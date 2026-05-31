# FPX-T Configuration Reference

This working reference records observed FPX-T web interface settings while building the guides. It is not one of the eight final deliverables, but it supports them.

Web configuration pass status:

- Profile 1 reviewed during first setup.
- Pole height corrected to 2.0 m.
- Configuration saved after review.
- After saving, the receiver reconnected in rover workflow and SW Maps showed horizontal accuracy 24 cm and vertical accuracy 44 cm.
- Post-save SW Maps status: fix type DGPS, age of differential n/a, satellites 31 in view / 25 in use, PDOP 1.20, HDOP 0.57, VDOP 1.06.
- First vertical-pole SW Maps test point elevation: 72.735 m.
- SW Maps instrument-height comparison points at same spot: 71.318 m and 72.059 m.
- Additional SW Maps point after setting instrument height back to zero: 74.158 m.
- The comparison did not show a clean 2.0 m elevation shift, so it does not conclusively prove how SW Maps is applying instrument height in this setup.
- Later observed SW Maps accuracy improved to horizontal 17 cm and vertical 34 cm.
- Three repeated zero-height SW Maps elevations after stabilization: 74.793 m, 74.798 m, 74.417 m.
- After stabilization, SW Maps still reported fix type DGPS and age of differential n/a.
- First USB diagnostics identified `COM3` as the u-blox GNSS serial port and confirmed NMEA/UBX output.
- First USB diagnostics showed DGPS / differential GNSS flags with no carrier solution and no observed Galileo HAS correction records.
- `NAV-SIG` correction source counts during first USB diagnostics: 88 no corrections, 12 SBAS corrections, 0 Galileo HAS corrections.

## GNSS Configuration

Observed during first setup:

- Measurement Rate: 4 Hz
- Seconds between measurements: 0.25
- Dynamic Model: Portable
- Min SV Elevation: 10
- Min C/N0: 6
- Enabled constellations:
  - BeiDou
  - Galileo
  - GPS
  - QZSS
  - SBAS
- Enable NTRIP Client: unchecked

## Message Rates

Buttons shown:

- Reset to Defaults
- Reset to PPP Logging

Message rates set to `1`:

- NMEA_GGA
- NMEA_GSA
- NMEA_GST
- NMEA_RMC

Message rates set to `4`:

- NMEA_GSV

All other observed message rates were set to `0`.

## Interpretation

The active NMEA output appears targeted for normal external field-app use:

- `GGA` provides fix data.
- `GSA` provides DOP and active satellite information.
- `GST` provides GNSS pseudorange error statistics, often used by apps to estimate accuracy.
- `GSV` provides satellites in view.
- `RMC` provides recommended minimum GNSS data such as position, speed, and time.

The internal NTRIP client was unchecked, so first-test SW Maps readings were not produced by the FPX-T's internal NTRIP client.

## Profile Configuration

Observed during first setup:

- Selected profile: 1
- Profile 1 label: Profile 1
- Profiles 2-8: blank
- Profile Name field: Profile 1
- Button shown: Reset Profile

Interpretation:

- The current setup is using the default `Profile 1`.
- No alternate named profiles have been configured yet.
- Changes made during setup should be treated as changes to `Profile 1` unless a new profile is created or selected first.

## Corrections Configuration

Observed during first setup:

- Corrections Source Lifetime: 30
- Corrections Sources Priority:
  1. External Radio
  2. ESP-NOW
  3. LoRa Radio
  4. Bluetooth
  5. USB Serial
  6. TCP (NTRIP)
  7. PPP HAS/B2b
  8. L-Band
  9. IP (PointPerfect/MQTT)
- Button shown: Reset to Defaults

Interpretation:

- The FPX-T web interface lists `PPP HAS/B2b` as a correction source.
- `PPP HAS/B2b` is lower priority than local/external correction sources such as radio, Bluetooth, USB Serial, and TCP NTRIP.
- `PPP HAS/B2b` is higher priority than L-Band and IP PointPerfect/MQTT in the observed default priority list.
- This confirms the configuration interface is aware of HAS/B2b-style PPP corrections, but it does not by itself prove HAS is currently active or converged.

