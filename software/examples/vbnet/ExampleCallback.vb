Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change to your UID

    ' Callback function for position callback (parameter has range 0 to 100)
    Sub PositionCB(ByVal sender As BrickletLinearPoti, ByVal position As Integer)
        System.Console.WriteLine("Position: " + position.ToString())
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim lp As New BrickletLinearPoti(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Set period for position callback to 0.05s (50ms)
        ' Note: The position callback is only called every 0.05 seconds
        '       if the position has changed since the last call!
        lp.SetPositionCallbackPeriod(50)

        ' Register position callback to function PositionCB
        AddHandler lp.Position, AddressOf PositionCB

        System.Console.WriteLine("Press key to exit")
        System.Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
