object dmStrat: TdmStrat
  OldCreateOrder = False
  Height = 682
  Width = 1001
  object qDeposits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT DISTINCT DEPOSITS.SDBDEPOSITID,DEPOSITS.DEPOSITNAME,'
      
        '  DEPOSITS.DEPOSITNAME  || '#39'  '#39' || DEPOSITS.SDBDEPOSITID AS DEPO' +
        'SITNAMEDEPOSITID,'
      '  DEPOSITS.DEPOSITCLANID, DEPOSITS.COUNTRYID'
      'FROM DEPOSITS'
      'ORDER by DEPOSITS.DEPOSITNAME,DEPOSITS.SDBDEPOSITID')
    SQLConnection = sqlcStrat
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
    object cdsDepositsDEPOSITNAMEDEPOSITID: TStringField
      FieldName = 'DEPOSITNAMEDEPOSITID'
      ReadOnly = True
      Required = True
      Size = 189
    end
  end
  object dsDeposits: TDataSource
    AutoEdit = False
    DataSet = cdsDeposits
    Left = 114
    Top = 58
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
      '  DEPOSITS.DEPOSITIDINT,DEPOSITS.DEPOSITIDSTR,'
      '  DEPOSITS.GEODYNAMICID, DEPOSITS.DEPOSITPARENTID,'
      '  DEPOSITS.DATINGTYPEID'
      'FROM DEPOSITS,COUNTRIES'
      'WHERE DEPOSITS.SDBDEPOSITID=:SDBDEPOSITID'
      'AND DEPOSITS.COUNTRYID=COUNTRIES.COUNTRYID'
      '')
    SQLConnection = sqlcStrat
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
      Size = 50
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
    object qDepositIAPPROXAGE: TFloatField
      FieldName = 'IAPPROXAGE'
    end
    object qDepositGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      Required = True
    end
    object qDepositDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object qDepositDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      Required = True
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
      DisplayFormat = '###0.000'
    end
    object cdsDepositAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.000'
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
    object cdsDepositCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
    object cdsDepositIAPPROXAGE: TFloatField
      FieldName = 'IAPPROXAGE'
    end
    object cdsDepositGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      Required = True
    end
    object cdsDepositDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDepositDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      Required = True
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
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
    Left = 576
    Top = 56
  end
  object qClans: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITCLANS'
      'ORDER by DEPOSITCLANS.DEPOSITCLAN')
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
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
  object qOtherDatabases: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM OTHERDATABASES'
      'ORDER by OTHERDATABASES.DATABASENAME')
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
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
  object DepositQuery: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.COUNTRYID,'
      '  DEPOSITS.DEPOSITNAME,  DEPOSITCLANS.DEPOSITCLAN,'
      '  DEPOSITS.DEPLONGITUDE,DEPOSITS.DEPLATITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  OTHERDATABASES.DATABASENAME,DEPOSITS.DEPOSITPARENTID,'
      '  DATINGTYPES.DATINGTYPE,GEODYNAMICSETTINGS.GEODYNAMICSETTING,'
      '  DEPISOTOPECOUNT.COUNTPB,DEPISOTOPECOUNT.COUNTSR,'
      '  DEPISOTOPECOUNT.COUNTND,DEPISOTOPECOUNT.COUNTOS,'
      '  DEPISOTOPECOUNT.COUNTS,DEPISOTOPECOUNT.COUNTSO4,'
      '  DEPISOTOPECOUNT.COUNTO'
      
        'FROM DEPOSITS, DEPOSITCLANS, DEPISOTOPECOUNT, OTHERDATABASES,DAT' +
        'INGTYPES,GEODYNAMICSETTINGS,DEPOSITFOR,USERSWHOFOR'
      'WHERE USERSWHOFOR.USERID = :UserID'
      'AND DEPOSITFOR.WHOFORID=USERSWHOFOR.WHOFORID'
      'AND DEPOSITFOR.SDBDEPOSITID=DEPOSITS.SDBDEPOSITID'
      'AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'AND DEPOSITS.SDBDEPOSITID=DEPISOTOPECOUNT.SDBDEPOSITID'
      'AND DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID'
      'AND DEPOSITS.DATINGTYPEID=DATINGTYPES.DATINGTYPEID'
      'AND DEPOSITS.GEODYNAMICID=GEODYNAMICSETTINGS.GEODYNAMICID')
    SQLConnection = sqlcStrat
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
      Required = True
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
      DisplayFormat = '###0.000'
    end
    object cdsDepositQueryAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
      DisplayFormat = '###0.000'
    end
    object cdsDepositQueryDATABASENAME: TStringField
      FieldName = 'DATABASENAME'
      Required = True
      Size = 50
    end
    object cdsDepositQueryCOUNTPB: TIntegerField
      FieldName = 'COUNTPB'
    end
    object cdsDepositQueryCOUNTSR: TIntegerField
      FieldName = 'COUNTSR'
    end
    object cdsDepositQueryCOUNTND: TIntegerField
      FieldName = 'COUNTND'
    end
    object cdsDepositQueryCOUNTOS: TIntegerField
      FieldName = 'COUNTOS'
    end
    object cdsDepositQueryCOUNTS: TIntegerField
      FieldName = 'COUNTS'
    end
    object cdsDepositQueryCOUNTSO4: TIntegerField
      FieldName = 'COUNTSO4'
    end
    object cdsDepositQueryCOUNTO: TIntegerField
      FieldName = 'COUNTO'
    end
    object cdsDepositQueryDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDepositQueryDATINGTYPE: TStringField
      FieldName = 'DATINGTYPE'
      Size = 50
    end
    object cdsDepositQueryGEODYNAMICSETTING: TStringField
      FieldName = 'GEODYNAMICSETTING'
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
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
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
    SQLConnection = sqlcStrat
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
  object sqlcStrat: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=c:\exe32\fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\stratdb2021v30.fdb'
      'User_Name=SYSDBA'
      'Password=V0lcano3^'
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
      'DriverUnit=DbxDevartInterBase'
      'OptimizedNumerics=false'
      'CharLength=1')
    Left = 56
    Top = 16
  end
  object qGradeUnits: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM GRADEUNITS'
      'ORDER BY GRADEUNITS.GRADEUNIT')
    SQLConnection = sqlcStrat
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
  object qCountries: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT  COUNTRIES.CONTINENTID, COUNTRIES.COUNTRYID,'
      '  COUNTRIES.COUNTRY,'
      '  CONTINENTS.CONTINENT, COUNTRIES.COUNTRYHASRECORDS,'
      '  COUNTRIES.STARTINGVALUE,COUNTRIES.DEFAULTMAPID'
      'FROM COUNTRIES, CONTINENTS'
      'WHERE COUNTRIES.CONTINENTID=CONTINENTS.CONTINENTID'
      'AND COUNTRIES.COUNTRYHASRECORDS = '#39'Y'#39
      'ORDER BY COUNTRIES.COUNTRY')
    SQLConnection = sqlcStrat
    Left = 24
    Top = 596
  end
  object dspCountries: TDataSetProvider
    DataSet = qCountries
    Left = 52
    Top = 596
  end
  object cdsCountries: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountries'
    Left = 80
    Top = 596
    object cdsCountriesCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCountriesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsCountriesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsCountriesCONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
    object cdsCountriesCOUNTRYHASRECORDS: TStringField
      FieldName = 'COUNTRYHASRECORDS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCountriesSTARTINGVALUE: TIntegerField
      FieldName = 'STARTINGVALUE'
    end
    object cdsCountriesDEFAULTMAPID: TStringField
      FieldName = 'DEFAULTMAPID'
      Required = True
    end
  end
  object dsCountries: TDataSource
    DataSet = cdsCountries
    Left = 108
    Top = 596
  end
  object qDepositTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITTYPES'
      '')
    SQLConnection = sqlcStrat
    Left = 204
    Top = 500
  end
  object dspDepsoitTypes: TDataSetProvider
    DataSet = qDepositTypes
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 234
    Top = 500
  end
  object cdsDepositTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepsoitTypes'
    Left = 262
    Top = 500
    object cdsDepositTypesDEPOSITTYPEID: TStringField
      FieldName = 'DEPOSITTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsDepositTypesDEPOSITTYPE: TStringField
      FieldName = 'DEPOSITTYPE'
      Required = True
      Size = 90
    end
  end
  object dsDepositTypes: TDataSource
    DataSet = cdsDepositTypes
    Left = 290
    Top = 500
  end
  object qDepProspect: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DEPOSITS'
      'WHERE DEPOSITS.DEPOSITID = :DepositID')
    SQLConnection = sqlcStrat
    Left = 248
    Top = 144
  end
  object dsQDepProspect: TDataSource
    DataSet = qDepProspect
    Left = 276
    Top = 144
  end
  object dspDepProspect: TDataSetProvider
    DataSet = qDepProspect
    Left = 304
    Top = 144
  end
  object cdsDepProspect: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    ProviderName = 'dspDepProspect'
    Left = 332
    Top = 144
    object cdsDepProspectDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepProspectDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 150
    end
  end
  object dsDepProspect: TDataSource
    DataSet = cdsDepProspect
    Left = 360
    Top = 144
  end
  object qDatingTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DATINGTYPES'
      'ORDER BY DATINGTYPES.DATINGTYPE')
    SQLConnection = sqlcStrat
    Left = 758
    Top = 22
  end
  object dspDatingTypes: TDataSetProvider
    DataSet = qDatingTypes
    Left = 786
    Top = 22
  end
  object cdsDatingTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDatingTypes'
    Left = 814
    Top = 22
    object cdsDatingTypesDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDatingTypesDATINGTYPE: TStringField
      FieldName = 'DATINGTYPE'
      Size = 50
    end
  end
  object dsDatingTypes: TDataSource
    AutoEdit = False
    DataSet = cdsDatingTypes
    Left = 842
    Top = 22
  end
  object qGeodynamicSettings: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM GEODYNAMICSETTINGS'
      'ORDER BY GEODYNAMICSETTINGS.GEODYNAMICSETTING')
    SQLConnection = sqlcStrat
    Left = 758
    Top = 70
  end
  object dspGeodynamicSettings: TDataSetProvider
    DataSet = qGeodynamicSettings
    Left = 786
    Top = 70
  end
  object cdsGeodynamicSettings: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGeodynamicSettings'
    Left = 814
    Top = 70
    object cdsGeodynamicSettingsGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGeodynamicSettingsGEODYNAMICSETTING: TStringField
      FieldName = 'GEODYNAMICSETTING'
      Size = 50
    end
  end
  object dsGeodynamicSettings: TDataSource
    AutoEdit = False
    DataSet = cdsGeodynamicSettings
    Left = 842
    Top = 70
  end
  object qDRep1: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.COUNTRYID,'
      '  DEPOSITS.DEPOSITNAME,  DEPOSITCLANS.DEPOSITCLAN,'
      '  DEPOSITS.DEPLONGITUDE,DEPOSITS.DEPLATITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DATINGTYPES.DATINGTYPE, GEODYNAMICSETTINGS.GEODYNAMICSETTING,'
      '  OTHERDATABASES.DATABASENAME,DEPOSITS.DEPOSITPARENTID,'
      '  DEPOSITSTATI.DEPOSITSTATUS'
      'FROM DEPOSITS,DEPOSITCLANS,OTHERDATABASES,DATINGTYPES,'
      '  GEODYNAMICSETTINGS,DEPOSITFOR,USERSWHOFOR,DEPOSITSTATI'
      'WHERE USERSWHOFOR.USERID = :UserID '
      'AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'AND DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID'
      'AND DEPOSITS.DATINGTYPEID = DATINGTYPES.DATINGTYPEID'
      'AND DEPOSITS.GEODYNAMICID = GEODYNAMICSETTINGS.GEODYNAMICID '
      'AND DEPOSITS.SDBDEPOSITID = DEPOSITFOR.SDBDEPOSITID'
      'AND DEPOSITFOR.WHOFORID = USERSWHOFOR.WHOFORID'
      'AND DEPOSITS.DEPOSITSTATUSID=DEPOSITSTATI.DEPOSITSTATUSID')
    SQLConnection = sqlcStrat
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
      Size = 50
    end
    object cdsDRep1DEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 75
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
    object cdsDRep1qDRep2: TDataSetField
      FieldName = 'qDRep2'
    end
    object cdsDRep1DATINGTYPE: TStringField
      FieldName = 'DATINGTYPE'
      Size = 50
    end
    object cdsDRep1GEODYNAMICSETTING: TStringField
      FieldName = 'GEODYNAMICSETTING'
      Size = 50
    end
    object cdsDRep1DEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDRep1DEPOSITSTATUS: TStringField
      FieldName = 'DEPOSITSTATUS'
      Size = 30
    end
  end
  object dsDRep1: TDataSource
    AutoEdit = False
    DataSet = cdsDRep1
    Left = 514
    Top = 278
  end
  object qDRep2: TSQLQuery
    DataSource = dsqDRep1
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SDBDEPOSITID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.COUNTRYID,'
      '  DEPOSITS.DEPOSITNAME,  DEPOSITCLANS.DEPOSITCLAN,'
      '  DEPOSITS.DEPLONGITUDE,DEPOSITS.DEPLATITUDE,'
      '  DEPOSITS.APPROXAGE,DEPOSITS.APPROXAGEUNCERTAINTY,'
      '  DATINGTYPES.DATINGTYPE, GEODYNAMICSETTINGS.GEODYNAMICSETTING,'
      '  OTHERDATABASES.DATABASENAME,DEPOSITS.DEPOSITPARENTID,'
      '  DEPOSITSTATI.DEPOSITSTATUS'
      'FROM DEPOSITS,DEPOSITCLANS,OTHERDATABASES,DATINGTYPES, '
      '  GEODYNAMICSETTINGS,DEPOSITFOR,USERSWHOFOR,DEPOSITSTATI'
      'WHERE DEPOSITS.DEPOSITPARENTID = :SDBDEPOSITID'
      'AND USERSWHOFOR.USERID = :UserID'
      'AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID'
      'AND DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID'
      'AND DEPOSITS.DATINGTYPEID = DATINGTYPES.DATINGTYPEID'
      'AND DEPOSITS.GEODYNAMICID = GEODYNAMICSETTINGS.GEODYNAMICID '
      'AND DEPOSITS.SDBDEPOSITID = DEPOSITFOR.SDBDEPOSITID'
      'AND DEPOSITFOR.WHOFORID = USERSWHOFOR.WHOFORID'
      'AND DEPOSITS.DEPOSITCLANID < 90000'
      'AND DEPOSITS.DEPOSITSTATUSID=DEPOSITSTATI.DEPOSITSTATUSID')
    SQLConnection = sqlcStrat
    Left = 424
    Top = 329
  end
  object dsqDRep2: TDataSource
    DataSet = qDRep2
    Left = 452
    Top = 329
  end
  object cdsDRep2: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDRep1qDRep2
    Params = <>
    Left = 480
    Top = 329
    object cdsDRep2SDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      Required = True
    end
    object cdsDRep2COUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDRep2DEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsDRep2DEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 75
    end
    object cdsDRep2DEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object cdsDRep2DEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object cdsDRep2APPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object cdsDRep2APPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object cdsDRep2DATABASENAME: TStringField
      FieldName = 'DATABASENAME'
      Required = True
      Size = 50
    end
    object cdsDRep2DATINGTYPE: TStringField
      FieldName = 'DATINGTYPE'
      Size = 50
    end
    object cdsDRep2GEODYNAMICSETTING: TStringField
      FieldName = 'GEODYNAMICSETTING'
      Size = 50
    end
    object cdsDRep2DEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDRep2DEPOSITSTATUS: TStringField
      FieldName = 'DEPOSITSTATUS'
      Size = 30
    end
  end
  object dsDRep2: TDataSource
    DataSet = cdsDRep2
    Left = 508
    Top = 329
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcStrat
    Left = 136
    Top = 16
  end
end
