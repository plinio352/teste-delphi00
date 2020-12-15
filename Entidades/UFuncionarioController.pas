unit UFuncionarioController;

interface

uses
  Data.DB, UFuncionario, UdmModelo, UConstante, Vcl.Dialogs, System.SysUtils,
  System.Variants;

type
  IFuncionarioController = interface
    function LstFunc: OleVariant;
    procedure Incluir(const dts: TDataSet);
    procedure Alterar(const dts: TDataSet);
    procedure Excluir(const dts: TDataSet);
    function GetIR(const AIdFunc: Integer): Double;
    function GetINSS(const AIdFunc: Integer): Double;

  end;

  TFuncionarioController = class(TInterfacedObject, IFuncionarioController)
  private
    ffuncModelo: TFuncionario;
    procedure SetFuncionario(const value: TFields);

  public
    constructor Create;
    destructor Destroy; override;

    class function New: IFuncionarioController;
    function LstFunc: OleVariant;
    procedure Incluir(const dts: TDataSet);
    procedure Alterar(const dts: TDataSet);
    procedure Excluir(const dts: TDataSet);
    function GetIR(const AIdFunc: Integer): Double;
    function GetINSS(const AIdFunc: Integer): Double;


  end;

implementation

{ TFuncionarioController }

procedure TFuncionarioController.Alterar(const dts: TDataSet);
begin
  try
    SetFuncionario(dts.Fields);
    dmModelo.con.BeginTrans;

    dmModelo.cmd.CommandText := FUNC_ALTERACAO;
    dmModelo.cmd.Parameters.ParamByName('id').Value := ffuncModelo.id;
    dmModelo.cmd.Parameters.ParamByName('Nome').Value := ffuncModelo.Nome;
    dmModelo.cmd.Parameters.ParamByName('CPF').Value := ffuncModelo.CPF;
    dmModelo.cmd.Parameters.ParamByName('Salario').Value := ffuncModelo.Salario;
    dmModelo.cmd.Execute;

    dmModelo.con.CommitTrans;

    ShowMessage('Alteração sucesso!');

  except
    on e: Exception do begin
      dmModelo.con.RollbackTrans;
      ShowMessage('Erro Alteração: '+ e.Message);
    end;
  end;

end;

constructor TFuncionarioController.Create;
begin
  ffuncModelo := TFuncionario.Create;
end;

destructor TFuncionarioController.Destroy;
begin
  ffuncModelo.Destroy;
  inherited;
end;

procedure TFuncionarioController.Excluir(const dts: TDataSet);
begin
  try
    SetFuncionario(dts.Fields);
    dmModelo.con.BeginTrans;

    dmModelo.cmd.CommandText := FUNC_EXCLUSAO;
    dmModelo.cmd.Parameters.ParamByName('Nome').Value := ffuncModelo.id;
    dmModelo.cmd.Execute;

    dmModelo.con.CommitTrans;

    ShowMessage('Exclusão sucesso!');

  except
    on e: Exception do begin
      dmModelo.con.RollbackTrans;
      ShowMessage('Erro Exclusão: '+ e.Message);
    end;
  end;

end;

function TFuncionarioController.GetINSS(const AIdFunc: Integer): Double;
var
  Qtd: Integer;
begin
  Result := 0;

  dmModelo.qryConsul.Close;
  dmModelo.qryConsul.SQL.Clear;
  dmModelo.qryConsul.SQL.Add(DEP_QTD + 'and IsCalculaINSS = ''S''');
  dmModelo.qryConsul.Parameters.ParamByName('FuncionarioId').Value := AIdFunc;
  dmModelo.qryConsul.Open;

  Qtd := dmModelo.qryConsul.FieldByName('Qtd').Value;

  if Qtd > 0 then begin
    dmModelo.qryConsul.Close;
    dmModelo.qryConsul.SQL.Clear;
    dmModelo.qryConsul.SQL.Add(FUNC_LISTA + 'and id = :id');
    dmModelo.qryConsul.Parameters.ParamByName('id').Value := AIdFunc;
    dmModelo.qryConsul.Open;

    Result := dmModelo.qryConsul.FieldByName('Salario').Value * 0.08;

  end;


end;

function TFuncionarioController.GetIR(const AIdFunc: Integer): Double;
var
  Qtd: Integer;
begin
  Result := 0;
  dmModelo.qryConsul.Close;
  dmModelo.qryConsul.SQL.Clear;
  dmModelo.qryConsul.SQL.Add(DEP_QTD + 'and IsCalculaIR = ''S''');
  dmModelo.qryConsul.Parameters.ParamByName('FuncionarioId').Value := AIdFunc;
  dmModelo.qryConsul.Open;

  Qtd := dmModelo.qryConsul.FieldByName('Qtd').Value;

  if Qtd > 0 then begin
    dmModelo.qryConsul.Close;
    dmModelo.qryConsul.SQL.Clear;
    dmModelo.qryConsul.SQL.Add(FUNC_LISTA + 'and id = :id');
    dmModelo.qryConsul.Parameters.ParamByName('id').Value := AIdFunc;
    dmModelo.qryConsul.Open;

    Result := (dmModelo.qryConsul.FieldByName('Salario').Value - (Qtd * 100.00)) * 0.15;

  end;

end;

procedure TFuncionarioController.Incluir(const dts: TDataSet);
begin
  try
    SetFuncionario(dts.Fields);
    dmModelo.con.BeginTrans;

    dmModelo.cmd.CommandText := FUNC_INCLUIR;
    dmModelo.cmd.Parameters.ParamByName('Nome').Value := ffuncModelo.Nome;
    dmModelo.cmd.Parameters.ParamByName('CPF').Value := ffuncModelo.CPF;
    dmModelo.cmd.Parameters.ParamByName('Salario').Value := ffuncModelo.Salario;
    dmModelo.cmd.Execute;

    dmModelo.con.CommitTrans;

    ShowMessage('Inclusão sucesso!');

  except
    on e: Exception do begin
      dmModelo.con.RollbackTrans;
      ShowMessage('Erro Consulta: '+ e.Message);
    end;
  end;

end;

function TFuncionarioController.LstFunc: OleVariant;
begin
  Result := VarArrayCreate([0,0], varVariant);

  try
    dmModelo.dsFuncionario.Close;
    dmModelo.dsFuncionario.Open;
    Result[0] := dmModelo.dspFuncionario.Data;

  except
    on e: Exception do
      ShowMessage('Erro Consulta: '+ e.Message);
  end;

end;

class function TFuncionarioController.New: IFuncionarioController;
begin
  Result := Self.Create;
end;

procedure TFuncionarioController.SetFuncionario(const value: TFields);
begin
  if not(value.FieldByName('id').IsNull) then
    ffuncModelo.id    := value.FieldByName('id').Value;
  ffuncModelo.Nome    := value.FieldByName('Nome').Value;
  ffuncModelo.CPF     := value.FieldByName('CPF').Value;
  ffuncModelo.Salario := value.FieldByName('Salario').Value;

end;

end.
