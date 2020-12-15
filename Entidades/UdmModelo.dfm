object dmModelo: TdmModelo
  OldCreateOrder = False
  Height = 238
  Width = 375
  object con: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=7737plin;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=entidades;Data Source=192.168.0.104,' +
      '1433'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 24
  end
  object dsFuncionario: TADODataSet
    Connection = con
    CursorType = ctStatic
    CommandText = 'select * from Funcionario'
    Parameters = <>
    Left = 56
    Top = 96
    object dsFuncionarioid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object dsFuncionarioNome: TWideStringField
      FieldName = 'Nome'
      Size = 100
    end
    object dsFuncionarioCPF: TWideStringField
      FieldName = 'CPF'
    end
    object dsFuncionarioSalario: TBCDField
      FieldName = 'Salario'
      Precision = 18
      Size = 2
    end
  end
  object dsDependente: TADODataSet
    Connection = con
    CursorType = ctStatic
    CommandText = 'select * from Dependente'
    Parameters = <>
    Left = 56
    Top = 160
    object dsDependenteid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object dsDependenteNome: TWideStringField
      FieldName = 'Nome'
      Size = 100
    end
    object dsDependenteIsCalculaIR: TWideStringField
      FieldName = 'IsCalculaIR'
      Size = 1
    end
    object dsDependenteIsCalculaINSS: TWideStringField
      FieldName = 'IsCalculaINSS'
      Size = 1
    end
    object dsDependenteFuncionarioId: TIntegerField
      FieldName = 'FuncionarioId'
    end
  end
  object dspFuncionario: TDataSetProvider
    DataSet = dsFuncionario
    Left = 136
    Top = 96
  end
  object dspDependente: TDataSetProvider
    DataSet = dsDependente
    Left = 136
    Top = 160
  end
  object cmd: TADOCommand
    Connection = con
    Parameters = <>
    Left = 136
    Top = 24
  end
  object qryConsul: TADOQuery
    Connection = con
    Parameters = <>
    Left = 200
    Top = 24
  end
end
