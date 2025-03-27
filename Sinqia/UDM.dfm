object DM: TDM
  OldCreateOrder = False
  Height = 308
  Width = 793
  object Conexao: TADOConnection
    CommandTimeout = 120
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=SINQIA_CRUD;Data Source=DESKTOP-M5F6K7S'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object qryCadCidades: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pCodigo_Cidade'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT'#9'Codigo_Cidade, Nome_Cidade, Estado_UF_Cidade, Cep_Inicial' +
        '_Cidade, Cep_Final_Cidade'#9'FROM'#9#9'dbo.Cidade '
      'WHERE  Codigo_Cidade = :pCodigo_Cidade')
    Left = 120
    Top = 16
    object qryCadCidadesCodigo_Cidade: TAutoIncField
      FieldName = 'Codigo_Cidade'
      ReadOnly = True
    end
    object qryCadCidadesNome_Cidade: TStringField
      FieldName = 'Nome_Cidade'
      Size = 50
    end
    object qryCadCidadesEstado_UF_Cidade: TStringField
      FieldName = 'Estado_UF_Cidade'
      FixedChar = True
      Size = 2
    end
    object qryCadCidadesCep_Inicial_Cidade: TStringField
      FieldName = 'Cep_Inicial_Cidade'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object qryCadCidadesCep_Final_Cidade: TStringField
      FieldName = 'Cep_Final_Cidade'
      EditMask = '99999-999;0;_'
      Size = 8
    end
  end
  object qryConsCidades: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pNome_Cidade'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT'#9'Codigo_Cidade, Nome_Cidade, Estado_UF_Cidade, Cep_Inicial' +
        '_Cidade, Cep_Final_Cidade'#9'FROM'#9#9'dbo.Cidade'
      'WHERE  Nome_Cidade LIKE :pNome_Cidade'
      'ORDER BY Nome_Cidade')
    Left = 216
    Top = 16
    object qryConsCidadesCodigo_Cidade: TAutoIncField
      FieldName = 'Codigo_Cidade'
      ReadOnly = True
    end
    object qryConsCidadesNome_Cidade: TStringField
      FieldName = 'Nome_Cidade'
      Size = 50
    end
    object qryConsCidadesEstado_UF_Cidade: TStringField
      FieldName = 'Estado_UF_Cidade'
      FixedChar = True
      Size = 2
    end
    object qryConsCidadesCep_Inicial_Cidade: TStringField
      FieldName = 'Cep_Inicial_Cidade'
      EditMask = '00000-000;0;_'
      Size = 8
    end
    object qryConsCidadesCep_Final_Cidade: TStringField
      FieldName = 'Cep_Final_Cidade'
      EditMask = '00000-000;0;_'
      Size = 8
    end
  end
  object qryCadClientes: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pCodigo_Cliente'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT'#9'Codigo_Cliente, CGC_CPF_Cliente, Nome_Cliente, Telefone_C' +
        'liente, Endereco_Cliente, Bairro_Cliente, '
      
        'Complemento_Cliente, CEP_Cliente, Email_Cliente, Codigo_Cidade'#9'F' +
        'ROM'#9'dbo.Clientes'
      'WHERE Codigo_Cliente = :pCodigo_Cliente')
    Left = 120
    Top = 88
    object qryCadClientesCodigo_Cliente: TAutoIncField
      FieldName = 'Codigo_Cliente'
      ReadOnly = True
    end
    object qryCadClientesCGC_CPF_Cliente: TStringField
      FieldName = 'CGC_CPF_Cliente'
      Size = 14
    end
    object qryCadClientesNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 100
    end
    object qryCadClientesTelefone_Cliente: TStringField
      FieldName = 'Telefone_Cliente'
      EditMask = '(99)99999-9999;0;_'
      Size = 11
    end
    object qryCadClientesEndereco_Cliente: TStringField
      FieldName = 'Endereco_Cliente'
      Size = 100
    end
    object qryCadClientesBairro_Cliente: TStringField
      FieldName = 'Bairro_Cliente'
      Size = 50
    end
    object qryCadClientesComplemento_Cliente: TStringField
      FieldName = 'Complemento_Cliente'
    end
    object qryCadClientesCEP_Cliente: TStringField
      FieldName = 'CEP_Cliente'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object qryCadClientesEmail_Cliente: TStringField
      FieldName = 'Email_Cliente'
      Size = 50
    end
    object qryCadClientesCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qryCadClientesCidade: TStringField
      FieldKind = fkLookup
      FieldName = 'Cidade'
      LookupDataSet = qryNomeCidade
      LookupKeyFields = 'Codigo_Cidade'
      LookupResultField = 'Nome_Cidade'
      KeyFields = 'Codigo_Cidade'
      LookupCache = True
      Lookup = True
    end
  end
  object qryConsClientes: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pNome_Cliente'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT'#9'Codigo_Cliente, CGC_CPF_Cliente, Nome_Cliente, Telefone_C' +
        'liente, Endereco_Cliente, Bairro_Cliente, '
      
        'Complemento_Cliente, CEP_Cliente, Email_Cliente,  Codigo_Cidade'#9 +
        'FROM'#9'dbo.Clientes'
      'WHERE Nome_Cliente LIKE :pNome_Cliente'
      'ORDER BY Nome_Cliente ASC')
    Left = 216
    Top = 88
    object qryConsClientesCodigo_Cliente: TAutoIncField
      FieldName = 'Codigo_Cliente'
      ReadOnly = True
    end
    object qryConsClientesCGC_CPF_Cliente: TStringField
      FieldName = 'CGC_CPF_Cliente'
      OnGetText = qryConsClientesCGC_CPF_ClienteGetText
      Size = 14
    end
    object qryConsClientesNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 100
    end
    object qryConsClientesTelefone_Cliente: TStringField
      FieldName = 'Telefone_Cliente'
      EditMask = '(99)99999-9999;0;_'
      Size = 11
    end
    object qryConsClientesEndereco_Cliente: TStringField
      FieldName = 'Endereco_Cliente'
      Size = 100
    end
    object qryConsClientesBairro_Cliente: TStringField
      FieldName = 'Bairro_Cliente'
      Size = 50
    end
    object qryConsClientesComplemento_Cliente: TStringField
      FieldName = 'Complemento_Cliente'
    end
    object qryConsClientesCEP_Cliente: TStringField
      FieldName = 'CEP_Cliente'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object qryConsClientesEmail_Cliente: TStringField
      FieldName = 'Email_Cliente'
      Size = 50
    end
    object qryConsClientesCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
  end
  object qryCepCliente: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CepParam'
        DataType = ftString
        Size = 8
        Value = Null
      end>
    SQL.Strings = (
      'DECLARE @Cep Varchar(8) = :CepParam;'
      ''
      'SELECT Codigo_Cidade'
      'FROM Cidade'
      'WHERE @Cep BETWEEN Cep_Inicial_Cidade AND Cep_Final_Cidade;')
    Left = 112
    Top = 160
    object qryCepClienteCodigo_Cidade: TAutoIncField
      FieldName = 'Codigo_Cidade'
      ReadOnly = True
    end
  end
  object qryNomeCidade: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Codigo_Cidade, Nome_Cidade FROM dbo.Cidade')
    Left = 208
    Top = 160
    object qryNomeCidadeCodigo_Cidade: TAutoIncField
      FieldName = 'Codigo_Cidade'
      ReadOnly = True
    end
    object qryNomeCidadeNome_Cidade: TStringField
      FieldName = 'Nome_Cidade'
      Size = 50
    end
  end
  object qryRelatorio: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT C.Nome_Cliente, C.Codigo_Cliente, CI.Nome_Cidade, CI.Esta' +
        'do_UF_Cidade, CI.Codigo_Cidade FROM Clientes C'
      'INNER JOIN Cidade CI '
      'ON CI.Codigo_Cidade = C.Codigo_Cidade')
    Left = 104
    Top = 224
    object qryRelatorioNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 100
    end
    object qryRelatorioCodigo_Cliente: TAutoIncField
      FieldName = 'Codigo_Cliente'
      ReadOnly = True
    end
    object qryRelatorioNome_Cidade: TStringField
      FieldName = 'Nome_Cidade'
      Size = 50
    end
    object qryRelatorioEstado_UF_Cidade: TStringField
      FieldName = 'Estado_UF_Cidade'
      FixedChar = True
      Size = 2
    end
    object qryRelatorioCodigo_Cidade: TAutoIncField
      FieldName = 'Codigo_Cidade'
      ReadOnly = True
    end
  end
  object qryRelClientesCidades: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo_Cliente_Inicial'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Codigo_Cliente_Final'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Codigo_Cidade_Inicial'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Codigo_Cidade_Final'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Estado_Inicial'
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = 'Estado_Final'
        DataType = ftString
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'DECLARE @Codigo_Cliente_Inicial Integer = :Codigo_Cliente_Inicia' +
        'l,'
      
        '        @Codigo_Cliente_Final   Integer = :Codigo_Cliente_Final,' +
        ' '
      #9#9'@Codigo_Cidade_Inicial  Integer = :Codigo_Cidade_Inicial,'
      #9#9'@Codigo_Cidade_Final    Integer = :Codigo_Cidade_Final,'
      #9#9'@Estado_Inicial         Char(2) = :Estado_Inicial,'
      #9#9'@Estado_Final           Char(2) = :Estado_Final;'
      ''
      'SELECT Codigo_Cliente,'
      '       CGC_CPF_Cliente,'
      '       Nome_Cliente,'
      '       Telefone_Cliente,'
      '       Endereco_Cliente,'
      '       Bairro_Cliente, '
      '       Complemento_Cliente,'
      '       CEP_Cliente,'
      '       Email_Cliente,'
      '       Cidade.Codigo_Cidade,'
      '       Cidade.Nome_Cidade,'
      '       Cidade.Estado_UF_Cidade'
      'FROM dbo.Clientes'
      '     INNER JOIN dbo.Cidade'
      '     ON Cidade.Codigo_Cidade = Clientes.Codigo_Cidade'
      
        'WHERE Codigo_Cliente          BETWEEN @Codigo_Cliente_Inicial AN' +
        'D @Codigo_Cliente_Final'
      
        '  AND Cidade.Codigo_Cidade    BETWEEN @Codigo_Cidade_Inicial  AN' +
        'D @Codigo_Cidade_Final'
      
        '  AND Cidade.Estado_UF_Cidade BETWEEN @Estado_Inicial         AN' +
        'D @Estado_Final'
      'ORDER BY Cidade.Codigo_Cidade;')
    Left = 200
    Top = 224
    object qryRelClientesCidadesCodigo_Cliente: TAutoIncField
      FieldName = 'Codigo_Cliente'
      ReadOnly = True
    end
    object qryRelClientesCidadesCGC_CPF_Cliente: TStringField
      FieldName = 'CGC_CPF_Cliente'
      Size = 14
    end
    object qryRelClientesCidadesNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 100
    end
    object qryRelClientesCidadesTelefone_Cliente: TStringField
      FieldName = 'Telefone_Cliente'
      EditMask = '(99)99999-9999;0;_'
      Size = 11
    end
    object qryRelClientesCidadesEndereco_Cliente: TStringField
      FieldName = 'Endereco_Cliente'
      Size = 100
    end
    object qryRelClientesCidadesBairro_Cliente: TStringField
      FieldName = 'Bairro_Cliente'
      Size = 50
    end
    object qryRelClientesCidadesComplemento_Cliente: TStringField
      FieldName = 'Complemento_Cliente'
    end
    object qryRelClientesCidadesCEP_Cliente: TStringField
      FieldName = 'CEP_Cliente'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object qryRelClientesCidadesEmail_Cliente: TStringField
      FieldName = 'Email_Cliente'
      Size = 50
    end
    object qryRelClientesCidadesCodigo_Cidade: TAutoIncField
      FieldName = 'Codigo_Cidade'
      ReadOnly = True
    end
    object qryRelClientesCidadesNome_Cidade: TStringField
      FieldName = 'Nome_Cidade'
      Size = 50
    end
    object qryRelClientesCidadesEstado_UF_Cidade: TStringField
      FieldName = 'Estado_UF_Cidade'
      FixedChar = True
      Size = 2
    end
  end
end
