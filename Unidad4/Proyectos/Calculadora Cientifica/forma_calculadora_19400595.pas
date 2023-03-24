unit forma_calculadora_19400595;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormCalculadora = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel2: TPanel;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCalculadora: TFormCalculadora;

implementation

{$R *.dfm}

uses FORMA_areas;

procedure TFormCalculadora.Button1Click(Sender: TObject);
var n1,n2,r:Real; //real = double
begin
  try
    n1:=StrToFloat(Edit1.Text);
    n2:=StrToFloat(Edit2.Text);
    ASM
      FLD n1
      FLD n2
      FADD
      FSTP r
    END;

    Edit3.Text:=floatToStr(r);

  except
    showMessage('Datos incorrectos');
  end;
end;

procedure TFormCalculadora.Button2Click(Sender: TObject);
  var n1, n2, r:Real;
begin
  try

    n1:=StrToFloat(Edit1.Text);
    n2:=StrToFloat(Edit2.Text);

    asm
      FLD n1
      FLD n2
      FSUB
      FSTP r
    end;

    Edit3.Text:=FLoatToStr(r);

  except
    showMessage('Datos incorrectos');

  end;
end;

procedure TFormCalculadora.Button3Click(Sender: TObject);
  var n1, n2, r:Real;
begin
  try
  n1:=StrToFloat(Edit1.Text);
  n2:=StrToFloat(Edit2.Text);

  asm
    FLD n1
    FLD n2
    FMUL
    FSTP r
  end;

  Edit3.Text:=FloatToStr(r);
  except
    showMessage('Datos incorrectos');
  end;
end;

procedure TFormCalculadora.Button4Click(Sender: TObject);
  var n1, n2, r: Real;
begin
try
  n1:= StrToFloat(Edit1.Text);
  n2:= StrToFloat(Edit2.Text);

  asm
    FLD n1
    FLD n2
    FDIV
    FSTP r
  end;

  Edit3.Text:=FloatToStr(r);

except
  showMessage('Datos incorrectos');

end;
end;

procedure TFormCalculadora.Button6Click(Sender: TObject);
begin
  try
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';

  except
    showMessage('Error');

  end;
end;

procedure TFormCalculadora.Button7Click(Sender: TObject);
    var n1, r:Real;
begin
  try
  n1:=StrToFloat(Edit1.Text);

  asm
    FLD n1
    FSQRT
    FSTP r
  end;

  Edit3.Text:=FloatToStr(r);
  except
    showMessage('Datos incorrectos');
  end;
end;

procedure TFormCalculadora.Button8Click(Sender: TObject);
begin

  FormaAreas.Show();

end;

end.
