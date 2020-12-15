program Calculadora;

uses
  Vcl.Forms,
  UfrmCalculadora in 'UfrmCalculadora.pas' {frmCalculadora},
  UProcessa in 'UProcessa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalculadora, frmCalculadora);
  Application.Run;
end.
