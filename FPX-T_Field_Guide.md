# FPX-T Field Guide

This is a working field guide for the SparkPNT FPX-T GNSS receiver. It is written for a technically minded beginner using the receiver for septic design and related field work.

The guide uses the saved documents in `docs/` as its source archive. When a statement depends on product documentation, the source is listed in the section.

## Start Here

The FPX-T is a rugged, all-band GNSS RTK receiver that can work as either a rover or a base station. For normal field data collection, you will usually use it as a rover: the receiver sits on a pole, receives satellite signals, and sends position data to a phone, tablet, or computer.

Before using the receiver for professional measurements, separate these two ideas:

- **Precision** means repeated measurements agree with each other.
- **Accuracy** means the measured location is correct in the real world.

A local base station can give very tight relative precision, but if the base station position is not known accurately, the whole job can still be shifted. For septic design, this distinction matters because elevations, setbacks, property features, and design points may need to line up with a real-world coordinate system.

Sources: [FPX-T Quickstart](docs/sparkpnt-fpx-t-quickstart.html), [FPX-T Modes of Operation](docs/sparkpnt-fpx-t-operating-modes.html)

## Basic Terms

- **GNSS** means Global Navigation Satellite System. It is the general term for satellite positioning systems such as GPS, Galileo, GLONASS, and BeiDou.
- **GPS** is the United States satellite system. People often say "GPS" casually, but the FPX-T can use several GNSS systems.
- **Rover** means the receiver is moving around and collecting positions.
- **Base station** means a receiver is fixed in one place and sends correction data to a rover.
- **RTK** means Real-Time Kinematic. It is a correction method that can provide centimeter-level positioning when the rover receives good correction data.
- **NTRIP** is a common way to send RTK correction data over the internet.
- **PPP-RTK** is a correction method that can use wide-area correction services such as PointPerfect.
- **RTCM** is a common correction-data format used for RTK.
- **NMEA** is a common position-data format sent from GNSS receivers to mapping apps.
- **BLE** means Bluetooth Low Energy. The FPX-T uses Bluetooth/BLE for connection to mobile devices.

## What The FPX-T Can Do

The documented operating modes are:

| Mode | Plain-English meaning | Documented accuracy expectation |
| --- | --- | --- |
| Rover | Standalone GNSS positioning without an RTK correction source | About 700 mm |
| Rover with RTK | Rover receives correction data from a local base or NTRIP service | About 8 mm horizontal and 15 mm vertical |
| Rover with PPP-RTK | Rover receives PointPerfect-style correction data over an internet connection | About 14 to 60 mm horizontal; RTK fix can take up to 300 seconds |
| Galileo HAS | Free Galileo correction service enabled by default on the FPX-T | Wait about 8 to 15 minutes for convergence; documented as under 20 cm precision |
| Base Station | FPX-T stays fixed and sends correction data to another rover | Relative accuracy depends on base setup |
| Base Station with NTRIP | FPX-T acts as a base and sends corrections through NTRIP | Useful when rovers also have internet access |

For early field learning, start with **Rover** mode and confirm that the receiver connects to your field app. Then test correction methods one at a time.

Sources: [FPX-T Modes of Operation](docs/sparkpnt-fpx-t-operating-modes.html), [FPX-T Quickstart](docs/sparkpnt-fpx-t-quickstart.html)

## First Power-On Checklist

Use this checklist before collecting any important data.

- Charge the FPX-T.
- Take the receiver outside with a clear view of the sky.
- Mount it securely on a survey pole or tripod.
- Keep it away from buildings, vehicles, metal roofs, dense trees, and other obstructions when testing.
- Hold the power button for about 3 seconds to turn it on.
- Wait for the display to illuminate and the startup beep.
- Confirm the receiver begins tracking satellites before judging accuracy.
- Do not collect final design points until you understand the fix status and correction status being used.

To power down, hold the power button for about 3 seconds until the receiver shows `Shutting Down...` and beeps three times.

Source: [FPX-T Quickstart](docs/sparkpnt-fpx-t-quickstart.html)

## Connecting To The Receiver

The FPX-T has two beginner-important connection paths:

- **Bluetooth/BLE** for sending position data to a field app on a phone or tablet.
- **WiFi configuration page** for changing settings through a browser.

### Bluetooth/BLE

Use Bluetooth/BLE when you want a field app to see the receiver position.

1. Power on the FPX-T.
2. Wait for startup to finish.
3. Double-tap the power button, pressing it twice within 1 second.
4. On the phone or tablet, connect to the FPX-T BLE device.
5. Open the field app and select the FPX-T as the GNSS receiver if the app requires that step.

The saved FPX-T documentation does not show the BLE device name in the captured text. Verify the exact device name on the receiver display or in the current online manual before writing a final procedure.

