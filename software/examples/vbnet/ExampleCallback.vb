Imports System
Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Linear Poti Bricklet

    ' Callback subroutine for position callback
    Sub PositionCB(ByVal sender As BrickletLinearPoti, ByVal position As Integer)
        Console.WriteLine("Position: " + position.ToString() + " %") ' Range: 0 to 100
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim lp As New BrickletLinearPoti(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Register position callback to subroutine PositionCB
        AddHandler lp.PositionCallback, AddressOf PositionCB

        ' Set period for position callback to 0.05s (50ms)
        ' Note: The position callback is only called every 0.05 seconds
        '       if the position has changed since the last call!
        lp.SetPositionCallbackPeriod(50)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
