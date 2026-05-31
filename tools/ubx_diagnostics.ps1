param(
    [string]$PortName = "COM3",
    [int]$BaudRate = 115200,
    [int]$Seconds = 5
)

function Get-UbxChecksum {
    param([byte[]]$Bytes)
    [int]$ckA = 0
    [int]$ckB = 0
    foreach ($b in $Bytes) {
        $ckA = ($ckA + $b) -band 0xFF
        $ckB = ($ckB + $ckA) -band 0xFF
    }
    return @([byte]$ckA, [byte]$ckB)
}

function New-UbxPoll {
    param([byte]$Class, [byte]$Id)
    [byte[]]$body = @($Class, $Id, 0x00, 0x00)
    $ck = Get-UbxChecksum -Bytes $body
    return [byte[]]@(0xB5, 0x62, $Class, $Id, 0x00, 0x00, $ck[0], $ck[1])
}

function Read-U2 {
    param([byte[]]$Bytes, [int]$Offset)
    return [BitConverter]::ToUInt16($Bytes, $Offset)
}

function Read-U4 {
    param([byte[]]$Bytes, [int]$Offset)
    return [BitConverter]::ToUInt32($Bytes, $Offset)
}

function Read-I4 {
    param([byte[]]$Bytes, [int]$Offset)
    return [BitConverter]::ToInt32($Bytes, $Offset)
}

function Format-FixType {
    param([int]$FixType)
    switch ($FixType) {
        0 { "no fix" }
        1 { "dead reckoning only" }
        2 { "2D fix" }
        3 { "3D fix" }
        4 { "GNSS + dead reckoning" }
        5 { "time only" }
        default { "unknown ($FixType)" }
    }
}

function Format-CarrSoln {
    param([int]$CarrSoln)
    switch ($CarrSoln) {
        0 { "none" }
        1 { "float" }
        2 { "fixed" }
        default { "reserved ($CarrSoln)" }
    }
}

function Format-CorrSource {
    param([int]$CorrSource)
    switch ($CorrSource) {
        0 { "no corrections" }
        1 { "SBAS corrections" }
        2 { "BeiDou corrections" }
        3 { "RTCM2 corrections" }
        4 { "RTCM3 OSR corrections" }
        5 { "RTCM3 SSR corrections" }
        6 { "QZSS SLAS corrections" }
        7 { "SPARTN corrections" }
        9 { "CLAS corrections" }
        10 { "LPP OSR corrections" }
        11 { "LPP SSR corrections" }
        12 { "GAL HAS corrections" }
        default { "unknown / reserved" }
    }
}

function Parse-UbxFrames {
    param([byte[]]$Bytes)
    $frames = New-Object System.Collections.Generic.List[object]
    $i = 0
    while ($i -le ($Bytes.Length - 8)) {
        if ($Bytes[$i] -ne 0xB5 -or $Bytes[$i + 1] -ne 0x62) {
            $i++
            continue
        }

        [byte]$cls = $Bytes[$i + 2]
        [byte]$id = $Bytes[$i + 3]
        [int]$len = [BitConverter]::ToUInt16($Bytes, $i + 4)
        $end = $i + 8 + $len
        if ($end -gt $Bytes.Length) {
            break
        }

        [byte[]]$checkBytes = $Bytes[($i + 2)..($i + 5 + $len)]
        $ck = Get-UbxChecksum -Bytes $checkBytes
        $valid = ($ck[0] -eq $Bytes[$i + 6 + $len] -and $ck[1] -eq $Bytes[$i + 7 + $len])
        [byte[]]$payload = @()
        if ($len -gt 0) {
            $payload = $Bytes[($i + 6)..($i + 5 + $len)]
        }

        $frames.Add([pscustomobject]@{
            Class = $cls
            Id = $id
            Length = $len
            ValidChecksum = $valid
            Payload = $payload
        }) | Out-Null
        $i = $end
    }
    return $frames
}