### WiFi Configuration Page

Use WiFi when you need to change receiver settings.

1. Power on the FPX-T.
2. Double-tap the power button, pressing it twice within 1 second.
3. On the phone, tablet, or computer, connect to the WiFi network named `RTK Config`.
4. Ignore the warning that the WiFi network has no internet connection.
5. Open Chrome or another browser.
6. Go to `http://rtk.local`.
7. If the page does not load, temporarily disable mobile/cellular data on the phone and try again.

Sources: [FPX-T Connectivity](docs/sparkpnt-fpx-t-connectivity.html), [FPX-T Configuration Settings](docs/sparkpnt-fpx-t-configuration-settings.html)

## Choosing A Correction Method

Use this simple decision path while learning:

```text
Need approximate mapping only?
  -> Use Rover mode and record that the data is not centimeter-grade.

Need free correction service and can wait 8 to 15 minutes?
  -> Test Galileo HAS.

Need centimeter-grade field data and have internet/cell service?
  -> Use RTK through NTRIP or PointPerfect Flex, depending on credentials and subscription.

Need high relative precision on a site with two receivers?
  -> Use one receiver as a base and one as a rover.

Need legally defensible survey control?
  -> Stop and involve a licensed surveyor or verified control workflow.
```

Important: a correction service does not automatically make every point good. You still need a clear sky view, stable pole height, correct antenna height, enough convergence time, and a fix status that matches the accuracy you need.

Sources: [FPX-T Corrections Services](docs/sparkpnt-fpx-t-correction-services.html), [SparkFun Correction Sources](docs/sparkfun-rtk-everywhere-correction-sources.html)

## Daily Field Procedure

This is the first draft of the daily workflow. Treat it as a checklist to refine after hands-on testing.

### Before Leaving

- Charge the FPX-T.
- Charge phone/tablet/computer.
- Confirm the field app opens.
- Confirm you have any needed correction credentials.
- Confirm cellular data or hotspot works if using internet corrections.
- Pack pole, mount, charger, cables, and any required measuring tape.
- Record the planned job name, location, and coordinate system if known.

### On Site

1. Set up in an open area with the best available sky view.
2. Mount the FPX-T solidly on the pole or tripod.
3. Power on the receiver.
4. Connect the field app over Bluetooth/BLE.
5. Confirm the app is receiving live positions.
6. Confirm the receiver mode and correction source.
7. Wait for the required fix or convergence status.
8. Measure and enter antenna/pole height if the workflow requires it.
9. Record a known or repeatable check point before collecting design points.
10. Collect field points.
11. Re-check the known point before leaving the site.

### After The Job

- Export or save the field data.
- Back up the data before editing it.
- Record the correction method used.
- Record any warnings, loss of fix, bad sky view, or unusual behavior.
- Charge the receiver for the next job.

## Minimum Data To Record With Each Job

Record this information in your field notes until the workflow is fully proven:

- Date and time
- Site name
- Receiver firmware version, if known
- Field app used
- Correction method used
- Fix status during collection
- Approximate sky conditions and obstructions
- Pole height or antenna height
- Coordinate system used by the field app
- Any points that were questionable

## Known Open Questions

These items need deeper verification from the saved docs, current online docs, or hands-on testing with the receiver:

- Exact BLE device name shown by the FPX-T.
- Exact web interface menus for viewing satellite status, signal quality, fix status, and correction status.
- How the FPX-T displays Galileo HAS status.
- How to prove Galileo HAS is actually being used rather than just observing better accuracy.
- PointPerfect Flex credential setup steps specific to the FPX-T web interface.
- Whether settings backup and restore are available directly from the FPX-T web interface or through RTK Everywhere settings files.
- Best Windows workflow for direct u-blox ZED-X20P diagnostics with u-center 2.

## Source Archive

Start with these local sources when expanding this guide:

- [Documentation source index](docs/SOURCES.md)
- [FPX-T Quickstart](docs/sparkpnt-fpx-t-quickstart.html)
- [FPX-T Connectivity](docs/sparkpnt-fpx-t-connectivity.html)
- [FPX-T Modes of Operation](docs/sparkpnt-fpx-t-operating-modes.html)
- [FPX-T Corrections Services](docs/sparkpnt-fpx-t-correction-services.html)
- [FPX-T Firmware Update](docs/sparkpnt-fpx-t-firmware-update.html)
- [SparkFun RTK Everywhere PointPerfect Flex](docs/sparkfun-rtk-everywhere-pointperfect-flex.html)
- [u-blox ZED-X20P data sheet](docs/u-blox-zed-x20p-datasheet.pdf)
- [u-blox X20 HPG 2.02 interface description](docs/u-blox-x20-hpg-2.02-interface-description.pdf)
