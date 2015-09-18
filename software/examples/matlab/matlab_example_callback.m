function matlab_example_callback()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletLinearPoti;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    lp = BrickletLinearPoti(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register position callback to function cb_position
    set(lp, 'PositionCallback', @(h, e) cb_position(e));

    % Set period for position callback to 0.05s (50ms)
    % Note: The position callback is only called every 0.05 seconds
    %       if the position has changed since the last call!
    lp.setPositionCallbackPeriod(50);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end

% Callback function for position callback (parameter has range 0 to 100)
function cb_position(e)
    fprintf('Position: %i\n', e.position);
end
