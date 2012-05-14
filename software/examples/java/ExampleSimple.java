import com.tinkerforge.BrickletLinearPoti;
import com.tinkerforge.IPConnection;

public class ExampleSimple {
	private static final String host = "localhost";
	private static final int port = 4223;
	private static final String UID = "ABC"; // Change to your UID

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions you
	//       might normally want to catch are described in the commnents below
	public static void main(String args[]) throws Exception {
		// Create connection to brickd
		IPConnection ipcon = new IPConnection(host, port); // Can throw IOException
		BrickletLinearPoti poti = new BrickletLinearPoti(UID); // Create device object

		// Add device to IP connection
		ipcon.addDevice(poti); // Can throw IPConnection.TimeoutException
		// Don't use device before it is added to a connection

		// Get current position (return value has range 0-100)
		int position = poti.getPosition(); // Can throw IPConnection.TimeoutException

		System.out.println("Position: " + position);

		System.out.println("Press ctrl+c to exit");
		ipcon.joinThread();
	}
}
