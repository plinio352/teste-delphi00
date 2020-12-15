unit UfrmDependente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmPadrao, Data.DB, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, UDependenteController,
  Vcl.DBLookup, Vcl.DBCtrls, Vcl.Mask, Vcl.ImgList, UFrmPesquisa;

type
  TPesq = procedure(T: TObject) of object;

  TfrmDependente = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    dbEdtNome: TDBEdit;
    GroupBox3: TGroupBox;
    cdsDadosid: TAutoIncField;
    cdsDadosNome: TWideStringField;
    cdsDadosIsCalculaIR: TWideStringField;
    cdsDadosIsCalculaINSS: TWideStringField;
    cdsDadosFuncionarioId: TIntegerField;
    dbrgIsCalculaIR: TDBRadioGroup;
    dbrgIsCalculaINSS: TDBRadioGroup;
    cdsFunc: TClientDataSet;
    cdsFuncid: TAutoIncField;
    cdsFuncNome: TWideStringField;
    cdsFuncSalario: TBCDField;
    edtCodFunc: TButtonedEdit;
    Splitter3: TSplitter;
    edtFunc: TEdit;
    ilPadrao16: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCodFuncExit(Sender: TObject);
    procedure edtCodFuncRightButtonClick(Sender: TObject);
    procedure tsMovimentoShow(Sender: TObject);
    procedure cdsDadosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    IDepController: IDependenteController;
    procedure AtualizaDS;
    procedure PesqFunc(T: TObject);

  public
    { Public declarations }
  end;

var
  frmDependente: TfrmDependente;

implementation

{$R *.dfm}

procedure TfrmDependente.AtualizaDS;
begin
  Dados := IDepController.LstDep;
  cdsDados.Data := Dados[0];
  cdsFunc.Data  := Dados[1];

end;

procedure TfrmDependente.btnCancelarClick(Sender: TObject);
begin
  inherited;

  AtualizaDS;

end;

procedure TfrmDependente.btnDeletarClick(Sender: TObject);
begin
  inherited;
  If MessageDlg('Confirmar exclus�o?', mtConfirmation, mbOkCancel, 0) = ID_OK then begin
     IDepController.Excluir(cdsDados);
  end;

  AtualizaDS

end;

procedure TfrmDependente.btnSalvarClick(Sender: TObject);
begin
  inherited;

  case Operacao of
    toIncluir: IDepController.Incluir(cdsDados);
    toAlteracao: IDepController.Alterar(cdsDados);
  end;

  AtualizaDS;


end;

procedure TfrmDependente.cdsDadosBeforePost(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('FuncionarioId').Value := StrToInt(edtCodFunc.Text);
end;

procedure TfrmDependente.edtCodFuncExit(Sender: TObject);
begin
  inherited;
   if (edtCodFunc.Text <> EmptyStr) then begin
      if cdsFunc.Locate('id', edtCodFunc.Text, [loCaseInsensitive]) then begin
         edtCodFunc.Text := cdsFunc.Fields[0].AsString;
         edtFunc.Text    := cdsFunc.Fields[1].AsString;
      end
      else begin
         ShowMessage('C�dito n�o encontrado!');
         edtCodFunc.Clear;
         edtFunc.Clear;
      end;
   end;

end;

procedure TfrmDependente.edtCodFuncRightButtonClick(Sender: TObject);
begin
  inherited;
  Pesquisa(cdsFunc.Data, PesqFunc);

end;

procedure TfrmDependente.FormCreate(Sender: TObject);
begin
  inherited;
  IDepController := TDependenteController.New;
end;

procedure TfrmDependente.FormShow(Sender: TObject);
begin
  inherited;
  AtualizaDS;
end;

procedure TfrmDependente.PesqFunc(T: TObject);
begin
   edtCodFunc.Text  := TFrmPesquisa(T).cdsPesq.Fields[0].AsString;
   edtFunc.Text     := TFrmPesquisa(T).cdsPesq.Fields[1].AsString;

end;

procedure TfrmDependente.tsMovimentoShow(Sender: TObject);
begin
  inherited;

  edtCodFunc.Clear;
  edtFunc.Clear;

  if Operacao <> toIncluir then begin
    if cdsDados.FieldByName('FuncionarioId').AsInteger <> 0 then begin
      edtCodFunc.Text := IntToStr(cdsDados.FieldByName('FuncionarioId').AsInteger);
      edtCodFuncExit(Self);
    end;
  end;
end;

end.
