unit Forma_Datos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormaDatos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaDatos: TFormaDatos;

implementation

{$R *.dfm}

procedure TFormaDatos.Button1Click(Sender: TObject);
begin
  if fileExists('C:\emu8086\vdrive\C\AquaMonitoreo\datosRegistrados.txt') then
    BEGIN
    memo1.Lines.LoadFromFile('C:\emu8086\vdrive\C\AquaMonitoreo\datosRegistrados.txt') ;
    Memo1.Lines.Delete(6);
    END
    else
      showMessage('ERROR! no se logro leer la información del archivo o aun no fue creado');

end;

procedure TFormaDatos.Button2Click(Sender: TObject);
begin
  FormaDatos.Close;
end;

procedure TFormaDatos.Button3Click(Sender: TObject);
begin
  memo1.Clear;
end;

end.
