unit Forma_Monitor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, ShellAPI;

type
  TFormaVentanaPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaVentanaPrincipal: TFormaVentanaPrincipal;

implementation

{$R *.dfm}

uses Forma_MasInfo, Forma_Datos, Forma_Devices, Forma_Mapa, Forma_Devices_Info,
  Forma_AcercaDe;

procedure TFormaVentanaPrincipal.Button1Click(Sender: TObject);
begin
  MasInfo.Show;
end;

procedure TFormaVentanaPrincipal.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormaVentanaPrincipal.Button3Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'C:\Users\cesar\Desktop\ProyectoAquaMonitoreo\ProyectoAquaMonitoreo.asm';
  try
    ShellExecute(FormaVentanaPrincipal.Handle,nil,PChar(URL), nil, nil, SW_SHOWNORMAL);
  except
    showMessage('Error al intentar abrir el programa en ensamblador');

  end;
end;

procedure TFormaVentanaPrincipal.Button4Click(Sender: TObject);
begin
  FormaDatos.Show;
end;

procedure TFormaVentanaPrincipal.Button5Click(Sender: TObject);
begin
  Devices.Show;
end;

procedure TFormaVentanaPrincipal.Button6Click(Sender: TObject);
begin
  Forma8.Show;
end;

procedure TFormaVentanaPrincipal.Button7Click(Sender: TObject);
begin
  FormaAcercaDe.Show;
end;

procedure TFormaVentanaPrincipal.Button8Click(Sender: TObject);
var
  URL: string;
begin

  URL := 'https://smn.conagua.gob.mx/es/climatologia/monitor-de-sequia/monitor-de-sequia-en-mexico';
  TRY
  //URL := StringReplace(URL, '"', '%22', [rfReplaceAll]);
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
  EXCEPT
    showMessage('ERROR al intentar abrir el sitio web del CONAGUA');

  END;
end;

procedure TFormaVentanaPrincipal.FormActivate(Sender: TObject);
begin
  FormaVentanaPrincipal.Caption:='Proyecto: AquaMonitoreo - Fecha: '+DateTimeToStr(now);
end;

end.
