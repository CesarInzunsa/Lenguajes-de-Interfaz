unit Forma_CalculadoraB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormaCalculadoraB = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaCalculadoraB: TFormaCalculadoraB;

implementation

{$R *.dfm}

procedure TFormaCalculadoraB.Button1Click(Sender: TObject);
  var
    n1, n2, r: byte;//Declaracion de variables locales
begin
  //1. Obtener valor de las cajas de texto
  n1:= StrToInt(Edit1.Text);
  n2:= StrToInt(Edit2.Text);

  //2. Realizar operacion en ensamblador (Hibrida)
  asm
    mov al, n1
    mov dl, n2
    add al, dl

    mov r, al
  end; //Fin de asm

  //3. Enviar r a la caja de texto
  Edit3.Text:=IntToStr(r);
end;

end.
