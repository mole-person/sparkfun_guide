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
3. Open u-center 2 or the documented diagnostic tool.
4. Confirm the receiver is outputting position data.
5. Check satellite status.
6. Check fix type.
7. Check correction status.
8. Save screenshots or logs before changing any settings.

## Warning

Do not change u-blox module configuration until the exact setting and recovery process are documented.
