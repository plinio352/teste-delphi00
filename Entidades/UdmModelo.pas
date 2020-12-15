unit UdmModelo;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Datasnap.Provider;

type
  TdmModelo = class(TDataModule)
    con: TADOConnection;
    dsFuncionario: TADODataSet;
    dsDependente: TADODataSet;
    dsFuncionarioid: TAutoIncField;
    dsFuncionarioNome: TWideStringField;
    dsFuncionarioCPF: TWideStringField;
    dsFuncionarioSalario: TBCDField;
    dsDependenteid: TAutoIncField;
    dsDependenteNome: TWideStringField;
    dsDependenteIsCalculaIR: TWideStringField;
    dsDependenteIsCalculaINSS: TWideStringField;
    dsDependenteFuncionarioId: TIntegerField;
    dspFuncionario: TDataSetProvider;
    dspDependente: TDataSetProvider;
    cmd: TADOCommand;
    qryConsul: TADOQuery;
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  dmModelo: TdmModelo;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
