program Entidades;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UdmModelo in 'UdmModelo.pas' {dmModelo: TDataModule},
  UFuncionario in 'UFuncionario.pas',
  UDependente in 'UDependente.pas',
  UDependenteController in 'UDependenteController.pas',
  UFuncionarioController in 'UFuncionarioController.pas',
  UConstante in 'UConstante.pas',
  UfrmPadrao in 'UfrmPadrao.pas' {frmPadrao},
  UfrmFuncionario in 'UfrmFuncionario.pas' {frmFuncionario},
  UfrmDependente in 'UfrmDependente.pas' {frmDependente},
  UFrmPesquisa in 'UFrmPesquisa.pas' {FrmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmModelo, dmModelo);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
