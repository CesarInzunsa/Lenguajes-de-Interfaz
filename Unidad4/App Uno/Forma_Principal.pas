unit Forma_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormaPrincipal = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaPrincipal: TFormaPrincipal;

implementation

{$R *.dfm}

procedure TFormaPrincipal.Button1Click(Sender: TObject);
begin
  showMessage('Hola Mundo!! '+edit1.Text);
end;

procedure TFormaPrincipal.Button2Click(Sender: TObject);
begin
  application.Terminate;
end;

end.
