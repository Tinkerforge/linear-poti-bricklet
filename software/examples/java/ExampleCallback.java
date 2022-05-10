import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletLinearPoti;

public class ExampleCallback {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Linear Poti Bricklet
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletLinearPoti lp = new BrickletLinearPoti(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Add position listener
		lp.addPositionListener(new BrickletLinearPoti.PositionListener() {
			public void position(int position) {
				System.out.println("Position: " + position + " %"); // Range: 0 to 100
			}
		});

		// Set period for position callback to 0.05s (50ms)
		// Note: The position callback is only called every 0.05 seconds
		//       if the position has changed since the last call!
		lp.setPositionCallbackPeriod(50);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
