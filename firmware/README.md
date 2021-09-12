# ESP32 Servo


## Quickstart

```
mc firmware make 
mc firmware make upload
```


## FAQ


### How to check if ESP32 module itself is working property

A simple test to check whether the toolchain and your ESP32 module is working is
to upload a [Blinky][Blinky] sketch

```
mc firmware make FIRMWARE=Blinky upload
```

The debug LED connected to pin 23 should now be blinking


### `serial.serialutil.SerialException: [Errno 13] could not open port /dev/ttyUSB0: [Errno 13] Permission denied: '/dev/ttyUSB0'`

* Check that your ESP32 is connected via `/dev/ttyUSB` (you can change `TTY` in [Makefile][Makefile])
* Check that your user has read/write permissions on `/dev/ttyUSB0`
* Check that the `/dev/ttyUSB0` device is forwarded to the docker container via `--device /dev/ttyUSB0`


### `A fatal error occurred: Failed to connect to ESP32: Invalid head of packet (0x1B)`

Looks like the device is not automatically entering programming mode. As soon as
you start seeing

```
Connecting........_____..
```

try holding the «BOOT» or «PROG» button and press the «RST» or «EN» button. The
ESP32 should enter bootloader mode and accept the firmware coming in.

