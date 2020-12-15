inherited frmFuncionario: TfrmFuncionario
  Caption = 'Funcionario'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgc1: TPageControl
    ActivePage = tsMovimento
    inherited tsDados: TTabSheet
      ExplicitWidth = 418
      ExplicitHeight = 261
      inherited Panel1: TPanel
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 412
        inherited btnIncluir: TButton
          ExplicitLeft = 1
          ExplicitTop = 1
        end
        inherited btnAlterar: TButton
          ExplicitLeft = 81
          ExplicitTop = 1
        end
        inherited btnDeletar: TButton
          OnClick = btnDeletarClick
          ExplicitLeft = 161
          ExplicitTop = 1
        end
      end
      inherited Panel2: TPanel
        ExplicitLeft = 0
        ExplicitTop = 47
        ExplicitWidth = 418
        ExplicitHeight = 214
      end
    end
    inherited tsMovimento: TTabSheet
      OnShow = tsMovimentoShow
      ExplicitWidth = 418
      ExplicitHeight = 261
      inherited Panel3: TPanel
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 412
      end
      inherited Panel4: TPanel
        ExplicitLeft = 0
        ExplicitTop = 47
        ExplicitWidth = 418
        ExplicitHeight = 214
        object GroupBox1: TGroupBox
          Left = 4
          Top = 16
          Width = 381
          Height = 50
          Caption = 'Nome:'
          TabOrder = 0
          object dbEdtNome: TDBEdit
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 371
            Height = 27
            Align = alClient
            DataField = 'Nome'
            DataSource = dsDados
            TabOrder = 0
            ExplicitHeight = 21
          end
        end
        object GroupBox2: TGroupBox
          Left = 4
          Top = 72
          Width = 185
          Height = 50
          Caption = 'CPF:'
          TabOrder = 1
          object DBEdtCPF: TDBEdit
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 175
            Height = 27
            Align = alClient
            DataField = 'CPF'
            DataSource = dsDados
            TabOrder = 0
            ExplicitHeight = 21
          end
        end
        object GroupBox3: TGroupBox
          Left = 4
          Top = 128
          Width = 185
          Height = 50
          Caption = 'Salario:'
          TabOrder = 2
          object DBEdtSalario: TDBEdit
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 175
            Height = 27
            Align = alClient
            DataField = 'Salario'
            DataSource = dsDados
            TabOrder = 0
            ExplicitHeight = 21
          end
        end
        object GroupBox4: TGroupBox
          Left = 200
          Top = 72
          Width = 185
          Height = 50
          Caption = 'INSS:'
          TabOrder = 3
          object lblINSS: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 175
            Height = 27
            Align = alClient
            Alignment = taRightJustify
            Caption = 'lblINSS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 122
            ExplicitWidth = 58
            ExplicitHeight = 18
          end
        end
        object GroupBox5: TGroupBox
          Left = 200
          Top = 128
          Width = 185
          Height = 50
          Caption = 'IR:'
          TabOrder = 4
          object lblIR: TLabel
            AlignWithMargins = True
            Left = 5
            Top = 18
            Width = 175
            Height = 27
            Align = alClient
            Alignment = taRightJustify
            Caption = 'lblIR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 143
            ExplicitWidth = 37
            ExplicitHeight = 18
          end
        end
      end
    end
  end
  inherited dsDados: TDataSource
    Left = 296
    Top = 32
  end
  inherited cdsDados: TClientDataSet
    Left = 352
    Top = 32
    object cdsDadosid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object cdsDadosNome: TWideStringField
      FieldName = 'Nome'
      Size = 100
    end
    object cdsDadosCPF: TWideStringField
      FieldName = 'CPF'
    end
    object cdsDadosSalario: TBCDField
      FieldName = 'Salario'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
end
