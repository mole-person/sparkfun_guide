# GNSS Terminology Cheat Sheet

Use this cheat sheet when reading the other FPX-T guides.

## Core Terms

- **GNSS** means Global Navigation Satellite System. It is the general term for satellite positioning systems such as GPS, Galileo, GLONASS, and BeiDou.
- **GPS** is the United States satellite system. People often say "GPS" casually, but the FPX-T can use several GNSS systems.
- **Rover** means the receiver is moving around and collecting positions.
- **Base station** means a receiver is fixed in one place and sends correction data to a rover.
- **RTK** means Real-Time Kinematic. It is a correction method that can provide centimeter-level positioning when the rover receives good correction data.
- **NTRIP** is a common way to send RTK correction data over the internet.
- **PPP** means Precise Point Positioning. It estimates position using precise satellite corrections and usually needs convergence time.
- **PPP-RTK** is a correction method that can use wide-area correction services such as PointPerfect.
- **RTCM** is a common correction-data format used for RTK.
- **NMEA** is a common position-data format sent from GNSS receivers to mapping apps.
- **BLE** means Bluetooth Low Energy. The FPX-T uses Bluetooth/BLE for connection to mobile devices.
- **HAS** means High Accuracy Service. Galileo HAS is a free correction service from the Galileo satellite system.
- **PointPerfect Flex** is a u-blox correction service used for PPP-RTK-style positioning.
- **DGPS** means Differential GPS or Differential GNSS. In field apps, this usually means the receiver is reporting some kind of corrected GNSS solution, but it does not automatically prove RTK Fixed.
- **DOP** means Dilution of Precision. It describes how satellite geometry affects position quality. Lower is better.
- **PDOP** means Position Dilution of Precision. It combines horizontal and vertical geometry.
- **HDOP** means Horizontal Dilution of Precision. It relates to horizontal position quality.
- **VDOP** means Vertical Dilution of Precision. It relates to vertical position quality.
- **Age of differential** means how old the correction data is. If it is `n/a`, the app is not reporting the age of an incoming correction stream.

## Accuracy vs Precision

- **Precision** means repeated measurements agree with each other.
- **Accuracy** means the measured location is correct in the real world.

A local base station can give very tight relative precision, but if the base station position is not known accurately, the whole job can still be shifted. For septic design, this distinction matters because elevations, setbacks, property features, and design points may need to line up with a real-world coordinate system.

## DGPS And DOP In Field Apps

When SW Maps shows `DGPS`, it means the app is seeing a corrected GNSS-style fix. It does not automatically prove RTK Fixed, PointPerfect, or Galileo HAS. Treat `DGPS` as "corrected GNSS, source still needs verification."

`DOP` means Dilution of Precision. It describes whether the satellites are arranged well in the sky for positioning. Lower values are better.

- `PDOP` combines horizontal and vertical geometry into one overall position number.
- `HDOP` describes horizontal geometry for latitude/longitude.
- `VDOP` describes vertical geometry for height/elevation.

Good DOP values do not guarantee survey-grade accuracy. They only tell you the satellite geometry is favorable.
