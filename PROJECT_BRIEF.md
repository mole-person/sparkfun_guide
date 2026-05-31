# FPX-T GNSS Receiver Project Brief

## Purpose

Develop a complete, practical guide for using a SparkPNT FPX-T GNSS receiver for septic system design and related field work.

The guide is written for a technically minded beginner who is comfortable following Windows-based technical instructions but is new to GNSS, RTK, PPP, NTRIP, and u-blox terminology.

## Primary Goal

Create a complete FPX-T User Guide that teaches:

1. How the hardware works
2. How to configure the receiver
3. How to verify that it is working correctly
4. How to troubleshoot common problems
5. How to use Galileo HAS corrections
6. How to use PointPerfect Flex corrections
7. How to collect field data
8. How to maintain and update the receiver

The final guide should be practical and focused on real-world use rather than theory.

## Hardware

- Receiver: SparkPNT FPX-T
- GNSS module: u-blox ZED-X20P
- Planned correction services:
  - Galileo HAS
  - PointPerfect Flex
- Potential field software:
  - SW Maps
  - QField
  - QGIS
- Potential diagnostic software:
  - u-center 2

## Source Priority

Use these sources first whenever possible:

1. FPX-T Documentation: https://docs.sparkpnt.com/FPX-T/
2. SparkFun RTK Everywhere Firmware Documentation: https://docs.sparkfun.com/SparkFun_RTK_Everywhere_Firmware/introduction/
3. SparkFun RTK Everywhere Firmware Source Code: https://github.com/sparkfun/SparkFun_RTK_Everywhere_Firmware
4. u-blox ZED-X20P documentation
5. PointPerfect Flex documentation
6. General GNSS references

Do not assume behavior based on older SparkFun products if FPX-T documentation exists. Documentation should always take precedence over assumptions.

## Deliverables

1. FPX-T Quick Start Guide
2. FPX-T Daily Field Procedure
3. Galileo HAS Setup and Verification Guide
4. PointPerfect Flex Setup Guide
5. FPX-T Troubleshooting Guide
6. FPX-T Firmware Update Guide
7. Advanced Diagnostics Guide
8. GNSS Terminology Cheat Sheet

## Writing Requirements

- Write for a beginner.
- Explain concepts before using them.
- Define acronyms in plain English.
- Provide screenshots or references where possible.
- Use checklists.
- Use decision trees.
- Avoid assuming prior GNSS knowledge.
- When uncertainty exists, identify the uncertainty and cite supporting documentation.
- Do not guess.
- Use documented behavior whenever possible.

## Repository Structure

```text
SPARKFUN_GUIDE/
|-- PROJECT_BRIEF.md
|-- README.md
|-- docs/
|-- notes/
|-- procedures/
`-- FPX-T_Field_Guide.md
```

Put PDFs, screenshots, copied documentation pages, and research notes in `docs/` so future guide work can reference actual source documents.
