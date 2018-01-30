function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletLinearPoti;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Linear Poti Bricklet

    ipcon = IPConnection(); % Create IP connection
    lp = handle(BrickletLinearPoti(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current position
    position = lp.getPosition();
    fprintf('Position: %i\n', position); % Range: 0 to 100

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
