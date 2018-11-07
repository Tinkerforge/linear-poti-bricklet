use std::{error::Error, io, thread};
use tinkerforge::{ip_connection::IpConnection, linear_poti_bricklet::*};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Linear Poti Bricklet.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let lp = LinearPotiBricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    let position_receiver = lp.get_position_callback_receiver();

    // Spawn thread to handle received callback messages.
    // This thread ends when the `lp` object
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for position in position_receiver {
            println!("Position: {}", position); // Range: 0 to 100
        }
    });

    // Set period for position receiver to 0.05s (50ms).
    // Note: The position callback is only called every 0.05 seconds
    //       if the position has changed since the last call!
    lp.set_position_callback_period(50);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
