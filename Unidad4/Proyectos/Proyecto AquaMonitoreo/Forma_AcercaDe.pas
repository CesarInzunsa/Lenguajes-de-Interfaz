unit Forma_AcercaDe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormaAcercaDe = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaAcercaDe: TFormaAcercaDe;

implementation

{$R *.dfm}

procedure TFormaAcercaDe.Button1Click(Sender: TObject);
begin
  FormaAcercaDe.Close;
end;

end.
