# Advanced Diagnostics Guide

This guide will cover deeper diagnostic tools such as u-center 2 and direct ZED-X20P status checks.

Sources: [SparkFun RTK Everywhere Configure with u-center](../docs/sparkfun-rtk-everywhere-configure-u-center.html), [u-blox ZED-X20P data sheet](../docs/u-blox-zed-x20p-datasheet.pdf), [u-blox X20 HPG 2.02 interface description](../docs/u-blox-x20-hpg-2.02-interface-description.pdf)

## Purpose

Use this guide only after the basic troubleshooting steps are complete. Advanced diagnostics are for confirming what the GNSS module is doing internally.

## Questions This Guide Should Answer

- Can a Windows PC connect directly to the ZED-X20P inside the FPX-T?
- Can u-center 2 be used safely with the FPX-T?
- Which port should be used?
- Which messages show satellite status?
- Which messages show correction status?
- Which messages show Galileo HAS reception and convergence?
- Which messages show PointPerfect correction use?

## Draft Workflow

1. Confirm the simple checks in the troubleshooting guide.
2. Connect the FPX-T to the Windows PC using the documented method.
3. Identify the USB serial ports exposed by Windows.
4. Confirm the receiver is outputting position data.
5. Check satellite status.
6. Check fix type.
7. Check correction status.
8. Save screenshots or logs before changing any settings.

## Windows USB Ports Observed

During first USB diagnostics, Windows showed these active ports:

- `COM3`: u-blox USB serial device, `VID_1546&PID_01AB`
- `COM4`: FPX-T controller / ESP diagnostic console, `VID_1A86&PID_55D2&MI_02`
- `COM11`: additional FPX-T controller USB serial interface, `VID_1A86&PID_55D2&MI_00`

`COM3` streamed GNSS NMEA output at 115200 baud and responded to UBX message polls. Use `COM3` first for GNSS diagnostics.

`COM4` printed controller boot/status text, including MAC addresses and detected I2C devices. Opening this port may show boot output from the controller, so do not rely on it for GNSS correction status.

`COM11` did not produce output during the first short capture.

## Local UBX Diagnostic Script

The repository includes a local read-only diagnostic script:

```powershell
powershell -ExecutionPolicy Bypass -File tools\ubx_diagnostics.ps1 -PortName COM3 -BaudRate 115200 -Seconds 5
```

The script polls:

- `UBX-NAV-PVT`
- `UBX-NAV-STATUS`
- `UBX-NAV-SAT`
- `UBX-NAV-SIG`
- `UBX-RXM-COR`

The first run confirmed:

- NMEA `GGA` fix quality: `2`, which is DGPS
- NMEA `RMC` mode: `D`, differential
- `NAV-PVT` fix type: 3D fix
- `NAV-PVT` `diffSoln`: true
- `NAV-PVT` carrier solution: none
- `NAV-STATUS` `diffSoln`: true
- `NAV-STATUS` carrier solution: none
- `NAV-SIG` correction source counts: 88 no corrections, 12 SBAS corrections
- `NAV-SIG` Galileo HAS correction records: none observed
- `RXM-COR`: no response to the poll

This diagnostic confirms that the receiver was using a differential GNSS-style solution during the test, but it did not show RTK carrier solution or Galileo HAS correction use.

## Warning

Do not change u-blox module configuration until the exact setting and recovery process are documented.
