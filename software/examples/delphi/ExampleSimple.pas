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
  UID = '7jb';

var
  e: TExample;

procedure TExample.Execute;
var position: word;
begin
  { Create IP connection to brickd }
  ipcon := TIPConnection.Create(HOST, PORT);

  { Create device object }
  lp := TBrickletLinearPoti.Create(UID);

  { Add device to IP connection }
  ipcon.AddDevice(lp);
  { Don't use device before it is added to a connection }

  { Get current position (value has range 0-100) }
  position := lp.GetPosition;
  WriteLn(Format('Position: %d', [position]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
