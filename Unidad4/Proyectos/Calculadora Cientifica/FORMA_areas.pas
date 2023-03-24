unit FORMA_areas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormaAreas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EditRadio: TEdit;
    Edit2: TEdit;
    EditAltura: TEdit;
    EditBase: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditArea: TEdit;
    Label5: TLabel;
    Button2: TButton;
    Button1: TButton;
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
  FormaAreas: TFormaAreas;

implementation

{$R *.dfm}

procedure TFormaAreas.Button1Click(Sender: TObject);
var radio, pi, r:Real;
begin

try
  radio:=StrToFloat(EditRadio.Text);
  pi:=3.1416;

  asm
    FLD radio
    FLD radio
    FMUL
    FLD pi
    FMUL
    FSTP r
  end;

  EditArea.Text:=FloatToStr(r);

except
  showMessage('Error_en valores');

end;
end;

procedure TFormaAreas.Button2Click(Sender: TObject);
var base, altura, r, dos:Real;
begin

try
  base:=StrToFloat(EditBase.Text);
  altura:=StrToFloat(EditAltura.Text);
  dos:= 2;

  asm
    FLD base
    FLD altura
    FMUL
    FLD dos
    FDIV
    FSTP r
  end;

  EditArea.Text:=FloatToStr(r);

except
  showMessage('Error_en valores');

end;
end;

procedure TFormaAreas.Button3Click(Sender: TObject);
  var base, altura, r:Real;
begin
  try
  base:=StrToFloat(EditBase.Text);
  altura:=StrToFloat(EditAltura.Text);

  asm
    FLD base;
    FLD altura;
    FMUL
    FSTP r;
  end;

  EditArea.Text:=FloatToStr(r);
  except
    showMessage('Datos incorrectos');
  end;

end;

end.
