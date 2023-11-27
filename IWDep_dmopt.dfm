object dmOpt: TdmOpt
  Height = 621
  Width = 826
  object dsOpt: TDataSource
    DataSet = cdsOpt
    Left = 312
    Top = 126
  end
  object qOpt: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OPTIONTYPEID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select USEROPTS.USERID, USEROPTS.OPTIONTYPEID,'
      '  USEROPTS.OPTIONID, USEROPTS.OPTIONTITLE'
      'from USEROPTS'
      'where USEROPTS.USERID = :USERID'
      'and USEROPTS.OPTIONTYPEID = :OPTIONTYPEID')
    SQLConnection = sqlcDep
    Left = 206
    Top = 126
    object qOptUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qOptOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object cdsOpt: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOpt'
    Left = 286
    Top = 124
    object cdsOptUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsQOpt: TDataSource
    DataSet = qOpt
    Left = 230
    Top = 126
  end
  object dspOpt: TDataSetProvider
    DataSet = qOpt
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 258
    Top = 126
  end
  object qOptAll: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select USEROPTS.USERID, USEROPTS.OPTIONTYPEID,'
      '  USEROPTS.OPTIONID, USEROPTS.OPTIONTITLE'
      'from USEROPTS')
    SQLConnection = sqlcDep
    Left = 34
    Top = 102
    object qOptAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptAllOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qOptAllOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptAllOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsqOptAll: TDataSource
    DataSet = qOptAll
    Left = 58
    Top = 102
  end
  object dspOptAll: TDataSetProvider
    DataSet = qOptAll
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 86
    Top = 102
  end
  object cdsOptAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptAll'
    Left = 114
    Top = 100
    object cdsOptAllUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptAllOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptAllOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptAllOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsOptAll: TDataSource
    DataSet = cdsOptAll
    Left = 140
    Top = 102
  end
  object sqlcDep: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\DateView2015v25.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver260.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartInterBaseMetaDataCommandFactory,' +
        'DbxDevartInterBaseDriver260.bpl'
      'DriverUnit=DbxDevartInterBase')
    Left = 24
    Top = 20
  end
  object qUserFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT USERSWHOFOR.WHOFORID,'
      '  USERSWHOFOR.USERID '
      'FROM FORLIST,USERSWHOFOR'
      'WHERE FORLIST.OWNER=:UserID'
      'AND FORLIST.WHOFORID=USERSWHOFOR.WHOFORID'
      'ORDER BY USERSWHOFOR.WHOFORID,USERSWHOFOR.USERID')
    SQLConnection = sqlcDep
    Left = 8
    Top = 214
    object qUserForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qUserForUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dspUserFor: TDataSetProvider
    DataSet = qUserFor
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 36
    Top = 214
  end
  object cdsUserFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserFor'
    Left = 64
    Top = 214
    object cdsUserForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsUserForUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dsUserFor: TDataSource
    DataSet = cdsUserFor
    Left = 92
    Top = 214
  end
  object qChangeUserFor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'DELETE FROM FORLIST'
      'WHERE FORLIST.WHOFORID='#39'NEW'#39)
    SQLConnection = sqlcDep
    Left = 32
    Top = 318
  end
  object qForList: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from FORLIST'
      'where FORLIST.OWNER=:UserID'
      'ORDER BY FORLIST.WHOFORID')
    SQLConnection = sqlcDep
    Left = 8
    Top = 262
  end
  object dspForList: TDataSetProvider
    DataSet = qForList
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 36
    Top = 262
  end
  object cdsForList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForList'
    Left = 64
    Top = 262
    object cdsForListWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsForListWHOFOR: TStringField
      FieldName = 'WHOFOR'
      Required = True
      Size = 50
    end
    object cdsForListOWNER: TStringField
      FieldName = 'OWNER'
      Required = True
    end
  end
  object dsForList: TDataSource
    DataSet = cdsForList
    Left = 92
    Top = 262
  end
  object qOptM: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT USEROPTS.USERID, USEROPTS.OPTIONTYPEID,'
      '  OPTIONTYPES.OPTIONTYPE'
      'FROM USEROPTS, OPTIONTYPES'
      'WHERE USEROPTS.USERID=:USERID'
      'AND USEROPTS.OPTIONTYPEID=OPTIONTYPES.OPTIONTYPEID')
    SQLConnection = sqlcDep
    Left = 400
    Top = 104
    object qOptMUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptMOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qOptMOPTIONTYPE: TStringField
      FieldName = 'OPTIONTYPE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsqOptM: TDataSource
    DataSet = qOptM
    Left = 428
    Top = 104
  end
  object dspOptM: TDataSetProvider
    DataSet = qOptM
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 456
    Top = 104
  end
  object cdsOptM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspoptM'
    Left = 484
    Top = 104
    object cdsOptMUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptMOPTIONTYPE: TStringField
      FieldName = 'OPTIONTYPE'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsOptMqOptsOptions: TDataSetField
      FieldName = 'qOptsOptions'
    end
    object cdsOptMqOptMInterp: TDataSetField
      FieldName = 'qOptMInterp'
    end
  end
  object dsOptM: TDataSource
    DataSet = cdsOptM
    Left = 512
    Top = 104
  end
  object qOptMInterp: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'SELECT DISTINCT USEROPTINTERP. USERID, USEROPTINTERP.OPTIONID,'
      '  USEROPTINTERP.INTERPABR, INTERPRETATION.INTERPRETATION'
      'FROM USEROPTINTERP, USEROPTS, INTERPRETATION'
      'WHERE USEROPTINTERP.USERID = :USERID'
      'AND USEROPTINTERP.USERID=USEROPTS.USERID'
      'AND USEROPTS.OPTIONTYPEID = '#39'I'#39
      'AND USEROPTINTERP.INTERPABR=INTERPRETATION.INTERPABR'
      'ORDER BY USEROPTINTERP.OPTIONID, USEROPTINTERP.INTERPABR')
    SQLConnection = sqlcDep
    Left = 416
    Top = 196
    object qOptMInterpUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptMInterpOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOptMInterpINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qOptMInterpINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsOptMInterp: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptMqOptMInterp
    Params = <>
    Left = 444
    Top = 196
    object cdsOptMInterpUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMInterpOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMInterpINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsOptMInterpINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object dsOptMInterp: TDataSource
    DataSet = cdsOptMInterp
    Left = 472
    Top = 196
  end
  object qOptMDates: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTDATES'
      'where USEROPTDATES.USERID=:USERID')
    SQLConnection = sqlcDep
    Left = 440
    Top = 260
  end
  object cdsOptMDates: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 468
    Top = 260
    object cdsOptMDatesUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMDatesOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMDatesDATEMIN: TFloatField
      FieldName = 'DATEMIN'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsOptMDatesDATEMAX: TFloatField
      FieldName = 'DATEMAX'
      Required = True
      DisplayFormat = '###0.00'
    end
  end
  object dsOptMDates: TDataSource
    DataSet = cdsOptMDates
    Left = 496
    Top = 260
  end
  object qOptMGraph: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTGRAPH'
      'where USEROPTGRAPH.USERID=:USERID')
    SQLConnection = sqlcDep
    Left = 440
    Top = 308
  end
  object cdsOptMGraph: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 468
    Top = 308
    object cdsOptMGraphUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMGraphMINAGEERROR: TFloatField
      FieldName = 'MINAGEERROR'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsOptMGraphSHOWALLLOCALITIES: TStringField
      FieldName = 'SHOWALLLOCALITIES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptMGraphGROUPCATEGORY: TStringField
      FieldName = 'GROUPCATEGORY'
      Required = True
      Size = 30
    end
    object cdsOptMGraphPDFTYPE: TStringField
      FieldName = 'PDFTYPE'
      Required = True
      Size = 3
    end
  end
  object dsOptMGraph: TDataSource
    DataSet = cdsOptMGraph
    Left = 496
    Top = 308
  end
  object qOptMInitial: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select * from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID=:USERID')
    SQLConnection = sqlcDep
    Left = 440
    Top = 356
  end
  object cdsOptMInitial: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 468
    Top = 356
    object cdsOptMInitialUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMInitialOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptMInitialOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptMInitialVALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
      DisplayFormat = '####0.000000'
    end
    object cdsOptMInitialVALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
      DisplayFormat = '####0.000000'
    end
  end
  object dsOptMInitial: TDataSource
    DataSet = cdsOptMInitial
    Left = 496
    Top = 356
  end
  object qOptInterp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select USEROPTINTERP.USERID, USEROPTINTERP.OPTIONID,'
      '  USEROPTINTERP.INTERPABR'
      'from USEROPTINTERP'
      'where USEROPTINTERP.USERID = :USERID'
      '')
    SQLConnection = sqlcDep
    Left = 208
    Top = 184
  end
  object dspOptInterp: TDataSetProvider
    DataSet = qOptInterp
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 236
    Top = 184
  end
  object cdsOptInterp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptInterp'
    Left = 268
    Top = 182
    object cdsOptInterpUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptInterpOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptInterpINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
  end
  object dsOptInterp: TDataSource
    DataSet = cdsOptInterp
    Left = 296
    Top = 182
  end
  object qOptDates: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select USEROPTDATES.USERID, USEROPTDATES.OPTIONID,'
      '  USEROPTDATES.DATEMIN, USEROPTDATES.DATEMAX'
      'from USEROPTDATES'
      'where USEROPTDATES.USERID = :USERID'
      '')
    SQLConnection = sqlcDep
    Left = 212
    Top = 236
  end
  object dspOptDates: TDataSetProvider
    DataSet = qOptDates
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 240
    Top = 236
  end
  object cdsOptDates: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptDates'
    Left = 264
    Top = 236
    object cdsOptDatesUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptDatesOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptDatesDATEMIN: TFloatField
      FieldName = 'DATEMIN'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsOptDatesDATEMAX: TFloatField
      FieldName = 'DATEMAX'
      Required = True
      DisplayFormat = '####0.00'
    end
  end
  object dsOptDates: TDataSource
    DataSet = cdsOptDates
    Left = 292
    Top = 236
  end
  object qOptGraph: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end>
    SQL.Strings = (
      'select USEROPTGRAPH.USERID, USEROPTGRAPH.MINAGEERROR,'
      '  USEROPTGRAPH.SHOWALLLOCALITIES, USEROPTGRAPH.GROUPCATEGORY,'
      '  USEROPTGRAPH.PDFTYPE'
      'from USEROPTGRAPH'
      'where USEROPTGRAPH.USERID = :USERID')
    SQLConnection = sqlcDep
    Left = 210
    Top = 284
  end
  object dspOptGraph: TDataSetProvider
    DataSet = qOptGraph
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 236
    Top = 284
  end
  object cdsOptGraph: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptGraph'
    Left = 266
    Top = 284
    object cdsOptGraphUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptGraphMINAGEERROR: TFloatField
      FieldName = 'MINAGEERROR'
      Required = True
      DisplayFormat = '##0.00'
    end
    object cdsOptGraphSHOWALLLOCALITIES: TStringField
      FieldName = 'SHOWALLLOCALITIES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptGraphGROUPCATEGORY: TStringField
      FieldName = 'GROUPCATEGORY'
      Required = True
      Size = 30
    end
    object cdsOptGraphPDFTYPE: TStringField
      FieldName = 'PDFTYPE'
      Required = True
      Size = 3
    end
  end
  object dsOptGraph: TDataSource
    DataSet = cdsOptGraph
    Left = 290
    Top = 284
  end
  object qOptRatios: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
        Size = 21
      end
      item
        DataType = ftString
        Name = 'OPTIONTYPEID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select USEROPTINITIAL.USERID, '
      '  USEROPTINITIAL.OPTIONTYPEID,USEROPTINITIAL.OPTIONID,'
      '  USEROPTINITIAL.VALUEMIN, USEROPTINITIAL.VALUEMAX'
      'from USEROPTINITIAL'
      'where USEROPTINITIAL.USERID = :USERID'
      'AND USEROPTINITIAL.OPTIONTYPEID = :OPTIONTYPEID'
      '')
    SQLConnection = sqlcDep
    Left = 212
    Top = 332
  end
  object dspOptRatios: TDataSetProvider
    DataSet = qOptRatios
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 240
    Top = 332
  end
  object cdsOptRatios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOptRatios'
    Left = 264
    Top = 332
    object cdsOptRatiosUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRatiosOPTIONTYPEID: TStringField
      FieldName = 'OPTIONTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsOptRatiosOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptRatiosVALUEMIN: TFloatField
      FieldName = 'VALUEMIN'
      Required = True
    end
    object cdsOptRatiosVALUEMAX: TFloatField
      FieldName = 'VALUEMAX'
      Required = True
    end
  end
  object dsOptRatios: TDataSource
    DataSet = cdsOptRatios
    Left = 292
    Top = 332
  end
  object qOptRanges: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcDep
    Left = 648
    Top = 152
  end
  object qOptsOptions: TSQLQuery
    DataSource = dsqOptM
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT USEROPTS.OPTIONID, USEROPTS.OPTIONTITLE'
      'FROM USEROPTS'
      'WHERE USEROPTS.USERID = :USERID'
      'AND USEROPTS.OPTIONTYPEID = :OptionTypeID'
      'ORDER BY USEROPTS.OPTIONID')
    SQLConnection = sqlcDep
    Left = 416
    Top = 152
  end
  object cdsOptsOptions: TClientDataSet
    Aggregates = <>
    DataSetField = cdsOptMqOptsOptions
    Params = <>
    Left = 448
    Top = 152
    object cdsOptsOptionsOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOptsOptionsOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsOptsOptions: TDataSource
    DataSet = cdsOptsOptions
    Left = 480
    Top = 152
  end
  object dspUserVar: TDataSetProvider
    DataSet = qUserVar
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 244
    Top = 400
  end
  object cdsUserVar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserVar'
    Left = 276
    Top = 398
    object cdsUserVarUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserVarAPPLICATIONID: TIntegerField
      FieldName = 'APPLICATIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserVarVARORDER: TIntegerField
      FieldName = 'VARORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserVarVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      Required = True
      Size = 15
    end
  end
  object dsUserVar: TDataSource
    DataSet = cdsUserVar
    Left = 304
    Top = 398
  end
  object qUserVar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM USERVAR'
      'WHERE USERVAR.USERID = :USERID'
      'AND USERVAR.APPLICATIONID = 2'
      '')
    SQLConnection = sqlcDep
    Left = 216
    Top = 400
  end
  object qInsertUserVar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'tUserID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'tApplicationID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'tVarOrder'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'tVariableID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'INSERT INTO USERVAR'
      '(USERID, APPLICATIONID, VARORDER, VARIABLEID)'
      'Values (:tUserID,:tApplicationID,:tVarOrder,:tVariableID)')
    SQLConnection = sqlcDep
    Left = 220
    Top = 452
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcDep
    Left = 104
    Top = 24
  end
end
