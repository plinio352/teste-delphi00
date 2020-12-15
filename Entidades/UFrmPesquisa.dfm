object FrmPesquisa: TFrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pesquisa'
  ClientHeight = 253
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 253
    Align = alClient
    TabOrder = 0
    object dbgPesq: TDBGrid
      Left = 1
      Top = 1
      Width = 751
      Height = 251
      Align = alClient
      DataSource = dsPesq
      DrawingStyle = gdsGradient
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = pmPesq
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgPesqCellClick
      OnDblClick = dbgPesqDblClick
    end
  end
  object dsPesq: TDataSource
    DataSet = cdsPesq
    Left = 112
    Top = 184
  end
  object pmPesq: TPopupMenu
    Left = 248
    Top = 184
    object Filtrar: TMenuItem
      Caption = 'Filtrar'
      OnClick = FiltrarClick
    end
    object CancelaFiltro: TMenuItem
      Caption = 'Cancela Filtro'
      Enabled = False
      OnClick = CancelaFiltroClick
    end
  end
  object cdsPesq: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsPesqAfterScroll
    Left = 184
    Top = 184
  end
end
