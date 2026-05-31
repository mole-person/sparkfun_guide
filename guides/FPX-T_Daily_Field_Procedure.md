# FPX-T Daily Field Procedure

This is the daily working checklist for collecting field data with the FPX-T.

Sources: [FPX-T Quickstart](../docs/sparkpnt-fpx-t-quickstart.html), [FPX-T Modes of Operation](../docs/sparkpnt-fpx-t-operating-modes.html), [FPX-T Corrections Services](../docs/sparkpnt-fpx-t-correction-services.html)

## Before Leaving

- Charge the FPX-T.
- Charge phone/tablet/computer.
- Confirm the field app opens.
- Confirm you have any needed correction credentials.
- Confirm cellular data or hotspot works if using internet corrections.
- Pack pole, mount, charger, cables, and any required measuring tape.
- Record the planned job name, location, and coordinate system if known.

## On Site

1. Set up in an open area with the best available sky view.
2. Mount the FPX-T solidly on the pole or tripod.
3. Power on the receiver.
4. Confirm the display reports `Rover started`.
5. Pair the phone or tablet with the FPX-T over Bluetooth/BLE if it is not already paired.
6. Confirm the app is receiving live positions.
7. In the field app, confirm latitude and longitude are present.
8. Record satellites in view, satellites in use, horizontal accuracy, and vertical accuracy.
9. Record fix type, differential age, PDOP, HDOP, and VDOP if the app shows them.
10. Confirm the receiver mode and correction source.
11. Wait for the required fix or convergence status.
12. Confirm the FPX-T antenna height / pole length setting matches the physical pole setup.
13. Leave the SW Maps instrument height at `0` unless the elevation workflow has been verified for the job.
14. If using tilt compensation, initialize it before collecting offset or tilted-pole points.
15. Record a known or repeatable check point before collecting design points.
16. Collect field points.
17. Re-check the known point before leaving the site.

## Current Baseline Workflow

The first validated basic workflow used these settings:

- FPX-T startup mode: Rover
- Bluetooth protocol: SPP & BLE
- Field app: SW Maps
- FPX-T pole height: 2.0 m
- SW Maps instrument height: 0
- PointPerfect: disabled
- NTRIP client: disabled
- TCP / UDP NMEA streaming: disabled
- WiFi mode: AP / configuration portal
- Fix type observed: DGPS
- Age of differential observed: n/a

This baseline confirms rover Bluetooth operation, not centimeter-grade correction status.

## Tilt Compensation Initialization

Use this only when tilt compensation is needed. For first setup and troubleshooting, keep the pole vertical.

1. Confirm `Enable Tilt Compensation` is checked in Instrument Configuration.
2. Confirm antenna height / pole length is correct.
3. Shake the FPX-T to start IMU calibration.
4. Swing the module back and forth for 3-5 seconds.
5. Rotate the device 90 degrees.
6. Swing the module back and forth for 3-5 seconds.
7. Confirm the receiver indicates tilt compensation is active before relying on tilted measurements.

## After The Job

- Export or save the field data.
- Back up the data before editing it.
- Record the correction method used.
- Record any warnings, loss of fix, bad sky view, or unusual behavior.
- Charge the receiver for the next job.

## Minimum Data To Record

- Date and time
- Site name
- Receiver firmware version, if known
- Field app used
- Correction method used
- Fix status during collection
- Differential age, if shown
- PDOP, HDOP, and VDOP, if shown
- Approximate sky conditions and obstructions
- Pole height or antenna height
- Whether pole height was applied in the receiver, the field app, or both
- Coordinate system used by the field app
- Whether elevations were checked against a known point
- Any points that were questionable

## Correction Decision Path

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
