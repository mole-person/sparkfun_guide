# Galileo HAS Setup and Verification Guide

This guide will explain how to use and verify Galileo HAS corrections on the FPX-T.

Sources: [FPX-T Modes of Operation](../docs/sparkpnt-fpx-t-operating-modes.html), [u-blox ZED-X20P data sheet](../docs/u-blox-zed-x20p-datasheet.pdf), [u-blox X20 HPG 2.02 interface description](../docs/u-blox-x20-hpg-2.02-interface-description.pdf)

## Current Documented Facts

- The FPX-T documentation says Galileo HAS corrections are enabled by default.
- The FPX-T documentation says the user should wait about 8 to 15 minutes for convergence.
- The FPX-T documentation describes expected precision as under 20 cm after convergence.
- HAS is useful where cellular data, internet, or other correction services are limited.
- The FPX-T web interface Corrections Configuration page lists `PPP HAS/B2b` as a correction source priority.
- During first setup, the visible web configuration did not show a live HAS status, PPP convergence status, or active correction-source status.
- During first setup, SW Maps reported `DGPS` with `Age of differential: n/a`; this does not prove Galileo HAS.

## Verification Goal

The goal is to prove that HAS is actually being received and used, not merely that the displayed position appears better.

## Procedure Draft

1. Power on the FPX-T outside with a clear view of the sky.
2. Confirm the receiver is not using NTRIP, PointPerfect Flex, Bluetooth corrections, USB corrections, ESP-NOW, or another correction source.
3. Confirm Galileo satellites are being tracked.
4. Locate the receiver status page, serial diagnostic output, or u-blox message that reports HAS status.
5. Wait 8 to 15 minutes for convergence.
6. Record the displayed fix type, correction status, estimated accuracy, and any HAS-specific status.
7. Save screenshots or field notes.

## First Setup Result

The basic rover workflow was verified, but HAS was not verified:

- PointPerfect Service: Disabled
- NTRIP Client: unchecked
- TCP / UDP network output: unchecked
- ESP-NOW: unchecked
- LoRa: unchecked
- WiFi mode: AP / configuration portal
- SW Maps fix type: DGPS
- SW Maps age of differential: n/a
- Best observed SW Maps accuracy after stabilization: 17 cm horizontal / 34 cm vertical

The visible web configuration confirms that `PPP HAS/B2b` exists as a correction-source priority option, but it does not prove HAS reception or convergence.

## Next Verification Path: USB Diagnostics

Use USB diagnostics to look for receiver messages that identify the active correction source and PPP/HAS convergence state. Until that diagnostic evidence is captured, the guide should describe HAS as "not yet verified on this unit."

## Open Questions

- How does the FPX-T display HAS status in the web interface?
- Can HAS be enabled or disabled from the FPX-T configuration page?
- Which u-blox messages prove HAS reception and convergence on the ZED-X20P?
- Does the FPX-T expose those messages directly, or is u-center 2 required?
- Does the observed SW Maps `DGPS` fix come from SBAS, PPP HAS/B2b, or another receiver-side correction state?
- Which USB serial port, baud rate, and diagnostic tool are most reliable for reading those messages from the FPX-T?
