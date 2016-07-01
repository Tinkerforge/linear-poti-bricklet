<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLinearPoti.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLinearPoti;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Linear Poti Bricklet

// Callback function for position callback (parameter has range 0 to 100)
function cb_position($position)
{
    echo "Position: $position\n";
}

$ipcon = new IPConnection(); // Create IP connection
$lp = new BrickletLinearPoti(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register position callback to function cb_position
$lp->registerCallback(BrickletLinearPoti::CALLBACK_POSITION, 'cb_position');

// Set period for position callback to 0.05s (50ms)
// Note: The position callback is only called every 0.05 seconds
//       if the position has changed since the last call!
$lp->setPositionCallbackPeriod(50);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
