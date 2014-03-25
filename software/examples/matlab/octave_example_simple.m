function matlab_example_simple
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "5WL"; % Change to your UID

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    poti = java_new("com.tinkerforge.BrickletLinearPoti", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current position of poti (return value has range 0-100)
    position = poti.getPosition();

    fprintf("Position: %g\n", position);

    input("\nPress any key to exit...\n", "s");
    ipcon.disconnect();
end

