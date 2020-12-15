unit UDependente;

interface

type
  TDependente = class
  private
    Fid: Integer;
    FFuncionarioId: Integer;
    FIsCalculaINSS: string;
    FNome: string;
    FIsCalculaIR: string;
    procedure SetFuncionarioId(const Value: Integer);
    procedure Setid(const Value: Integer);
    procedure SetIsCalculaINSS(const Value: string);
    procedure SetIsCalculaIR(const Value: string);
    procedure SetNome(const Value: string);
  public
    property id: Integer read Fid write Setid;
    property Nome: string read FNome write SetNome;
    property IsCalculaIR: string read FIsCalculaIR write SetIsCalculaIR;
    property IsCalculaINSS: string read FIsCalculaINSS write SetIsCalculaINSS;
    property FuncionarioId: Integer read FFuncionarioId write SetFuncionarioId;
  end;


implementation

{ TDependente }

procedure TDependente.SetFuncionarioId(const Value: Integer);
begin
  FFuncionarioId := Value;
end;

procedure TDependente.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TDependente.SetIsCalculaINSS(const Value: string);
begin
  FIsCalculaINSS := Value;
end;

procedure TDependente.SetIsCalculaIR(const Value: string);
begin
  FIsCalculaIR := Value;
end;

procedure TDependente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
