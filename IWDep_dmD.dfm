object dmDepD: TdmDepD
  OldCreateOrder = False
  Height = 634
  Width = 1001
  object SQLMonitor1: TSQLMonitor
    FileName = 'C:\Dev\DateViewWeb2\sqlcDateView.txt'
    SQLConnection = sqlcDep
    Left = 160
    Top = 14
  end
  object qDeposits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITS'
      'ORDER by DEPOSITS.DEPOSITNAME')
    SQLConnection = sqlcDep
    Left = 30
    Top = 58
  end
  object dspDeposits: TDataSetProvider
    DataSet = qDeposits
    Left = 58
    Top = 58
  end
  object cdsDeposits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeposits'
    Left = 86
    Top = 58
    object cdsDepositsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositsDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsDepositsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepositsDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
  end
  object dsDeposits: TDataSource
    AutoEdit = False
    DataSet = cdsDeposits
    Left = 114
    Top = 58
  end
  object XLSAdapter1: TXLSAdapter
    AllowOverwritingFiles = False
    Left = 572
    Top = 124
  end
  object FlexCelReport1: TFlexCelReport
    Template = 'c:\exe\Files\Flexcell\FlxStratUnits.xls'
    FileName = 'Test.xls'
    AutoClose = False
    Adapter = XLSAdapter1
    DateTimeFormat = 'yyyy/mm/dd hh:mm'
    KeepEmptyPictures = False
    DataModule = Owner
    Left = 572
    Top = 168
  end
  object FlexCelReportDetails1: TFlexCelReport
    Template = 'C:\EXE\Files\Flexcell\FlxStratDetail1.xls'
    FileName = 'Test.xls'
    AutoClose = False
    Adapter = XLSAdapter1
    DateTimeFormat = 'yyyy/mm/dd hh:mm'
    KeepEmptyPictures = False
    DataModule = Owner
    Left = 576
    Top = 220
  end
  object qDeposit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITS.SDBDEPOSITID,DEPOSITS.DEPOSITCLANID, '
      '  DEPOSITS.DATABASEID, DEPOSITS.DEPOSITNAME,'
      '  DEPOSITS.DEPLATITUDE,DEPOSITS.DEPLONGITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DEPOSITS.COUNTRYID,DEPOSITS.IAPPROXAGE,'
      '  COUNTRIES.CONTINENTID,'
      '  DEPOSITS.HOSTUNITID,'
      '  DEPOSITS.DEPOSITIDINT,DEPOSITS.DEPOSITIDSTR'
      'FROM DEPOSITS,COUNTRIES'
      'WHERE DEPOSITS.SDBDEPOSITID=:SDBDEPOSITID'
      'AND DEPOSITS.COUNTRYID=COUNTRIES.COUNTRYID'
      '')
    SQLConnection = sqlcDep
    Left = 250
    Top = 214
    object qDepositSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object qDepositDATABASEID: TIntegerField
      FieldName = 'DATABASEID'
      Required = True
    end
    object qDepositDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
    object qDepositDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object qDepositDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object qDepositAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object qDepositAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object qDepositCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object qDepositDEPOSITIDINT: TIntegerField
      FieldName = 'DEPOSITIDINT'
      Required = True
    end
    object qDepositDEPOSITIDSTR: TStringField
      FieldName = 'DEPOSITIDSTR'
      Required = True
      Size = 30
    end
    object qDepositHOSTUNITID: TIntegerField
      FieldName = 'HOSTUNITID'
      Required = True
    end
    object qDepositCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object dspDeposit: TDataSetProvider
    DataSet = qDeposit
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    Left = 306
    Top = 214
  end
  object cdsDeposit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDeposit'
    Left = 334
    Top = 214
    object cdsDepositSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsDepositDATABASEID: TIntegerField
      FieldName = 'DATABASEID'
      Required = True
    end
    object cdsDepositDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
    object cdsDepositDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
      DisplayFormat = '##0.00000'
    end
    object cdsDepositDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
      DisplayFormat = '##0.00000'
    end
    object cdsDepositAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      DisplayFormat = '###0.00'
    end
    object cdsDepositAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.00'
    end
    object cdsDepositCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepositDEPOSITIDINT: TIntegerField
      FieldName = 'DEPOSITIDINT'
      Required = True
    end
    object cdsDepositDEPOSITIDSTR: TStringField
      FieldName = 'DEPOSITIDSTR'
      Required = True
      Size = 30
    end
    object cdsDepositHOSTUNITID: TIntegerField
      FieldName = 'HOSTUNITID'
      Required = True
    end
    object cdsDepositqDepositCommodities: TDataSetField
      FieldName = 'qDepositCommodities'
    end
    object cdsDepositqDepositDomains: TDataSetField
      FieldName = 'qDepositDomains'
    end
    object cdsDepositqHostUnitAge: TDataSetField
      FieldName = 'qHostUnitAge'
    end
    object cdsDepositCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsDepositqDepositFor: TDataSetField
      FieldName = 'qDepositFor'
    end
  end
  object dsDeposit: TDataSource
    AutoEdit = False
    DataSet = cdsDeposit
    Left = 362
    Top = 214
  end
  object dsqDeposit: TDataSource
    AutoEdit = False
    DataSet = qDeposit
    Left = 278
    Top = 214
  end
  object qDepositDomains: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DOMAINDEPOSITS.SBDEPOSITID, DOMAINDEPOSITS.DOMAINID,'
      '  DOMAINS.DOMAINNAME, DOMAINS.CONTINENTID'
      'FROM DOMAINDEPOSITS, DOMAINS'
      'WHERE DOMAINDEPOSITS.SBDEPOSITID=:SDBDepositID'
      'AND DOMAINDEPOSITS.DOMAINID=DOMAINS.DOMAINID'
      'ORDER by DOMAINDEPOSITS.DOMAINID')
    SQLConnection = sqlcDep
    Left = 278
    Top = 262
    object qDepositDomainsSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qDepositDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object cdsDepositDomain: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqDepositDomains
    Params = <>
    Left = 306
    Top = 262
    object cdsDepositDomainSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositDomainDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositDomainDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsDepositDomainCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object dsDepositDomain: TDataSource
    AutoEdit = False
    DataSet = cdsDepositDomain
    Left = 334
    Top = 262
  end
  object qDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ContinentID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DOMAINS'
      'WHERE DOMAINS.CONTINENTID=:ContinentID'
      'ORDER by DOMAINS.DOMAINNAME')
    SQLConnection = sqlcDep
    Left = 30
    Top = 106
  end
  object dspDomains: TDataSetProvider
    DataSet = qDomains
    Left = 58
    Top = 106
  end
  object cdsDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomains'
    Left = 86
    Top = 106
    object cdsDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainsSPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainsSPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainsDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainsDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDomainsMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainsMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
  end
  object dsDomains: TDataSource
    AutoEdit = False
    DataSet = cdsDomains
    Left = 114
    Top = 106
  end
  object qNewDeposit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'SDBDepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO DEPOSITS'
      '(SDBDepositID)'
      'Values (:SDBDepositID)')
    SQLConnection = sqlcDep
    Left = 576
    Top = 56
  end
  object qClans: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITCLANS'
      'ORDER by DEPOSITCLANS.DEPOSITCLAN')
    SQLConnection = sqlcDep
    Left = 30
    Top = 158
  end
  object dspClans: TDataSetProvider
    DataSet = qClans
    Left = 58
    Top = 158
  end
  object cdsClans: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClans'
    Left = 86
    Top = 158
    object cdsClansDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClansDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 150
    end
  end
  object dsClans: TDataSource
    AutoEdit = False
    DataSet = cdsClans
    Left = 114
    Top = 158
  end
  object qCommodities: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM COMMODITIES'
      'ORDER BY COMMODITIES.COMMODITY')
    SQLConnection = sqlcDep
    Left = 30
    Top = 206
  end
  object dspCommodities: TDataSetProvider
    DataSet = qCommodities
    Left = 58
    Top = 206
  end
  object cdsCommodities: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCommodities'
    Left = 86
    Top = 206
    object cdsCommoditiesCOMMODITYID: TStringField
      FieldName = 'COMMODITYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCommoditiesCOMMODITY: TStringField
      FieldName = 'COMMODITY'
      Required = True
      Size = 30
    end
  end
  object dsCommodities: TDataSource
    AutoEdit = False
    DataSet = cdsCommodities
    Left = 114
    Top = 206
  end
  object FlexCelReportDeposits: TFlexCelReport
    Template = 'c:\exe\Files\Flexcell\FlxStratDBDeposits.xls'
    FileName = 'Test.xls'
    AutoClose = False
    Adapter = XLSAdapter1
    DateTimeFormat = 'yyyy/mm/dd hh:mm'
    KeepEmptyPictures = False
    DataModule = Owner
    Left = 580
    Top = 276
  end
  object qDRep1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.COUNTRYID,'
      '  DEPOSITS.DEPOSITNAME,  DEPOSITCLANS.DEPOSITCLAN,'
      '  DEPOSITS.DEPLONGITUDE,DEPOSITS.DEPLATITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  OTHERDATABASES.DATABASENAME'
      'from DEPOSITS,DEPOSITCLANS,OTHERDATABASES'
      'where DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'and DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID')
    SQLConnection = sqlcDep
    Left = 402
    Top = 278
  end
  object dsqDRep1: TDataSource
    AutoEdit = False
    DataSet = qDRep1
    Left = 430
    Top = 278
  end
  object dspDRep1: TDataSetProvider
    DataSet = qDRep1
    Left = 458
    Top = 278
  end
  object cdsDRep1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDRep1'
    Left = 486
    Top = 278
    object cdsDRep1SDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDRep1COUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDRep1DEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
    object cdsDRep1DEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 150
    end
    object cdsDRep1DEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDRep1DEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDRep1APPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      DisplayFormat = '###0.00'
    end
    object cdsDRep1APPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.00'
    end
    object cdsDRep1DATABASENAME: TStringField
      FieldName = 'DATABASENAME'
      Required = True
      Size = 50
    end
  end
  object dsDRep1: TDataSource
    AutoEdit = False
    DataSet = cdsDRep1
    Left = 514
    Top = 278
  end
  object qOtherDatabases: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM OTHERDATABASES'
      'ORDER by OTHERDATABASES.DATABASENAME')
    SQLConnection = sqlcDep
    Left = 30
    Top = 258
  end
  object dspOtherDatabases: TDataSetProvider
    DataSet = qOtherDatabases
    Left = 58
    Top = 258
  end
  object cdsOtherDatabases: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOtherDatabases'
    Left = 86
    Top = 258
    object cdsOtherDatabasesDATBASEID: TIntegerField
      FieldName = 'DATBASEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOtherDatabasesDATABASENAME: TStringField
      FieldName = 'DATABASENAME'
      Required = True
      Size = 50
    end
    object cdsOtherDatabasesDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
    end
  end
  object dsOtherDatabases: TDataSource
    AutoEdit = False
    DataSet = cdsOtherDatabases
    Left = 114
    Top = 258
  end
  object qContinents: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Continents'
      'where Continents.HasData='#39'Y'#39)
    SQLConnection = sqlcDep
    Left = 30
    Top = 362
    object qContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qContinentsCONTINENT: TStringField
      FieldName = 'CONTINENT'
    end
    object qContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object dsContinents: TDataSource
    AutoEdit = False
    DataSet = cdsContinents
    Left = 114
    Top = 362
  end
  object cdsContinents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContinents'
    Left = 86
    Top = 362
    object cdsContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsContinentsCONTINENT: TStringField
      FieldName = 'CONTINENT'
    end
    object cdsContinentsDEFAULTDOMAINID: TIntegerField
      FieldName = 'DEFAULTDOMAINID'
      Required = True
    end
  end
  object dspContinents: TDataSetProvider
    DataSet = qContinents
    Left = 58
    Top = 362
  end
  object qDomainsAll: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DOMAINS'
      'ORDER by DOMAINS.CONTINENTID, DOMAINS.DOMAINNAME')
    SQLConnection = sqlcDep
    Left = 30
    Top = 410
  end
  object dspDomainsAll: TDataSetProvider
    DataSet = qDomainsAll
    Left = 58
    Top = 410
  end
  object cdsDomainsAll: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainsAll'
    Left = 86
    Top = 410
    object cdsDomainsAllDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainsAllCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainsAllDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainsAllDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainsAllDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
  end
  object dsDomainsAll: TDataSource
    AutoEdit = False
    DataSet = cdsDomainsAll
    Left = 114
    Top = 410
  end
  object qDepositCommodities: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITCOMMODITIES.SBDEPOSITID, '
      '  DEPOSITCOMMODITIES.COMMODITYORDER,'
      '  DEPOSITCOMMODITIES.COMMODITYID, COMMODITIES.COMMODITY,'
      
        '  DEPOSITCOMMODITIES.COMMODITYGRADE,DEPOSITCOMMODITIES.GRADEUNIT' +
        'ID,'
      '  GRADEUNITS.GRADEUNIT'
      'FROM DEPOSITCOMMODITIES, COMMODITIES,GRADEUNITS'
      'WHERE DEPOSITCOMMODITIES.SBDEPOSITID=:SDBDepositID'
      'AND DEPOSITCOMMODITIES.COMMODITYID=COMMODITIES.COMMODITYID'
      'AND DEPOSITCOMMODITIES.GRADEUNITID=GRADEUNITS.GRADEID'
      'ORDER by DEPOSITCOMMODITIES.COMMODITYORDER')
    SQLConnection = sqlcDep
    Left = 278
    Top = 310
    object qDepositCommoditiesSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositCommoditiesCOMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositCommoditiesCOMMODITYID: TStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object qDepositCommoditiesCOMMODITY: TStringField
      FieldName = 'COMMODITY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qDepositCommoditiesCOMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
    end
    object qDepositCommoditiesGRADEUNITID: TStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepositCommoditiesGRADEUNIT: TStringField
      FieldName = 'GRADEUNIT'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object cdsDepositCommodities: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqDepositCommodities
    Params = <>
    Left = 306
    Top = 310
    object cdsDepositCommoditiesSBDEPOSITID: TIntegerField
      FieldName = 'SBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositCommoditiesCOMMODITYORDER: TIntegerField
      FieldName = 'COMMODITYORDER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositCommoditiesCOMMODITYID: TStringField
      FieldName = 'COMMODITYID'
      Required = True
      Size = 3
    end
    object cdsDepositCommoditiesCOMMODITY: TStringField
      FieldName = 'COMMODITY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsDepositCommoditiesCOMMODITYGRADE: TFloatField
      FieldName = 'COMMODITYGRADE'
      DisplayFormat = '#####0.0'
    end
    object cdsDepositCommoditiesGRADEUNITID: TStringField
      FieldName = 'GRADEUNITID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepositCommoditiesGRADEUNIT: TStringField
      FieldName = 'GRADEUNIT'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsDepositCommodities: TDataSource
    AutoEdit = False
    DataSet = cdsDepositCommodities
    Left = 334
    Top = 310
  end
  object DepositQuery: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.COUNTRYID,'
      '  DEPOSITS.DEPOSITNAME,  DEPOSITCLANS.DEPOSITCLAN,'
      '  DEPOSITS.DEPLONGITUDE,DEPOSITS.DEPLATITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  OTHERDATABASES.DATABASENAME'
      'from DEPOSITS,DEPOSITCLANS,OTHERDATABASES'
      'where DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'and DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID')
    SQLConnection = sqlcDep
    Left = 272
    Top = 34
  end
  object dspDepositQuery: TDataSetProvider
    DataSet = DepositQuery
    Left = 302
    Top = 34
  end
  object cdsDepositQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositQuery'
    Left = 330
    Top = 34
    object cdsDepositQuerySDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositQueryCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepositQueryDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
    object cdsDepositQueryDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object cdsDepositQueryDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDepositQueryDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDepositQueryAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
      DisplayFormat = '###0.00'
    end
    object cdsDepositQueryAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.00'
    end
    object cdsDepositQueryDATABASENAME: TStringField
      FieldName = 'DATABASENAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsDepositQuery: TDataSource
    DataSet = cdsDepositQuery
    Left = 358
    Top = 34
  end
  object qCountryContinents: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM COUNTRIES'
      'ORDER BY COUNTRIES.COUNTRY')
    SQLConnection = sqlcDep
    Left = 30
    Top = 318
    object qCountryContinentsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object qCountryContinentsCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object qCountryContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object dspCountryContinents: TDataSetProvider
    DataSet = qCountryContinents
    Left = 58
    Top = 318
  end
  object cdsCountryContinents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountryContinents'
    Left = 86
    Top = 318
    object cdsCountryContinentsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCountryContinentsCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsCountryContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
  end
  object dsCountryContinents: TDataSource
    AutoEdit = False
    DataSet = cdsCountryContinents
    Left = 114
    Top = 318
  end
  object DepositQueryRec: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select DISTINCT DEPOSITS.SDBDEPOSITID'
      'from DEPOSITS')
    SQLConnection = sqlcDep
    Left = 272
    Top = 82
  end
  object dspDepositQueryRec: TDataSetProvider
    DataSet = DepositQueryRec
    Options = [poReadOnly]
    Left = 300
    Top = 82
  end
  object cdsDepositQueryRec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositQueryRec'
    Left = 328
    Top = 82
    object cdsDepositQueryRecSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qUnitCountry: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'COUNTRYID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select * from STRATUNITS'
      'where STRATUNITS.COUNTRYID=:COUNTRYID'
      'or STRATUNITS.COUNTRYID='#39'UND'#39
      'or STRATUNITS.COUNTRYID='#39'nd'#39
      'order by STRATUNITS.UNITNAME, STRATUNITS.COUNTRYID')
    SQLConnection = sqlcDep
    Left = 28
    Top = 459
    object qUnitCountryUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitCountryUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object qUnitCountryCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
  end
  object dspUnitCountry: TDataSetProvider
    DataSet = qUnitCountry
    Left = 58
    Top = 460
  end
  object cdsUnitCountry: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitCountry'
    Left = 86
    Top = 460
    object cdsUnitCountryUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitCountryUNITNAME: TStringField
      DisplayLabel = 'Stratigraphic Unit'
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsUnitCountryCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
  end
  object dsUnitCountry: TDataSource
    DataSet = cdsUnitCountry
    Left = 114
    Top = 458
  end
  object qHostUnitAge: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'HostUnitID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT STRATUNITS.MINAGE, STRATUNITS.MAXAGE'
      'FROM STRATUNITS'
      'WHERE STRATUNITS.UNITID=:HostUnitID')
    SQLConnection = sqlcDep
    Left = 278
    Top = 358
    object qHostUnitAgeMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qHostUnitAgeMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsHostUnitAge: TDataSource
    AutoEdit = False
    DataSet = cdsHostUnitAge
    Left = 334
    Top = 358
  end
  object cdsHostUnitAge: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqHostUnitAge
    Params = <>
    Left = 306
    Top = 358
    object cdsHostUnitAgeMINAGE: TFloatField
      FieldName = 'MINAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
    object cdsHostUnitAgeMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###0.00'
    end
  end
  object qInsertLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO STRATDOMAIN'
      '(UnitID, DomainIDID)'
      'Values (:UnitID, :DomainID)')
    SQLConnection = sqlcDep
    Left = 452
    Top = 24
  end
  object qDeleteDomainLink: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SBDepositID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DomainID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from DOMAINDEPOSITS'
      'where DOMAINDEPOSITS.SBDEPOSITID = :SBDepositID'
      'and DOMAINDEPOSITS.DOMAINID = :DomainID'
      '')
    SQLConnection = sqlcDep
    Left = 452
    Top = 72
  end
  object qDefaultDomains: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'ContinentID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DOMAINS'
      'WHERE DOMAINS.DOMAINID < 0'
      'AND DOMAINS.CONTINENTID=:ContinentID'
      'ORDER by DOMAINS.DOMAINNAME')
    SQLConnection = sqlcDep
    Left = 26
    Top = 502
  end
  object dspDefaultDomains: TDataSetProvider
    DataSet = qDefaultDomains
    Left = 54
    Top = 502
  end
  object cdsDefaultDomains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDefaultDomains'
    Left = 82
    Top = 502
    object cdsDefaultDomainsDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDefaultDomainsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDefaultDomainsDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
  end
  object dsDefaultDomains: TDataSource
    AutoEdit = False
    DataSet = cdsDefaultDomains
    Left = 110
    Top = 502
  end
  object sqlcDep: TSQLConnection
    ConnectionName = 'STRATDB_LOCAL2006'
    DriverName = 'Firebird2'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBFire20.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird2'
      'Database=c:/data/firebird/stratdb.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'HostName=:localhost')
    VendorLib = 'fbclient.dll'
    Left = 56
    Top = 20
  end
  object qDepositFor: TSQLQuery
    DataSource = dsqDeposit
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITFOR.SDBDEPOSITID, '
      '  DEPOSITFOR.WHOFORID,'
      '  DEPOSITFOR.INC4CHTYN, FORLIST.WHOFOR'
      'FROM DEPOSITFOR,FORLIST'
      'WHERE DEPOSITFOR.SDBDEPOSITID=:SDBDepositID'
      'AND DEPOSITFOR.WHOFORID=FORLIST.WHOFORID'
      'ORDER BY DEPOSITFOR.WHOFORID')
    SQLConnection = sqlcDep
    Left = 278
    Top = 402
    object qDepositForSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qDepositForINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepositForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object cdsDepositFor: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositqDepositFor
    Params = <>
    Left = 306
    Top = 402
    object cdsDepositForSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDepositForINC4CHTYN: TStringField
      FieldName = 'INC4CHTYN'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepositForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsDepositFor: TDataSource
    AutoEdit = False
    DataSet = cdsDepositFor
    Left = 334
    Top = 402
  end
  object qGradeUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM GRADEUNITS'
      'ORDER BY GRADEUNITS.GRADEUNIT')
    SQLConnection = sqlcDep
    Left = 30
    Top = 550
  end
  object dspGradeUnits: TDataSetProvider
    DataSet = qGradeUnits
    Left = 58
    Top = 550
  end
  object cdsGradeUnits: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGradeUnits'
    Left = 86
    Top = 550
    object cdsGradeUnitsGRADEID: TStringField
      FieldName = 'GRADEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsGradeUnitsGRADEUNIT: TStringField
      FieldName = 'GRADEUNIT'
      Required = True
      Size = 60
    end
  end
  object dsGradeUnits: TDataSource
    AutoEdit = False
    DataSet = cdsGradeUnits
    Left = 114
    Top = 550
  end
end
