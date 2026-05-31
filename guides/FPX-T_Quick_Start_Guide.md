# FPX-T Quick Start Guide

This guide gets the FPX-T powered on, connected, and reporting positions to a field app.

Sources: [FPX-T Quickstart](../docs/sparkpnt-fpx-t-quickstart.html), [FPX-T Connectivity](../docs/sparkpnt-fpx-t-connectivity.html)

## What The FPX-T Does

The FPX-T is a rugged, all-band GNSS RTK receiver that can work as either a rover or a base station. For normal field data collection, you will usually use it as a rover: the receiver sits on a pole, receives satellite signals, and sends position data to a phone, tablet, or computer.

## First Power-On Checklist

- Charge the FPX-T.
- Take the receiver outside with a clear view of the sky.
- Mount it securely on a survey pole or tripod.
- Keep it away from buildings, vehicles, metal roofs, dense trees, and other obstructions when testing.
- Hold the power button for about 3 seconds to turn it on.
- Wait for the display to illuminate and the startup beep.
- Confirm the receiver begins tracking satellites before judging accuracy.
- Do not collect final design points until you understand the fix status and correction status being used.

To power down, hold the power button for about 3 seconds until the receiver shows `Shutting Down...` and beeps three times.

## Connect With Bluetooth/BLE

Use Bluetooth/BLE when you want a field app to see the receiver position.

1. Power on the FPX-T.
2. Wait for startup to finish.
3. On the phone or tablet, pair with the FPX-T Bluetooth/BLE device.
4. Open the field app and select the FPX-T as the GNSS receiver if the app requires that step.
5. Confirm the app is receiving live location data from the FPX-T.

During first setup, the FPX-T paired with a phone and connected to SW Maps without pressing any buttons on the receiver. Do not double-tap the power button for Bluetooth pairing. On the tested FPX-T, a single power-button press opened the menu, and a double-tap opened the menu and selected the first option, which changed the unit to base mode.

The saved FPX-T documentation does not show the BLE device name in the captured text. Verify the exact device name on the receiver display or in the current online manual before writing a final procedure.

## Open The WiFi Configuration Page

Use WiFi when you need to change receiver settings.

1. Power on the FPX-T.
2. Open the device menu with a single power-button press.
3. Use the function button to move through menu options without selecting the wrong mode.
4. On the tested FPX-T, the menu options appeared in this order: `Base`, `BaseCast`, `BaseAssist`, `Rover`, `Config`, `E-Pair`, `Exit`.
5. Move to `Config`.
6. Press the power button once to select `Config`.
7. On the phone, tablet, or computer, connect to the WiFi network named `RTK Config`.
8. Ignore the warning that the WiFi network has no internet connection.
9. The phone may automatically open the FPX-T web interface after connecting to `RTK Config`.
10. If the web interface does not open automatically, open Chrome or another browser.
11. Go to `http://rtk.local`.
12. If the page does not load, temporarily disable mobile/cellular data on the phone and try again.

## First Success Check

- The receiver powers on.
- The receiver reports `Rover started`.
- SW Maps or another field app receives live positions over Bluetooth/BLE.
- The web configuration page opens over WiFi.
- You can identify the current mode, fix type, reported accuracy, and whether a correction source is actually proven.

## Web Interface Menu

After selecting `Config` on the FPX-T and connecting the phone to `RTK Config`, the web interface opened automatically on the phone.

Observed web interface sections:

- Profile Configuration
- GNSS Configuration
- Base Configuration
- PointPerfect Configuration
- Ports Configuration
- WiFi Configuration
- TCP / UDP Configuration
- Radio Configuration
- Corrections Configuration
- Instrument Configuration
- System Configuration
- Save Configuration and Exit
- Reset

## GNSS Configuration Baseline

These settings were observed during first setup. Record them before changing anything.

General GNSS settings:

- Measurement Rate: 4 Hz
- Seconds between measurements: 0.25
- Dynamic Model: Portable
- Min SV Elevation: 10
- Min C/N0: 6
- Constellations enabled: BeiDou, Galileo, GPS, QZSS, SBAS
- Enable NTRIP Client: unchecked

Message Rates menu:

- Buttons shown:
  - Reset to Defaults
  - Reset to PPP Logging
- Message rates set to `1`:
  - NMEA_GGA
  - NMEA_GSA
  - NMEA_GST
  - NMEA_RMC
- Message rates set to `4`:
  - NMEA_GSV
