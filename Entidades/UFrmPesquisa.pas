unit UFrmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Menus, Datasnap.DBClient, System.UITypes;

type
  TPesq = procedure(T: TObject) of object;

  TFrmPesquisa = class(TForm)
    Panel1: TPanel;
    dbgPesq: TDBGrid;
    dsPesq: TDataSource;
    pmPesq: TPopupMenu;
    Filtrar: TMenuItem;
    CancelaFiltro: TMenuItem;
    cdsPesq: TClientDataSet;
    procedure dbgPesqDblClick(Sender: TObject);
    procedure FiltrarClick(Sender: TObject);
    procedure CancelaFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPesqCellClick(Column: TColumn);
    procedure cdsPesqAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FPesq: TPesq;

    procedure ChamaFiltro(grid: TDBGrid; cds: TClientDataSet; campoChave: string);
    procedure ConfirmaFiltra(cds: TClientDataSet; iSQL: String);
    procedure CancelaFiltra(cds: TClientDataSet);
  public
    { Public declarations }
    property Pesq: TPesq read FPesq write FPesq;
  end;

var
  FrmPesquisa: TFrmPesquisa;

  procedure Pesquisa(ADados: OleVariant; Procedimento: TPesq);
implementation

{$R *.dfm}

procedure Pesquisa(ADados: OleVariant; Procedimento: TPesq);
begin
  if not Assigned(FrmPesquisa) then
  FrmPesquisa := TFrmPesquisa.Create(nil);
  with FrmPesquisa do
  try
    try
      cdsPesq.Close;
      cdsPesq.Data := ADados;

      Pesq := Procedimento;

      if ShowModal = mrOk then
        close;

    except
      on E: Exception do
      begin
        MessageDlg('Ocorreu um erro na Pesquisa. Erro: '+ E.Message,mtError,[mbOK],0);
      end else ShowMessage('Foi encontrado um parametro inesperado.');
    end;
  finally
    FreeAndNil(FrmPesquisa);
  end;

end;

procedure TFrmPesquisa.CancelaFiltra(cds: TClientDataSet);
begin
  if cds.Active then
    with cds do
    begin
      Filtered  := False;
      Filter    := EmptyStr;
      Filtered  := True;
    end;
end;

procedure TFrmPesquisa.CancelaFiltroClick(Sender: TObject);
begin
  CancelaFiltra(cdsPesq);
  Filtrar.Enabled := True;
  CancelaFiltro.Enabled := False;

end;

procedure TFrmPesquisa.ChamaFiltro(grid: TDBGrid; cds: TClientDataSet;
  campoChave: string);
var
  Filtro: String;
begin
  Filtro := grid.SelectedField.AsString;
  if (InputQuery('Filtrar','Pelo campo: ' + grid.SelectedField.DisplayLabel, Filtro)) then
    if (grid.SelectedField is TDateTimeField) then
      ConfirmaFiltra(cds, grid.SelectedField.FieldName + ' BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDateTime(Filtro)) + ' 00:00:00') +' AND ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDateTime(Filtro)) + ' 23:59:59'))
    else
      if (grid.SelectedField is TNumericField) then
        ConfirmaFiltra(cds, '(' + grid.SelectedField.FieldName + ' = ' + StringReplace(StringReplace(FloatToStr(StrToFloat(Filtro)), '.', '', [rfReplaceAll]), ',', '.', [rfReplaceAll]) + ')')
      else
        if grid.SelectedField.FieldName = campoChave then
          ConfirmaFiltra(cds, grid.SelectedField.FieldName + ' LIKE '+QuotedStr('%' + Filtro + '%'))
        else
          ConfirmaFiltra(cds, grid.SelectedField.FieldName + ' LIKE '+QuotedStr('%' + Filtro + '%'));
end;

procedure TFrmPesquisa.ConfirmaFiltra(cds: TClientDataSet; iSQL: String);
begin
  if cds.Active then
    with cds do
    begin
      Filtered  := False;
      Filter    := iSQL;
      Filtered  := True;
    end;
end;

procedure TFrmPesquisa.dbgPesqCellClick(Column: TColumn);
begin
   if Assigned(FPesq) then begin
      FPesq(FrmPesquisa);
   end;
end;

procedure TFrmPesquisa.dbgPesqDblClick(Sender: TObject);
begin
   ModalResult := mrOk;
   if Assigned(FPesq) then begin
      FPesq(FrmPesquisa);
   end;
end;

procedure TFrmPesquisa.FiltrarClick(Sender: TObject);
begin
  ChamaFiltro(dbgPesq, cdsPesq, dbgPesq.Fields[0].Name);
  Filtrar.Enabled := False;
  CancelaFiltro.Enabled := True;
end;

procedure TFrmPesquisa.FormCreate(Sender: TObject);
begin
  FPesq := nil;
end;

procedure TFrmPesquisa.cdsPesqAfterScroll(DataSet: TDataSet);
begin
   if Assigned(FPesq) then begin
      FPesq(FrmPesquisa);
   end;
end;

end.


