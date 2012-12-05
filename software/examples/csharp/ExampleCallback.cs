using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "ABC"; // Change to your UID

	// Callback function for position callback (parameter has range 0-100) 
	static void PositionCB(object sender, int position)
	{
		System.Console.WriteLine("Position: " + position);
	}

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletLinearPoti lp = new BrickletLinearPoti(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Set Period for position callback to 0.05s (50ms)
		// Note: The position callback is only called every second if the 
		//       position has changed since the last call!
		lp.SetPositionCallbackPeriod(50);

		// Register position callback to function PositionCB
		lp.Position += PositionCB;

		System.Console.WriteLine("Press key to exit");
		System.Console.ReadKey();
	}
}
