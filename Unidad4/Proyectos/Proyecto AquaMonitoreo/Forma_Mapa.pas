unit Forma_Mapa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForma8 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Forma8: TForma8;

implementation

{$R *.dfm}

procedure TForma8.Button1Click(Sender: TObject);
begin
  Forma8.Close;
end;

end.
