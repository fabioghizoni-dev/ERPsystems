object DM: TDM
  OnCreate = DataModuleCreate
  Height = 594
  Width = 828
  object DriverPG: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\User\Documents\Embarcadero\Studio\Projects\ERPsystem-ma' +
      'in\VCL\Exe\Win32Debug\dlls32\libpq.dll'
    Left = 90
    Top = 16
  end
  object ConnDbERP: TFDConnection
    Params.Strings = (
      'Database=dberp'
      'User_Name=postgres'
      'Password=123'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 26
    Top = 16
  end
  object clientes: TFDTable
    Active = True
    IndexFieldNames = 'id_cliente'
    Connection = ConnDbERP
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'clientes'
    Left = 168
    Top = 184
    object clientesid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
    end
    object clientesnome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 8190
    end
    object clientescpf_cliente: TWideStringField
      FieldName = 'cpf_cliente'
      Origin = 'cpf_cliente'
      Size = 8190
    end
    object clientescelular_cliente: TWideStringField
      FieldName = 'celular_cliente'
      Origin = 'celular_cliente'
      Size = 8190
    end
    object clientesdata_adicionado: TDateField
      FieldName = 'data_adicionado'
      Origin = 'data_adicionado'
    end
  end
  object produtos: TFDTable
    Active = True
    IndexFieldNames = 'id_produto'
    Connection = ConnDbERP
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'produtos'
    Left = 297
    Top = 183
    object produtosid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
    end
    object produtosnome_produto: TWideStringField
      FieldName = 'nome_produto'
      Origin = 'nome_produto'
      Size = 8190
    end
    object produtospreco_unitario: TCurrencyField
      FieldName = 'preco_unitario'
      Origin = 'preco_unitario'
    end
    object produtosqntd_estoque: TIntegerField
      FieldName = 'qntd_estoque'
      Origin = 'qntd_estoque'
    end
  end
  object dtSrc: TDataSource
    DataSet = clientes
    Left = 168
    Top = 240
  end
  object dtSrc2: TDataSource
    DataSet = endereco
    Left = 232
    Top = 240
  end
  object dtSrc3: TDataSource
    DataSet = produtos
    Left = 296
    Top = 240
  end
  object vendas: TFDTable
    Active = True
    IndexFieldNames = 'id_prod_vendido'
    Connection = ConnDbERP
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'vendas'
    Left = 356
    Top = 183
    object vendasnome_vendedor: TWideStringField
      FieldName = 'nome_vendedor'
      Origin = 'nome_vendedor'
      Size = 8190
    end
    object vendasnome_prod_vendido: TWideStringField
      FieldName = 'nome_prod_vendido'
      Origin = 'nome_prod_vendido'
      Size = 8190
    end
    object vendasid_prod_vendido: TIntegerField
      FieldName = 'id_prod_vendido'
      Origin = 'id_prod_vendido'
    end
    object vendasdata_venda: TDateField
      FieldName = 'data_venda'
      Origin = 'data_venda'
    end
    object vendaspreco_prod: TCurrencyField
      FieldName = 'preco_prod'
      Origin = 'preco_prod'
    end
    object vendasqntd_vendida: TIntegerField
      FieldName = 'qntd_vendida'
      Origin = 'qntd_vendida'
    end
  end
  object dtSrc4: TDataSource
    DataSet = vendas
    Left = 357
    Top = 241
  end
  object endereco: TFDTable
    Active = True
    Connection = ConnDbERP
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'endereco'
    Left = 232
    Top = 184
    object enderecopais_cliente: TWideStringField
      FieldName = 'pais_cliente'
      Origin = 'pais_cliente'
      Size = 8190
    end
    object enderecoestado_cliente: TWideStringField
      FieldName = 'estado_cliente'
      Origin = 'estado_cliente'
      Size = 8190
    end
    object enderecocidade_cliente: TWideStringField
      FieldName = 'cidade_cliente'
      Origin = 'cidade_cliente'
      Size = 8190
    end
    object enderecobairro_cliente: TWideStringField
      FieldName = 'bairro_cliente'
      Origin = 'bairro_cliente'
      Size = 8190
    end
    object enderecoid_cliente_end: TIntegerField
      FieldName = 'id_cliente_end'
      Origin = 'id_cliente_end'
    end
    object endereconome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 8190
    end
  end
end
