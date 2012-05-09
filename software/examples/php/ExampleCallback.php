<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLinearPoti.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLinearPoti;

$host = 'localhost';
$port = 4223;
$uid = '7jb'; // Change to your UID

// Callback function for position callback (parameter has range 0-100)
function cb_position($position)
{
    echo "Position: $position\n";
}

$ipcon = new IPConnection($host, $port); // Create IP connection to brickd
$poti = new BrickletLinearPoti($uid); // Create device object

$ipcon->addDevice($poti); // Add device to IP connection
// Don't use device before it is added to a connection

// Set Period for position callback to 0.05s (50ms)
// Note: The position position is only called every 50ms if the
//       position has changed since the last call!
$poti->setPositionCallbackPeriod(50);

// Register position callback to function cb_position
$poti->registerCallback(BrickletLinearPoti::CALLBACK_POSITION, 'cb_position');

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
