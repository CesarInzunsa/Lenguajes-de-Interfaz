program AppUno_23;

uses
  Vcl.Forms,
  Forma_Principal in 'Forma_Principal.pas' {FormaPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormaPrincipal, FormaPrincipal);
  Application.Run;
end.
