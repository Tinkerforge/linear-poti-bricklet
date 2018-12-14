package main

import (
	"fmt"
	"tinkerforge/ipconnection"
	"tinkerforge/linear_poti_bricklet"
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

	// Get current position.
	position, _ := lp.GetPosition()
	fmt.Printf("Position: \n", position) // Range: 0 to 100

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
