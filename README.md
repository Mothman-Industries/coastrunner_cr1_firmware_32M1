## Coast Runner CR-1 Firmware for 32M1

This firmware controls the BLDC spindle used on the Coast Runner CR-1.
It provides closed-loop (VFD) spindle control using a trap strategy. 

## Building

To be built using the MPLAB extensions in VSCode
Install the extension and open the project
Click the build button

## Flashing

Upload ./16m1debugtools/16m1debugcode/GG3_Arduino_As_ISP.ino to your machine through the arduino IDE
Using avrdude, flash debug.hex through the Arduino as ISP using command
```avrdude -p m32m1 -c arduino_as_isp -P com6 -v -U flash:w:default.hex```
Upload grBLDC to your machine through the arduino IDE
