function matlab_example_simple
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletLinearPoti;

    HOST = 'localhost';
    PORT = 4223;
    UID = '5WL'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    poti = BrickletLinearPoti(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current position of poti (return value has range 0-100)
    position = poti.getPosition();
    fprintf('Position: %g\n', position);

    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end
