#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletLinearPoti;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Linear Poti Bricklet

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $lp = Tinkerforge::BrickletLinearPoti->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current position
my $position = $lp->get_position();
print "Position: $position\n"; # Range: 0 to 100

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
