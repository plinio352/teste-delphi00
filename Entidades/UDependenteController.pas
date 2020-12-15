unit UDependenteController;

interface

uses
  Data.DB, UdmModelo, System.SysUtils, Vcl.Dialogs, UDependente, UConstante,
  System.Variants;

type
  IDependenteController = interface
    function LstDep: OleVariant;
    procedure Incluir(const dts: TDataSet);
    procedure Alterar(const dts: TDataSet);
    procedure Excluir(const dts: TDataSet);
  end;

  TDependenteController = class(TInterfacedObject, IDependenteController)
  private
    FdepModelo: TDependente;
    procedure SetDependente(const value: TFields);

  public
    constructor Create;
    destructor Destroy; override;

    class function New: IDependenteController;
    function LstDep: OleVariant;
    procedure Incluir(const dts: TDataSet);
    procedure Alterar(const dts: TDataSet);
    procedure Excluir(const dts: TDataSet);

  end;

implementation

{ TDependenteController }

procedure TDependenteController.Alterar(const dts: TDataSet);
begin
  try
    SetDependente(dts.Fields);
    dmModelo.con.BeginTrans;

    dmModelo.cmd.CommandText := DEP_ALTERACAO;
    dmModelo.cmd.Parameters.ParamByName('id').Value := FdepModelo.id;
    dmModelo.cmd.Parameters.ParamByName('Nome').Value := FdepModelo.Nome;
    dmModelo.cmd.Parameters.ParamByName('IsCalculaIR').Value := FdepModelo.IsCalculaIR;
    dmModelo.cmd.Parameters.ParamByName('IsCalculaINSS').Value := FdepModelo.IsCalculaINSS;
    dmModelo.cmd.Parameters.ParamByName('FuncionarioId').Value := FdepModelo.FuncionarioId;
    dmModelo.cmd.Execute;

    dmModelo.con.CommitTrans;

    ShowMessage('Altera��o sucesso!');

  except
    on e: Exception do begin
      dmModelo.con.RollbackTrans;
      ShowMessage('Erro Consulta: '+ e.Message);
    end;
  end;

end;

constructor TDependenteController.Create;
begin
  FdepModelo := TDependente.Create;
end;

destructor TDependenteController.Destroy;
begin
  FdepModelo.Free;
  inherited;
end;

procedure TDependenteController.Excluir(const dts: TDataSet);
begin
  try
    SetDependente(dts.Fields);
    dmModelo.con.BeginTrans;

    dmModelo.cmd.CommandText := DEP_EXCLUSAO;
    dmModelo.cmd.Parameters.ParamByName('id').Value := FdepModelo.id;
    dmModelo.cmd.Execute;

    dmModelo.con.CommitTrans;

    ShowMessage('Exclus�o sucesso!');

  except
    on e: Exception do begin
      dmModelo.con.RollbackTrans;
      ShowMessage('Erro Consulta: '+ e.Message);
    end;
  end;

end;

procedure TDependenteController.Incluir(const dts: TDataSet);
begin
  try
    SetDependente(dts.Fields);
    dmModelo.con.BeginTrans;

    dmModelo.cmd.CommandText := DEP_INCLUIR;
    dmModelo.cmd.Parameters.ParamByName('Nome').Value := FdepModelo.Nome;
    dmModelo.cmd.Parameters.ParamByName('IsCalculaIR').Value := FdepModelo.IsCalculaIR;
    dmModelo.cmd.Parameters.ParamByName('IsCalculaINSS').Value := FdepModelo.IsCalculaINSS;
    dmModelo.cmd.Parameters.ParamByName('FuncionarioId').Value := FdepModelo.FuncionarioId;
    dmModelo.cmd.Execute;

    dmModelo.con.CommitTrans;

    ShowMessage('Inclus�o sucesso!');

  except
    on e: Exception do begin
      dmModelo.con.RollbackTrans;
      ShowMessage('Erro Consulta: '+ e.Message);
    end;
  end;

end;

function TDependenteController.LstDep: OleVariant;
begin
  Result := VarArrayCreate([0,1], varVariant);

  try
    dmModelo.dsDependente.Close;
    dmModelo.dsDependente.Open;
    Result[0] := dmModelo.dspDependente.Data;

    dmModelo.dsFuncionario.Close;
    dmModelo.dsFuncionario.Open;
    Result[1] := dmModelo.dspFuncionario.Data;

  except
    on e: Exception do
      ShowMessage('Erro Consulta: '+ e.Message);
  end;

end;

class function TDependenteController.New: IDependenteController;
begin
  Result := Self.Create;
end;

procedure TDependenteController.SetDependente(const value: TFields);
begin
  if not(value.FieldByName('id').IsNull) then
    FdepModelo.id             := value.FieldByName('id').Value;
  FdepModelo.Nome           := value.FieldByName('Nome').Value;
  FdepModelo.IsCalculaIR    := value.FieldByName('IsCalculaIR').Value;
  FdepModelo.IsCalculaINSS  := value.FieldByName('IsCalculaINSS').Value;
  FdepModelo.FuncionarioId  := value.FieldByName('FuncionarioId').Value;

end;

end.
