function octave_example_callback
    more off;
    
    HOST = "localhost";
    PORT = 4223;
    UID = "5WL"; % Change to your UID

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    poti = java_new("com.tinkerforge.BrickletLinearPoti", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Set Period for position callback to 0.05s (50ms)
    % Note: The position position is only called every 50ms if the 
    %       position has changed since the last call!
    poti.setPositionCallbackPeriod(50);

    % Register position callback to function cb_position
    poti.addPositionListener("cb_position");

    input("\nPress any key to exit...\n", "s");
    ipcon.disconnect();
end

% Callback function for position callback (parameter has range 0-100)
function cb_position(position_value)
    fprintf("Position: %g\n", position_value);
end
