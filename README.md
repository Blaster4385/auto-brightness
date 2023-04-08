# Auto-Brightness

This is a simple script that uses the ambient light sensor on a laptop to adjust the brightness of the screen. It is designed to be run as a service, and will automatically adjust the brightness of the screen based on the ambient light in the room.

## Requirements

- Ambient light sensor (hardware)
- brightnessctl (to adjust brightness)

## Installation

- Clone the repository
- Run the install script as root

## Notes

- The script assumes that the sensor is located at `/sys/class/backlight/intel_backlight/`. If this is not the case, you will need to edit the script to reflect the correct path. You can find the correct path by running `find /sys -name "brightness"`.

- The script assumes that the ambient light sensor value is located at `/sys/bus/iio/devices/iio:device0/in_illuminance_raw`. If this is not the case, you will need to edit the script to reflect the correct path. A quick google search with your laptop model should help you find the correct path.