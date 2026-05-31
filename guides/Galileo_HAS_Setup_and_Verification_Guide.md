# Galileo HAS Setup and Verification Guide

This guide will explain how to use and verify Galileo HAS corrections on the FPX-T.

Sources: [FPX-T Modes of Operation](../docs/sparkpnt-fpx-t-operating-modes.html), [u-blox ZED-X20P data sheet](../docs/u-blox-zed-x20p-datasheet.pdf), [u-blox X20 HPG 2.02 interface description](../docs/u-blox-x20-hpg-2.02-interface-description.pdf)

## Current Documented Facts

- The FPX-T documentation says Galileo HAS corrections are enabled by default.
- The FPX-T documentation says the user should wait about 8 to 15 minutes for convergence.
- The FPX-T documentation describes expected precision as under 20 cm after convergence.
- HAS is useful where cellular data, internet, or other correction services are limited.

## Verification Goal

The goal is to prove that HAS is actually being received and used, not merely that the displayed position appears better.

## Procedure Draft

1. Power on the FPX-T outside with a clear view of the sky.
2. Confirm the receiver is not using NTRIP, PointPerfect Flex, Bluetooth corrections, USB corrections, ESP-NOW, or another correction source.
3. Confirm Galileo satellites are being tracked.
4. Locate the receiver status page or diagnostic message that reports HAS status.
5. Wait 8 to 15 minutes for convergence.
6. Record the displayed fix type, correction status, estimated accuracy, and any HAS-specific status.
7. Save screenshots or field notes.

## Open Questions

- How does the FPX-T display HAS status in the web interface?
- Can HAS be enabled or disabled from the FPX-T configuration page?
- Which u-blox messages prove HAS reception and convergence on the ZED-X20P?
- Does the FPX-T expose those messages directly, or is u-center 2 required?
