#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletLinearPoti;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Linear Poti Bricklet

# Callback subroutine for position callback
sub cb_position
{
    my ($position) = @_;

    print "Position: $position\n"; # Range: 0 to 100
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $lp = Tinkerforge::BrickletLinearPoti->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register position callback to subroutine cb_position
$lp->register_callback($lp->CALLBACK_POSITION, 'cb_position');

# Set period for position callback to 0.05s (50ms)
# Note: The position callback is only called every 0.05 seconds
#       if the position has changed since the last call!
$lp->set_position_callback_period(50);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
