#!/bin/sh
# connects to localhost:4223 by default, use --host and --port to change it

# change to your UID
uid=XYZ

# get current position (value has range 0-100)
tinkerforge call linear-poti-bricklet $uid get-position
