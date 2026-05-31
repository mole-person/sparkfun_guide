# FPX-T GNSS Receiver Project Brief

## Purpose

I recently purchased a SparkPNT FPX-T GNSS receiver and want to develop a complete understanding of how to use it effectively for septic system design and related field work.

I am NOT a programmer and I am relatively new to GNSS technology. Documentation and procedures should be written for a technically-minded beginner, not for a software developer or professional surveyor.

Explanations should avoid unnecessary jargon. When technical terms are required, they should be defined and explained in plain English.

---

# Primary Goal

Create a complete FPX-T User Guide that teaches me:

1. How the hardware works
2. How to configure the receiver
3. How to verify that it is working correctly
4. How to troubleshoot common problems
5. How to use Galileo HAS corrections
6. How to use PointPerfect Flex corrections
7. How to collect field data
8. How to maintain and update the receiver

The final guide should be practical and focused on real-world use rather than theory.

---

# My Background

* New to GNSS technology
* Not a programmer
* Comfortable using Windows
* Comfortable following technical instructions
* Starting a septic design business
* Primary use case is professional field data collection
* Accuracy requirements range from sub-meter to centimeter-level depending on task

When writing procedures, assume I may not know:

* GNSS terminology
* RTK terminology
* PPP terminology
* NTRIP terminology
* u-blox terminology

All acronyms should be explained.

---

# Hardware

Current Receiver:

* SparkPNT FPX-T

Receiver Hardware:

* u-blox ZED-X20P

Planned Correction Services:

* Galileo HAS
* PointPerfect Flex

Potential Field Software:

* SW Maps
* QField
* QGIS

Potential Diagnostic Software:

* u-center 2

---

# Documentation Priority

Use these sources first whenever possible.

Priority 1:

FPX-T Documentation

https://docs.sparkpnt.com/FPX-T/

Priority 2:

SparkFun RTK Everywhere Firmware Documentation

https://docs.sparkfun.com/SparkFun_RTK_Everywhere_Firmware/introduction/

Priority 3:

SparkFun RTK Everywhere Firmware Source Code

https://github.com/sparkfun/SparkFun_RTK_Everywhere_Firmware

Priority 4:

u-blox ZED-X20P Documentation

* Data Sheet
* Integration Manual
* Interface Description
* User Guide

Priority 5:

PointPerfect Flex Documentation

Priority 6:

General GNSS references

Do not assume behavior based on older SparkFun products if FPX-T documentation exists.

Documentation should always take precedence over assumptions.

---

# Initial Research Objectives

Answer the following questions using documentation.

## Device Configuration

How is the FPX-T configured?

* Web browser?
* USB?
* Bluetooth?
* WiFi?
* Serial interface?

What interfaces are available?

How does a Windows PC communicate with the receiver?

---

## Firmware

How are firmware updates performed?

How can firmware versions be checked?

Can settings be backed up?

Can settings be restored?

---

## GNSS Operation

How can satellite status be viewed?

How can signal quality be viewed?

How can fix status be viewed?

How can correction status be viewed?

---

## Galileo HAS

Determine:

* Whether Galileo HAS is enabled by default
* Whether Galileo HAS can be enabled or disabled
* How HAS status is displayed
* How HAS reception can be verified
* How HAS convergence can be verified
* Whether HAS uses Galileo E6 on this receiver
* Expected performance when HAS is operating correctly

The objective is to create a repeatable test procedure that proves HAS is actually working.

Do not rely solely on observed accuracy improvements.

---

## PointPerfect Flex

Determine:

* Setup procedure
* Credential management
* Internet requirements
* Bluetooth requirements
* WiFi requirements
* Expected startup procedure
* Expected fix acquisition times
* Troubleshooting procedures

Create a field-ready workflow.

---

## Diagnostics

Determine whether direct access to the ZED-X20P is possible.

Determine whether u-center 2 can be used.

Determine:

* What information u-center provides
* When u-center is useful
* When the web interface is sufficient

Create a troubleshooting workflow beginning with the simplest tools first.

---

# Desired Deliverables

Create the following documents.

1. FPX-T Quick Start Guide
2. FPX-T Daily Field Procedure
3. Galileo HAS Setup and Verification Guide
4. PointPerfect Flex Setup Guide
5. FPX-T Troubleshooting Guide
6. FPX-T Firmware Update Guide
7. Advanced Diagnostics Guide
8. GNSS Terminology Cheat Sheet

---

# Writing Style Requirements

Write for a beginner.

Explain concepts before using them.

Provide screenshots or references where possible.

Use checklists.

Use decision trees.

Avoid assuming prior GNSS knowledge.

When uncertainty exists, identify the source of uncertainty and cite supporting documentation.

Do not guess.

Use documented behavior whenever possible.

Directory setup
SPARKFUN_GUIDE/
├── PROJECT_BRIEF.md
├── README.md
├── docs/
├── notes/
├── procedures/
└── FPX-T_Field_Guide.md

Then put PDFs, screenshots, copied documentation pages, and any notes you gather into the docs/ folder. Codex will have a much easier time helping you build a reliable field guide if it can reference the actual source documents instead of relying on memory or web searches.