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
3. Double-tap the power button, pressing it twice within 1 second.
4. On the phone or tablet, connect to the FPX-T BLE device.
5. Open the field app and select the FPX-T as the GNSS receiver if the app requires that step.

The saved FPX-T documentation does not show the BLE device name in the captured text. Verify the exact device name on the receiver display or in the current online manual before writing a final procedure.

## Open The WiFi Configuration Page

Use WiFi when you need to change receiver settings.

1. Power on the FPX-T.
2. Double-tap the power button, pressing it twice within 1 second.
3. On the phone, tablet, or computer, connect to the WiFi network named `RTK Config`.
4. Ignore the warning that the WiFi network has no internet connection.
5. Open Chrome or another browser.
6. Go to `http://rtk.local`.
7. If the page does not load, temporarily disable mobile/cellular data on the phone and try again.

## First Success Check

- The receiver powers on.
- The field app receives live positions over Bluetooth/BLE.
- The web configuration page opens over WiFi.
- You can identify the current mode and correction source.
