<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLinearPoti.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLinearPoti;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Linear Poti Bricklet

$ipcon = new IPConnection(); // Create IP connection
$lp = new BrickletLinearPoti(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Get current position
$position = $lp->getPosition();
echo "Position: $position\n"; // Range: 0 to 100

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
