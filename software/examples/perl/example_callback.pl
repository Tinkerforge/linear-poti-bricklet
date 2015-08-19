#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletLinearPoti;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change to your UID

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $lp = Tinkerforge::BrickletLinearPoti->new(&UID, $ipcon); # Create device object

# Callback subroutine for position callback (parameter has range 0 to 100)
sub cb_position
{
    my ($position) = @_;

    print "Position: " . $position . "\n";
}

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Set period for position callback to 0.05s (50ms)
# Note: The position callback is only called every 0.05 seconds
#       if the position has changed since the last call!
$lp->set_position_callback_period(50);

# Register position callback to subroutine cb_position
$lp->register_callback($lp->CALLBACK_POSITION, 'cb_position');

print "Press any key to exit...\n";
<STDIN>;
$ipcon->disconnect();
