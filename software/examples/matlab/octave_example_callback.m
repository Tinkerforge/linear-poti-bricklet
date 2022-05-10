function octave_example_callback()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Linear Poti Bricklet

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    lp = javaObject("com.tinkerforge.BrickletLinearPoti", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register position callback to function cb_position
    lp.addPositionCallback(@cb_position);

    % Set period for position callback to 0.05s (50ms)
    % Note: The position callback is only called every 0.05 seconds
    %       if the position has changed since the last call!
    lp.setPositionCallbackPeriod(50);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for position callback
function cb_position(e)
    fprintf("Position: %d %%\n", e.position); % Range: 0 to 100
end
