var IPConnection = require('Tinkerforge/IPConnection');
var BrickletLinearPoti = require('Tinkerforge/BrickletLinearPoti');

var HOST = 'localhost';
var PORT = 4223;
var UID = '5WL';// Change to your UID

var ipcon = new IPConnection(); // Create IP connection
var poti = new BrickletLinearPoti(UID, ipcon); // Create device object

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
        // Get current position of poti (return value has range 0-100)
        poti.getPosition(
            function(position) {
                console.log('Position: '+position);
            },
            function(error) {
                if(error === IPConnection.ERROR_TIMEOUT) {
                  console.log('Error: The request timed out');
                }
            }
        );
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