$port = New-Object System.IO.Ports.SerialPort $PortName, $BaudRate, "None", 8, "One"
$port.ReadTimeout = 200
$port.WriteTimeout = 1000
$port.DtrEnable = $false
$port.RtsEnable = $false

try {
    $port.Open()
    $port.DiscardInBuffer()

    $polls = @(
        (New-UbxPoll 0x01 0x07), # NAV-PVT
        (New-UbxPoll 0x01 0x03), # NAV-STATUS
        (New-UbxPoll 0x01 0x35), # NAV-SAT
        (New-UbxPoll 0x01 0x43), # NAV-SIG
        (New-UbxPoll 0x02 0x34)  # RXM-COR
    )

    foreach ($poll in $polls) {
        $port.Write($poll, 0, $poll.Length)
        Start-Sleep -Milliseconds 150
    }

    $bytes = New-Object System.Collections.Generic.List[byte]
    $buffer = New-Object byte[] 4096
    $deadline = (Get-Date).AddSeconds($Seconds)
    while ((Get-Date) -lt $deadline) {
        try {
            $read = $port.Read($buffer, 0, $buffer.Length)
            if ($read -gt 0) {
                for ($j = 0; $j -lt $read; $j++) {
                    $bytes.Add($buffer[$j]) | Out-Null
                }
            }
        }
        catch [System.TimeoutException] {
        }
    }
}
finally {
    if ($port.IsOpen) {
        $port.Close()
    }
}

$raw = $bytes.ToArray()
$ascii = [System.Text.Encoding]::ASCII.GetString($raw)
$nmea = $ascii -split "`r?`n" | Where-Object { $_ -like '$G*' }
$lastGga = $nmea | Where-Object { $_ -like '$G*GGA,*' } | Select-Object -Last 1
$lastRmc = $nmea | Where-Object { $_ -like '$G*RMC,*' } | Select-Object -Last 1
$frames = Parse-UbxFrames -Bytes $raw

"Port: $PortName @ $BaudRate"
"Bytes captured: $($raw.Length)"
"NMEA sentences captured: $($nmea.Count)"
if ($lastGga) { "Last GGA: $lastGga" }
if ($lastRmc) { "Last RMC: $lastRmc" }
"UBX frames captured: $($frames.Count)"

$frames |
    Group-Object { "0x{0:X2} 0x{1:X2}" -f $_.Class, $_.Id } |
    Sort-Object Name |
    ForEach-Object { "UBX $($_.Name): $($_.Count) frame(s)" }

$pvt = $frames | Where-Object { $_.Class -eq 0x01 -and $_.Id -eq 0x07 -and $_.ValidChecksum -and $_.Length -ge 92 } | Select-Object -Last 1
if ($pvt) {
    $p = $pvt.Payload
    $fixType = $p[20]
    $flags = $p[21]
    $flags2 = $p[22]
    $numSv = $p[23]
    $lon = (Read-I4 $p 24) / 10000000.0
    $lat = (Read-I4 $p 28) / 10000000.0
    $height = (Read-I4 $p 32) / 1000.0
    $hMsl = (Read-I4 $p 36) / 1000.0
    $hAcc = (Read-U4 $p 40) / 1000.0
    $vAcc = (Read-U4 $p 44) / 1000.0
    $pDop = (Read-U2 $p 76) / 100.0
    $diffSoln = (($flags -band 0x02) -ne 0)
    $carrSoln = ($flags -shr 6) -band 0x03

    ""
    "NAV-PVT summary:"
    "  fixType: $(Format-FixType $fixType)"
    "  diffSoln flag: $diffSoln"
    "  carrier solution: $(Format-CarrSoln $carrSoln)"
    "  satellites used: $numSv"
    "  lat/lon: $lat, $lon"
    "  height ellipsoid: $height m"
    "  height MSL: $hMsl m"
    "  hAcc/vAcc: $hAcc m / $vAcc m"
    "  pDOP: $pDop"
    "  raw flags: 0x{0:X2}, flags2: 0x{1:X2}" -f $flags, $flags2
}

