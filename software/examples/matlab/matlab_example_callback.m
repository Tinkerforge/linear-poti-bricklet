function matlab_example_callback
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletLinearPoti;

    HOST = 'localhost';
    PORT = 4223;
    UID = '5WL'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    poti = BrickletLinearPoti(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Set Period for position callback to 0.05s (50ms)
    % Note: The position position is only called every 50ms if the 
    %       position has changed since the last call!
    poti.setPositionCallbackPeriod(50);

    % Register threshold reached callback to function cb_reached
    set(poti, 'PositionCallback', @(h, e) cb_position(e));

    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end

% Callback function for position callback (parameter has range 0-100)
function cb_position(e)
    fprintf('Position: %g\n', e.position);
end
