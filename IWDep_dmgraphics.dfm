object dmgDV: TdmgDV
  Height = 593
  Width = 894
  object sqlcDateView: TSQLConnection
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
    Left = 36
    Top = 10
  end
  object Querydm: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT ISORGR30.CountryAbr, ISORGR30.UnitID, SUITE.UNIT' +
        'NAME,ISORGR30.MaterialAbr, '
      'ISORGR30.IsotopeSystem, ISORGR30.ApproachAbr, ISORGR30.TechAbr, '
      
        'ISORGR30.InterpAbr, ISORGR30.PrefLevel, ISORGR30.IAge, ISORGR30.' +
        'IAgePError, '
      'ISORGR30.IAgeMError, ISORGR30.AgeUnits, ISORGR30.Confidential, '
      'ISORGR30.Lithology, ISORGR30.MethodAbr, ISORGR30.RecordID, '
      
        'COUNTRY.Country, MATERIAL.MaterialDescription, Interpretation.In' +
        'terpretation, '
      
        'APPROACH.ApproachDescription, TECHNIQUE.Technique, ISOSYSTEM.Iso' +
        'SystemName,  '
      'ISORGR30.RAGE, ISORGR30.RAGEPERROR, ISORGR30.RAGEMERROR  '
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      
        'ORDER by CountryAbr,UnitName,MaterialAbr,IsotopeSystem,ApproachA' +
        'br,InterpAbr,PrefLevel,TechAbr,IAge')
    SQLConnection = sqlcDateView
    Left = 144
    Top = 18
    object QuerydmCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object QuerydmUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object QuerydmMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object QuerydmISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      Required = True
      Size = 15
    end
    object QuerydmAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      Required = True
      Size = 5
    end
    object QuerydmTECHABR: TStringField
      FieldName = 'TECHABR'
      Required = True
      Size = 5
    end
    object QuerydmINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object QuerydmPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      Required = True
    end
    object QuerydmIAGE: TIntegerField
      FieldName = 'IAGE'
      Required = True
    end
    object QuerydmIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      Required = True
    end
    object QuerydmIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object QuerydmAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object QuerydmLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object QuerydmUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QuerydmMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QuerydmRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object QuerydmCONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
    end
    object QuerydmRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object QuerydmRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object QuerydmRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
  end
  object dspQuery2: TDataSetProvider
    DataSet = Querydm
    Left = 198
    Top = 18
  end
  object cdsQuerydm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery2'
    Left = 226
    Top = 18
    object cdsQuerydmCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsQuerydmUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQuerydmAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmTECHABR: TStringField
      FieldName = 'TECHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmPREFLEVEL: TSmallintField
      FieldName = 'PREFLEVEL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmIAGE: TIntegerField
      FieldName = 'IAGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmIAGEPERROR: TIntegerField
      FieldName = 'IAGEPERROR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmLITHOLOGY: TStringField
      FieldName = 'LITHOLOGY'
      Required = True
      Size = 50
    end
    object cdsQuerydmIAGEMERROR: TIntegerField
      FieldName = 'IAGEMERROR'
      Required = True
    end
    object cdsQuerydmAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 2
    end
    object cdsQuerydmMETHODABR: TStringField
      FieldName = 'METHODABR'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQuerydmUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsQuerydmRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object cdsQuerydmCONFIDENTIAL: TIntegerField
      FieldName = 'CONFIDENTIAL'
    end
    object cdsQuerydmRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object cdsQuerydmRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object cdsQuerydmRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
    object cdsQuerydmQdmGrouping: TDataSetField
      FieldName = 'QdmGrouping'
    end
    object cdsQuerydmQdmSmp: TDataSetField
      FieldName = 'QdmSmp'
    end
    object cdsQuerydmQdmInit: TDataSetField
      FieldName = 'QdmInit'
    end
  end
  object dsQuerydm: TDataSource
    DataSet = cdsQuerydm
    Left = 254
    Top = 18
  end
  object dsTempDataMap: TDataSource
    DataSet = cdsTempDataMap
    Left = 66
    Top = 96
  end
  object dsTempDataDI: TDataSource
    DataSet = cdsTempDataDI
    Left = 66
    Top = 140
  end
  object dsTempDataI: TDataSource
    DataSet = cdsTempDataI
    Left = 66
    Top = 186
  end
  object dsTempDataDT: TDataSource
    DataSet = cdsTempDataDT
    Left = 66
    Top = 238
  end
  object dsTempDataDG: TDataSource
    DataSet = cdsTempDataDG
    Left = 66
    Top = 282
  end
  object dsQdmGrouping: TDataSource
    DataSet = cdsQdmGrouping
    Left = 200
    Top = 80
  end
  object dsQdmSmp: TDataSource
    DataSet = cdsQdmSmp
    Left = 194
    Top = 126
  end
  object dsQdmInit: TDataSource
    DataSet = cdsQdmInit
    Left = 198
    Top = 400
  end
  object cdsTempDataMap: TClientDataSet
    PersistDataPacket.Data = {
      2D0100009619E0BD01000000180000000D0000000000030000002D010E496E74
      6572707265746174696F6E010049000000010005574944544802000200140007
      41676542616E64010049000000010005574944544802000200140009496E7465
      7270416272010049000000010005574944544802000200050008436F6C756D6E
      4E6F02000100000000000853616D706C654E6F01004900000001000557494454
      4802000200140003416765080004000000000007416765506C75730800040000
      000000084167654D696E75730800040000000000084C61746974756465080004
      0000000000094C6F6E676974756465080004000000000009456C65766174696F
      6E08000400000000000C436F6C756D6E4E6F4461746502000100000000000852
      65636F7264494404000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Interpretation'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AgeBand'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'InterpAbr'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ColumnNo'
        DataType = ftSmallint
      end
      item
        Name = 'SampleNo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Age'
        DataType = ftFloat
      end
      item
        Name = 'AgePlus'
        DataType = ftFloat
      end
      item
        Name = 'AgeMinus'
        DataType = ftFloat
      end
      item
        Name = 'Latitude'
        DataType = ftFloat
      end
      item
        Name = 'Longitude'
        DataType = ftFloat
      end
      item
        Name = 'Elevation'
        DataType = ftFloat
      end
      item
        Name = 'ColumnNoDate'
        DataType = ftSmallint
      end
      item
        Name = 'RecordID'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 38
    Top = 96
    object cdsTempDataMapInterpretation: TStringField
      FieldName = 'Interpretation'
    end
    object cdsTempDataMapAgeBand: TStringField
      FieldName = 'AgeBand'
    end
    object cdsTempDataMapInterpAbr: TStringField
      FieldName = 'InterpAbr'
      Size = 5
    end
    object cdsTempDataMapColumnNo: TSmallintField
      FieldName = 'ColumnNo'
    end
    object cdsTempDataMapSampleNo: TStringField
      FieldName = 'SampleNo'
    end
    object cdsTempDataMapAge: TFloatField
      FieldName = 'Age'
    end
    object cdsTempDataMapAgePlus: TFloatField
      FieldName = 'AgePlus'
    end
    object cdsTempDataMapAgeMinus: TFloatField
      FieldName = 'AgeMinus'
    end
    object cdsTempDataMapLatitude: TFloatField
      FieldName = 'Latitude'
    end
    object cdsTempDataMapLongitude: TFloatField
      FieldName = 'Longitude'
    end
    object cdsTempDataMapElevation: TFloatField
      FieldName = 'Elevation'
    end
    object cdsTempDataMapColumnNoDate: TSmallintField
      FieldName = 'ColumnNoDate'
    end
    object cdsTempDataMapRecordID: TIntegerField
      FieldName = 'RecordID'
    end
  end
  object cdsTempDataDI: TClientDataSet
    PersistDataPacket.Data = {
      F00000009619E0BD010000001800000009000000000003000000F0000E496E74
      6572707265746174696F6E010049000000010005574944544802000200140003
      416765080004000000000008537569744E616D65010049000000010005574944
      544802000200320009496E746572704162720100490000000100055749445448
      0200020005000847726F7570696E670100490000000100055749445448020002
      00140008436F6C756D6E4E6F02000100000000000A4167654572726F72417608
      000400000000000C416765506C75734572726F7208000400000000000D416765
      4D696E75734572726F7208000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 140
    object cdsTempDataDIInterpretation: TStringField
      FieldName = 'Interpretation'
    end
    object cdsTempDataDIAge: TFloatField
      FieldName = 'Age'
    end
    object cdsTempDataDISuitName: TStringField
      FieldName = 'SuitName'
      Size = 50
    end
    object cdsTempDataDIInterpAbr: TStringField
      FieldName = 'InterpAbr'
      Size = 5
    end
    object cdsTempDataDIGrouping: TStringField
      FieldName = 'Grouping'
    end
    object cdsTempDataDIColumnNo: TSmallintField
      FieldName = 'ColumnNo'
    end
    object cdsTempDataDIAgeErrorAv: TFloatField
      FieldName = 'AgeErrorAv'
    end
    object cdsTempDataDIAgePlusError: TFloatField
      FieldName = 'AgePlusError'
    end
    object cdsTempDataDIAgeMinusError: TFloatField
      FieldName = 'AgeMinusError'
    end
  end
  object cdsTempDataDT: TClientDataSet
    PersistDataPacket.Data = {
      290100009619E0BD01000000180000000B00000000000300000029010847726F
      7570696E67010049000000010005574944544802000200140008537569744E61
      6D65010049000000010005574944544802000200320008436F6C756D6E4E6F02
      000100000000000341676508000400000000000C416765506C75734572726F72
      08000400000000000D4167654D696E75734572726F7208000400000000000949
      736F53797374656D0100490000000100055749445448020002000F000B4D6174
      657269616C41627201004900000001000557494454480200020005000B417070
      726F616368416272010049000000010005574944544802000200050009426C6F
      636B696E6754080004000000000014426C6F636B696E6754556E636572746169
      6E747908000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 238
    object cdsTempDataDTGrouping: TStringField
      FieldName = 'Grouping'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTempDataDTMaterialAbr: TStringField
      FieldName = 'MaterialAbr'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 5
    end
    object cdsTempDataDTIsoSystem: TStringField
      FieldName = 'IsoSystem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 15
    end
    object cdsTempDataDTApproachAbr: TStringField
      FieldName = 'ApproachAbr'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 5
    end
    object cdsTempDataDTAge: TFloatField
      FieldName = 'Age'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '###0.00'
    end
    object cdsTempDataDTSuitName: TStringField
      FieldName = 'SuitName'
      Size = 50
    end
    object cdsTempDataDTColumnNo: TSmallintField
      FieldName = 'ColumnNo'
    end
    object cdsTempDataDTAgePlusError: TFloatField
      FieldName = 'AgePlusError'
      DisplayFormat = '###0.00'
    end
    object cdsTempDataDTAgeMinusError: TFloatField
      FieldName = 'AgeMinusError'
      DisplayFormat = '###0.00'
    end
    object cdsTempDataDTBlockingT: TFloatField
      FieldName = 'BlockingT'
      DisplayFormat = '###0.0'
    end
    object cdsTempDataDTBlockingTUncertainty: TFloatField
      FieldName = 'BlockingTUncertainty'
      DisplayFormat = '###0.0'
    end
  end
  object cdsTempDataDG: TClientDataSet
    PersistDataPacket.Data = {
      F00000009619E0BD010000001800000009000000000003000000F0000847726F
      7570696E67010049000000010005574944544802000200140003416765080004
      000000000008537569744E616D65010049000000010005574944544802000200
      320009496E746572704162720100490000000100055749445448020002000500
      0E496E746572707265746174696F6E0100490000000100055749445448020002
      00140008436F6C756D6E4E6F02000100000000000A4167654572726F72417608
      000400000000000C416765506C75734572726F7208000400000000000D416765
      4D696E75734572726F7208000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 282
    object cdsTempDataDGGrouping: TStringField
      FieldName = 'Grouping'
    end
    object cdsTempDataDGAge: TFloatField
      FieldName = 'Age'
      DisplayFormat = '###0.00'
    end
    object cdsTempDataDGSuitName: TStringField
      FieldName = 'SuitName'
      Size = 50
    end
    object cdsTempDataDGInterpAbr: TStringField
      FieldName = 'InterpAbr'
      Size = 5
    end
    object cdsTempDataDGInterpretation: TStringField
      FieldName = 'Interpretation'
    end
    object cdsTempDataDGColumnNo: TSmallintField
      FieldName = 'ColumnNo'
    end
    object cdsTempDataDGAgeErrorAv: TFloatField
      FieldName = 'AgeErrorAv'
      DisplayFormat = '###0.00'
    end
    object cdsTempDataDGAgePlusError: TFloatField
      FieldName = 'AgePlusError'
      DisplayFormat = '###0.00'
    end
    object cdsTempDataDGAgeMinusError: TFloatField
      FieldName = 'AgeMinusError'
      DisplayFormat = '###0.00'
    end
  end
  object QdmGrouping: TSQLQuery
    DataSource = dsQuerydmDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from Grouping'
      'where RecordID=:RecordID')
    SQLConnection = sqlcDateView
    Left = 144
    Top = 80
    object QdmGroupingRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object QdmGroupingGROUPING: TStringField
      FieldName = 'GROUPING'
      Required = True
    end
  end
  object QdmSmp: TSQLQuery
    DataSource = dsQuerydmDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from SmpReg, SmpLoc'
      'where SmpReg.SampleNo=SmpLoc.SampleNo'
      'and RecordID=:RecordID')
    SQLConnection = sqlcDateView
    Left = 140
    Top = 126
    object QdmSmpRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object QdmSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      Required = True
      Size = 15
    end
    object QdmSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object QdmSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object QdmSmpINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QdmSmpCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object QdmSmpCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object QdmSmpLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object QdmSmpLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object QdmSmpELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
    end
  end
  object QdmInit: TSQLQuery
    DataSource = dsQuerydmDB
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'RECORDID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select * from IsoInit'
      'where RecordID=:RecordID')
    SQLConnection = sqlcDateView
    Left = 144
    Top = 400
    object QdmInitRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object QdmInitINITRATIO: TFloatField
      FieldName = 'INITRATIO'
    end
    object QdmInitINITRATIOERROR: TFloatField
      FieldName = 'INITRATIOERROR'
    end
    object QdmInitEPSILON: TFloatField
      FieldName = 'EPSILON'
    end
    object QdmInitEPSILONERROR: TFloatField
      FieldName = 'EPSILONERROR'
    end
    object QdmInitMU: TFloatField
      FieldName = 'MU'
    end
    object QdmInitMUPERROR: TFloatField
      FieldName = 'MUPERROR'
    end
    object QdmInitMUMERROR: TFloatField
      FieldName = 'MUMERROR'
    end
    object QdmInitINITIALRATIO3D: TFloatField
      FieldName = 'INITIALRATIO3D'
    end
    object QdmInitINITIALRATIO3DERROR: TFloatField
      FieldName = 'INITIALRATIO3DERROR'
    end
  end
  object dsQuerydmDB: TDataSource
    DataSet = Querydm
    Left = 170
    Top = 18
  end
  object cdsQdmGrouping: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQuerydmQdmGrouping
    Params = <>
    Left = 172
    Top = 80
    object cdsQdmGroupingRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQdmGroupingGROUPING: TStringField
      FieldName = 'GROUPING'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsQdmSmp: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQuerydmQdmSmp
    Params = <>
    Left = 166
    Top = 126
    object cdsQdmSmpRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQdmSmpISOSYSTEM: TStringField
      FieldName = 'ISOSYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQdmSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQdmSmpFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQdmSmpINCLUDED: TStringField
      FieldName = 'INCLUDED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsQdmSmpCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsQdmSmpCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      Required = True
      Size = 3
    end
    object cdsQdmSmpLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
    end
    object cdsQdmSmpLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
    end
    object cdsQdmSmpELEVATION: TFloatField
      FieldName = 'ELEVATION'
      Required = True
    end
  end
  object cdsQdmInit: TClientDataSet
    Aggregates = <>
    DataSetField = cdsQuerydmQdmInit
    Params = <>
    Left = 172
    Top = 400
    object cdsQdmInitRECORDID: TIntegerField
      FieldName = 'RECORDID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQdmInitINITRATIO: TFloatField
      FieldName = 'INITRATIO'
    end
    object cdsQdmInitINITRATIOERROR: TFloatField
      FieldName = 'INITRATIOERROR'
    end
    object cdsQdmInitEPSILON: TFloatField
      FieldName = 'EPSILON'
    end
    object cdsQdmInitEPSILONERROR: TFloatField
      FieldName = 'EPSILONERROR'
    end
    object cdsQdmInitMU: TFloatField
      FieldName = 'MU'
    end
    object cdsQdmInitMUPERROR: TFloatField
      FieldName = 'MUPERROR'
    end
    object cdsQdmInitMUMERROR: TFloatField
      FieldName = 'MUMERROR'
    end
    object cdsQdmInitINITIALRATIO3D: TFloatField
      FieldName = 'INITIALRATIO3D'
    end
    object cdsQdmInitINITIALRATIO3DERROR: TFloatField
      FieldName = 'INITIALRATIO3DERROR'
    end
  end
  object cdsTempDataI: TClientDataSet
    PersistDataPacket.Data = {
      9E0000009619E0BD0100000018000000060000000000030000009E000E496E74
      6572707265746174696F6E010049000000010005574944544802000200140006
      506C6F744E6F020001000000000008436F6C756D6E4E6F020001000000000009
      5661726961626C65580800040000000000095661726961626C65590800040000
      0000000847726F7570696E670100490000000100055749445448020002001400
      0000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 186
    object cdsTempDataIInterpretation: TStringField
      FieldName = 'Interpretation'
    end
    object cdsTempDataIPlotNo: TSmallintField
      FieldName = 'PlotNo'
    end
    object cdsTempDataIColumnNo: TSmallintField
      FieldName = 'ColumnNo'
    end
    object cdsTempDataIVariableX: TFloatField
      FieldName = 'VariableX'
      DisplayFormat = '###0.000000'
    end
    object cdsTempDataIVariableY: TFloatField
      FieldName = 'VariableY'
      DisplayFormat = '###0.000000'
    end
    object cdsTempDataIGrouping: TStringField
      FieldName = 'Grouping'
    end
  end
  object qVariables: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Variables')
    SQLConnection = sqlcDateView
    Left = 282
    Top = 86
  end
  object dspVariables: TDataSetProvider
    DataSet = qVariables
    Left = 310
    Top = 86
  end
  object cdsVariables: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVariables'
    Left = 338
    Top = 86
    object cdsVariablesVARIABLEABR: TStringField
      FieldName = 'VARIABLEABR'
      Required = True
      Size = 5
    end
    object cdsVariablesVARIABLENAME: TStringField
      FieldName = 'VARIABLENAME'
      Required = True
      Size = 60
    end
  end
  object dsVariables: TDataSource
    DataSet = cdsVariables
    Left = 366
    Top = 86
  end
  object cdsTable1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 316
    Top = 24
  end
  object cdsTempDataProb: TClientDataSet
    PersistDataPacket.Data = {
      6C0000009619E0BD0100000018000000040000000000030000006C000B437572
      76654E756D62657204000100000000000341676508000400000000000A437572
      766556616C756508000400000000000A43757276655469746C65010049000000
      01000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 38
    Top = 328
    object cdsTempDataProbCurveNumber: TIntegerField
      FieldName = 'CurveNumber'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsTempDataProbAge: TFloatField
      FieldName = 'Age'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '###0.000'
    end
    object cdsTempDataProbCurveValue: TFloatField
      FieldName = 'CurveValue'
      DisplayFormat = '##0.000'
    end
    object cdsTempDataProbCurveTitle: TStringField
      FieldName = 'CurveTitle'
    end
  end
  object dsTempDataProb: TDataSource
    DataSet = cdsTempDataProb
    Left = 66
    Top = 328
  end
  object Querydm2: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT USEROPTS.OPTIONTITLE,ISORGR30.RAGE,ISORGR30.UNIT' +
        'ID,SUITE.UNITNAME,'
      '   ISORGR30.INTERPABR,USEROPTS.OPTIONTITLE,USEROPTS.OPTIONID,'
      '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR'
      ''
      ''
      ''
      ''
      ''
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,UserOpts,Use' +
        'rOptInterp'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      'AND USEROPTS.USERID = USERSWHOFOR.USERID'
      'AND USEROPTS.USERID = USEROPTINTERP.USERID'
      'AND USEROPTS.OPTIONID = USEROPTINTERP.OPTIONID'
      'AND USEROPTINTERP.INTERPABR = ISORGR30.INTERPABR'
      'AND USEROPTS.OPTIONTYPEID = '#39'I'#39)
    SQLConnection = sqlcDateView
    Left = 438
    Top = 22
  end
  object dspQuerydm2: TDataSetProvider
    DataSet = Querydm2
    Left = 466
    Top = 22
  end
  object cdsQuerydm2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydm2'
    Left = 494
    Top = 22
    object cdsQuerydm2OPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsQuerydm2UNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydm2RAGE: TFloatField
      FieldName = 'RAGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '###0.00'
    end
    object cdsQuerydm2INTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuerydm2OPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      Required = True
    end
    object cdsQuerydm2OPTIONTITLE_1: TStringField
      FieldName = 'OPTIONTITLE_1'
      Required = True
      Size = 30
    end
    object cdsQuerydm2RAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydm2RAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydm2UNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsQuerydm2: TDataSource
    DataSet = cdsQuerydm2
    Left = 522
    Top = 22
  end
  object qGroupingLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from USEROPTGROUPING'
      'where USEROPTGROUPING.USERID = :USERID')
    SQLConnection = sqlcDateView
    Left = 284
    Top = 140
  end
  object dspGroupingLink: TDataSetProvider
    DataSet = qGroupingLink
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 312
    Top = 140
  end
  object cdsGroupingLink: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGroupingLink'
    Left = 340
    Top = 140
    object cdsGroupingLinkUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGroupingLinkGROUPINGNUMBER: TIntegerField
      FieldName = 'GROUPINGNUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGroupingLinkGROUPINGLINK: TStringField
      FieldName = 'GROUPINGLINK'
      Required = True
      Size = 30
    end
  end
  object dsGroupingLink: TDataSource
    DataSet = cdsGroupingLink
    Left = 368
    Top = 140
  end
  object QuerydmDI: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT USEROPTS.OPTIONTITLE,ISORGR30.RAGE,ISORGR30.UNIT' +
        'ID,SUITE.UNITNAME,'
      '   ISORGR30.INTERPABR,USEROPTS.OPTIONTITLE,USEROPTS.OPTIONID,'
      '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR'
      ''
      ''
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,IsoFor,UserO' +
        'pts'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      'AND USEROPTS.USERID = USERSWHOFOR.USERID'
      'AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID'
      'AND ISOFOR.RECORDID=ISORGR30.RECORDID'
      'AND USEROPTS.OPTIONTYPEID = '#39'I'#39)
    SQLConnection = sqlcDateView
    Left = 438
    Top = 74
    object QuerydmDIOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
    object QuerydmDIRAGE: TFloatField
      FieldName = 'RAGE'
    end
    object QuerydmDIUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object QuerydmDIUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object QuerydmDIINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object QuerydmDIOPTIONTITLE_1: TStringField
      FieldName = 'OPTIONTITLE_1'
      Required = True
      Size = 30
    end
    object QuerydmDIOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      Required = True
    end
    object QuerydmDIRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
    end
    object QuerydmDIRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
    end
  end
  object dspQuerydmDI: TDataSetProvider
    DataSet = QuerydmDI
    Left = 466
    Top = 74
  end
  object cdsQuerydmDI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydmDI'
    Left = 494
    Top = 74
    object cdsQuerydmDIOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
    object cdsQuerydmDIRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmDIUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsQuerydmDIUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsQuerydmDIINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuerydmDIOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      Required = True
    end
    object cdsQuerydmDIRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmDIRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
  end
  object dsQuerydmDI: TDataSource
    DataSet = cdsQuerydmDI
    Left = 522
    Top = 74
  end
  object QuerydmDG: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT USEROPTGROUPING.GROUPINGLINK,ISORGR30.RAGE,  ISO' +
        'RGR30.UNITID,SUITE.UNITNAME,'
      '   ISORGR30.INTERPABR,USEROPTGROUPING.GROUPINGNUMBER,'
      '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR'
      'from USEROPTGROUPING,USERSWHOFOR, isorgr30,Suite,ISOFOR,Grouping'
      'WHERE UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND USERSWHOFOR.USERID=USEROPTGROUPING.USERID'
      'AND ISORGR30.RECORDID =GROUPING.RECORDID'
      'AND ISORGR30.RECORDID=ISOFOR.RECORDID'
      'AND ISOFOR.WHOFORID=USERSWHOFOR.WHOFORID '
      'AND '
      'ISORGR30.CountryAbr = '#39'ZAF'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      'AND GROUPING.GROUPING = USEROPTGROUPING.GROUPINGLINK'
      
        'ORDER BY USEROPTGROUPING.GROUPINGLINK, ISORGR30.RAGE, SUITE.UNIT' +
        'NAME')
    SQLConnection = sqlcDateView
    Left = 438
    Top = 120
  end
  object dspQuerydmDG: TDataSetProvider
    DataSet = QuerydmDG
    Left = 466
    Top = 120
  end
  object cdsQuerydmDG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydmDG'
    Left = 494
    Top = 120
    object cdsQuerydmDGGROUPINGLINK: TStringField
      FieldName = 'GROUPINGLINK'
      Required = True
      Size = 30
    end
    object cdsQuerydmDGRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmDGUNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsQuerydmDGUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsQuerydmDGINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuerydmDGGROUPINGNUMBER: TIntegerField
      FieldName = 'GROUPINGNUMBER'
      Required = True
    end
    object cdsQuerydmDGRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmDGRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
  end
  object dsQuerydmDG: TDataSource
    DataSet = cdsQuerydmDG
    Left = 522
    Top = 120
  end
  object QuerydmI: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT USEROPTS.OPTIONTITLE,ISORGR30.RAGE,ISORGR30.UNIT' +
        'ID,SUITE.UNITNAME,'
      '   ISORGR30.INTERPABR,USEROPTS.OPTIONID,'
      
        '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOINIT.INITRATIO, IS' +
        'OINIT.EPSILON, ISOINIT.MU, ISOINIT.INITIALRATIO3D'
      ''
      ''
      ''
      ''
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,IsoFor,Sourc' +
        'eA,SourceListB,UserOpts,IsoInit'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      'AND USEROPTS.USERID = USERSWHOFOR.USERID'
      'AND USEROPTS.OPTIONTYPEID = '#39'I'#39
      'AND ISORGR30.RECORDID = ISOINIT.RECORDID'
      'ORDER BY USEROPTS.OPTIONTITLE, ISORGR30.RAGE, SUITE.UNITNAME'
      '')
    SQLConnection = sqlcDateView
    Left = 438
    Top = 166
  end
  object dspQuerydmI: TDataSetProvider
    DataSet = QuerydmI
    Left = 466
    Top = 166
  end
  object cdsQuerydmI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydmI'
    Left = 494
    Top = 166
    object cdsQuerydmIOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
    object cdsQuerydmIRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmIUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsQuerydmIINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuerydmIOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      Required = True
    end
    object cdsQuerydmIRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmIRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmIINITRATIO: TFloatField
      FieldName = 'INITRATIO'
      DisplayFormat = '###0.000000'
    end
    object cdsQuerydmIEPSILON: TFloatField
      FieldName = 'EPSILON'
      DisplayFormat = '###0.000'
    end
    object cdsQuerydmIMU: TFloatField
      FieldName = 'MU'
      DisplayFormat = '###0.000'
    end
    object cdsQuerydmIINITIALRATIO3D: TFloatField
      FieldName = 'INITIALRATIO3D'
      DisplayFormat = '###0.000000'
    end
  end
  object dsQuerydmI: TDataSource
    DataSet = cdsQuerydmI
    Left = 522
    Top = 166
  end
  object QuerydmDT: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT USEROPTGROUPING.GROUPINGLINK,'
      
        '   ISORGR30.UNITID,SUITE.UNITNAME, USEROPTGROUPING.GROUPINGNUMBE' +
        'R,'
      '   ISORGR30.RAGE,'
      '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,'
      '   ISORGR30.ISOTOPESYSTEM, ISORGR30.MATERIALABR,'
      '   ISORGR30.APPROACHABR,'
      '   ISORGR30.INTERPABR,'
      '   BLOCKINGT.BLOCKINGT, BLOCKINGT.BLOCKINGTUNCERTAINTY'
      ''
      ''
      ''
      ''
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '       IsoSystem,Suite,UsersWhoFor,UserOpts,UserOptGrouping,Bloc' +
        'kingT'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      ''
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      ''
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      'AND USEROPTS.USERID = USERSWHOFOR.USERID'
      'AND USEROPTS.USERID = USEROPTGROUPING.USERID')
    SQLConnection = sqlcDateView
    Left = 440
    Top = 214
  end
  object dspQuerydmDT: TDataSetProvider
    DataSet = QuerydmDT
    Left = 468
    Top = 214
  end
  object cdsQuerydmDT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydmDT'
    Left = 496
    Top = 214
    object cdsQuerydmDTGROUPINGLINK: TStringField
      FieldName = 'GROUPINGLINK'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object cdsQuerydmDTMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmDTISOTOPESYSTEM: TStringField
      FieldName = 'ISOTOPESYSTEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsQuerydmDTAPPROACHABR: TStringField
      FieldName = 'APPROACHABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsQuerydmDTRAGE: TFloatField
      FieldName = 'RAGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmDTUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsQuerydmDTGROUPINGNUMBER: TIntegerField
      FieldName = 'GROUPINGNUMBER'
      Required = True
    end
    object cdsQuerydmDTRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmDTRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmDTINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuerydmDTBLOCKINGT: TFloatField
      FieldName = 'BLOCKINGT'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmDTBLOCKINGTUNCERTAINTY: TFloatField
      FieldName = 'BLOCKINGTUNCERTAINTY'
      DisplayFormat = '###0.00'
    end
  end
  object dsQuerydmDT: TDataSource
    DataSet = cdsQuerydmDT
    Left = 524
    Top = 214
  end
  object QuerydmMI: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT USEROPTS.OPTIONID,SMPLOC.SAMPLENO,SMPLOC.LATITUD' +
        'E,SMPLOC.LONGITUDE,SMPLOC.ELEVATION,'
      '   ISORGR30.INTERPABR,USEROPTS.OPTIONTITLE,'
      
        '   ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISORGR3' +
        '0.RECORDID'
      '   '
      '   '
      '   '
      ''
      ''
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '       IsoSystem,Suite,UsersWhoFor,UserOpts,UserOptGrouping,SmpR' +
        'eg,SmpLoc'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      'AND USEROPTS.USERID = USERSWHOFOR.USERID'
      'AND USEROPTS.USERID = USEROPTGROUPING.USERID'
      'AND USEROPTS.OPTIONTYPEID = '#39'I'#39
      'AND SMPREG.RECORDID=ISORGR30.RECORDID'
      'AND SMPREG.SAMPLENO=SMPLOC.SAMPLENO'
      'AND SMPREG.INCLUDED='#39'Y'#39)
    SQLConnection = sqlcDateView
    Left = 440
    Top = 262
  end
  object dspQuerydmMI: TDataSetProvider
    DataSet = QuerydmMI
    Left = 468
    Top = 262
  end
  object cdsQuerydmMI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydmMI'
    Left = 496
    Top = 262
    object cdsQuerydmMIOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmMISAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsQuerydmMIOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
    object cdsQuerydmMILATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsQuerydmMILONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsQuerydmMIINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuerydmMIRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmMIRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
  end
  object dsQuerydmMI: TDataSource
    DataSet = cdsQuerydmMI
    Left = 524
    Top = 262
  end
  object QuerydmIG: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT USEROPTGROUPING.GROUPINGLINK,ISORGR30.RAGE,ISORG' +
        'R30.UNITID,SUITE.UNITNAME,'
      '   ISORGR30.INTERPABR,USEROPTGROUPING.GROUPINGNUMBER,'
      
        '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOINIT.INITRATIO, IS' +
        'OINIT.EPSILON, ISOINIT.MU, ISOINIT.INITIALRATIO3D'
      ''
      ''
      ''
      ''
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,IsoFor,Sourc' +
        'eA,SourceListB,IsoInit,UserOptGrouping,Grouping'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.Lithology = LITHOL.Lithology '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.TechAbr = TECHNIQUE.TechAbr '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      'AND USEROPTS.USERID = USERSWHOFOR.USERID'
      'AND USEROPTS.OPTIONTYPEID = '#39'I'#39
      'AND ISORGR30.RECORDID = ISOINIT.RECORDID'
      'AND USEROPTS.USERID = USEROPTGROUPING.USERID'
      'AND GROUPING.GROUPING = USEROPTGROUPING.GROUPINGLINK'
      'ORDER BY USEROPTS.OPTIONTITLE, ISORGR30.RAGE, SUITE.UNITNAME'
      '')
    SQLConnection = sqlcDateView
    Left = 442
    Top = 306
  end
  object dspQuerydmIG: TDataSetProvider
    DataSet = QuerydmIG
    Left = 470
    Top = 306
  end
  object cdsQuerydmIG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydmIG'
    Left = 498
    Top = 306
    object cdsQuerydmIGGROUPINGLINK: TStringField
      FieldName = 'GROUPINGLINK'
      Required = True
      Size = 30
    end
    object cdsQuerydmIGRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmIGUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsQuerydmIGINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuerydmIGGROUPINGNUMBER: TIntegerField
      FieldName = 'GROUPINGNUMBER'
      Required = True
    end
    object cdsQuerydmIGRAGEPERROR: TFloatField
      FieldName = 'RAGEPERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmIGRAGEMERROR: TFloatField
      FieldName = 'RAGEMERROR'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmIGINITRATIO: TFloatField
      FieldName = 'INITRATIO'
      DisplayFormat = '##0.000000'
    end
    object cdsQuerydmIGEPSILON: TFloatField
      FieldName = 'EPSILON'
      DisplayFormat = '###0.000'
    end
    object cdsQuerydmIGMU: TFloatField
      FieldName = 'MU'
      DisplayFormat = '###0.000'
    end
    object cdsQuerydmIGINITIALRATIO3D: TFloatField
      FieldName = 'INITIALRATIO3D'
      DisplayFormat = '##0.000000'
    end
  end
  object dsQuerydmIG: TDataSource
    DataSet = cdsQuerydmIG
    Left = 526
    Top = 306
  end
  object QuerydmMIG: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USERID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DISTINCT USEROPTS.OPTIONID,SMPLOC.SAMPLENO,SMPLOC.LATITUD' +
        'E,SMPLOC.LONGITUDE,SMPLOC.ELEVATION,'
      '   ISORGR30.INTERPABR,USEROPTGROUPING.GROUPINGLINK,'
      
        '   ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISORGR3' +
        '0.RECORDID'
      '   '
      '   '
      '   '
      ''
      ''
      
        'from isorgr30, Country, Interpretation, Approach,Material,Method' +
        's,'
      
        '       IsoSystem,Suite,UsersWhoFor,UserOpts,UserOptGrouping,SmpR' +
        'eg,SmpLoc'
      'WHERE ISORGR30.CountryAbr = COUNTRY.CountryAbr '
      'and UsersWhoFor.USERID=:USERID'
      'AND ISORGR30.UnitID = SUITE.UnitID '
      'AND ISORGR30.MaterialAbr = MATERIAL.MaterialAbr '
      'AND ISORGR30.ApproachAbr = APPROACH.ApproachAbr '
      'AND ISORGR30.InterpAbr = INTERPRETATION.InterpAbr '
      'AND ISORGR30.IsotopeSystem = ISOSYSTEM.IsoSystem '
      'AND ISORGR30.MethodAbr = METHODS.MethodAbr '
      'AND '
      'ISORGR30.CountryAbr = '#39'TST'#39
      'AND '
      'ISORGR30.PrefLevel >= '#39'1'#39
      'AND USEROPTS.USERID = USERSWHOFOR.USERID'
      'AND USEROPTS.USERID = USEROPTGROUPING.USERID'
      'AND USEROPTS.OPTIONTYPEID = '#39'I'#39
      'AND SMPREG.RECORDID=ISORGR30.RECORDID'
      'AND SMPREG.SAMPLENO=SMPLOC.SAMPLENO'
      'AND SMPREG.INCLUDED='#39'Y'#39)
    SQLConnection = sqlcDateView
    Left = 440
    Top = 350
  end
  object dspQuerydmMIG: TDataSetProvider
    DataSet = QuerydmMIG
    Left = 468
    Top = 350
  end
  object cdsQuerydmMIG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydmMIG'
    Left = 496
    Top = 350
    object cdsQuerydmMIGOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      Required = True
    end
    object cdsQuerydmMIGSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsQuerydmMIGLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsQuerydmMIGLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsQuerydmMIGINTERPABR: TStringField
      FieldName = 'INTERPABR'
      Required = True
      Size = 5
    end
    object cdsQuerydmMIGGROUPINGLINK: TStringField
      FieldName = 'GROUPINGLINK'
      Required = True
      Size = 30
    end
    object cdsQuerydmMIGRAGE: TFloatField
      FieldName = 'RAGE'
      DisplayFormat = '###0.00'
    end
    object cdsQuerydmMIGRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
  end
  object dsQuerydmMIG: TDataSource
    DataSet = cdsQuerydmMIG
    Left = 524
    Top = 350
  end
  object qUserDeposits: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT USEROPTS.OPTIONID, USEROPTS.OPTIONTITLE,'
      '  USERDEPOSITS.USERID, USERDEPOSITS.DEPOSITID,'
      '  USERDEPOSITS.RAGE, USERDEPOSITS.RAGEUNCERTAINTY,'
      '  USERDEPOSITS.DEPLONGITUDE, USERDEPOSITS.DEPLATITUDE,'
      '  USERDEPOSITS.DEPOSITNAME'
      'FROM USEROPTS, USERDEPOSITS, USEROPTDATES'
      'WHERE USERDEPOSITS.USERID = :UserID'
      'AND USEROPTS.USERID = USERDEPOSITS.USERID'
      'AND USEROPTS.OPTIONTYPEID = '#39'D'#39
      'AND USERDEPOSITS.RAGE >= USEROPTDATES.DATEMIN'
      'AND USERDEPOSITS.RAGE < USEROPTDATES.DATEMAX'
      'AND USERDEPOSITS.DEPLATITUDE<90.0'
      'AND USEROPTS.USERID = USEROPTDATES.USERID'
      'AND USEROPTS.OPTIONID = USEROPTDATES.OPTIONID')
    SQLConnection = sqlcDateView
    Left = 280
    Top = 200
  end
  object dspUserDeposits: TDataSetProvider
    DataSet = qUserDeposits
    Left = 312
    Top = 200
  end
  object cdsUserDeposits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserDeposits'
    Left = 336
    Top = 200
    object cdsUserDepositsUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserDepositsDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserDepositsRAGE: TFloatField
      FieldName = 'RAGE'
      Required = True
    end
    object cdsUserDepositsDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object cdsUserDepositsDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object cdsUserDepositsRAGEUNCERTAINTY: TFloatField
      FieldName = 'RAGEUNCERTAINTY'
      Required = True
    end
    object cdsUserDepositsOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      Required = True
    end
    object cdsUserDepositsOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
    object cdsUserDepositsDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
  end
  object dsUserDeposits: TDataSource
    DataSet = cdsUserDeposits
    Left = 368
    Top = 200
  end
  object qDeleteUserDeposits: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM USERDEPOSITS'
      'WHERE USERDEPOSITS.USERID = :UserID')
    SQLConnection = sqlcDateView
    Left = 280
    Top = 248
  end
  object qInsertUserDeposit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RAge'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RAgeUncertainty'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DepLatitude'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DepLongitude'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DepositName'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO USERDEPOSITS'
      
        '(USERID, DEPOSITID, RAGE,RAGEUNCERTAINTY,DEPLATITUDE,DEPLONGITUD' +
        'E,DEPOSITNAME)'
      
        'Values (:UserID,:DepositID,:RAge,:RAgeUncertainty,:DepLatitude,:' +
        'DepLongitude,:DepositName)')
    SQLConnection = sqlcDateView
    Left = 284
    Top = 292
  end
  object qUserOptCaptions: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OptionTypeID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT USEROPTS.OPTIONID,USEROPTS.OPTIONTITLE'
      'FROM USEROPTS'
      'WHERE USEROPTS.USERID = :UserID'
      'AND USEROPTS.OPTIONTYPEID = :OptionTypeID'
      'ORDER BY USEROPTS.OPTIONID')
    SQLConnection = sqlcDateView
    Left = 280
    Top = 344
  end
  object dspUserOptCaptions: TDataSetProvider
    DataSet = qUserOptCaptions
    Left = 304
    Top = 344
  end
  object cdsUserOptCaptions: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserOptCaptions'
    Left = 328
    Top = 344
    object cdsUserOptCaptionsOPTIONID: TIntegerField
      FieldName = 'OPTIONID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserOptCaptionsOPTIONTITLE: TStringField
      FieldName = 'OPTIONTITLE'
      Required = True
      Size = 30
    end
  end
  object dsUserOptCaptions: TDataSource
    DataSet = cdsUserOptCaptions
    Left = 352
    Top = 344
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcDateView
    Left = 40
    Top = 56
  end
end
