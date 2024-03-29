using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Linear Poti Bricklet

	// Callback function for position callback
	static void PositionCB(BrickletLinearPoti sender, int position)
	{
		Console.WriteLine("Position: " + position + " %"); // Range: 0 to 100
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletLinearPoti lp = new BrickletLinearPoti(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register position callback to function PositionCB
		lp.PositionCallback += PositionCB;

		// Set period for position callback to 0.05s (50ms)
		// Note: The position callback is only called every 0.05 seconds
		//       if the position has changed since the last call!
		lp.SetPositionCallbackPeriod(50);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
