# FPX-T Troubleshooting Guide

This guide will collect simple troubleshooting steps before moving into advanced diagnostics.

Sources: [FPX-T Connectivity](../docs/sparkpnt-fpx-t-connectivity.html), [FPX-T Corrections Services](../docs/sparkpnt-fpx-t-correction-services.html), [SparkFun Correction Sources](../docs/sparkfun-rtk-everywhere-correction-sources.html)

## Start With The Simple Checks

- Is the receiver charged?
- Is the receiver outside with a clear view of the sky?
- Is the field app connected to the FPX-T over Bluetooth/BLE?
- Is the phone still connected to `RTK Config` when using the web page?
- If `http://rtk.local` does not load, is cellular data interfering with the WiFi connection?
- Is the correction source active and selected?
- Has enough time passed for the chosen correction method?

## Common Problems

| Problem | First checks |
| --- | --- |
| Cannot open web page | Connect to `RTK Config`, try `http://rtk.local`, disable cellular data temporarily |
| No Bluetooth position in app | Confirm BLE pairing, confirm app selected the external receiver |
| No RTK fix | Confirm correction source, internet connection, sky view, and correction credentials |
| Accuracy seems poor | Check sky obstruction, pole stability, correction status, and convergence time |
| Elevations seem wrong | Confirm antenna height / pole length, SW Maps instrument height, and whether output tip altitude is enabled |
| Unit accidentally enters base mode | Avoid double-tapping the power button; a double-tap can open the menu and select `Base` |
| Web page opens automatically | This is expected when connecting to `RTK Config`; use `http://rtk.local` only if it does not auto-open |

## First-Setup Baseline

During first setup, the receiver was confirmed working as a rover with SW Maps:

- Receiver mode: Rover
- Field app: SW Maps over Bluetooth
- Fix type: DGPS
- Age of differential: n/a
- Satellites after save: 31 in view / 25 in use
- Accuracy after save: 24 cm horizontal / 44 cm vertical, later improving to 17 cm horizontal / 34 cm vertical
- PDOP / HDOP / VDOP after save: 1.20 / 0.57 / 1.06

This is a working rover baseline, but it does not prove RTK Fixed, PointPerfect, NTRIP, or Galileo HAS.

## Height And Elevation Issues

During first setup:

- FPX-T pole height was set to 2.0 m.
- SW Maps instrument height was kept at 0 for the baseline workflow.
- `Output Tip Altitude` was unchecked in Instrument Configuration.
- Same-location elevation samples varied enough that the elevation workflow was not considered validated.

Do not enter the pole height in both the FPX-T and SW Maps unless the workflow has been tested against a known point. If both systems apply height correction, elevations can be double-corrected.

Use a known benchmark or repeatable control point before trusting elevations for design work.

## Correction Status Issues

If SW Maps reports `DGPS` with `Age of differential: n/a`, treat it as a corrected GNSS-style solution with an unverified correction source. Do not label it RTK Fixed, PointPerfect, or Galileo HAS unless the receiver diagnostics prove that correction source is active.

The reviewed web configuration did not expose a live HAS/PPP convergence status. USB serial diagnostics are the next step for proving the active correction source.

## Tilt Compensation Note

The saved FPX-T quickstart documentation says tilt compensation is not supported by this device, but the saved FPX-T tilt page documents tilt configuration and initialization. The `-T` designation and live web interface also indicate tilt compensation support.

Use the FPX-T tilt page and live interface as the better source for this model. Keep the pole vertical unless tilt compensation has been initialized and verified.

## Open Questions

- Exact FPX-T display icons and meanings.
- Exact correction-status indicators outside the visible web configuration page.
- Best order of checks for Galileo HAS, PointPerfect Flex, NTRIP, and base/rover workflows.
- Which USB diagnostic messages prove active Galileo HAS or PPP convergence on this receiver.
