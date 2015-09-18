#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change to your UID

# Get current position (range is 0 to 100)
tinkerforge call linear-poti-bricklet $uid get-position
