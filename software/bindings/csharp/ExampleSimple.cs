using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "ABC"; // Change to your UID

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(HOST, PORT); // Create connection to brickd
		BrickletLinearPoti lp = new BrickletLinearPoti(UID); // Create device object
		ipcon.AddDevice(lp); // Add device to ip connection
		// Don't use device before it is added to a connection


		// Get current position of poti (return value has range 0-100)
		ushort position;
		lp.GetPosition(out position);

		System.Console.WriteLine("Position: " + position);

		System.Console.WriteLine("Press ctrl+c to exit");
		ipcon.JoinThread();
    }
}
