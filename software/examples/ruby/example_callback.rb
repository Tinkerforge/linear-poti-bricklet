#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_linear_poti'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change to your UID

ipcon = IPConnection.new # Create IP connection
lp = BrickletLinearPoti.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Register position callback (parameter has range 0 to 100)
lp.register_callback(BrickletLinearPoti::CALLBACK_POSITION) do |position|
  puts "Position: #{position}"
end

# Set period for position callback to 0.05s (50ms)
# Note: The position callback is only called every 0.05 seconds
#       if the position has changed since the last call!
lp.set_position_callback_period 50

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
