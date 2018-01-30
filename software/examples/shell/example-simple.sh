#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Linear Poti Bricklet

# Get current position
tinkerforge call linear-poti-bricklet $uid get-position
