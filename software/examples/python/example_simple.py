#!/usr/bin/env python
# -*- coding: utf-8 -*-  

HOST = "localhost"
PORT = 4223
UID = "abc" # Change to your UID

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_linear_poti import LinearPoti

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    poti = LinearPoti(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Get current position of poti (return value has range 0-100)
    position = poti.get_position()

    print('Position: ' + str(position))

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.disconnect()