## Base Configuration

Observed during first setup:

- Base position mode: Fixed
- Alternate base position mode shown: Survey-in
- Fixed coordinate type selected: ECEF Coordinates
- Button shown: Load From GNSS
- ECEF X: -2387679.793
- ECEF Y: -3638358.013
- ECEF Z: 4647294.344
- ECEF Name: blank
- Commonly Used Coordinates: No coordinates stored
- Buttons shown: Add, Load, Delete

Geodetic coordinate option:

- Geodetic radio option shown but not selected.
- Button shown: Load LLH from GNSS
- Latitude: 40.09029474790
- Longitude: -106.8505760
- Detected Format: DD.ddddddddd
- HAE Mark / Alt: 1560.0890 m
- HAE calculation option selected: Calculate HAE APC
- Alternate HAE calculation option shown: Calculate HAE Mark
- HAE APC: 1562.147 m, grayed out
- Geodetic Name: blank
- Commonly Used Coordinates: No coordinates stored
- Buttons shown: Add, Load, Delete

NTRIP server / base RTCM:

- Enable NTRIP Server: unchecked
- RTCM Rates dropdown shown.
- Buttons shown: Reset to Defaults, Reset to Low Bandwidth Link
- RTCM_1005: 1
- RTCM_1074: 1
- RTCM_1077: 0
- RTCM_1084: 1
- RTCM_1087: 0
- RTCM_1094: 1
- RTCM_1097: 0
- RTCM_1124: 1
- RTCM_1230: 10

Interpretation:

- If the unit is put into `Base` mode, it is currently staged to use a fixed base coordinate rather than running a survey-in.
- The fixed coordinate appears to have been loaded from the current GNSS position, not saved under a reusable site name.
- Because no common coordinates are stored, there is no named base point saved for repeatable reuse yet.
- NTRIP server is off, so the unit is not currently configured to publish base corrections to an NTRIP caster.
- Base RTCM messages are configured, but those rates only matter when operating as a base and sending corrections over an enabled output path.

## Radio Configuration

Observed during first setup:

- ESP-NOW: unchecked
- LoRa: unchecked

Interpretation:

- The built-in ESP-NOW correction path is not active.
- The LoRa correction path is not active.
- This is separate from `Enable External Radio Corrections` in Ports Configuration, which was checked.

## PointPerfect Configuration

Observed during first setup:

- Device ID: 28562FACA3B606
- PointPerfect Service: Disabled

Interpretation:

- PointPerfect was not active during the first SW Maps test.
- The first SW Maps `DGPS` fix was not produced by PointPerfect Flex.

## Ports Configuration

Observed during first setup:

- Radio Port Baud Rate: 57600
- Mux Channel: NMEA
- Data Port Baud Rate: 115200
- Enable External Radio Corrections: checked
- Enable NMEA output on Radio: unchecked
- Enable GNSS output over USB: unchecked

Interpretation:

- External radio corrections are enabled, so the receiver is prepared to accept correction data through the radio path.
- NMEA output on the radio is disabled, so the radio is not being used as an outbound NMEA stream.
- GNSS output over USB is disabled in the observed configuration.
- Bluetooth/SW Maps operation still works separately from these radio/USB output settings.

## WiFi Configuration

Observed during first setup:

- Networks: four saved network slots are shown.
- SSID fields: empty.
- Password fields: empty.
- Configuration Mode: AP
- Other Configuration Mode option shown: WiFi

Interpretation:

- The FPX-T is not currently configured to join a normal WiFi network.
- WiFi is currently being used as an access point / configuration portal.
- This matches the field behavior where connecting the phone to the unit's network automatically opened the web interface.
- Internet-based correction services would require a configured network path, either through WiFi mode or another connection method.

## TCP / UDP Configuration

Observed during first setup:

