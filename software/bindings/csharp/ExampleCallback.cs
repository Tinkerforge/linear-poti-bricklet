using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "ABC"; // Change to your UID

	// Callback function for position callback (parameter has range 0-100) 
	static void PositionCB(ushort position)
	{
		System.Console.WriteLine("Position: " + position);
	}

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(HOST, PORT); // Create connection to brickd
		BrickletLinearPoti lp = new BrickletLinearPoti(UID); // Create device object
		ipcon.AddDevice(lp); // Add device to ip connection
		// Don't use device before it is added to a connection


		// Set Period for position callback to 0.05s (50ms)
		// Note: The position callback is only called every second if the 
		//       position has changed since the last call!
		lp.SetPositionCallbackPeriod(50);

		// Register position callback to function PositionCB
		lp.RegisterCallback(new BrickletLinearPoti.Position(PositionCB));

		System.Console.WriteLine("Press ctrl+c to exit");
		ipcon.JoinThread();
    }
}
