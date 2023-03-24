program ProyectoCalculadoraB_23;

uses
  Vcl.Forms,
  Forma_CalculadoraB in 'Forma_CalculadoraB.pas' {FormaCalculadoraB};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormaCalculadoraB, FormaCalculadoraB);
  Application.Run;
end.
