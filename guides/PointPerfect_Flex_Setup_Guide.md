# PointPerfect Flex Setup Guide

This guide will explain how to configure PointPerfect Flex corrections for the FPX-T.

Sources: [SparkFun RTK Everywhere PointPerfect Flex](../docs/sparkfun-rtk-everywhere-pointperfect-flex.html), [u-blox PointPerfect Flex](../docs/u-blox-pointperfect-flex.html), [u-blox PointPerfect Service Coverage](../docs/u-blox-pointperfect-service-coverage.html), [FPX-T Modes of Operation](../docs/sparkpnt-fpx-t-operating-modes.html)

## Current Documented Facts

- The FPX-T documentation describes PPP-RTK corrections from u-blox PointPerfect.
- The FPX-T documentation says PointPerfect-style corrections are provided over an IP connection, usually using a cell phone hotspot.
- The FPX-T documentation says time to RTK fix can take up to 300 seconds.
- The FPX-T documentation lists expected horizontal accuracy as about 14 to 60 mm.
- The FPX-T web interface includes a PointPerfect Configuration section.
- During first setup, the PointPerfect Service setting was `Disabled`.
- During first setup, the PointPerfect Device ID was visible as `28562FACA3B606`.

## Setup Workflow Draft

1. Confirm the PointPerfect Flex account, plan, and coverage area.
2. Confirm the FPX-T has an internet path, such as WiFi through a phone hotspot.
3. Open the FPX-T WiFi configuration page at `http://rtk.local`.
4. Locate the PointPerfect or correction-service settings.
5. Enter the required PointPerfect credentials.
6. Save the settings.
7. Restart or reconnect if the web interface requires it.
8. Wait for corrections and RTK fix.
9. Record the startup time and final fix status.

## Open Questions

- Exact credential fields required by the FPX-T web interface.
- Whether Bluetooth is involved in the PointPerfect Flex workflow or only WiFi/internet.
- How the FPX-T reports PointPerfect connection status.
- Best troubleshooting steps for expired credentials, no internet, or no fix.
