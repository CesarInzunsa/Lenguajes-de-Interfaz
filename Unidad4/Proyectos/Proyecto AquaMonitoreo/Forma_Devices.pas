unit Forma_Devices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, ShellAPI;

type
  TDevices = class(TForm)
    panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Devices: TDevices;

implementation

{$R *.dfm}

uses Forma_EmulatioKit, Forma_Termometro;

procedure TDevices.Button1Click(Sender: TObject);
begin

  try
    ShellExecute(Devices.Handle,nil,PChar('C:\Users\cesar\Desktop\ProyectoAquaMonitoreo\Emulation Kit.exe'), nil, nil, SW_SHOWNORMAL);
  except
    showMessage('Error al intentar abrir el programa en ensamblador');

  end;
end;

procedure TDevices.Button2Click(Sender: TObject);
begin

  try
    ShellExecute(Devices.Handle,nil,PChar('C:\emu8086\DEVICES\Thermometer.exe'), nil, nil, SW_SHOWNORMAL);
  except
    showMessage('Error al intentar abrir el programa en ensamblador');

  end;

end;

procedure TDevices.Button3Click(Sender: TObject);
begin
  Devices.Close;
end;

procedure TDevices.Button4Click(Sender: TObject);
begin
  FormaInfoEmu.Show;
end;

procedure TDevices.Button5Click(Sender: TObject);
begin
  FormaTermometro.Show;
end;

end.
