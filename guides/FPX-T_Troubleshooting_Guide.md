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

## Open Questions

- Exact FPX-T display icons and meanings.
- Exact correction-status indicators in the web interface.
- Best order of checks for Galileo HAS, PointPerfect Flex, NTRIP, and base/rover workflows.
