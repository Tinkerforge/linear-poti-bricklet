import com.tinkerforge.BrickletLinearPoti;
import com.tinkerforge.IPConnection;

public class ExampleCallback {
	private static final String host = new String("localhost");
	private static final int port = 4223;
	private static final String UID = new String("ABC"); // Change to your UID
	
	// Note: To make the example code cleaner we do not handle exceptions. Exceptions you
	//       might normally want to catch are described in the commnents below
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(host, port); // Create connection to brickd (Can throw IOException)

		BrickletLinearPoti poti = new BrickletLinearPoti(UID); // Create device object
		ipcon.addDevice(poti); // Add device to ip connection (Can throw IPConnection.TimeoutException)
		// Don't use device before it is added to a connection
		

		// Set Period for position callback to 0.05s (50ms)
		// Note: The position callback is only called every second if the 
		//       position has changed since the last call!
		poti.setPositionCallbackPeriod(50);

		// Add and implement position listener (called if position changes)
		poti.addListener(new BrickletLinearPoti.PositionListener() {
			public void position(int position) {
				System.out.println("Position: " + position);
			}
		});
		
		System.out.println("Press ctrl+c to exit");
		ipcon.joinThread();
	}
}
