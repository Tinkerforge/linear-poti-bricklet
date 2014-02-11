var IPConnection = require('Tinkerforge/IPConnection');
var BrickletLinearPoti = require('Tinkerforge/BrickletLinearPoti');

var HOST = 'localhost';
var PORT = 4223;
var UID = '5WL';// Change to your UID

var ipcon = new IPConnection();// Create IP connection
var poti = new BrickletLinearPoti(UID, ipcon);// Create device object

ipcon.connect(HOST, PORT,
    function(error) {
        if(error === IPConnection.ERROR_ALREADY_CONNECTED) {
            console.log('Error: Already connected');        
        }
    }
);// Connect to brickd

// Don't use device before ipcon is connected
ipcon.on(IPConnection.CALLBACK_CONNECTED,
    function(connectReason) {
        // Set Period for position callback to 0.05s (50ms)
        // Note: The position position is only called every 50ms if the 
        // position has changed since the last call!
        poti.setPositionCallbackPeriod(50);   
    }
);

// Register position callback
poti.on(BrickletLinearPoti.CALLBACK_POSITION,
    // Callback function for position callback (parameter has range 0-100)
    function(position) {
        console.log('Position: '+position);
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data', function(data) {
	    ipcon.disconnect(
            function(error) {
                if(error === IPConnection.ERROR_NOT_CONNECTED) {
                    console.log('Error: Not connected');        
                }
            }
        );
process.exit(0);
});

