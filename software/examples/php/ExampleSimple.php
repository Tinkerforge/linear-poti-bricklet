<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLinearPoti.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLinearPoti;

$host = 'localhost';
$port = 4223;
$uid = '7jb'; // Change to your UID

$ipcon = new IPConnection(); // Create IP connection
$poti = new BrickletLinearPoti($uid, $ipcon); // Create device object

$ipcon->connect($host, $port); // Connect to brickd
// Don't use device before ipcon is connected

// Get current position of poti (return value has range 0-100)
$position = $poti->getPosition();

echo "Position: $position\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));

?>
