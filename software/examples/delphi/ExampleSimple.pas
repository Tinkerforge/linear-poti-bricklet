program ExampleSimple;

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
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = '7jb'; { Change to your UID }

var
  e: TExample;

procedure TExample.Execute;
var position: word;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create();

  { Create device object }
  lp := TBrickletLinearPoti.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current position (value has range 0-100) }
  position := lp.GetPosition;
  WriteLn(Format('Position: %d', [position]));

  WriteLn('Press key to exit');
  ReadLn;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
