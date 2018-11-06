use std::{error::Error, io, thread};
use tinkerforge::{ipconnection::IpConnection, linear_poti_bricklet::*};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Linear Poti Bricklet

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection
    let linear_poti_bricklet = LinearPotiBricklet::new(UID, &ipcon); // Create device object

    ipcon.connect(HOST, PORT).recv()??; // Connect to brickd
                                        // Don't use device before ipcon is connected

    //Create listener for position events.
    let position_listener = linear_poti_bricklet.get_position_receiver();
    // Spawn thread to handle received events. This thread ends when the linear_poti_bricklet
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for event in position_listener {
            println!("Position: {}", event); // Range: 0 to 100
        }
    });

    // Set period for position listener to 0.05s (50ms)
    // Note: The position callback is only called every 0.05 seconds
    //       if the position has changed since the last call!
    linear_poti_bricklet.set_position_callback_period(50);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