- All other observed message rates were set to `0`.

Notes:

- `NMEA_GGA`, `NMEA_GSA`, `NMEA_GST`, `NMEA_GSV`, and `NMEA_RMC` are the main NMEA messages currently being output to SW Maps.
- `Enable NTRIP Client` was unchecked, so the FPX-T was not using its internal NTRIP client during this first SW Maps test.
- Because the field app still reported `DGPS`, the correction/improved fix source may be SBAS, HAS, or another receiver-side correction state. This still needs verification.

## Configuration Baseline From First Setup

These values were confirmed during the first complete web-configuration pass:

- Active profile: `Profile 1`
- System firmware: `v3.3`
- System initial state: `Rover`
- WiFi configuration mode: `AP`
- Saved WiFi networks: blank
- PointPerfect Service: `Disabled`
- TCP Client, TCP Server, and UDP Server: unchecked
- ESP-NOW and LoRa: unchecked
- Bluetooth Protocol: `SPP & BLE`
- Log to SD Card: checked
- Units: `Meters`
- Enable Audible Beeper: checked
- Enable Tilt Compensation: checked
- Antenna Height / Pole Length: `2.0 m`
- Antenna Phase Center: `58.30 mm`
- Output Tip Altitude: unchecked

Keep the receiver units set to meters unless there is a specific reason to change the receiver UI. GNSS heights, antenna offsets, and correction documentation are normally metric. If imperial display is needed, prefer setting that in the field app or export workflow.

Do not enter the 2.0 m pole height in both the FPX-T and SW Maps unless the altitude workflow has been verified. Applying height correction in both places can double-correct elevations.

## SW Maps Verification

After pairing the FPX-T with a phone, SW Maps was able to use the receiver as an external GNSS source.

First confirmed SW Maps status:

- Latitude and longitude were present.
- Satellites in view: 36
- Satellites in use: 31
- Fix type: DGPS
- Horizontal accuracy: 14 cm
- Vertical accuracy: 33 cm
- PDOP: 0.90
- HDOP: 0.47
- VDOP: 0.72
- Age of differential: n/a

Post-configuration SW Maps status after saving the 2.0 m pole height:

- Fix type: DGPS
- Satellites in view: 31
- Satellites in use: 25
- Horizontal accuracy: 24 cm, later improving to 17 cm
- Vertical accuracy: 44 cm, later improving to 34 cm
- PDOP: 1.20
- HDOP: 0.57
- VDOP: 1.06
- Age of differential: n/a

These values are an observed first-test result, not a guaranteed accuracy level. `DGPS` means SW Maps sees a differential GNSS-type fix, but it does not by itself prove RTK Fixed, PointPerfect, or Galileo HAS. `Age of differential: n/a` means SW Maps is not reporting the age of an incoming correction stream in this status view.

For field work, always record the correction method, fix status, satellite count, reported accuracy, DOP values, and differential age at the time points are collected.

## Height And Elevation Notes

During first setup, the FPX-T pole height was set to `2.0 m`, and SW Maps instrument height was left at `0`.

Initial same-location elevation checks showed too much scatter to prove exactly how SW Maps applies its instrument-height field under the current DGPS state. After the unit stabilized, three repeated zero-height SW Maps elevations were:

- 74.793 m
- 74.798 m
- 74.417 m

This 0.381 m range matched the approximate reported vertical accuracy at the time. Treat elevations from this baseline workflow as rough until they are checked against a known benchmark or a stronger correction state.

## Display Notes From First Setup

These notes are based on initial hands-on setup and should be refined as more display states are observed.

- `Rover started` means the receiver booted into rover mode.
- The in-display **satellite dish icon** and satellite count show whether the receiver is tracking satellites.
- The manual says the GNSS icon LED blinks yellow once per second when a GNSS fix is achieved.
- The manual says the GNSS icon LED turns solid green when RTK Fix is achieved.
- During first setup, the GNSS icon LED appeared to blink green, not yellow, after the receiver began tracking satellites. Treat this as a documented field observation until confirmed with SparkPNT support or additional units.
- The in-display **crosshair icon** appears next to the current position-quality number. In the first setup, it initially showed `>30` while no satellites were in use, then later showed `.326` after the receiver reached 28 satellites.
- A flashing satellite dish icon with `0` satellites means the receiver is not ready for field collection.
- A steady satellite dish icon with a high satellite count means the receiver has a usable satellite solution, but correction status still needs to be checked before precision work.
