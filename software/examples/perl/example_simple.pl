#!/usr/bin/perl  

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletLinearPoti;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => '5WL'; # Change to your UID

my $ipcon = IPConnection->new(); # Create IP connection
my $poti = BrickletLinearPoti->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current position of poti (return value has range 0-100)
my $position = $poti->get_position();

print "Position: $position\n";

print "\nPress any key to exit...\n";
<STDIN>;
$ipcon->disconnect();

