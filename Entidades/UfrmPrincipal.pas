unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UfrmFuncionario, UfrmDependente;

type
  TfrmPrincipal = class(TForm)
    mmPrinc: TMainMenu;
    Menu: TMenuItem;
    Funcionario1: TMenuItem;
    Dependente1: TMenuItem;
    procedure Funcionario1Click(Sender: TObject);
    procedure Dependente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Dependente1Click(Sender: TObject);
begin
  try
    frmDependente := TfrmDependente.Create(Self);
    frmDependente.Show;

  finally

  end;
end;

procedure TfrmPrincipal.Funcionario1Click(Sender: TObject);
begin
  try
    frmFuncionario := TfrmFuncionario.Create(Self);
    frmFuncionario.Show;

  finally

  end;

end;

end.
