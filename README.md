# Cocoa-Sparkfun
A quick and dirty implementation using ORSSerialPort and the Sparkfun RFID reader.

1. Install the drivers - http://www.ftdichip.com/Drivers/VCP.htm
2. `ls -la /dev` directory and find your own device path(i.e. /dev/cu.usbserial-AI02KQN0)
3. Replace the DEVICE_PATH with your device path in the `ViewController.m`.
4. Build and become annoyed by the loud 'beep' the device makes when you scan

It's written in ObjectiveC. I'm 36 years old, get off my lawn.
All code resides in the view controller, as one would expect.
There are no unit tests.
I test in my mind.