- TCP Client: unchecked
- TCP Server: unchecked
- UDP Server: unchecked

Help text observed:

- TCP Client: if enabled, the device connects to WiFi and pushes NMEA to the given TCP server over the given port.
- TCP Server: if enabled, the device allows inbound TCP connections and pushes NMEA over the given port when a client is connected.
- UDP Server: if enabled, the device broadcasts NMEA sentences over UDP.

Interpretation:

- No network NMEA streaming mode is active.
- The FPX-T is not currently pushing position data to a TCP endpoint.
- The FPX-T is not currently accepting inbound TCP clients for NMEA.
- The FPX-T is not currently broadcasting NMEA over UDP.

## System Configuration

Observed during first setup:

- System Firmware: v3.3
- Button shown: Check for New Firmware
- Allow Beta Firmware: unchecked
- Enable Automatic Firmware Updates: unchecked
- Button shown: Upload BIN
- System Initial State: Rover
- Other System Initial State options shown: Base NTP, BaseCast
- Log to SD Card: checked
- Max Logging Time: 1440 min
- Max Log File Length: 1440 min
- Aligned Log Files: unchecked
- Log File Name: blank / not observed
- Button shown: Start New Log
- Enable ARP Logging: unchecked
- Bluetooth Protocol: SPP & BLE
- Other Bluetooth Protocol options shown: SPP, BLE, Off
- Enable Audible Beeper: checked
- Units: Meters
- Other Units option shown: Feet/Inches
- Enable Automatic Device Restart: unchecked
- Shutdown if Not Charging: unchecked
- Enable Factory Defaults: unchecked
- Reset to Factory Defaults button: grayed out while factory-defaults checkbox is unchecked

Interpretation:

- The unit is configured to boot into rover mode, which matches normal field collection.
- Beta firmware is not enabled.
- Automatic firmware updates are not enabled.
- Firmware updates can be checked online or uploaded manually as a BIN file.
- SD card logging is enabled with a 24-hour maximum logging time and 24-hour maximum log file length.
- Bluetooth is configured for both SPP and BLE, which matches the observed ability to pair/connect from a phone without changing a setting on the receiver.
- The audible beeper is enabled, which matters for tilt initialization and status feedback.
- Units are set to meters. Keep this setting unless there is a specific reason to switch the receiver UI to feet/inches; GNSS configuration values, antenna offsets, and corrections documentation are typically metric.
- Factory reset is protected behind an explicit enable checkbox.

## Instrument Configuration

Observed during first setup:

- Enable Tilt Compensation: checked
- Output Tip Altitude: unchecked
- Antenna Phase Center: 58.30 mm
- Antenna Height / Pole Length: 2.0 m

Interpretation:

- Antenna Height / Pole Length should match the physical pole setup used in the field.
- Antenna Phase Center is the receiver's internal antenna offset value used to relate the measured GNSS position to the practical measurement point.
- Output Tip Altitude being unchecked suggests the receiver may not be outputting the pole-tip altitude directly.
- Do not blindly enter the same 2.0 m pole height in SW Maps and the FPX-T without verifying the altitude workflow. Applying pole height in both places can double-correct elevations.
- The FPX-T tilt page confirms that tilt compensation is configured through Instrument Configuration and requires IMU calibration / initialization before use.
- The saved quickstart page says tilt compensation is not supported, which conflicts with the FPX-T tilt page and the `-T` model designation. Treat the tilt page and live FPX-T interface as the better source for FPX-T tilt behavior.

## Tilt Compensation Initialization

From the saved FPX-T tilt page:

1. Shake to initialize calibration.
2. Swing the module back and forth for 3-5 seconds.
3. Rotate the device 90 degrees.
4. Swing the module back and forth for 3-5 seconds.
5. Finish initialization.

User field note:

- The FPX-T is expected to beep three times after activation, then beep about every 10 seconds while tilt compensation is active. This beep cadence still needs confirmation from documentation or repeated testing.