$status = $frames | Where-Object { $_.Class -eq 0x01 -and $_.Id -eq 0x03 -and $_.ValidChecksum -and $_.Length -ge 16 } | Select-Object -Last 1
if ($status) {
    $p = $status.Payload
    $fixType = $p[4]
    $flags = $p[5]
    $fixStat = $p[6]
    $flags2 = $p[7]
    $diffSoln = (($flags -band 0x02) -ne 0)
    $carrSoln = ($flags2 -shr 6) -band 0x03

    ""
    "NAV-STATUS summary:"
    "  fixType: $(Format-FixType $fixType)"
    "  diffSoln flag: $diffSoln"
    "  carrier solution: $(Format-CarrSoln $carrSoln)"
    "  fixStat: 0x{0:X2}" -f $fixStat
    "  raw flags: 0x{0:X2}, flags2: 0x{1:X2}" -f $flags, $flags2
}

$sig = $frames | Where-Object { $_.Class -eq 0x01 -and $_.Id -eq 0x43 -and $_.ValidChecksum -and $_.Length -ge 8 } | Select-Object -Last 1
if ($sig) {
    $p = $sig.Payload
    $numSigs = $p[5]
    $sigRows = New-Object System.Collections.Generic.List[object]
    for ($idx = 0; $idx -lt $numSigs; $idx++) {
        $o = 8 + ($idx * 16)
        if (($o + 15) -ge $p.Length) { break }
        $sigRows.Add([pscustomobject]@{
            GnssId = $p[$o]
            SvId = $p[$o + 1]
            SigId = $p[$o + 2]
            Cno = $p[$o + 6]
            QualityInd = $p[$o + 7]
            CorrSource = $p[$o + 8]
            IonoModel = $p[$o + 9]
            SigFlags = Read-U2 $p ($o + 10)
        }) | Out-Null
    }

    ""
    "NAV-SIG summary:"
    "  signals reported: $numSigs"
    "  correction source counts:"
    $sigRows |
        Group-Object CorrSource |
        Sort-Object { [int]$_.Name } |
        ForEach-Object {
            $source = [int]$_.Name
            "    $source ($(Format-CorrSource $source)): $($_.Count)"
        }

    $hasRows = $sigRows | Where-Object { $_.CorrSource -eq 12 }
    if ($hasRows.Count -gt 0) {
        "  GAL HAS correction records:"
        $hasRows | Select-Object -First 12 | ForEach-Object {
            "    gnssId=$($_.GnssId) svId=$($_.SvId) sigId=$($_.SigId) cno=$($_.Cno) quality=$($_.QualityInd) flags=0x{0:X4}" -f $_.SigFlags
        }
    }
    else {
        "  GAL HAS correction records: none observed"
    }

    "  first 12 signal records, including raw correction source and flags:"
    $sigRows | Select-Object -First 12 | ForEach-Object {
        "    gnssId=$($_.GnssId) svId=$($_.SvId) sigId=$($_.SigId) cno=$($_.Cno) quality=$($_.QualityInd) corrSource=$($_.CorrSource) ionoModel=$($_.IonoModel) flags=0x{0:X4}" -f $_.SigFlags
    }
}

$rxmCor = $frames | Where-Object { $_.Class -eq 0x02 -and $_.Id -eq 0x34 -and $_.ValidChecksum } | Select-Object -Last 1
if ($rxmCor) {
    ""
    "RXM-COR frame received:"
    "  payload length: $($rxmCor.Length)"
    "  payload hex: $(($rxmCor.Payload | ForEach-Object { '{0:X2}' -f $_ }) -join ' ')"
}
else {
    ""
    "RXM-COR frame not received from this poll."
}
