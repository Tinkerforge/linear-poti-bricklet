<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLinearPoti.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLinearPoti;

$host = 'localhost';
$port = 4223;
$uid = '7jb'; // Change to your UID

$ipcon = new IPConnection($host, $port); // Create IP connection to brickd
$poti = new BrickletLinearPoti($uid); // Create device object

$ipcon->addDevice($poti); // Add device to IP connection
// Don't use device before it is added to a connection

// Get current position of poti (return value has range 0-100)
$position = $poti->getPosition();

echo "Position: $position\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->destroy();

?>
