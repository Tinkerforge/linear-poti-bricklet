#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_linear_poti'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = '7jb' # Change to your UID

ipcon = IPConnection.new # Create IP connection
lp = BrickletLinearPoti.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Get current position of poti (return value has range 0-100)
position = lp.get_position()
puts "Position: #{position}"

puts 'Press key to exit'
$stdin.gets
