unit UFuncionario;

interface

type
  TFuncionario = class
  private
    FCPF: string;
    FSalario: Double;
    Fid: Integer;
    FNome: string;
    procedure SetCPF(const Value: string);
    procedure Setid(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetSalario(const Value: Double);
  public
    property id: Integer read Fid write Setid;
    property Nome: string read FNome write SetNome;
    property CPF: string read FCPF write SetCPF;
    property Salario: Double read FSalario write SetSalario;

  end;

implementation

{ TFuncionario }

procedure TFuncionario.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TFuncionario.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TFuncionario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TFuncionario.SetSalario(const Value: Double);
begin
  FSalario := Value;
end;

end.
