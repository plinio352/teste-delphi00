unit UfrmPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TOperacao = (toIncluir, toAlteracao);
  TfrmPadrao = class(TForm)
    pgc1: TPageControl;
    tsDados: TTabSheet;
    tsMovimento: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btnIncluir: TButton;
    Splitter1: TSplitter;
    btnAlterar: TButton;
    Splitter2: TSplitter;
    btnDeletar: TButton;
    Panel3: TPanel;
    Splitter4: TSplitter;
    btnCancelar: TButton;
    btnSalvar: TButton;
    Panel4: TPanel;
    dbgDados: TDBGrid;
    dsDados: TDataSource;
    cdsDados: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Dados: OleVariant;
    Operacao: TOperacao;
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

procedure TfrmPadrao.btnAlterarClick(Sender: TObject);
begin
  pgc1.ActivePage := tsMovimento;
  Operacao := toAlteracao;
  cdsDados.Edit;

end;

procedure TfrmPadrao.btnCancelarClick(Sender: TObject);
begin
  cdsDados.Cancel;
  pgc1.ActivePage := tsDados;

end;

procedure TfrmPadrao.btnIncluirClick(Sender: TObject);
begin
  pgc1.ActivePage := tsMovimento;
  Operacao := toIncluir;
  cdsDados.Append;
end;

procedure TfrmPadrao.btnSalvarClick(Sender: TObject);
begin
  pgc1.ActivePage := tsDados;
  cdsDados.Post;

end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPadrao := nil;
  Action := caFree;

end;

procedure TfrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    perform(WM_NEXTDLGCTL,0,0);

end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
  pgc1.ActivePage := tsDados;
end;

end.
