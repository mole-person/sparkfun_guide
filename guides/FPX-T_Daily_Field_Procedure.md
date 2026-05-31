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
4. Connect the field app over Bluetooth/BLE.
5. Confirm the app is receiving live positions.
6. Confirm the receiver mode and correction source.
7. Wait for the required fix or convergence status.
8. Measure and enter antenna/pole height if the workflow requires it.
9. Record a known or repeatable check point before collecting design points.
10. Collect field points.
11. Re-check the known point before leaving the site.

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
- Approximate sky conditions and obstructions
- Pole height or antenna height
- Coordinate system used by the field app
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
