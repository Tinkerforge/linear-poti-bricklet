program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLinearPoti;

type
  TExample = class
  private
    ipcon: TIPConnection;
    lp: TBrickletLinearPoti;
  public
    procedure PositionCB(const position: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = '7jb'; { Change to your UID }

var
  e: TExample;

{ Callback function for position callback (parameter has range 0-100) }
procedure TExample.PositionCB(const position: word);
begin
  WriteLn(Format('Position: %d', [position]));
end;

procedure TExample.Execute;
begin
  { Create IP connection to brickd }
  ipcon := TIPConnection.Create(HOST, PORT);

  { Create device object }
  lp := TBrickletLinearPoti.Create(UID);

  { Add device to IP connection }
  ipcon.AddDevice(lp);
  { Don't use device before it is added to a connection }

  { Set Period for position callback to 0.05s (50ms)
    Note: The position callback is only called every 50ms if the
          position has changed since the last call! }
  lp.SetPositionCallbackPeriod(50);

  { Register position callback to procedure PositionCB }
  lp.OnPosition := {$ifdef FPC}@{$endif}PositionCB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
