package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
	"github.com/Tinkerforge/go-api-bindings/linear_poti_bricklet"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Linear Poti Bricklet.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	lp, _ := linear_poti_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	lp.RegisterPositionCallback(func(position uint16) {
		fmt.Printf("Position: %d\n", position) // Range: 0 to 100
	})

	// Set period for position receiver to 0.05s (50ms).
	// Note: The position callback is only called every 0.05 seconds
	//       if the position has changed since the last call!
	lp.SetPositionCallbackPeriod(50)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
