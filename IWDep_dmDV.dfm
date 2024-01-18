object dmDV: TdmDV
  OldCreateOrder = False
  Height = 426
  Width = 647
  object QueryDV: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  ISORGR30.COUNTRYABR, ISORGR30.UNITNAME, '
      '  ISORGR30.MATERIALABR,  ISORGR30.ISOTOPESYSTEM, '
      '  ISORGR30.APPROACHABR,  ISORGR30.TECHABR,'
      '  ISORGR30.INTERPABR, ISORGR30.IAGE, ISORGR30.IAGEPERROR, '
      '  ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,    '
      '  ISORGR30.LITHOLOGY, ISORGR30.RECORDID, '
      '  COUNTRY.COUNTRY, MATERIAL.MATERIALDESCRIPTION, '
      '  INTERPRETATION.INTERPRETATION, TECHNIQUE.TECHNIQUE,'
      '  APPROACH.APPROACHDESCRIPTION, ISOSYSTEM.ISOSYSTEMNAME,  '
      '  ISORGR30.RAGE, ISORGR30.RAGEPERROR, '
      '  ISORGR30.RAGEMERROR,'
      '  ISOFOR.WHOFORID'
      'FROM ISORGR30, COUNTRY, INTERPRETATION, APPROACH,MATERIAL,'
      '      ISOSYSTEM,ISOFOR,TECHNIQUE'
      'WHERE  ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR '
      'AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR '
      'AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR '
      'AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR '
      'AND ISORGR30.TECHABR=TECHNIQUE.TECHABR'
      'AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM '
      'AND ISORGR30.PREFLEVEL >= '#39'1'#39
      'AND ISOFOR.RECORDID=ISORGR30.RECORDID'
      'AND ISOFOR.WHOFORID='#39'PUBL'#39
      
        'ORDER BY ISORGR30.COUNTRYABR,ISORGR30.UNITNAME,ISORGR30.MATERIAL' +
        'ABR,'
      'ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,'
      '  ISORGR30.PREFLEVEL,ISORGR30.IAGE')
    SQLConnection = sqlcDateView
    Left = 124
    Top = 14
  end
  object dspQueryDV: TDataSetProvider
    DataSet = QueryDV
    Left = 154
    Top = 14
  end
  object cdsQueryDV: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQueryDV'
    Left = 182
    Top = 14
    object cdsQueryDVCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsQueryDVUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object cdsQueryDVMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQueryDVISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQueryDVAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQueryDVINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQueryDVIAGE: TIntegerField
      FieldName = 'IAGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQueryDVIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQueryDVIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object cdsQueryDVAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsQueryDVLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsQueryDVRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsQueryDVCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsQueryDVMATERIALDESCRIPTION: TStringField
      FieldName = 'MATERIALDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQueryDVINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
    object cdsQueryDVAPPROACHDESCRIPTION: TStringField
      FieldName = 'APPROACHDESCRIPTION'
      Required = True
      Size = 50
    end
    object cdsQueryDVISOSYSTEMNAME: TStringField
      FieldName = 'ISOSYSTEMNAME'
      Size = 30
    end
    object cdsQueryDVRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsQueryDVRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQueryDVRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQueryDVWHOFORID: TStringField
      FieldName = 'WHOFORID'
      Required = True
      Size = 5
    end
    object cdsQueryDVTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object cdsQueryDVTECHNIQUE: TStringField
      FieldName = 'TECHNIQUE'
      Size = 40
    end
  end
  object dsQueryDV: TDataSource
    DataSet = cdsQueryDV
    Left = 210
    Top = 14
  end
  object SQLMonitor1: TSQLMonitor
    FileName = 'C:\Dataev\DateViewWeb2\sqlcDateView.txt'
    Left = 64
    Top = 10
  end
  object qDVUser: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM USERS'
      'WHERE USERS.USERNAMEID=:UserID')
    SQLConnection = sqlcDateView
    Left = 124
    Top = 162
  end
  object dspDVUser: TDataSetProvider
    DataSet = qDVUser
    Left = 154
    Top = 162
  end
  object cdsDVUser: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDVUser'
    Left = 182
    Top = 162
    object cdsDVUserUSERNAMEID: TStringField
      FieldName = 'USERNAMEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDVUserNUMCONTRIBUTED: TIntegerField
      FieldName = 'NUMCONTRIBUTED'
    end
  end
  object dsDVUser: TDataSource
    DataSet = cdsDVUser
    Left = 210
    Top = 162
  end
  object XLSAdapter1: TXLSAdapter
    AllowOverwritingFiles = False
    Left = 384
    Top = 8
  end
  object sqlcDateView: TSQLConnection
    ConnectionName = 'DateView_Local'
    DriverName = 'Firebird20'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire20.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird20'
      'Database=c:/data/firebird/dateview3.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Left = 24
    Top = 16
  end
end
