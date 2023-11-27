object dmDep: TdmDep
  Height = 891
  Width = 890
  object Query1: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITNAME,  STRATUNITS.PARENTID,'
      '  STRATUNITS.RANKID,  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS,'
      '  RANKS.UNITRANK, COUNTRIES.COUNTRY,'
      '  STRATUNITS.APPROVALID, '
      '  APPROVALSTATUS.APPROVALID, APPROVALSTATUS.APPROVALSTATUS,'
      '  APPLICLINK.UNITID, APPLICLINK.APPLICATIONID,'
      '  UNITROCKCLASS.UNITID, UNITROCKCLASS.ROCKCLASSID,'
      '  UNITSETTING.UNITID,UNITSETTING.SETTINGID,'
      '  ROCKCLASSES.ROCKCLASSID, ROCKCLASSES.ROCKCLASS,'
      '  SETTINGS.SETTINGID, SETTINGS.SETTING,'
      '  DIRECTIONS.SOURCEFROMNAME,'
      '  DEPOSITIONNVIRONMENT.DEPOSITIONENVIRONMENT'
      'from STRATUNITS, COUNTRIES, RANKS, APPROVALSTATUS, APPLICLINK,'
      '  UNITROCKCLASS,UNITSETTING,ROCKCLASSES,SETTINGS,'
      '  STRATSEDENVIRONMENT,STRATCURRENT,DIRECTIONS,'
      '  DEPOSITIONNVIRONMENT,UNITFOR,USERSWHOFOR'
      'where STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'and STRATUNITS.UNITID=UNITFOR.UNITID'
      'and STRATUNITS.RANKID=RANKS.RANKID'
      'and STRATUNITS.APPROVALID = APPROVALSTATUS.APPROVALID'
      'AND STRATUNITS.UNITID=APPLICLINK.UNITID'
      'AND STRATUNITS.UNITID=UNITROCKCLASS.UNITID'
      'AND STRATUNITS.UNITID=UNITSETTING.UNITID'
      'AND ROCKCLASSES.ROCKCLASSID=UNITROCKCLASS.ROCKCLASSID'
      'AND SETTINGS.SETTINGID=UNITSETTING.SETTINGID'
      'AND STRATUNITS.UNITID=STRATSEDENVIRONMENT.UNITID'
      'AND STRATUNITS.UNITID=STRATCURRENT.UNITID'
      
        'AND STRATSEDENVIRONMENT.DEPOSITIONENVIRONMENTID=DEPOSITIONNVIRON' +
        'MENT.DEPOSITIONENVIRONMENTID'
      'AND STRATCURRENT.CURRENTDIRECTION=DIRECTIONS.DIRECTIONANGLE')
    Left = 200
    Top = 5
  end
  object dspQuery1: TDataSetProvider
    DataSet = Query1
    Left = 230
    Top = 5
  end
  object cdsQuery1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1'
    Left = 258
    Top = 5
    object cdsQuery1UNITID: TIntegerField
      FieldName = 'UNITID'
      Required = True
    end
    object cdsQuery1COUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsQuery1UNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsQuery1RANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsQuery1PARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsQuery1MINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsQuery1MAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsQuery1AGEUNITS: TStringField
      DisplayLabel = 'Age Units'
      FieldName = 'AGEUNITS'
      Required = True
      Size = 6
    end
    object cdsQuery1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
    end
    object cdsQuery1UNITRANK: TStringField
      FieldName = 'UNITRANK'
      Required = True
    end
    object cdsQuery1APPROVALSTATUS: TStringField
      DisplayLabel = 'Approval Status'
      FieldName = 'APPROVALSTATUS'
      Required = True
      Size = 50
    end
    object cdsQuery1AGEYEARS: TFMTBCDField
      FieldName = 'AGEYEARS'
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object dsQuery1: TDataSource
    DataSet = cdsQuery1
    Left = 286
    Top = 5
  end
  object qContinents: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CONTINENT'
      '')
    Left = 22
    Top = 57
  end
  object dspContinents: TDataSetProvider
    DataSet = qContinents
    Left = 50
    Top = 57
  end
  object cdsContinents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContinents'
    Left = 78
    Top = 57
    object cdsContinentsCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsContinentsCONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
  end
  object qCountries: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT  COUNTRY.CONTINENTID, COUNTRY.COUNTRYABR,'
      '  COUNTRY.COUNTRY,'
      '  CONTINENT.CONTINENT, COUNTRY.COUNTRYHASRECORDS'
      'FROM COUNTRY, CONTINENT'
      'WHERE COUNTRY.CONTINENTID=CONTINENT.CONTINENTID'
      'AND COUNTRY.COUNTRYHASRECORDS = '#39'Y'#39
      'ORDER BY COUNTRY.COUNTRY')
    Left = 20
    Top = 103
  end
  object dspCountries: TDataSetProvider
    DataSet = qCountries
    Left = 48
    Top = 103
  end
  object cdsCountries: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountries'
    Left = 76
    Top = 103
    object cdsCountriesCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCountriesCOUNTRYABR: TStringField
      FieldName = 'COUNTRYABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsCountriesCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Required = True
      Size = 30
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
  end
  object dsContinents: TDataSource
    AutoEdit = False
    DataSet = cdsContinents
    Left = 106
    Top = 57
  end
  object dsCountries: TDataSource
    DataSet = cdsCountries
    Left = 104
    Top = 103
  end
  object qYesNo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM YESNO')
    Left = 10
    Top = 155
  end
  object dspYesNo: TDataSetProvider
    DataSet = qYesNo
    Left = 38
    Top = 155
  end
  object cdsYesNo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspYesNo'
    Left = 66
    Top = 155
    object cdsYesNoYESNOID: TStringField
      FieldName = 'YESNOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsYesNoYESNO: TStringField
      FieldName = 'YESNO'
      Required = True
      Size = 11
    end
  end
  object dsYesNo: TDataSource
    DataSet = cdsYesNo
    Left = 94
    Top = 155
  end
  object qUnitQ: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'UnitID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT STRATUNITS.UNITID, STRATUNITS.UNITNAME,'
      '  STRATUNITS.PARENTID, STRATUNITS.RANKID,'
      '  STRATUNITS.MINAGE, STRATUNITS.MAXAGE,'
      '  STRATUNITS.AGEUNITS,'
      '  STRATUNITS.AGEYEARS, STRATUNITS.DESCRIPTION,'
      '  STRATUNITS.COUNTRYID, STRATUNITS.CONSTRAINTLEVELID,'
      '  STRATUNITS.APPROVALID,'
      '  COUNTRIES.COUNTRY'
      'FROM STRATUNITS, RANKS,COUNTRIES,UNITFOR,USERSWHOFOR '
      'WHERE STRATUNITS.UNITID = :UnitID'
      'AND STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'and STRATUNITS.UNITID=UNITFOR.UNITID'
      '')
    SQLConnection = sqlcDateView
    Left = 380
    Top = 71
    object qUnitQUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qUnitQUNITNAME: TStringField
      FieldName = 'UNITNAME'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object qUnitQPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object qUnitQRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object qUnitQAGEYEARS: TFMTBCDField
      FieldName = 'AGEYEARS'
      Required = True
      Precision = 15
      Size = 0
    end
    object qUnitQMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
    end
    object qUnitQMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
    end
    object qUnitQAGEUNITS: TStringField
      FieldName = 'AGEUNITS'
      Required = True
      Size = 6
    end
    object qUnitQAPPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      Size = 2
    end
    object qUnitQCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object qUnitQDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
    end
    object qUnitQCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ReadOnly = True
      Required = True
      Size = 3
    end
    object qUnitQCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object cdsUnitQ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnitQ'
    OnReconcileError = cdsAnyReconcileError
    Left = 464
    Top = 71
    object cdsUnitQUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUnitQUNITNAME: TStringField
      FieldName = 'UNITNAME'
      Required = True
      Size = 50
    end
    object cdsUnitQPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Required = True
    end
    object cdsUnitQAPPROVALID: TStringField
      FieldName = 'APPROVALID'
      Required = True
      Size = 2
    end
    object cdsUnitQAGEYEARS: TFMTBCDField
      FieldName = 'AGEYEARS'
      Required = True
      Precision = 15
      Size = 0
    end
    object cdsUnitQMINAGE: TFloatField
      FieldName = 'MINAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsUnitQMAXAGE: TFloatField
      FieldName = 'MAXAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsUnitQAGEUNITS: TStringField
      DisplayLabel = 'Age Units'
      FieldName = 'AGEUNITS'
      Required = True
      Size = 6
    end
    object cdsUnitQCONSTRAINTLEVELID: TSmallintField
      FieldName = 'CONSTRAINTLEVELID'
      Required = True
    end
    object cdsUnitQCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      ReadOnly = True
      Required = True
      Size = 3
    end
    object cdsUnitQRANKID: TStringField
      FieldName = 'RANKID'
      Required = True
      Size = 5
    end
    object cdsUnitQCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsUnitQDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      BlobType = ftMemo
    end
    object cdsUnitQqSubUnits: TDataSetField
      FieldName = 'qSubUnits'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqParent: TDataSetField
      FieldName = 'qParent'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUnitQqValid: TDataSetField
      FieldName = 'qValid'
    end
    object cdsUnitQqPreceeding: TDataSetField
      FieldName = 'qPreceeding'
    end
    object cdsUnitQqRefs: TDataSetField
      FieldName = 'qRefs'
    end
    object cdsUnitQqSucceeding: TDataSetField
      FieldName = 'qSucceeding'
    end
    object cdsUnitQqCorrelatives: TDataSetField
      FieldName = 'qCorrelatives'
    end
    object cdsUnitQqSynonyms: TDataSetField
      FieldName = 'qSynonyms'
    end
    object cdsUnitQqStratMaps: TDataSetField
      FieldName = 'qStratMaps'
    end
    object cdsUnitQqRecords: TDataSetField
      FieldName = 'qRecords'
      ReadOnly = True
    end
    object cdsUnitQqLinkedApplications: TDataSetField
      FieldName = 'qLinkedApplications'
    end
    object cdsUnitQqUnitSetting: TDataSetField
      FieldName = 'qUnitSetting'
    end
    object cdsUnitQqUnitRockClass: TDataSetField
      FieldName = 'qUnitRockClass'
    end
    object cdsUnitQqStratDomain: TDataSetField
      FieldName = 'qStratDomain'
    end
    object cdsUnitQqUnitPeriods: TDataSetField
      FieldName = 'qUnitPeriods'
      Required = True
    end
    object cdsUnitQqUnitFeature: TDataSetField
      FieldName = 'qUnitFeature'
    end
    object cdsUnitQqUnitSedEnv: TDataSetField
      FieldName = 'qUnitSedEnv'
    end
    object cdsUnitQqUnitCurrent: TDataSetField
      FieldName = 'qUnitCurrent'
    end
    object cdsUnitQqUnitFor: TDataSetField
      FieldName = 'qUnitFor'
    end
  end
  object dspUnitQ: TDataSetProvider
    DataSet = qUnitQ
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 436
    Top = 71
  end
  object dsqUnitQ: TDataSource
    DataSet = qUnitQ
    Left = 408
    Top = 71
  end
  object dsUnitQ: TDataSource
    DataSet = cdsUnitQ
    Left = 492
    Top = 71
  end
  object Query1Rec: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DISTINCT STRATUNITS.UNITID, STRATUNITS.COUNTRYID,'
      '  STRATUNITS.UNITNAME,  STRATUNITS.PARENTID,'
      '  STRATUNITS.UNITRANK,  STRATUNITS.AGEYEARS,'
      '  STRATUNITS.MINAGE,  STRATUNITS.MAXAGE,'
      '  RANKS.UNITRANK, COUNTRIES.COUNTRY'
      'FROM STRATUNITS, COUNTRIES, RANKS,UNITFOR,USERSWHOFOR'
      'WHERE STRATUNITS.COUNTRYID=COUNTRIES.COUNTRYID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = UNITFOR.WHOFORID'
      'AND STRATUNITS.RANKID=RANKS.RANKID')
    Left = 16
    Top = 197
  end
  object dspQuery1Rec: TDataSetProvider
    DataSet = Query1Rec
    Options = [poReadOnly]
    Left = 44
    Top = 197
  end
  object cdsQuery1Rec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1Rec'
    Left = 72
    Top = 197
    object cdsQuery1RecUNITID: TIntegerField
      FieldName = 'UNITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object DomainQuery: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT DOMAINS.DOMAINID, DOMAINS.CONTINENTID,'
      '  DOMAINS.DOMAINNAME,  DOMAINS.DOMAINPARENTID,'
      '  DOMAINS.DOMAINTYPEID,  DOMAINS.SPOTLATITUDE,'
      '  DOMAINS.SPOTLONGITUDE,'
      '  DOMAINS.MINPLOTAGE, DOMAINS.MAXPLOTAGE,'
      '  DOMAINTYPES.DOMAINTYPE, CONTINENTS.CONTINENT'
      'from DOMAINS, DOMAINTYPES, CONTINENTS,DOMAINFOR,USERSWHOFOR'
      'where DOMAINS.CONTINENTID=CONTINENTS.CONTINENTID'
      'AND USERSWHOFOR.USERID = :UserID '
      'AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID'
      'and DOMAINS.DOMAINID=DOMAINFOR.DOMAINID'
      'and DOMAINS.DOMAINTYPEID=DOMAINTYPES.DOMAINTYPEID')
    SQLConnection = sqlcDateView
    Left = 388
    Top = 17
  end
  object dspDomainQuery: TDataSetProvider
    DataSet = DomainQuery
    Left = 418
    Top = 17
  end
  object cdsDomainQuery: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDomainQuery'
    Left = 446
    Top = 17
    object cdsDomainQueryDOMAINID: TIntegerField
      FieldName = 'DOMAINID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDomainQueryCONTINENTID: TStringField
      FieldName = 'CONTINENTID'
      Required = True
      Size = 3
    end
    object cdsDomainQueryDOMAINNAME: TStringField
      FieldName = 'DOMAINNAME'
      Required = True
      Size = 150
    end
    object cdsDomainQueryDOMAINPARENTID: TIntegerField
      FieldName = 'DOMAINPARENTID'
      Required = True
    end
    object cdsDomainQueryDOMAINTYPEID: TStringField
      FieldName = 'DOMAINTYPEID'
      Required = True
      Size = 5
    end
    object cdsDomainQuerySPOTLATITUDE: TFloatField
      FieldName = 'SPOTLATITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainQuerySPOTLONGITUDE: TFloatField
      FieldName = 'SPOTLONGITUDE'
      Required = True
      DisplayFormat = '###0.00000'
    end
    object cdsDomainQueryDOMAINTYPE: TStringField
      FieldName = 'DOMAINTYPE'
      Required = True
      Size = 30
    end
    object cdsDomainQueryCONTINENT: TStringField
      FieldName = 'CONTINENT'
      Required = True
    end
    object cdsDomainQueryMINPLOTAGE: TFloatField
      FieldName = 'MINPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
    object cdsDomainQueryMAXPLOTAGE: TFloatField
      FieldName = 'MAXPLOTAGE'
      Required = True
      DisplayFormat = '###0.00'
    end
  end
  object dsDomainQuery: TDataSource
    DataSet = cdsDomainQuery
    Left = 474
    Top = 17
  end
  object qCommodities: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM COMMODITIES'
      '')
    SQLConnection = sqlcDateView
    Left = 8
    Top = 311
  end
  object dspCommodities: TDataSetProvider
    DataSet = qCommodities
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 38
    Top = 311
  end
  object cdsCommodities: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCommodities'
    Left = 66
    Top = 311
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
    DataSet = cdsCommodities
    Left = 94
    Top = 311
  end
  object qDepositTypes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DEPOSITTYPES'
      '')
    Left = 12
    Top = 251
  end
  object dspDepsoitTypes: TDataSetProvider
    DataSet = qDepositTypes
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowMultiRecordUpdates, poAutoRefresh, poPropogateChanges]
    Left = 42
    Top = 251
  end
  object cdsDepositTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepsoitTypes'
    Left = 70
    Top = 251
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
    Left = 98
    Top = 251
  end
  object qUsers: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM USERS'
      'WHERE USERS.USERID=:UserID')
    SQLConnection = sqlcDateView
    Left = 2
    Top = 363
    object qUsersUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object qUsersLASTUSED: TSQLTimeStampField
      FieldName = 'LASTUSED'
      DisplayFormat = 'yyyy/mm/dd'
    end
  end
  object dspUsers: TDataSetProvider
    DataSet = qUsers
    Left = 30
    Top = 363
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsers'
    Left = 58
    Top = 363
    object cdsUsersUSERID: TStringField
      FieldName = 'USERID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsersLASTUSED: TSQLTimeStampField
      FieldName = 'LASTUSED'
      DisplayFormat = 'yyyy/mm/dd'
    end
  end
  object dsUsers: TDataSource
    DataSet = cdsUsers
    Left = 86
    Top = 363
  end
  object qUsersWhoFor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select DISTINCT USERSWHOFOR.USERID, USERSWHOFOR.WHOFORID, '
      '  FORLIST.WHOFOR,FORLIST.OWNER'
      'from USERSWHOFOR, FORLIST'
      'where USERSWHOFOR.WHOFORID = FORLIST.WHOFORID'
      'and USERSWHOFOR.USERID=:UserID'
      'order by FORLIST.WHOFOR')
    SQLConnection = sqlcDateView
    Left = 8
    Top = 413
    object qUsersWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object qUsersWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      Size = 50
    end
    object qUsersWhoForOWNER: TStringField
      FieldName = 'OWNER'
      ProviderFlags = []
    end
    object qUsersWhoForUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
  end
  object dspUsersWhoFor: TDataSetProvider
    DataSet = qUsersWhoFor
    Options = [poAutoRefresh, poPropogateChanges]
    Left = 36
    Top = 413
  end
  object cdsUsersWhoFor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsersWhoFor'
    Left = 64
    Top = 413
    object cdsUsersWhoForWHOFORID: TStringField
      FieldName = 'WHOFORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsUsersWhoForWHOFOR: TStringField
      FieldName = 'WHOFOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsUsersWhoForOWNER: TStringField
      FieldName = 'OWNER'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsUsersWhoForUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
  end
  object dsUsersWhoFor: TDataSource
    DataSet = cdsUsersWhoFor
    Left = 92
    Top = 413
  end
  object dspDepCovrProspect: TDataSetProvider
    DataSet = qDepCovrProspect
    Left = 232
    Top = 535
  end
  object cdsDepCovrProspect: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepCovrProspect'
    Left = 260
    Top = 535
    object cdsDepCovrProspectDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepCovrProspectAVERLEAST: TStringField
      FieldName = 'AVERLEAST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepCovrProspectCOEFFVAR64: TFloatField
      FieldName = 'COEFFVAR64'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVAR74: TFloatField
      FieldName = 'COEFFVAR74'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVAR84: TFloatField
      FieldName = 'COEFFVAR84'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVARMU: TFloatField
      FieldName = 'COEFFVARMU'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVAR76: TFloatField
      FieldName = 'COEFFVAR76'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVAR86: TFloatField
      FieldName = 'COEFFVAR86'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVAR64MODEL: TFloatField
      FieldName = 'COEFFVAR64MODEL'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVAR74MODEL: TFloatField
      FieldName = 'COEFFVAR74MODEL'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVARTHUMODEL: TFloatField
      FieldName = 'COEFFVARTHUMODEL'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVARMUSMP: TFloatField
      FieldName = 'COEFFVARMUSMP'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCORREL76: TFloatField
      FieldName = 'CORREL76'
      DisplayFormat = '0.000'
    end
    object cdsDepCovrProspectCORREL86: TFloatField
      FieldName = 'CORREL86'
      DisplayFormat = '0.000'
    end
    object cdsDepCovrProspectMEAN64: TFloatField
      FieldName = 'MEAN64'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEAN74: TFloatField
      FieldName = 'MEAN74'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEAN84: TFloatField
      FieldName = 'MEAN84'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEANMU: TFloatField
      FieldName = 'MEANMU'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEAN76: TFloatField
      FieldName = 'MEAN76'
      DisplayFormat = '##0.00000'
    end
    object cdsDepCovrProspectMEAN86: TFloatField
      FieldName = 'MEAN86'
      DisplayFormat = '##0.00000'
    end
    object cdsDepCovrProspectMEAN64MODEL: TFloatField
      FieldName = 'MEAN64MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEAN74MODEL: TFloatField
      FieldName = 'MEAN74MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEANTHUMODEL: TFloatField
      FieldName = 'MEANTHUMODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEANMUSAMPLES: TFloatField
      FieldName = 'MEANMUSAMPLES'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectNUMSAMPLES64: TFloatField
      FieldName = 'NUMSAMPLES64'
    end
    object cdsDepCovrProspectNUMSAMPLES74: TFloatField
      FieldName = 'NUMSAMPLES74'
    end
    object cdsDepCovrProspectNUMSAMPLES84: TFloatField
      FieldName = 'NUMSAMPLES84'
    end
    object cdsDepCovrProspectNUMSAMPLESMU: TFloatField
      FieldName = 'NUMSAMPLESMU'
    end
    object cdsDepCovrProspectNUMSAMPLES76: TFloatField
      FieldName = 'NUMSAMPLES76'
    end
    object cdsDepCovrProspectNUMSAMPLES86: TFloatField
      FieldName = 'NUMSAMPLES86'
    end
    object cdsDepCovrProspectNUMSAMPLES64MODEL: TFloatField
      FieldName = 'NUMSAMPLES64MODEL'
    end
    object cdsDepCovrProspectNUMSAMPLES74MODEL: TFloatField
      FieldName = 'NUMSAMPLES74MODEL'
    end
    object cdsDepCovrProspectNUMSAMPLESTHUMODEL: TFloatField
      FieldName = 'NUMSAMPLESTHUMODEL'
    end
    object cdsDepCovrProspectNUMSAMPLESMUSMP: TFloatField
      FieldName = 'NUMSAMPLESMUSMP'
    end
    object cdsDepCovrProspectSDEV64: TFloatField
      FieldName = 'SDEV64'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEV74: TFloatField
      FieldName = 'SDEV74'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEV84: TFloatField
      FieldName = 'SDEV84'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEVMU: TFloatField
      FieldName = 'SDEVMU'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEV76: TFloatField
      FieldName = 'SDEV76'
      DisplayFormat = '##0.00000'
    end
    object cdsDepCovrProspectSDEV86: TFloatField
      FieldName = 'SDEV86'
      DisplayFormat = '##0.00000'
    end
    object cdsDepCovrProspectSDEV64MODEL: TFloatField
      FieldName = 'SDEV64MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEV74MODEL: TFloatField
      FieldName = 'SDEV74MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEVTHUMODEL: TFloatField
      FieldName = 'SDEVTHUMODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEVMUSMP: TFloatField
      FieldName = 'SDEVMUSMP'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIAN64: TFloatField
      FieldName = 'MEDIAN64'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIAN74: TFloatField
      FieldName = 'MEDIAN74'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIAN84: TFloatField
      FieldName = 'MEDIAN84'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIANMU: TFloatField
      FieldName = 'MEDIANMU'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIAN76: TFloatField
      FieldName = 'MEDIAN76'
      DisplayFormat = '##0.00000'
    end
    object cdsDepCovrProspectMEDIAN86: TFloatField
      FieldName = 'MEDIAN86'
      DisplayFormat = '##0.00000'
    end
    object cdsDepCovrProspectMEDIAN64MODEL: TFloatField
      FieldName = 'MEDIAN64MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIAN74MODEL: TFloatField
      FieldName = 'MEDIAN74MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIAN84MODEL: TFloatField
      FieldName = 'MEDIAN84MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIANTHUMODEL: TFloatField
      FieldName = 'MEDIANTHUMODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIANMUSAMPLES: TFloatField
      FieldName = 'MEDIANMUSAMPLES'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIANTHUSAMPLES: TFloatField
      FieldName = 'MEDIANTHUSAMPLES'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectAVERAGELEAST: TStringField
      FieldName = 'AVERAGELEAST'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDepCovrProspectMODELID: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object cdsDepCovrProspectIQR64: TFloatField
      FieldName = 'IQR64'
      Required = True
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQR74: TFloatField
      FieldName = 'IQR74'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQR84: TFloatField
      FieldName = 'IQR84'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQR76: TFloatField
      FieldName = 'IQR76'
      DisplayFormat = '##0.00000'
    end
    object cdsDepCovrProspectIQR86: TFloatField
      FieldName = 'IQR86'
      DisplayFormat = '##0.00000'
    end
    object cdsDepCovrProspectIQRMU: TFloatField
      FieldName = 'IQRMU'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQR64MODEL: TFloatField
      FieldName = 'IQR64MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQR74MODEL: TFloatField
      FieldName = 'IQR74MODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQRTHUMODEL: TFloatField
      FieldName = 'IQRTHUMODEL'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQRMUSMP: TFloatField
      FieldName = 'IQRMUSMP'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIANSR87INITIAL: TFloatField
      FieldName = 'MEDIANSR87INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectMEDIANND143INITIAL: TFloatField
      FieldName = 'MEDIANND143INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectMEDIANOS187INITIAL: TFloatField
      FieldName = 'MEDIANOS187INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectMEDIANS34: TFloatField
      FieldName = 'MEDIANS34'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIANSO434: TFloatField
      FieldName = 'MEDIANSO434'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEDIANO18: TFloatField
      FieldName = 'MEDIANO18'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectNUMSAMPLESSR87INITIAL: TFloatField
      FieldName = 'NUMSAMPLESSR87INITIAL'
    end
    object cdsDepCovrProspectNUMSAMPLESND143INITIAL: TFloatField
      FieldName = 'NUMSAMPLESND143INITIAL'
    end
    object cdsDepCovrProspectNUMSAMPLESOS187INITIAL: TFloatField
      FieldName = 'NUMSAMPLESOS187INITIAL'
    end
    object cdsDepCovrProspectNUMSAMPLESS34: TFloatField
      FieldName = 'NUMSAMPLESS34'
    end
    object cdsDepCovrProspectNUMSAMPLESSO434: TFloatField
      FieldName = 'NUMSAMPLESSO434'
    end
    object cdsDepCovrProspectNUMSAMPLESO18: TFloatField
      FieldName = 'NUMSAMPLESO18'
    end
    object cdsDepCovrProspectIQRSR87INITIAL: TFloatField
      FieldName = 'IQRSR87INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectIQRND143INITIAL: TFloatField
      FieldName = 'IQRND143INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectIQROS187INITIAL: TFloatField
      FieldName = 'IQROS187INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectIQRS34: TFloatField
      FieldName = 'IQRS34'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQRSO434: TFloatField
      FieldName = 'IQRSO434'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectIQRO18: TFloatField
      FieldName = 'IQRO18'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEANSR87INITIAL: TFloatField
      FieldName = 'MEANSR87INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectMEANND143INITIAL: TFloatField
      FieldName = 'MEANND143INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectMEANOS187INITIAL: TFloatField
      FieldName = 'MEANOS187INITIAL'
      DisplayFormat = '###0.000000'
    end
    object cdsDepCovrProspectMEANS34: TFloatField
      FieldName = 'MEANS34'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEANSO434: TFloatField
      FieldName = 'MEANSO434'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectMEANO18: TFloatField
      FieldName = 'MEANO18'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEVSR87INITIAL: TFloatField
      FieldName = 'SDEVSR87INITIAL'
    end
    object cdsDepCovrProspectSDEVND143INITIAL: TFloatField
      FieldName = 'SDEVND143INITIAL'
    end
    object cdsDepCovrProspectSDEVOS187INITIAL: TFloatField
      FieldName = 'SDEVOS187INITIAL'
    end
    object cdsDepCovrProspectSDEVS34: TFloatField
      FieldName = 'SDEVS34'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEVSO434: TFloatField
      FieldName = 'SDEVSO434'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectSDEVO18: TFloatField
      FieldName = 'SDEVO18'
      DisplayFormat = '###0.000'
    end
    object cdsDepCovrProspectCOEFFVARSR87INITIAL: TFloatField
      FieldName = 'COEFFVARSR87INITIAL'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVARND143INITIAL: TFloatField
      FieldName = 'COEFFVARND143INITIAL'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVAROS187INITIAL: TFloatField
      FieldName = 'COEFFVAROS187INITIAL'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVARS34: TFloatField
      FieldName = 'COEFFVARS34'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVARSO434: TFloatField
      FieldName = 'COEFFVARSO434'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectCOEFFVARO18: TFloatField
      FieldName = 'COEFFVARO18'
      DisplayFormat = '####0.000'
    end
    object cdsDepCovrProspectMEDIANHF176INITIAL: TFloatField
      FieldName = 'MEDIANHF176INITIAL'
    end
    object cdsDepCovrProspectMEANHF176INITIAL: TFloatField
      FieldName = 'MEANHF176INITIAL'
    end
    object cdsDepCovrProspectNUMSAMPLESHF176INITIAL: TFloatField
      FieldName = 'NUMSAMPLESHF176INITIAL'
    end
    object cdsDepCovrProspectSDEVHF176INITIAL: TFloatField
      FieldName = 'SDEVHF176INITIAL'
    end
    object cdsDepCovrProspectCOEFFVARHF176INITIAL: TFloatField
      FieldName = 'COEFFVARHF176INITIAL'
    end
    object cdsDepCovrProspectIQRHF176INITIAL: TFloatField
      FieldName = 'IQRHF176INITIAL'
    end
    object cdsDepCovrProspectMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
  end
  object dsDepCovrProspect: TDataSource
    DataSet = cdsDepCovrProspect
    Left = 288
    Top = 535
  end
  object qDepCovrTarget1: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DEPCOVR,AVERLEAST'
      'WHERE DEPCOVR.DEPOSITID = :DepositID'
      'AND DEPCOVR.AVERLEAST=AVERLEAST.AVERLEAST')
    SQLConnection = sqlcDateView
    Left = 204
    Top = 583
    object qDepCovrTarget1DEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepCovrTarget1AVERLEAST: TStringField
      FieldName = 'AVERLEAST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepCovrTarget1MEDIAN64: TFloatField
      FieldName = 'MEDIAN64'
    end
    object qDepCovrTarget1MEDIAN74: TFloatField
      FieldName = 'MEDIAN74'
    end
    object qDepCovrTarget1MEDIAN84: TFloatField
      FieldName = 'MEDIAN84'
    end
    object qDepCovrTarget1MEDIAN76: TFloatField
      FieldName = 'MEDIAN76'
    end
    object qDepCovrTarget1MEDIAN86: TFloatField
      FieldName = 'MEDIAN86'
    end
    object qDepCovrTarget1MEDIANMU: TFloatField
      FieldName = 'MEDIANMU'
    end
    object qDepCovrTarget1MEDIAN64MODEL: TFloatField
      FieldName = 'MEDIAN64MODEL'
    end
    object qDepCovrTarget1MEDIAN74MODEL: TFloatField
      FieldName = 'MEDIAN74MODEL'
    end
    object qDepCovrTarget1MEDIANTHUMODEL: TFloatField
      FieldName = 'MEDIANTHUMODEL'
    end
    object qDepCovrTarget1MEDIANMUSAMPLES: TFloatField
      FieldName = 'MEDIANMUSAMPLES'
    end
    object qDepCovrTarget1MEAN64: TFloatField
      FieldName = 'MEAN64'
    end
    object qDepCovrTarget1MEAN74: TFloatField
      FieldName = 'MEAN74'
    end
    object qDepCovrTarget1MEAN84: TFloatField
      FieldName = 'MEAN84'
    end
    object qDepCovrTarget1MEAN76: TFloatField
      FieldName = 'MEAN76'
    end
    object qDepCovrTarget1MEAN86: TFloatField
      FieldName = 'MEAN86'
    end
    object qDepCovrTarget1MEANMU: TFloatField
      FieldName = 'MEANMU'
    end
    object qDepCovrTarget1MEAN64MODEL: TFloatField
      FieldName = 'MEAN64MODEL'
    end
    object qDepCovrTarget1MEAN74MODEL: TFloatField
      FieldName = 'MEAN74MODEL'
    end
    object qDepCovrTarget1MEANTHUMODEL: TFloatField
      FieldName = 'MEANTHUMODEL'
    end
    object qDepCovrTarget1MEANMUSAMPLES: TFloatField
      FieldName = 'MEANMUSAMPLES'
    end
    object qDepCovrTarget1NUMSAMPLES64: TFloatField
      FieldName = 'NUMSAMPLES64'
    end
    object qDepCovrTarget1NUMSAMPLES74: TFloatField
      FieldName = 'NUMSAMPLES74'
    end
    object qDepCovrTarget1NUMSAMPLES84: TFloatField
      FieldName = 'NUMSAMPLES84'
    end
    object qDepCovrTarget1NUMSAMPLES76: TFloatField
      FieldName = 'NUMSAMPLES76'
    end
    object qDepCovrTarget1NUMSAMPLES86: TFloatField
      FieldName = 'NUMSAMPLES86'
    end
    object qDepCovrTarget1NUMSAMPLESMU: TFloatField
      FieldName = 'NUMSAMPLESMU'
    end
    object qDepCovrTarget1NUMSAMPLES64MODEL: TFloatField
      FieldName = 'NUMSAMPLES64MODEL'
    end
    object qDepCovrTarget1NUMSAMPLES74MODEL: TFloatField
      FieldName = 'NUMSAMPLES74MODEL'
    end
    object qDepCovrTarget1NUMSAMPLESTHUMODEL: TFloatField
      FieldName = 'NUMSAMPLESTHUMODEL'
    end
    object qDepCovrTarget1NUMSAMPLESMUSMP: TFloatField
      FieldName = 'NUMSAMPLESMUSMP'
    end
    object qDepCovrTarget1SDEV64: TFloatField
      FieldName = 'SDEV64'
    end
    object qDepCovrTarget1SDEV74: TFloatField
      FieldName = 'SDEV74'
    end
    object qDepCovrTarget1SDEV84: TFloatField
      FieldName = 'SDEV84'
    end
    object qDepCovrTarget1SDEV76: TFloatField
      FieldName = 'SDEV76'
    end
    object qDepCovrTarget1SDEV86: TFloatField
      FieldName = 'SDEV86'
    end
    object qDepCovrTarget1SDEVMU: TFloatField
      FieldName = 'SDEVMU'
    end
    object qDepCovrTarget1SDEV64MODEL: TFloatField
      FieldName = 'SDEV64MODEL'
    end
    object qDepCovrTarget1SDEV74MODEL: TFloatField
      FieldName = 'SDEV74MODEL'
    end
    object qDepCovrTarget1SDEVTHUMODEL: TFloatField
      FieldName = 'SDEVTHUMODEL'
    end
    object qDepCovrTarget1SDEVMUSMP: TFloatField
      FieldName = 'SDEVMUSMP'
    end
    object qDepCovrTarget1COEFFVAR64: TFloatField
      FieldName = 'COEFFVAR64'
    end
    object qDepCovrTarget1COEFFVAR74: TFloatField
      FieldName = 'COEFFVAR74'
    end
    object qDepCovrTarget1COEFFVAR84: TFloatField
      FieldName = 'COEFFVAR84'
    end
    object qDepCovrTarget1COEFFVAR76: TFloatField
      FieldName = 'COEFFVAR76'
    end
    object qDepCovrTarget1COEFFVAR86: TFloatField
      FieldName = 'COEFFVAR86'
    end
    object qDepCovrTarget1COEFFVARMU: TFloatField
      FieldName = 'COEFFVARMU'
    end
    object qDepCovrTarget1COEFFVAR64MODEL: TFloatField
      FieldName = 'COEFFVAR64MODEL'
    end
    object qDepCovrTarget1COEFFVAR74MODEL: TFloatField
      FieldName = 'COEFFVAR74MODEL'
    end
    object qDepCovrTarget1COEFFVARTHUMODEL: TFloatField
      FieldName = 'COEFFVARTHUMODEL'
    end
    object qDepCovrTarget1COEFFVARMUSMP: TFloatField
      FieldName = 'COEFFVARMUSMP'
    end
    object qDepCovrTarget1CORREL76: TFloatField
      FieldName = 'CORREL76'
    end
    object qDepCovrTarget1CORREL86: TFloatField
      FieldName = 'CORREL86'
    end
    object qDepCovrTarget1MODELID: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object qDepCovrTarget1AVERLEAST_1: TStringField
      FieldName = 'AVERLEAST_1'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qDepCovrTarget1AVERAGELEAST: TStringField
      FieldName = 'AVERAGELEAST'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDepCovrTarget1IQR64: TFloatField
      FieldName = 'IQR64'
      Required = True
    end
    object qDepCovrTarget1IQR74: TFloatField
      FieldName = 'IQR74'
    end
    object qDepCovrTarget1IQR84: TFloatField
      FieldName = 'IQR84'
    end
    object qDepCovrTarget1IQR76: TFloatField
      FieldName = 'IQR76'
    end
    object qDepCovrTarget1IQR86: TFloatField
      FieldName = 'IQR86'
    end
    object qDepCovrTarget1IQRMU: TFloatField
      FieldName = 'IQRMU'
    end
    object qDepCovrTarget1IQR64MODEL: TFloatField
      FieldName = 'IQR64MODEL'
    end
    object qDepCovrTarget1IQR74MODEL: TFloatField
      FieldName = 'IQR74MODEL'
    end
    object qDepCovrTarget1IQRTHUMODEL: TFloatField
      FieldName = 'IQRTHUMODEL'
    end
    object qDepCovrTarget1IQRMUSMP: TFloatField
      FieldName = 'IQRMUSMP'
    end
    object qDepCovrTarget1MEDIANSR87INITIAL: TFloatField
      FieldName = 'MEDIANSR87INITIAL'
    end
    object qDepCovrTarget1MEDIANND143INITIAL: TFloatField
      FieldName = 'MEDIANND143INITIAL'
    end
    object qDepCovrTarget1MEDIANOS187INITIAL: TFloatField
      FieldName = 'MEDIANOS187INITIAL'
    end
    object qDepCovrTarget1MEDIANS34: TFloatField
      FieldName = 'MEDIANS34'
    end
    object qDepCovrTarget1MEDIANSO434: TFloatField
      FieldName = 'MEDIANSO434'
    end
    object qDepCovrTarget1MEDIANO18: TFloatField
      FieldName = 'MEDIANO18'
    end
    object qDepCovrTarget1MEANSR87INITIAL: TFloatField
      FieldName = 'MEANSR87INITIAL'
    end
    object qDepCovrTarget1MEANND143INITIAL: TFloatField
      FieldName = 'MEANND143INITIAL'
    end
    object qDepCovrTarget1MEANOS187INITIAL: TFloatField
      FieldName = 'MEANOS187INITIAL'
    end
    object qDepCovrTarget1MEANS34: TFloatField
      FieldName = 'MEANS34'
    end
    object qDepCovrTarget1MEANSO434: TFloatField
      FieldName = 'MEANSO434'
    end
    object qDepCovrTarget1MEANO18: TFloatField
      FieldName = 'MEANO18'
    end
    object qDepCovrTarget1NUMSAMPLESSR87INITIAL: TFloatField
      FieldName = 'NUMSAMPLESSR87INITIAL'
    end
    object qDepCovrTarget1NUMSAMPLESND143INITIAL: TFloatField
      FieldName = 'NUMSAMPLESND143INITIAL'
    end
    object qDepCovrTarget1NUMSAMPLESOS187INITIAL: TFloatField
      FieldName = 'NUMSAMPLESOS187INITIAL'
    end
    object qDepCovrTarget1NUMSAMPLESS34: TFloatField
      FieldName = 'NUMSAMPLESS34'
    end
    object qDepCovrTarget1NUMSAMPLESSO434: TFloatField
      FieldName = 'NUMSAMPLESSO434'
    end
    object qDepCovrTarget1NUMSAMPLESO18: TFloatField
      FieldName = 'NUMSAMPLESO18'
    end
    object qDepCovrTarget1SDEVSR87INITIAL: TFloatField
      FieldName = 'SDEVSR87INITIAL'
    end
    object qDepCovrTarget1SDEVND143INITIAL: TFloatField
      FieldName = 'SDEVND143INITIAL'
    end
    object qDepCovrTarget1SDEVOS187INITIAL: TFloatField
      FieldName = 'SDEVOS187INITIAL'
    end
    object qDepCovrTarget1SDEVS34: TFloatField
      FieldName = 'SDEVS34'
    end
    object qDepCovrTarget1SDEVSO434: TFloatField
      FieldName = 'SDEVSO434'
    end
    object qDepCovrTarget1SDEVO18: TFloatField
      FieldName = 'SDEVO18'
    end
    object qDepCovrTarget1COEFFVARSR87INITIAL: TFloatField
      FieldName = 'COEFFVARSR87INITIAL'
    end
    object qDepCovrTarget1COEFFVARND143INITIAL: TFloatField
      FieldName = 'COEFFVARND143INITIAL'
    end
    object qDepCovrTarget1COEFFVAROS187INITIAL: TFloatField
      FieldName = 'COEFFVAROS187INITIAL'
    end
    object qDepCovrTarget1COEFFVARS34: TFloatField
      FieldName = 'COEFFVARS34'
    end
    object qDepCovrTarget1COEFFVARSO434: TFloatField
      FieldName = 'COEFFVARSO434'
    end
    object qDepCovrTarget1COEFFVARO18: TFloatField
      FieldName = 'COEFFVARO18'
    end
    object qDepCovrTarget1IQRSR87INITIAL: TFloatField
      FieldName = 'IQRSR87INITIAL'
    end
    object qDepCovrTarget1IQRND143INITIAL: TFloatField
      FieldName = 'IQRND143INITIAL'
    end
    object qDepCovrTarget1IQROS187INITIAL: TFloatField
      FieldName = 'IQROS187INITIAL'
    end
    object qDepCovrTarget1IQRS34: TFloatField
      FieldName = 'IQRS34'
    end
    object qDepCovrTarget1IQRSO434: TFloatField
      FieldName = 'IQRSO434'
    end
    object qDepCovrTarget1IQRO18: TFloatField
      FieldName = 'IQRO18'
    end
    object qDepCovrTarget1MEDIAN84MODEL: TFloatField
      FieldName = 'MEDIAN84MODEL'
    end
    object qDepCovrTarget1MEDIANTHUSAMPLES: TFloatField
      FieldName = 'MEDIANTHUSAMPLES'
    end
    object qDepCovrTarget1MEDIANHF176INITIAL: TFloatField
      FieldName = 'MEDIANHF176INITIAL'
    end
    object qDepCovrTarget1MEANHF176INITIAL: TFloatField
      FieldName = 'MEANHF176INITIAL'
    end
    object qDepCovrTarget1NUMSAMPLESHF176INITIAL: TFloatField
      FieldName = 'NUMSAMPLESHF176INITIAL'
    end
    object qDepCovrTarget1SDEVHF176INITIAL: TFloatField
      FieldName = 'SDEVHF176INITIAL'
    end
    object qDepCovrTarget1COEFFVARHF176INITIAL: TFloatField
      FieldName = 'COEFFVARHF176INITIAL'
    end
    object qDepCovrTarget1IQRHF176INITIAL: TFloatField
      FieldName = 'IQRHF176INITIAL'
    end
  end
  object dspDepCovrTarget1: TDataSetProvider
    DataSet = qDepCovrTarget1
    Left = 232
    Top = 583
  end
  object cdsDepCovrTarget1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepCovrTarget1'
    Left = 260
    Top = 583
    object cdsDepCovrTarget1DEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepCovrTarget1AVERLEAST: TStringField
      FieldName = 'AVERLEAST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepCovrTarget1MEDIAN64: TFloatField
      FieldName = 'MEDIAN64'
    end
    object cdsDepCovrTarget1MEDIAN74: TFloatField
      FieldName = 'MEDIAN74'
    end
    object cdsDepCovrTarget1MEDIAN84: TFloatField
      FieldName = 'MEDIAN84'
    end
    object cdsDepCovrTarget1MEDIAN76: TFloatField
      FieldName = 'MEDIAN76'
    end
    object cdsDepCovrTarget1MEDIAN86: TFloatField
      FieldName = 'MEDIAN86'
    end
    object cdsDepCovrTarget1MEDIANMU: TFloatField
      FieldName = 'MEDIANMU'
    end
    object cdsDepCovrTarget1MEDIAN64MODEL: TFloatField
      FieldName = 'MEDIAN64MODEL'
    end
    object cdsDepCovrTarget1MEDIAN74MODEL: TFloatField
      FieldName = 'MEDIAN74MODEL'
    end
    object cdsDepCovrTarget1MEDIANTHUMODEL: TFloatField
      FieldName = 'MEDIANTHUMODEL'
    end
    object cdsDepCovrTarget1MEDIANMUSAMPLES: TFloatField
      FieldName = 'MEDIANMUSAMPLES'
    end
    object cdsDepCovrTarget1MEAN64: TFloatField
      FieldName = 'MEAN64'
    end
    object cdsDepCovrTarget1MEAN74: TFloatField
      FieldName = 'MEAN74'
    end
    object cdsDepCovrTarget1MEAN84: TFloatField
      FieldName = 'MEAN84'
    end
    object cdsDepCovrTarget1MEAN76: TFloatField
      FieldName = 'MEAN76'
    end
    object cdsDepCovrTarget1MEAN86: TFloatField
      FieldName = 'MEAN86'
    end
    object cdsDepCovrTarget1MEANMU: TFloatField
      FieldName = 'MEANMU'
    end
    object cdsDepCovrTarget1MEAN64MODEL: TFloatField
      FieldName = 'MEAN64MODEL'
    end
    object cdsDepCovrTarget1MEAN74MODEL: TFloatField
      FieldName = 'MEAN74MODEL'
    end
    object cdsDepCovrTarget1MEANTHUMODEL: TFloatField
      FieldName = 'MEANTHUMODEL'
    end
    object cdsDepCovrTarget1MEANMUSAMPLES: TFloatField
      FieldName = 'MEANMUSAMPLES'
    end
    object cdsDepCovrTarget1NUMSAMPLES64: TFloatField
      FieldName = 'NUMSAMPLES64'
    end
    object cdsDepCovrTarget1NUMSAMPLES74: TFloatField
      FieldName = 'NUMSAMPLES74'
    end
    object cdsDepCovrTarget1NUMSAMPLES84: TFloatField
      FieldName = 'NUMSAMPLES84'
    end
    object cdsDepCovrTarget1NUMSAMPLES76: TFloatField
      FieldName = 'NUMSAMPLES76'
    end
    object cdsDepCovrTarget1NUMSAMPLES86: TFloatField
      FieldName = 'NUMSAMPLES86'
    end
    object cdsDepCovrTarget1NUMSAMPLESMU: TFloatField
      FieldName = 'NUMSAMPLESMU'
    end
    object cdsDepCovrTarget1NUMSAMPLES64MODEL: TFloatField
      FieldName = 'NUMSAMPLES64MODEL'
    end
    object cdsDepCovrTarget1NUMSAMPLES74MODEL: TFloatField
      FieldName = 'NUMSAMPLES74MODEL'
    end
    object cdsDepCovrTarget1NUMSAMPLESTHUMODEL: TFloatField
      FieldName = 'NUMSAMPLESTHUMODEL'
    end
    object cdsDepCovrTarget1NUMSAMPLESMUSMP: TFloatField
      FieldName = 'NUMSAMPLESMUSMP'
    end
    object cdsDepCovrTarget1SDEV64: TFloatField
      FieldName = 'SDEV64'
    end
    object cdsDepCovrTarget1SDEV74: TFloatField
      FieldName = 'SDEV74'
    end
    object cdsDepCovrTarget1SDEV84: TFloatField
      FieldName = 'SDEV84'
    end
    object cdsDepCovrTarget1SDEV76: TFloatField
      FieldName = 'SDEV76'
    end
    object cdsDepCovrTarget1SDEV86: TFloatField
      FieldName = 'SDEV86'
    end
    object cdsDepCovrTarget1SDEVMU: TFloatField
      FieldName = 'SDEVMU'
    end
    object cdsDepCovrTarget1SDEV64MODEL: TFloatField
      FieldName = 'SDEV64MODEL'
    end
    object cdsDepCovrTarget1SDEV74MODEL: TFloatField
      FieldName = 'SDEV74MODEL'
    end
    object cdsDepCovrTarget1SDEVTHUMODEL: TFloatField
      FieldName = 'SDEVTHUMODEL'
    end
    object cdsDepCovrTarget1SDEVMUSMP: TFloatField
      FieldName = 'SDEVMUSMP'
    end
    object cdsDepCovrTarget1COEFFVAR64: TFloatField
      FieldName = 'COEFFVAR64'
    end
    object cdsDepCovrTarget1COEFFVAR74: TFloatField
      FieldName = 'COEFFVAR74'
    end
    object cdsDepCovrTarget1COEFFVAR84: TFloatField
      FieldName = 'COEFFVAR84'
    end
    object cdsDepCovrTarget1COEFFVAR76: TFloatField
      FieldName = 'COEFFVAR76'
    end
    object cdsDepCovrTarget1COEFFVAR86: TFloatField
      FieldName = 'COEFFVAR86'
    end
    object cdsDepCovrTarget1COEFFVARMU: TFloatField
      FieldName = 'COEFFVARMU'
    end
    object cdsDepCovrTarget1COEFFVAR64MODEL: TFloatField
      FieldName = 'COEFFVAR64MODEL'
    end
    object cdsDepCovrTarget1COEFFVAR74MODEL: TFloatField
      FieldName = 'COEFFVAR74MODEL'
    end
    object cdsDepCovrTarget1COEFFVARTHUMODEL: TFloatField
      FieldName = 'COEFFVARTHUMODEL'
    end
    object cdsDepCovrTarget1COEFFVARMUSMP: TFloatField
      FieldName = 'COEFFVARMUSMP'
    end
    object cdsDepCovrTarget1CORREL76: TFloatField
      FieldName = 'CORREL76'
    end
    object cdsDepCovrTarget1CORREL86: TFloatField
      FieldName = 'CORREL86'
    end
    object cdsDepCovrTarget1MODELID: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object cdsDepCovrTarget1AVERLEAST_1: TStringField
      FieldName = 'AVERLEAST_1'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsDepCovrTarget1AVERAGELEAST: TStringField
      FieldName = 'AVERAGELEAST'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDepCovrTarget1IQR64: TFloatField
      FieldName = 'IQR64'
      Required = True
    end
    object cdsDepCovrTarget1IQR74: TFloatField
      FieldName = 'IQR74'
    end
    object cdsDepCovrTarget1IQR84: TFloatField
      FieldName = 'IQR84'
    end
    object cdsDepCovrTarget1IQR76: TFloatField
      FieldName = 'IQR76'
    end
    object cdsDepCovrTarget1IQR86: TFloatField
      FieldName = 'IQR86'
    end
    object cdsDepCovrTarget1IQRMU: TFloatField
      FieldName = 'IQRMU'
    end
    object cdsDepCovrTarget1IQR64MODEL: TFloatField
      FieldName = 'IQR64MODEL'
    end
    object cdsDepCovrTarget1IQR74MODEL: TFloatField
      FieldName = 'IQR74MODEL'
    end
    object cdsDepCovrTarget1IQRTHUMODEL: TFloatField
      FieldName = 'IQRTHUMODEL'
    end
    object cdsDepCovrTarget1IQRMUSMP: TFloatField
      FieldName = 'IQRMUSMP'
    end
    object cdsDepCovrTarget1MEDIANSR87INITIAL: TFloatField
      FieldName = 'MEDIANSR87INITIAL'
    end
    object cdsDepCovrTarget1MEDIANND143INITIAL: TFloatField
      FieldName = 'MEDIANND143INITIAL'
    end
    object cdsDepCovrTarget1MEDIANOS187INITIAL: TFloatField
      FieldName = 'MEDIANOS187INITIAL'
    end
    object cdsDepCovrTarget1MEDIANS34: TFloatField
      FieldName = 'MEDIANS34'
    end
    object cdsDepCovrTarget1MEDIANSO434: TFloatField
      FieldName = 'MEDIANSO434'
    end
    object cdsDepCovrTarget1MEDIANO18: TFloatField
      FieldName = 'MEDIANO18'
    end
    object cdsDepCovrTarget1MEANSR87INITIAL: TFloatField
      FieldName = 'MEANSR87INITIAL'
    end
    object cdsDepCovrTarget1MEANND143INITIAL: TFloatField
      FieldName = 'MEANND143INITIAL'
    end
    object cdsDepCovrTarget1MEANOS187INITIAL: TFloatField
      FieldName = 'MEANOS187INITIAL'
    end
    object cdsDepCovrTarget1MEANS34: TFloatField
      FieldName = 'MEANS34'
    end
    object cdsDepCovrTarget1MEANSO434: TFloatField
      FieldName = 'MEANSO434'
    end
    object cdsDepCovrTarget1MEANO18: TFloatField
      FieldName = 'MEANO18'
    end
    object cdsDepCovrTarget1NUMSAMPLESSR87INITIAL: TFloatField
      FieldName = 'NUMSAMPLESSR87INITIAL'
    end
    object cdsDepCovrTarget1NUMSAMPLESND143INITIAL: TFloatField
      FieldName = 'NUMSAMPLESND143INITIAL'
    end
    object cdsDepCovrTarget1NUMSAMPLESOS187INITIAL: TFloatField
      FieldName = 'NUMSAMPLESOS187INITIAL'
    end
    object cdsDepCovrTarget1NUMSAMPLESS34: TFloatField
      FieldName = 'NUMSAMPLESS34'
    end
    object cdsDepCovrTarget1NUMSAMPLESSO434: TFloatField
      FieldName = 'NUMSAMPLESSO434'
    end
    object cdsDepCovrTarget1NUMSAMPLESO18: TFloatField
      FieldName = 'NUMSAMPLESO18'
    end
    object cdsDepCovrTarget1SDEVSR87INITIAL: TFloatField
      FieldName = 'SDEVSR87INITIAL'
    end
    object cdsDepCovrTarget1SDEVND143INITIAL: TFloatField
      FieldName = 'SDEVND143INITIAL'
    end
    object cdsDepCovrTarget1SDEVOS187INITIAL: TFloatField
      FieldName = 'SDEVOS187INITIAL'
    end
    object cdsDepCovrTarget1SDEVS34: TFloatField
      FieldName = 'SDEVS34'
    end
    object cdsDepCovrTarget1SDEVSO434: TFloatField
      FieldName = 'SDEVSO434'
    end
    object cdsDepCovrTarget1SDEVO18: TFloatField
      FieldName = 'SDEVO18'
    end
    object cdsDepCovrTarget1COEFFVARSR87INITIAL: TFloatField
      FieldName = 'COEFFVARSR87INITIAL'
    end
    object cdsDepCovrTarget1COEFFVARND143INITIAL: TFloatField
      FieldName = 'COEFFVARND143INITIAL'
    end
    object cdsDepCovrTarget1COEFFVAROS187INITIAL: TFloatField
      FieldName = 'COEFFVAROS187INITIAL'
    end
    object cdsDepCovrTarget1COEFFVARS34: TFloatField
      FieldName = 'COEFFVARS34'
    end
    object cdsDepCovrTarget1COEFFVARSO434: TFloatField
      FieldName = 'COEFFVARSO434'
    end
    object cdsDepCovrTarget1COEFFVARO18: TFloatField
      FieldName = 'COEFFVARO18'
    end
    object cdsDepCovrTarget1IQRSR87INITIAL: TFloatField
      FieldName = 'IQRSR87INITIAL'
    end
    object cdsDepCovrTarget1IQRND143INITIAL: TFloatField
      FieldName = 'IQRND143INITIAL'
    end
    object cdsDepCovrTarget1IQROS187INITIAL: TFloatField
      FieldName = 'IQROS187INITIAL'
    end
    object cdsDepCovrTarget1IQRS34: TFloatField
      FieldName = 'IQRS34'
    end
    object cdsDepCovrTarget1IQRSO434: TFloatField
      FieldName = 'IQRSO434'
    end
    object cdsDepCovrTarget1IQRO18: TFloatField
      FieldName = 'IQRO18'
    end
    object cdsDepCovrTarget1MEDIAN84MODEL: TFloatField
      FieldName = 'MEDIAN84MODEL'
    end
    object cdsDepCovrTarget1MEDIANTHUSAMPLES: TFloatField
      FieldName = 'MEDIANTHUSAMPLES'
    end
    object cdsDepCovrTarget1MEDIANHF176INITIAL: TFloatField
      FieldName = 'MEDIANHF176INITIAL'
    end
    object cdsDepCovrTarget1MEANHF176INITIAL: TFloatField
      FieldName = 'MEANHF176INITIAL'
    end
    object cdsDepCovrTarget1NUMSAMPLESHF176INITIAL: TFloatField
      FieldName = 'NUMSAMPLESHF176INITIAL'
    end
    object cdsDepCovrTarget1SDEVHF176INITIAL: TFloatField
      FieldName = 'SDEVHF176INITIAL'
    end
    object cdsDepCovrTarget1COEFFVARHF176INITIAL: TFloatField
      FieldName = 'COEFFVARHF176INITIAL'
    end
    object cdsDepCovrTarget1IQRHF176INITIAL: TFloatField
      FieldName = 'IQRHF176INITIAL'
    end
  end
  object dsDepCovrTarget1: TDataSource
    DataSet = cdsDepCovrTarget1
    Left = 288
    Top = 583
  end
  object qDepCovrTarget2: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DEPCOVR,AVERLEAST'
      'WHERE DEPCOVR.DEPOSITID = :DepositID'
      'AND DEPCOVR.AVERLEAST=AVERLEAST.AVERLEAST')
    SQLConnection = sqlcDateView
    Left = 204
    Top = 631
    object qDepCovrTarget2DEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepCovrTarget2AVERLEAST: TStringField
      FieldName = 'AVERLEAST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepCovrTarget2MEDIAN64: TFloatField
      FieldName = 'MEDIAN64'
    end
    object qDepCovrTarget2MEDIAN74: TFloatField
      FieldName = 'MEDIAN74'
    end
    object qDepCovrTarget2MEDIAN84: TFloatField
      FieldName = 'MEDIAN84'
    end
    object qDepCovrTarget2MEDIAN76: TFloatField
      FieldName = 'MEDIAN76'
    end
    object qDepCovrTarget2MEDIAN86: TFloatField
      FieldName = 'MEDIAN86'
    end
    object qDepCovrTarget2MEDIANMU: TFloatField
      FieldName = 'MEDIANMU'
    end
    object qDepCovrTarget2MEDIAN64MODEL: TFloatField
      FieldName = 'MEDIAN64MODEL'
    end
    object qDepCovrTarget2MEDIAN74MODEL: TFloatField
      FieldName = 'MEDIAN74MODEL'
    end
    object qDepCovrTarget2MEDIANTHUMODEL: TFloatField
      FieldName = 'MEDIANTHUMODEL'
    end
    object qDepCovrTarget2MEDIANMUSAMPLES: TFloatField
      FieldName = 'MEDIANMUSAMPLES'
    end
    object qDepCovrTarget2MEAN64: TFloatField
      FieldName = 'MEAN64'
    end
    object qDepCovrTarget2MEAN74: TFloatField
      FieldName = 'MEAN74'
    end
    object qDepCovrTarget2MEAN84: TFloatField
      FieldName = 'MEAN84'
    end
    object qDepCovrTarget2MEAN76: TFloatField
      FieldName = 'MEAN76'
    end
    object qDepCovrTarget2MEAN86: TFloatField
      FieldName = 'MEAN86'
    end
    object qDepCovrTarget2MEANMU: TFloatField
      FieldName = 'MEANMU'
    end
    object qDepCovrTarget2MEAN64MODEL: TFloatField
      FieldName = 'MEAN64MODEL'
    end
    object qDepCovrTarget2MEAN74MODEL: TFloatField
      FieldName = 'MEAN74MODEL'
    end
    object qDepCovrTarget2MEANTHUMODEL: TFloatField
      FieldName = 'MEANTHUMODEL'
    end
    object qDepCovrTarget2MEANMUSAMPLES: TFloatField
      FieldName = 'MEANMUSAMPLES'
    end
    object qDepCovrTarget2NUMSAMPLES64: TFloatField
      FieldName = 'NUMSAMPLES64'
    end
    object qDepCovrTarget2NUMSAMPLES74: TFloatField
      FieldName = 'NUMSAMPLES74'
    end
    object qDepCovrTarget2NUMSAMPLES84: TFloatField
      FieldName = 'NUMSAMPLES84'
    end
    object qDepCovrTarget2NUMSAMPLES76: TFloatField
      FieldName = 'NUMSAMPLES76'
    end
    object qDepCovrTarget2NUMSAMPLES86: TFloatField
      FieldName = 'NUMSAMPLES86'
    end
    object qDepCovrTarget2NUMSAMPLESMU: TFloatField
      FieldName = 'NUMSAMPLESMU'
    end
    object qDepCovrTarget2NUMSAMPLES64MODEL: TFloatField
      FieldName = 'NUMSAMPLES64MODEL'
    end
    object qDepCovrTarget2NUMSAMPLES74MODEL: TFloatField
      FieldName = 'NUMSAMPLES74MODEL'
    end
    object qDepCovrTarget2NUMSAMPLESTHUMODEL: TFloatField
      FieldName = 'NUMSAMPLESTHUMODEL'
    end
    object qDepCovrTarget2NUMSAMPLESMUSMP: TFloatField
      FieldName = 'NUMSAMPLESMUSMP'
    end
    object qDepCovrTarget2SDEV64: TFloatField
      FieldName = 'SDEV64'
    end
    object qDepCovrTarget2SDEV74: TFloatField
      FieldName = 'SDEV74'
    end
    object qDepCovrTarget2SDEV84: TFloatField
      FieldName = 'SDEV84'
    end
    object qDepCovrTarget2SDEV76: TFloatField
      FieldName = 'SDEV76'
    end
    object qDepCovrTarget2SDEV86: TFloatField
      FieldName = 'SDEV86'
    end
    object qDepCovrTarget2SDEVMU: TFloatField
      FieldName = 'SDEVMU'
    end
    object qDepCovrTarget2SDEV64MODEL: TFloatField
      FieldName = 'SDEV64MODEL'
    end
    object qDepCovrTarget2SDEV74MODEL: TFloatField
      FieldName = 'SDEV74MODEL'
    end
    object qDepCovrTarget2SDEVTHUMODEL: TFloatField
      FieldName = 'SDEVTHUMODEL'
    end
    object qDepCovrTarget2SDEVMUSMP: TFloatField
      FieldName = 'SDEVMUSMP'
    end
    object qDepCovrTarget2COEFFVAR64: TFloatField
      FieldName = 'COEFFVAR64'
    end
    object qDepCovrTarget2COEFFVAR74: TFloatField
      FieldName = 'COEFFVAR74'
    end
    object qDepCovrTarget2COEFFVAR84: TFloatField
      FieldName = 'COEFFVAR84'
    end
    object qDepCovrTarget2COEFFVAR76: TFloatField
      FieldName = 'COEFFVAR76'
    end
    object qDepCovrTarget2COEFFVAR86: TFloatField
      FieldName = 'COEFFVAR86'
    end
    object qDepCovrTarget2COEFFVARMU: TFloatField
      FieldName = 'COEFFVARMU'
    end
    object qDepCovrTarget2COEFFVAR64MODEL: TFloatField
      FieldName = 'COEFFVAR64MODEL'
    end
    object qDepCovrTarget2COEFFVAR74MODEL: TFloatField
      FieldName = 'COEFFVAR74MODEL'
    end
    object qDepCovrTarget2COEFFVARTHUMODEL: TFloatField
      FieldName = 'COEFFVARTHUMODEL'
    end
    object qDepCovrTarget2COEFFVARMUSMP: TFloatField
      FieldName = 'COEFFVARMUSMP'
    end
    object qDepCovrTarget2CORREL76: TFloatField
      FieldName = 'CORREL76'
    end
    object qDepCovrTarget2CORREL86: TFloatField
      FieldName = 'CORREL86'
    end
    object qDepCovrTarget2MODELID: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object qDepCovrTarget2AVERLEAST_1: TStringField
      FieldName = 'AVERLEAST_1'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qDepCovrTarget2AVERAGELEAST: TStringField
      FieldName = 'AVERAGELEAST'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDepCovrTarget2IQR64: TFloatField
      FieldName = 'IQR64'
      Required = True
    end
    object qDepCovrTarget2IQR74: TFloatField
      FieldName = 'IQR74'
    end
    object qDepCovrTarget2IQR84: TFloatField
      FieldName = 'IQR84'
    end
    object qDepCovrTarget2IQR76: TFloatField
      FieldName = 'IQR76'
    end
    object qDepCovrTarget2IQR86: TFloatField
      FieldName = 'IQR86'
    end
    object qDepCovrTarget2IQRMU: TFloatField
      FieldName = 'IQRMU'
    end
    object qDepCovrTarget2IQR64MODEL: TFloatField
      FieldName = 'IQR64MODEL'
    end
    object qDepCovrTarget2IQR74MODEL: TFloatField
      FieldName = 'IQR74MODEL'
    end
    object qDepCovrTarget2IQRTHUMODEL: TFloatField
      FieldName = 'IQRTHUMODEL'
    end
    object qDepCovrTarget2IQRMUSMP: TFloatField
      FieldName = 'IQRMUSMP'
    end
    object qDepCovrTarget2MEDIANSR87INITIAL: TFloatField
      FieldName = 'MEDIANSR87INITIAL'
    end
    object qDepCovrTarget2MEDIANND143INITIAL: TFloatField
      FieldName = 'MEDIANND143INITIAL'
    end
    object qDepCovrTarget2MEDIANOS187INITIAL: TFloatField
      FieldName = 'MEDIANOS187INITIAL'
    end
    object qDepCovrTarget2MEDIANS34: TFloatField
      FieldName = 'MEDIANS34'
    end
    object qDepCovrTarget2MEDIANSO434: TFloatField
      FieldName = 'MEDIANSO434'
    end
    object qDepCovrTarget2MEDIANO18: TFloatField
      FieldName = 'MEDIANO18'
    end
    object qDepCovrTarget2MEANSR87INITIAL: TFloatField
      FieldName = 'MEANSR87INITIAL'
    end
    object qDepCovrTarget2MEANND143INITIAL: TFloatField
      FieldName = 'MEANND143INITIAL'
    end
    object qDepCovrTarget2MEANOS187INITIAL: TFloatField
      FieldName = 'MEANOS187INITIAL'
    end
    object qDepCovrTarget2MEANS34: TFloatField
      FieldName = 'MEANS34'
    end
    object qDepCovrTarget2MEANSO434: TFloatField
      FieldName = 'MEANSO434'
    end
    object qDepCovrTarget2MEANO18: TFloatField
      FieldName = 'MEANO18'
    end
    object qDepCovrTarget2NUMSAMPLESSR87INITIAL: TFloatField
      FieldName = 'NUMSAMPLESSR87INITIAL'
    end
    object qDepCovrTarget2NUMSAMPLESND143INITIAL: TFloatField
      FieldName = 'NUMSAMPLESND143INITIAL'
    end
    object qDepCovrTarget2NUMSAMPLESOS187INITIAL: TFloatField
      FieldName = 'NUMSAMPLESOS187INITIAL'
    end
    object qDepCovrTarget2NUMSAMPLESS34: TFloatField
      FieldName = 'NUMSAMPLESS34'
    end
    object qDepCovrTarget2NUMSAMPLESSO434: TFloatField
      FieldName = 'NUMSAMPLESSO434'
    end
    object qDepCovrTarget2NUMSAMPLESO18: TFloatField
      FieldName = 'NUMSAMPLESO18'
    end
    object qDepCovrTarget2SDEVSR87INITIAL: TFloatField
      FieldName = 'SDEVSR87INITIAL'
    end
    object qDepCovrTarget2SDEVND143INITIAL: TFloatField
      FieldName = 'SDEVND143INITIAL'
    end
    object qDepCovrTarget2SDEVOS187INITIAL: TFloatField
      FieldName = 'SDEVOS187INITIAL'
    end
    object qDepCovrTarget2SDEVS34: TFloatField
      FieldName = 'SDEVS34'
    end
    object qDepCovrTarget2SDEVSO434: TFloatField
      FieldName = 'SDEVSO434'
    end
    object qDepCovrTarget2SDEVO18: TFloatField
      FieldName = 'SDEVO18'
    end
    object qDepCovrTarget2COEFFVARSR87INITIAL: TFloatField
      FieldName = 'COEFFVARSR87INITIAL'
    end
    object qDepCovrTarget2COEFFVARND143INITIAL: TFloatField
      FieldName = 'COEFFVARND143INITIAL'
    end
    object qDepCovrTarget2COEFFVAROS187INITIAL: TFloatField
      FieldName = 'COEFFVAROS187INITIAL'
    end
    object qDepCovrTarget2COEFFVARS34: TFloatField
      FieldName = 'COEFFVARS34'
    end
    object qDepCovrTarget2COEFFVARSO434: TFloatField
      FieldName = 'COEFFVARSO434'
    end
    object qDepCovrTarget2COEFFVARO18: TFloatField
      FieldName = 'COEFFVARO18'
    end
    object qDepCovrTarget2IQRSR87INITIAL: TFloatField
      FieldName = 'IQRSR87INITIAL'
    end
    object qDepCovrTarget2IQRND143INITIAL: TFloatField
      FieldName = 'IQRND143INITIAL'
    end
    object qDepCovrTarget2IQROS187INITIAL: TFloatField
      FieldName = 'IQROS187INITIAL'
    end
    object qDepCovrTarget2IQRS34: TFloatField
      FieldName = 'IQRS34'
    end
    object qDepCovrTarget2IQRSO434: TFloatField
      FieldName = 'IQRSO434'
    end
    object qDepCovrTarget2IQRO18: TFloatField
      FieldName = 'IQRO18'
    end
    object qDepCovrTarget2MEDIAN84MODEL: TFloatField
      FieldName = 'MEDIAN84MODEL'
    end
    object qDepCovrTarget2MEDIANTHUSAMPLES: TFloatField
      FieldName = 'MEDIANTHUSAMPLES'
    end
    object qDepCovrTarget2MEDIANHF176INITIAL: TFloatField
      FieldName = 'MEDIANHF176INITIAL'
    end
    object qDepCovrTarget2MEANHF176INITIAL: TFloatField
      FieldName = 'MEANHF176INITIAL'
    end
    object qDepCovrTarget2NUMSAMPLESHF176INITIAL: TFloatField
      FieldName = 'NUMSAMPLESHF176INITIAL'
    end
    object qDepCovrTarget2SDEVHF176INITIAL: TFloatField
      FieldName = 'SDEVHF176INITIAL'
    end
    object qDepCovrTarget2COEFFVARHF176INITIAL: TFloatField
      FieldName = 'COEFFVARHF176INITIAL'
    end
    object qDepCovrTarget2IQRHF176INITIAL: TFloatField
      FieldName = 'IQRHF176INITIAL'
    end
  end
  object dspDepCovrTarget2: TDataSetProvider
    DataSet = qDepCovrTarget2
    Left = 232
    Top = 631
  end
  object cdsDepCovrTarget2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepCovrTarget2'
    Left = 260
    Top = 631
    object cdsDepCovrTarget2DEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepCovrTarget2AVERLEAST: TStringField
      FieldName = 'AVERLEAST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepCovrTarget2MEDIAN64: TFloatField
      FieldName = 'MEDIAN64'
    end
    object cdsDepCovrTarget2MEDIAN74: TFloatField
      FieldName = 'MEDIAN74'
    end
    object cdsDepCovrTarget2MEDIAN84: TFloatField
      FieldName = 'MEDIAN84'
    end
    object cdsDepCovrTarget2MEDIAN76: TFloatField
      FieldName = 'MEDIAN76'
    end
    object cdsDepCovrTarget2MEDIAN86: TFloatField
      FieldName = 'MEDIAN86'
    end
    object cdsDepCovrTarget2MEDIANMU: TFloatField
      FieldName = 'MEDIANMU'
    end
    object cdsDepCovrTarget2MEDIAN64MODEL: TFloatField
      FieldName = 'MEDIAN64MODEL'
    end
    object cdsDepCovrTarget2MEDIAN74MODEL: TFloatField
      FieldName = 'MEDIAN74MODEL'
    end
    object cdsDepCovrTarget2MEDIANTHUMODEL: TFloatField
      FieldName = 'MEDIANTHUMODEL'
    end
    object cdsDepCovrTarget2MEDIANMUSAMPLES: TFloatField
      FieldName = 'MEDIANMUSAMPLES'
    end
    object cdsDepCovrTarget2MEAN64: TFloatField
      FieldName = 'MEAN64'
    end
    object cdsDepCovrTarget2MEAN74: TFloatField
      FieldName = 'MEAN74'
    end
    object cdsDepCovrTarget2MEAN84: TFloatField
      FieldName = 'MEAN84'
    end
    object cdsDepCovrTarget2MEAN76: TFloatField
      FieldName = 'MEAN76'
    end
    object cdsDepCovrTarget2MEAN86: TFloatField
      FieldName = 'MEAN86'
    end
    object cdsDepCovrTarget2MEANMU: TFloatField
      FieldName = 'MEANMU'
    end
    object cdsDepCovrTarget2MEAN64MODEL: TFloatField
      FieldName = 'MEAN64MODEL'
    end
    object cdsDepCovrTarget2MEAN74MODEL: TFloatField
      FieldName = 'MEAN74MODEL'
    end
    object cdsDepCovrTarget2MEANTHUMODEL: TFloatField
      FieldName = 'MEANTHUMODEL'
    end
    object cdsDepCovrTarget2MEANMUSAMPLES: TFloatField
      FieldName = 'MEANMUSAMPLES'
    end
    object cdsDepCovrTarget2NUMSAMPLES64: TFloatField
      FieldName = 'NUMSAMPLES64'
    end
    object cdsDepCovrTarget2NUMSAMPLES74: TFloatField
      FieldName = 'NUMSAMPLES74'
    end
    object cdsDepCovrTarget2NUMSAMPLES84: TFloatField
      FieldName = 'NUMSAMPLES84'
    end
    object cdsDepCovrTarget2NUMSAMPLES76: TFloatField
      FieldName = 'NUMSAMPLES76'
    end
    object cdsDepCovrTarget2NUMSAMPLES86: TFloatField
      FieldName = 'NUMSAMPLES86'
    end
    object cdsDepCovrTarget2NUMSAMPLESMU: TFloatField
      FieldName = 'NUMSAMPLESMU'
    end
    object cdsDepCovrTarget2NUMSAMPLES64MODEL: TFloatField
      FieldName = 'NUMSAMPLES64MODEL'
    end
    object cdsDepCovrTarget2NUMSAMPLES74MODEL: TFloatField
      FieldName = 'NUMSAMPLES74MODEL'
    end
    object cdsDepCovrTarget2NUMSAMPLESTHUMODEL: TFloatField
      FieldName = 'NUMSAMPLESTHUMODEL'
    end
    object cdsDepCovrTarget2NUMSAMPLESMUSMP: TFloatField
      FieldName = 'NUMSAMPLESMUSMP'
    end
    object cdsDepCovrTarget2SDEV64: TFloatField
      FieldName = 'SDEV64'
    end
    object cdsDepCovrTarget2SDEV74: TFloatField
      FieldName = 'SDEV74'
    end
    object cdsDepCovrTarget2SDEV84: TFloatField
      FieldName = 'SDEV84'
    end
    object cdsDepCovrTarget2SDEV76: TFloatField
      FieldName = 'SDEV76'
    end
    object cdsDepCovrTarget2SDEV86: TFloatField
      FieldName = 'SDEV86'
    end
    object cdsDepCovrTarget2SDEVMU: TFloatField
      FieldName = 'SDEVMU'
    end
    object cdsDepCovrTarget2SDEV64MODEL: TFloatField
      FieldName = 'SDEV64MODEL'
    end
    object cdsDepCovrTarget2SDEV74MODEL: TFloatField
      FieldName = 'SDEV74MODEL'
    end
    object cdsDepCovrTarget2SDEVTHUMODEL: TFloatField
      FieldName = 'SDEVTHUMODEL'
    end
    object cdsDepCovrTarget2SDEVMUSMP: TFloatField
      FieldName = 'SDEVMUSMP'
    end
    object cdsDepCovrTarget2COEFFVAR64: TFloatField
      FieldName = 'COEFFVAR64'
    end
    object cdsDepCovrTarget2COEFFVAR74: TFloatField
      FieldName = 'COEFFVAR74'
    end
    object cdsDepCovrTarget2COEFFVAR84: TFloatField
      FieldName = 'COEFFVAR84'
    end
    object cdsDepCovrTarget2COEFFVAR76: TFloatField
      FieldName = 'COEFFVAR76'
    end
    object cdsDepCovrTarget2COEFFVAR86: TFloatField
      FieldName = 'COEFFVAR86'
    end
    object cdsDepCovrTarget2COEFFVARMU: TFloatField
      FieldName = 'COEFFVARMU'
    end
    object cdsDepCovrTarget2COEFFVAR64MODEL: TFloatField
      FieldName = 'COEFFVAR64MODEL'
    end
    object cdsDepCovrTarget2COEFFVAR74MODEL: TFloatField
      FieldName = 'COEFFVAR74MODEL'
    end
    object cdsDepCovrTarget2COEFFVARTHUMODEL: TFloatField
      FieldName = 'COEFFVARTHUMODEL'
    end
    object cdsDepCovrTarget2COEFFVARMUSMP: TFloatField
      FieldName = 'COEFFVARMUSMP'
    end
    object cdsDepCovrTarget2CORREL76: TFloatField
      FieldName = 'CORREL76'
    end
    object cdsDepCovrTarget2CORREL86: TFloatField
      FieldName = 'CORREL86'
    end
    object cdsDepCovrTarget2MODELID: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object cdsDepCovrTarget2AVERLEAST_1: TStringField
      FieldName = 'AVERLEAST_1'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsDepCovrTarget2AVERAGELEAST: TStringField
      FieldName = 'AVERAGELEAST'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsDepCovrTarget2IQR64: TFloatField
      FieldName = 'IQR64'
      Required = True
    end
    object cdsDepCovrTarget2IQR74: TFloatField
      FieldName = 'IQR74'
    end
    object cdsDepCovrTarget2IQR84: TFloatField
      FieldName = 'IQR84'
    end
    object cdsDepCovrTarget2IQR76: TFloatField
      FieldName = 'IQR76'
    end
    object cdsDepCovrTarget2IQR86: TFloatField
      FieldName = 'IQR86'
    end
    object cdsDepCovrTarget2IQRMU: TFloatField
      FieldName = 'IQRMU'
    end
    object cdsDepCovrTarget2IQR64MODEL: TFloatField
      FieldName = 'IQR64MODEL'
    end
    object cdsDepCovrTarget2IQR74MODEL: TFloatField
      FieldName = 'IQR74MODEL'
    end
    object cdsDepCovrTarget2IQRTHUMODEL: TFloatField
      FieldName = 'IQRTHUMODEL'
    end
    object cdsDepCovrTarget2IQRMUSMP: TFloatField
      FieldName = 'IQRMUSMP'
    end
    object cdsDepCovrTarget2MEDIANSR87INITIAL: TFloatField
      FieldName = 'MEDIANSR87INITIAL'
    end
    object cdsDepCovrTarget2MEDIANND143INITIAL: TFloatField
      FieldName = 'MEDIANND143INITIAL'
    end
    object cdsDepCovrTarget2MEDIANOS187INITIAL: TFloatField
      FieldName = 'MEDIANOS187INITIAL'
    end
    object cdsDepCovrTarget2MEDIANS34: TFloatField
      FieldName = 'MEDIANS34'
    end
    object cdsDepCovrTarget2MEDIANSO434: TFloatField
      FieldName = 'MEDIANSO434'
    end
    object cdsDepCovrTarget2MEDIANO18: TFloatField
      FieldName = 'MEDIANO18'
    end
    object cdsDepCovrTarget2MEANSR87INITIAL: TFloatField
      FieldName = 'MEANSR87INITIAL'
    end
    object cdsDepCovrTarget2MEANND143INITIAL: TFloatField
      FieldName = 'MEANND143INITIAL'
    end
    object cdsDepCovrTarget2MEANOS187INITIAL: TFloatField
      FieldName = 'MEANOS187INITIAL'
    end
    object cdsDepCovrTarget2MEANS34: TFloatField
      FieldName = 'MEANS34'
    end
    object cdsDepCovrTarget2MEANSO434: TFloatField
      FieldName = 'MEANSO434'
    end
    object cdsDepCovrTarget2MEANO18: TFloatField
      FieldName = 'MEANO18'
    end
    object cdsDepCovrTarget2NUMSAMPLESSR87INITIAL: TFloatField
      FieldName = 'NUMSAMPLESSR87INITIAL'
    end
    object cdsDepCovrTarget2NUMSAMPLESND143INITIAL: TFloatField
      FieldName = 'NUMSAMPLESND143INITIAL'
    end
    object cdsDepCovrTarget2NUMSAMPLESOS187INITIAL: TFloatField
      FieldName = 'NUMSAMPLESOS187INITIAL'
    end
    object cdsDepCovrTarget2NUMSAMPLESS34: TFloatField
      FieldName = 'NUMSAMPLESS34'
    end
    object cdsDepCovrTarget2NUMSAMPLESSO434: TFloatField
      FieldName = 'NUMSAMPLESSO434'
    end
    object cdsDepCovrTarget2NUMSAMPLESO18: TFloatField
      FieldName = 'NUMSAMPLESO18'
    end
    object cdsDepCovrTarget2SDEVSR87INITIAL: TFloatField
      FieldName = 'SDEVSR87INITIAL'
    end
    object cdsDepCovrTarget2SDEVND143INITIAL: TFloatField
      FieldName = 'SDEVND143INITIAL'
    end
    object cdsDepCovrTarget2SDEVOS187INITIAL: TFloatField
      FieldName = 'SDEVOS187INITIAL'
    end
    object cdsDepCovrTarget2SDEVS34: TFloatField
      FieldName = 'SDEVS34'
    end
    object cdsDepCovrTarget2SDEVSO434: TFloatField
      FieldName = 'SDEVSO434'
    end
    object cdsDepCovrTarget2SDEVO18: TFloatField
      FieldName = 'SDEVO18'
    end
    object cdsDepCovrTarget2COEFFVARSR87INITIAL: TFloatField
      FieldName = 'COEFFVARSR87INITIAL'
    end
    object cdsDepCovrTarget2COEFFVARND143INITIAL: TFloatField
      FieldName = 'COEFFVARND143INITIAL'
    end
    object cdsDepCovrTarget2COEFFVAROS187INITIAL: TFloatField
      FieldName = 'COEFFVAROS187INITIAL'
    end
    object cdsDepCovrTarget2COEFFVARS34: TFloatField
      FieldName = 'COEFFVARS34'
    end
    object cdsDepCovrTarget2COEFFVARSO434: TFloatField
      FieldName = 'COEFFVARSO434'
    end
    object cdsDepCovrTarget2COEFFVARO18: TFloatField
      FieldName = 'COEFFVARO18'
    end
    object cdsDepCovrTarget2IQRSR87INITIAL: TFloatField
      FieldName = 'IQRSR87INITIAL'
    end
    object cdsDepCovrTarget2IQRND143INITIAL: TFloatField
      FieldName = 'IQRND143INITIAL'
    end
    object cdsDepCovrTarget2IQROS187INITIAL: TFloatField
      FieldName = 'IQROS187INITIAL'
    end
    object cdsDepCovrTarget2IQRS34: TFloatField
      FieldName = 'IQRS34'
    end
    object cdsDepCovrTarget2IQRSO434: TFloatField
      FieldName = 'IQRSO434'
    end
    object cdsDepCovrTarget2IQRO18: TFloatField
      FieldName = 'IQRO18'
    end
    object cdsDepCovrTarget2MEDIAN84MODEL: TFloatField
      FieldName = 'MEDIAN84MODEL'
    end
    object cdsDepCovrTarget2MEDIANTHUSAMPLES: TFloatField
      FieldName = 'MEDIANTHUSAMPLES'
    end
    object cdsDepCovrTarget2MEDIANHF176INITIAL: TFloatField
      FieldName = 'MEDIANHF176INITIAL'
    end
    object cdsDepCovrTarget2MEANHF176INITIAL: TFloatField
      FieldName = 'MEANHF176INITIAL'
    end
    object cdsDepCovrTarget2NUMSAMPLESHF176INITIAL: TFloatField
      FieldName = 'NUMSAMPLESHF176INITIAL'
    end
    object cdsDepCovrTarget2SDEVHF176INITIAL: TFloatField
      FieldName = 'SDEVHF176INITIAL'
    end
    object cdsDepCovrTarget2COEFFVARHF176INITIAL: TFloatField
      FieldName = 'COEFFVARHF176INITIAL'
    end
    object cdsDepCovrTarget2IQRHF176INITIAL: TFloatField
      FieldName = 'IQRHF176INITIAL'
    end
  end
  object dsDepCovrTarget2: TDataSource
    DataSet = cdsDepCovrTarget2
    Left = 288
    Top = 631
  end
  object qVarProspect: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.SAMPLENO, SMPDATA.FRAC, SMPDATA.DATAVALUE,'
      '  SMPDATA.VARIABLEID,SMPDATA.NORMALISINGSTANDARD,'
      '  STANDARDS.STANDARDNAME,'
      '  SMPDATA.REFNUM,SOURCELIST.SOURCESHORT'
      'FROM SMPDATA,USERVAR,STANDARDS,SOURCELIST'
      'WHERE USERVAR.USERID = :UserID'
      'AND SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID=USERVAR.VARIABLEID'
      'AND SMPDATA.NORMALISINGSTANDARD=STANDARDS.STANDARDID'
      'AND SMPDATA.REFNUM=SOURCELIST.SOURCENUM'
      'ORDER BY SMPDATA.SAMPLENO,SMPDATA.FRAC')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 175
  end
  object cdsVarProspect: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqVarProspect
    Params = <>
    Left = 420
    Top = 175
    object cdsVarProspectSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVarProspectFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsVarProspectVARIABLEID: TStringField
      FieldName = 'VARIABLEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsVarProspectDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      Required = True
      DisplayFormat = '#####0.000000'
    end
    object cdsVarProspectNORMALISINGSTANDARD: TStringField
      FieldName = 'NORMALISINGSTANDARD'
      Required = True
      Size = 10
    end
    object cdsVarProspectREFNUM: TIntegerField
      FieldName = 'REFNUM'
      Required = True
    end
    object cdsVarProspectSTANDARDNAME: TStringField
      FieldName = 'STANDARDNAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsVarProspectSOURCESHORT: TStringField
      FieldName = 'SOURCESHORT'
      Required = True
      Size = 100
    end
  end
  object dsVarProspect: TDataSource
    DataSet = cdsVarProspect
    Left = 448
    Top = 175
  end
  object qPb64: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS PB64'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'206Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 223
  end
  object cdsPb64: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqPb64
    Params = <>
    Left = 420
    Top = 223
    object cdsPb64PB64: TFloatField
      FieldName = 'PB64'
      Required = True
    end
  end
  object dsPb64: TDataSource
    DataSet = cdsPb64
    Left = 448
    Top = 223
  end
  object qPb74: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS PB74'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'207Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 267
  end
  object cdsPb74: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqPb74
    Params = <>
    Left = 420
    Top = 267
    object cdsPb74PB74: TFloatField
      FieldName = 'PB74'
      Required = True
    end
  end
  object dsPb74: TDataSource
    DataSet = cdsPb74
    Left = 448
    Top = 267
  end
  object qPb84: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS PB84'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'208Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 315
  end
  object cdsPb84: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqPb84
    Params = <>
    Left = 420
    Top = 315
    object cdsPb84PB84: TFloatField
      FieldName = 'PB84'
      Required = True
    end
  end
  object dsPb84: TDataSource
    DataSet = cdsPb84
    Left = 448
    Top = 315
  end
  object qSig64: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS Sig64'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's206Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 492
    Top = 223
  end
  object cdsSig64: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSig64
    Params = <>
    Left = 520
    Top = 223
    object cdsSig64SIG64: TFloatField
      FieldName = 'SIG64'
      Required = True
    end
  end
  object dsSig64: TDataSource
    DataSet = cdsSig64
    Left = 548
    Top = 223
  end
  object qE64: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS E64'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e206Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 592
    Top = 223
  end
  object cdsE64: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqE64
    Params = <>
    Left = 620
    Top = 223
    object cdsE64E64: TFloatField
      FieldName = 'E64'
      Required = True
    end
  end
  object dsE64: TDataSource
    DataSet = cdsE64
    Left = 648
    Top = 223
  end
  object qSig74: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS Sig74'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's207Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 492
    Top = 267
  end
  object cdsSig74: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSig74
    Params = <>
    Left = 520
    Top = 267
    object cdsSig74SIG74: TFloatField
      FieldName = 'SIG74'
      Required = True
    end
  end
  object dsSig74: TDataSource
    DataSet = cdsSig74
    Left = 548
    Top = 267
  end
  object qE74: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS E74'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e207Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 592
    Top = 267
  end
  object cdsE74: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqE74
    Params = <>
    Left = 620
    Top = 267
    object cdsE74E74: TFloatField
      FieldName = 'E74'
      Required = True
    end
  end
  object dsE74: TDataSource
    DataSet = cdsE74
    Left = 648
    Top = 267
  end
  object qSig84: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS Sig84'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's208Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 315
  end
  object cdsSig84: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSig84
    Params = <>
    Left = 524
    Top = 315
    object cdsSig84SIG84: TFloatField
      FieldName = 'SIG84'
      Required = True
    end
  end
  object dsSig84: TDataSource
    DataSet = cdsSig84
    Left = 552
    Top = 315
  end
  object qE84: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS E84'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e208Pb204Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 315
  end
  object cdsE84: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqE84
    Params = <>
    Left = 624
    Top = 315
    object cdsE84E84: TFloatField
      FieldName = 'E84'
      Required = True
    end
  end
  object dsE84: TDataSource
    DataSet = cdsE84
    Left = 652
    Top = 315
  end
  object qPb76: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS PB76'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'207Pb206Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 359
  end
  object cdsPb76: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqPb76
    Params = <>
    Left = 420
    Top = 359
    object cdsPb76PB76: TFloatField
      FieldName = 'PB76'
      Required = True
    end
  end
  object dsPb76: TDataSource
    DataSet = cdsPb76
    Left = 448
    Top = 359
  end
  object qSig76: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS Sig76'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's207Pb206Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 359
  end
  object cdsSig76: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSig76
    Params = <>
    Left = 524
    Top = 359
    object cdsSig76SIG76: TFloatField
      FieldName = 'SIG76'
      Required = True
    end
  end
  object dsSig76: TDataSource
    DataSet = cdsSig76
    Left = 552
    Top = 359
  end
  object qE76: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS E76'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e207Pb206Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 359
  end
  object cdsE76: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqE76
    Params = <>
    Left = 624
    Top = 359
    object cdsE76E76: TFloatField
      FieldName = 'E76'
      Required = True
    end
  end
  object dsE76: TDataSource
    DataSet = cdsE76
    Left = 652
    Top = 359
  end
  object qPb86: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS PB86'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'208Pb206Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 403
  end
  object cdsPb86: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqPb86
    Params = <>
    Left = 420
    Top = 403
    object cdsPb86PB86: TFloatField
      FieldName = 'PB86'
    end
  end
  object dsPb86: TDataSource
    DataSet = cdsPb86
    Left = 448
    Top = 403
  end
  object qSig86: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS Sig86'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's208Pb206Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 403
  end
  object cdsSig86: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSig86
    Params = <>
    Left = 524
    Top = 403
    object cdsSig86SIG86: TFloatField
      FieldName = 'SIG86'
      Required = True
    end
  end
  object dsSig86: TDataSource
    DataSet = cdsSig86
    Left = 552
    Top = 403
  end
  object qE86: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS E86'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e208Pb206Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 403
  end
  object cdsE86: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqE86
    Params = <>
    Left = 624
    Top = 403
    object cdsE86E86: TFloatField
      FieldName = 'E86'
      Required = True
    end
  end
  object dsE86: TDataSource
    DataSet = cdsE86
    Left = 652
    Top = 403
  end
  object qR76: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS R76'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'r207Pb206Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 447
  end
  object cdsR76: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqR76
    Params = <>
    Left = 420
    Top = 447
    object cdsR76R76: TFloatField
      FieldName = 'R76'
      Required = True
    end
  end
  object dsR76: TDataSource
    DataSet = cdsR76
    Left = 448
    Top = 447
  end
  object qR86: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS R86'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'r208Pb206Pb'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 491
  end
  object cdsR86: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqR86
    Params = <>
    Left = 420
    Top = 491
    object cdsR86R86: TFloatField
      FieldName = 'R86'
      Required = True
    end
  end
  object dsR86: TDataSource
    DataSet = cdsR86
    Left = 448
    Top = 491
  end
  object qAverLeast: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM AVERLEAST')
    SQLConnection = sqlcDateView
    Left = 6
    Top = 459
  end
  object dspAverLeast: TDataSetProvider
    DataSet = qAverLeast
    Left = 34
    Top = 459
  end
  object cdsAverLeast: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAverLeast'
    Left = 62
    Top = 459
    object cdsAverLeastAVERLEAST: TStringField
      FieldName = 'AVERLEAST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsAverLeastAVERAGELEAST: TStringField
      FieldName = 'AVERAGELEAST'
      Required = True
    end
  end
  object dsAverLeast: TDataSource
    DataSet = cdsAverLeast
    Left = 90
    Top = 459
  end
  object qInsertDepCovrProspect: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'AverLeast'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO DEPCOVR'
      '(DEPOSITID, AVERLEAST)'
      'Values (:DepositID, :AverLeast)')
    SQLConnection = sqlcDateView
    Left = 212
    Top = 371
  end
  object qUserDepSmp: TSQLQuery
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
      end>
    SQL.Strings = (
      'SELECT * FROM USERDEPSAMPLEVALUES'
      'WHERE USERDEPSAMPLEVALUES.USERID = :UserID'
      'AND USERDEPSAMPLEVALUES.DEPOSITID = :DepositID'
      'ORDER BY USERDEPSAMPLEVALUES.SAMPLENO, USERDEPSAMPLEVALUES.FRAC')
    SQLConnection = sqlcDateView
    Left = 186
    Top = 315
    object qUserDepSmpUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object qUserDepSmpDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      Required = True
    end
    object qUserDepSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object qUserDepSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object qUserDepSmpMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object qUserDepSmpINC4STATS: TStringField
      FieldName = 'INC4STATS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qUserDepSmpPB64: TFloatField
      FieldName = 'PB64'
    end
    object qUserDepSmpSPB64: TFloatField
      FieldName = 'SPB64'
    end
    object qUserDepSmpEPB64: TFloatField
      FieldName = 'EPB64'
    end
    object qUserDepSmpPB74: TFloatField
      FieldName = 'PB74'
    end
    object qUserDepSmpSPB74: TFloatField
      FieldName = 'SPB74'
    end
    object qUserDepSmpEPB74: TFloatField
      FieldName = 'EPB74'
    end
    object qUserDepSmpPB84: TFloatField
      FieldName = 'PB84'
    end
    object qUserDepSmpSPB84: TFloatField
      FieldName = 'SPB84'
    end
    object qUserDepSmpEPB84: TFloatField
      FieldName = 'EPB84'
    end
    object qUserDepSmpMU: TFloatField
      FieldName = 'MU'
    end
    object qUserDepSmpSMU: TFloatField
      FieldName = 'SMU'
    end
    object qUserDepSmpMUSMP: TFloatField
      FieldName = 'MUSMP'
    end
    object qUserDepSmpPB76: TFloatField
      FieldName = 'PB76'
    end
    object qUserDepSmpSPB76: TFloatField
      FieldName = 'SPB76'
    end
    object qUserDepSmpEPB76: TFloatField
      FieldName = 'EPB76'
    end
    object qUserDepSmpRHO76: TFloatField
      FieldName = 'RHO76'
    end
    object qUserDepSmpPB86: TFloatField
      FieldName = 'PB86'
    end
    object qUserDepSmpSPB86: TFloatField
      FieldName = 'SPB86'
    end
    object qUserDepSmpEPB86: TFloatField
      FieldName = 'EPB86'
    end
    object qUserDepSmpRHO86: TFloatField
      FieldName = 'RHO86'
    end
    object qUserDepSmpKAPPASRC: TFloatField
      FieldName = 'KAPPASRC'
    end
    object qUserDepSmpSKAPPASRC: TFloatField
      FieldName = 'SKAPPASRC'
    end
    object qUserDepSmpKAPPASMP: TFloatField
      FieldName = 'KAPPASMP'
    end
    object qUserDepSmpSKAPPASMP: TFloatField
      FieldName = 'SKAPPASMP'
    end
    object qUserDepSmpSR87I: TFloatField
      FieldName = 'SR87I'
    end
    object qUserDepSmpSSR87I: TFloatField
      FieldName = 'SSR87I'
    end
    object qUserDepSmpESR87I: TFloatField
      FieldName = 'ESR87I'
    end
    object qUserDepSmpND143I: TFloatField
      FieldName = 'ND143I'
    end
    object qUserDepSmpSND143I: TFloatField
      FieldName = 'SND143I'
    end
    object qUserDepSmpEND143I: TFloatField
      FieldName = 'END143I'
    end
    object qUserDepSmpHF176I: TFloatField
      FieldName = 'HF176I'
    end
    object qUserDepSmpSHF176I: TFloatField
      FieldName = 'SHF176I'
    end
    object qUserDepSmpEHF176I: TFloatField
      FieldName = 'EHF176I'
    end
    object qUserDepSmpOS187I: TFloatField
      FieldName = 'OS187I'
    end
    object qUserDepSmpSOS187I: TFloatField
      FieldName = 'SOS187I'
    end
    object qUserDepSmpEOS187I: TFloatField
      FieldName = 'EOS187I'
    end
    object qUserDepSmpS34: TFloatField
      FieldName = 'S34'
    end
    object qUserDepSmpSS34: TFloatField
      FieldName = 'SS34'
    end
    object qUserDepSmpSO434: TFloatField
      FieldName = 'SO434'
    end
    object qUserDepSmpSSO434: TFloatField
      FieldName = 'SSO434'
    end
    object qUserDepSmpO18: TFloatField
      FieldName = 'O18'
    end
    object qUserDepSmpSO18: TFloatField
      FieldName = 'SO18'
    end
  end
  object dspUserDepSmp: TDataSetProvider
    DataSet = qUserDepSmp
    Left = 214
    Top = 315
  end
  object cdsUserDepSmp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserDepSmp'
    Left = 242
    Top = 315
    object cdsUserDepSmpUSERID: TStringField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUserDepSmpDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      Required = True
    end
    object cdsUserDepSmpSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      Required = True
    end
    object cdsUserDepSmpFRAC: TStringField
      FieldName = 'FRAC'
      Required = True
      Size = 15
    end
    object cdsUserDepSmpMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsUserDepSmpINC4STATS: TStringField
      FieldName = 'INC4STATS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsUserDepSmpPB64: TFloatField
      FieldName = 'PB64'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpSPB64: TFloatField
      FieldName = 'SPB64'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpEPB64: TFloatField
      FieldName = 'EPB64'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpPB74: TFloatField
      FieldName = 'PB74'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpSPB74: TFloatField
      FieldName = 'SPB74'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpEPB74: TFloatField
      FieldName = 'EPB74'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpPB84: TFloatField
      FieldName = 'PB84'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpSPB84: TFloatField
      FieldName = 'SPB84'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpEPB84: TFloatField
      FieldName = 'EPB84'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpMU: TFloatField
      FieldName = 'MU'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpSMU: TFloatField
      FieldName = 'SMU'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpPB76: TFloatField
      FieldName = 'PB76'
      DisplayFormat = '#0.00000'
    end
    object cdsUserDepSmpSPB76: TFloatField
      FieldName = 'SPB76'
      DisplayFormat = '#0.00000'
    end
    object cdsUserDepSmpEPB76: TFloatField
      FieldName = 'EPB76'
    end
    object cdsUserDepSmpPB86: TFloatField
      FieldName = 'PB86'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpSPB86: TFloatField
      FieldName = 'SPB86'
      DisplayFormat = '#0.00000'
    end
    object cdsUserDepSmpEPB86: TFloatField
      FieldName = 'EPB86'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpRHO76: TFloatField
      FieldName = 'RHO76'
      DisplayFormat = '#0.000'
    end
    object cdsUserDepSmpRHO86: TFloatField
      FieldName = 'RHO86'
      DisplayFormat = '#0.000'
    end
    object cdsUserDepSmpMUSMP: TFloatField
      FieldName = 'MUSMP'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpSR87I: TFloatField
      FieldName = 'SR87I'
      DisplayFormat = '##0.000000'
    end
    object cdsUserDepSmpSSR87I: TFloatField
      FieldName = 'SSR87I'
      DisplayFormat = '##0.000000'
    end
    object cdsUserDepSmpESR87I: TFloatField
      FieldName = 'ESR87I'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpND143I: TFloatField
      FieldName = 'ND143I'
      DisplayFormat = '##0.000000'
    end
    object cdsUserDepSmpSND143I: TFloatField
      FieldName = 'SND143I'
      DisplayFormat = '##0.000000'
    end
    object cdsUserDepSmpEND143I: TFloatField
      FieldName = 'END143I'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpHF176I: TFloatField
      FieldName = 'HF176I'
      DisplayFormat = '##0.000000'
    end
    object cdsUserDepSmpSHF176I: TFloatField
      FieldName = 'SHF176I'
      DisplayFormat = '##0.000000'
    end
    object cdsUserDepSmpEHF176I: TFloatField
      FieldName = 'EHF176I'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpOS187I: TFloatField
      FieldName = 'OS187I'
      DisplayFormat = '##0.000000'
    end
    object cdsUserDepSmpSOS187I: TFloatField
      FieldName = 'SOS187I'
      DisplayFormat = '##0.000000'
    end
    object cdsUserDepSmpEOS187I: TFloatField
      FieldName = 'EOS187I'
      DisplayFormat = '0.0'
    end
    object cdsUserDepSmpS34: TFloatField
      FieldName = 'S34'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsUserDepSmpSS34: TFloatField
      FieldName = 'SS34'
      DisplayFormat = '####0.00'
    end
    object cdsUserDepSmpSO434: TFloatField
      FieldName = 'SO434'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsUserDepSmpSSO434: TFloatField
      FieldName = 'SSO434'
      DisplayFormat = '####0.00'
    end
    object cdsUserDepSmpO18: TFloatField
      FieldName = 'O18'
      Required = True
      DisplayFormat = '####0.00'
    end
    object cdsUserDepSmpSO18: TFloatField
      FieldName = 'SO18'
      DisplayFormat = '####0.00'
    end
    object cdsUserDepSmpKAPPASRC: TFloatField
      FieldName = 'KAPPASRC'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpSKAPPASRC: TFloatField
      FieldName = 'SKAPPASRC'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpKAPPASMP: TFloatField
      FieldName = 'KAPPASMP'
      DisplayFormat = '###0.000'
    end
    object cdsUserDepSmpSKAPPASMP: TFloatField
      FieldName = 'SKAPPASMP'
      DisplayFormat = '###0.000'
    end
  end
  object dsUserDepSmp: TDataSource
    DataSet = cdsUserDepSmp
    Left = 270
    Top = 315
  end
  object qDeleteUserDepSmp: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM USERDEPSAMPLEVALUES'
      'WHERE USERDEPSAMPLEVALUES.USERID = :UserID'
      'AND USERDEPSAMPLEVALUES.DEPOSITID = :DepositID')
    SQLConnection = sqlcDateView
    Left = 188
    Top = 267
  end
  object qSr87: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS Sr87i     '
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'87Sr86Sr'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 535
  end
  object cdsSr87: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSr87
    Params = <>
    Left = 420
    Top = 535
    object cdsSr87SR87I: TFloatField
      FieldName = 'SR87I'
      Required = True
    end
  end
  object dsSr87: TDataSource
    DataSet = cdsSr87
    Left = 448
    Top = 535
  end
  object qSigSr87: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS SigSr87i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's87Sr86Sr'#39
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 535
  end
  object cdsSigSr87: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSigSr87
    Params = <>
    Left = 524
    Top = 535
    object cdsSigSr87SIGSR87: TFloatField
      FieldName = 'SIGSR87I'
      Required = True
    end
  end
  object dsSigSr87: TDataSource
    DataSet = cdsSigSr87
    Left = 552
    Top = 535
  end
  object qESr87: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS ESr87i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e87Sr86Sr'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 535
  end
  object cdsESr87: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqESr87
    Params = <>
    Left = 624
    Top = 535
    object cdsESr87ESR87: TFloatField
      FieldName = 'ESR87I'
      Required = True
    end
  end
  object dsESr87: TDataSource
    DataSet = cdsESr87
    Left = 652
    Top = 535
  end
  object qNd143: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS Nd143i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'143Nd144Nd'#39
      '')
    SQLConnection = sqlcDateView
    Left = 396
    Top = 579
  end
  object cdsNd143: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqNd143
    Params = <>
    Left = 424
    Top = 579
    object cdsNd143ND143I: TFloatField
      FieldName = 'ND143I'
      Required = True
    end
  end
  object dsNd143: TDataSource
    DataSet = cdsNd143
    Left = 452
    Top = 579
  end
  object qSigNd143: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS SigNd143i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's143Nd144Nd'#39
      '')
    SQLConnection = sqlcDateView
    Left = 500
    Top = 579
  end
  object cdsSigNd143: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSigNd143
    Params = <>
    Left = 528
    Top = 579
    object cdsSigNd143SIGND143: TFloatField
      FieldName = 'SIGND143I'
      Required = True
    end
  end
  object dsSigNd143: TDataSource
    DataSet = cdsSigNd143
    Left = 556
    Top = 579
  end
  object qENd143: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS ENd143i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e143Nd144Nd'#39
      '')
    SQLConnection = sqlcDateView
    Left = 600
    Top = 579
  end
  object cdsENd143: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqENd143
    Params = <>
    Left = 628
    Top = 579
    object cdsENd143END143: TFloatField
      FieldName = 'END143I'
      Required = True
    end
  end
  object dsENd143: TDataSource
    DataSet = cdsENd143
    Left = 656
    Top = 579
  end
  object qOs187: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS Os187i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'187Os188Os'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 623
  end
  object cdsOs187: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqOs187
    Params = <>
    Left = 420
    Top = 623
    object cdsOs187OS187I: TFloatField
      FieldName = 'OS187I'
      Required = True
    end
  end
  object dsOs187: TDataSource
    DataSet = cdsOs187
    Left = 448
    Top = 623
  end
  object qSigOs187: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS SigOs187i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's187Os188Os'#39
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 623
  end
  object cdsSigOs187: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSigOs187
    Params = <>
    Left = 524
    Top = 623
    object cdsSigOs187SIGOS187: TFloatField
      FieldName = 'SIGOS187I'
      Required = True
    end
  end
  object dsSigOs187: TDataSource
    DataSet = cdsSigOs187
    Left = 552
    Top = 623
  end
  object qEOs187: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS EOs187i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e187Os188Os'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 623
  end
  object cdsEOs187: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqEOs187
    Params = <>
    Left = 624
    Top = 623
    object cdsEOs187EOS187: TFloatField
      FieldName = 'EOS187I'
      Required = True
    end
  end
  object dsEOs187: TDataSource
    DataSet = cdsEOs187
    Left = 652
    Top = 623
  end
  object qDepositSamplesProspect: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT DEPOSITSAMPLES.DEPOSITID, DEPOSITSAMPLES.SAMPLENO,'
      '  DEPOSITSAMPLES.FRAC,DEPOSITSAMPLES.INCL4STATS,'
      '  SMPDATA.DATAVALUE,SMPDATA.MATERIALABR'
      'FROM DEPOSITSAMPLES, SMPDATA'
      'WHERE DEPOSITSAMPLES.DEPOSITID = :DepositID'
      'AND DEPOSITSAMPLES.SAMPLENO=SMPDATA.SAMPLENO'
      'AND DEPOSITSAMPLES.FRAC = SMPDATA.FRAC'
      'AND (SMPDATA.VARIABLEID='#39'207Pb204Pb'#39' or'
      '  SMPDATA.VARIABLEID='#39'34Ssulphide'#39' OR'
      '  SMPDATA.VARIABLEID='#39'34Ssphalerite'#39' OR'
      '  SMPDATA.VARIABLEID='#39'34Ssulphate'#39' OR'
      '  SMPDATA.VARIABLEID='#39'187Os188Os'#39' or'
      '  SMPDATA.VARIABLEID='#39'143Nd144Nd'#39' OR'
      '  SMPDATA.VARIABLEID='#39'176Hf177Hf'#39' or'
      '  SMPDATA.VARIABLEID='#39'87Sr86Sr'#39' OR'
      '  SMPDATA.VARIABLEID='#39'Delta18O'#39')'
      
        'ORDER BY SMPDATA.DATAVALUE, DEPOSITSAMPLES.SAMPLENO,DEPOSITSAMPL' +
        'ES.FRAC')
    SQLConnection = sqlcDateView
    Left = 368
    Top = 135
    object qDepositSamplesProspectDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositSamplesProspectSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepositSamplesProspectFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object qDepositSamplesProspectINCL4STATS: TStringField
      FieldName = 'INCL4STATS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepositSamplesProspectDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      DisplayFormat = '##0.000'
    end
    object qDepositSamplesProspectMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
  end
  object dspDepositSamplesProspect: TDataSetProvider
    DataSet = qDepositSamplesProspect
    Constraints = False
    Left = 432
    Top = 135
  end
  object dsqDepositSamplesProspect: TDataSource
    DataSet = qDepositSamplesProspect
    Left = 400
    Top = 135
  end
  object cdsDepositSamplesProspect: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepositSamplesProspect'
    Left = 464
    Top = 135
    object cdsDepositSamplesProspectDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositSamplesProspectSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepositSamplesProspectFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsDepositSamplesProspectINCL4STATS: TStringField
      FieldName = 'INCL4STATS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepositSamplesProspectMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsDepositSamplesProspectqVarProspect: TDataSetField
      FieldName = 'qVarProspect'
    end
    object cdsDepositSamplesProspectqE64: TDataSetField
      FieldName = 'qE64'
    end
    object cdsDepositSamplesProspectqE74: TDataSetField
      FieldName = 'qE74'
    end
    object cdsDepositSamplesProspectqE84: TDataSetField
      FieldName = 'qE84'
    end
    object cdsDepositSamplesProspectqE76: TDataSetField
      FieldName = 'qE76'
    end
    object cdsDepositSamplesProspectqE86: TDataSetField
      FieldName = 'qE86'
    end
    object cdsDepositSamplesProspectqSig64: TDataSetField
      FieldName = 'qSig64'
    end
    object cdsDepositSamplesProspectqSig74: TDataSetField
      FieldName = 'qSig74'
    end
    object cdsDepositSamplesProspectqSig84: TDataSetField
      FieldName = 'qSig84'
    end
    object cdsDepositSamplesProspectqSig76: TDataSetField
      FieldName = 'qSig76'
    end
    object cdsDepositSamplesProspectqSig86: TDataSetField
      FieldName = 'qSig86'
    end
    object cdsDepositSamplesProspectqESr87: TDataSetField
      FieldName = 'qESr87'
    end
    object cdsDepositSamplesProspectqENd143: TDataSetField
      FieldName = 'qENd143'
    end
    object cdsDepositSamplesProspectqEOs187: TDataSetField
      FieldName = 'qEOs187'
    end
    object cdsDepositSamplesProspectqSigSr87: TDataSetField
      FieldName = 'qSigSr87'
    end
    object cdsDepositSamplesProspectqSigNd143: TDataSetField
      FieldName = 'qSigNd143'
    end
    object cdsDepositSamplesProspectqSigOs187: TDataSetField
      FieldName = 'qSigOs187'
    end
    object cdsDepositSamplesProspectqOs187: TDataSetField
      FieldName = 'qOs187'
    end
    object cdsDepositSamplesProspectqNd143: TDataSetField
      FieldName = 'qNd143'
    end
    object cdsDepositSamplesProspectqSr87: TDataSetField
      FieldName = 'qSr87'
    end
    object cdsDepositSamplesProspectqR86: TDataSetField
      FieldName = 'qR86'
    end
    object cdsDepositSamplesProspectqR76: TDataSetField
      FieldName = 'qR76'
    end
    object cdsDepositSamplesProspectqPb86: TDataSetField
      FieldName = 'qPb86'
    end
    object cdsDepositSamplesProspectqPb76: TDataSetField
      FieldName = 'qPb76'
    end
    object cdsDepositSamplesProspectqPb84: TDataSetField
      FieldName = 'qPb84'
    end
    object cdsDepositSamplesProspectqPb74: TDataSetField
      FieldName = 'qPb74'
    end
    object cdsDepositSamplesProspectqPb64: TDataSetField
      FieldName = 'qPb64'
    end
    object cdsDepositSamplesProspectqEO18: TDataSetField
      FieldName = 'qEO18'
    end
    object cdsDepositSamplesProspectqSigO18: TDataSetField
      FieldName = 'qSigO18'
    end
    object cdsDepositSamplesProspectqO18: TDataSetField
      FieldName = 'qO18'
    end
    object cdsDepositSamplesProspectqESO434: TDataSetField
      FieldName = 'qESO434'
    end
    object cdsDepositSamplesProspectqSigSO434: TDataSetField
      FieldName = 'qSigSO434'
    end
    object cdsDepositSamplesProspectqSO434: TDataSetField
      FieldName = 'qSO434'
    end
    object cdsDepositSamplesProspectqES34: TDataSetField
      FieldName = 'qES34'
    end
    object cdsDepositSamplesProspectqSigS34: TDataSetField
      FieldName = 'qSigS34'
    end
    object cdsDepositSamplesProspectqS34: TDataSetField
      FieldName = 'qS34'
    end
    object cdsDepositSamplesProspectDATAVALUE: TFloatField
      FieldName = 'DATAVALUE'
      ReadOnly = True
      DisplayFormat = '##0.000'
    end
    object cdsDepositSamplesProspectqeHf176: TDataSetField
      FieldName = 'qeHf176'
    end
    object cdsDepositSamplesProspectqSigHf176: TDataSetField
      FieldName = 'qSigHf176'
    end
    object cdsDepositSamplesProspectqHF176: TDataSetField
      FieldName = 'qHF176'
    end
  end
  object dsDepositSamplesProspect: TDataSource
    DataSet = cdsDepositSamplesProspect
    Left = 496
    Top = 135
  end
  object qDepCovrProspect: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM DEPCOVR,AVERLEAST'
      'WHERE DEPCOVR.DEPOSITID = :DepositID'
      'AND DEPCOVR.AVERLEAST=AVERLEAST.AVERLEAST')
    SQLConnection = sqlcDateView
    Left = 200
    Top = 535
    object qDepCovrProspectDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qDepCovrProspectAVERLEAST: TStringField
      FieldName = 'AVERLEAST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object qDepCovrProspectMEDIAN64: TFloatField
      FieldName = 'MEDIAN64'
    end
    object qDepCovrProspectMEDIAN74: TFloatField
      FieldName = 'MEDIAN74'
    end
    object qDepCovrProspectMEDIAN84: TFloatField
      FieldName = 'MEDIAN84'
    end
    object qDepCovrProspectMEDIAN76: TFloatField
      FieldName = 'MEDIAN76'
    end
    object qDepCovrProspectMEDIAN86: TFloatField
      FieldName = 'MEDIAN86'
    end
    object qDepCovrProspectMEDIANMU: TFloatField
      FieldName = 'MEDIANMU'
    end
    object qDepCovrProspectMEDIAN64MODEL: TFloatField
      FieldName = 'MEDIAN64MODEL'
    end
    object qDepCovrProspectMEDIAN74MODEL: TFloatField
      FieldName = 'MEDIAN74MODEL'
    end
    object qDepCovrProspectMEDIANTHUMODEL: TFloatField
      FieldName = 'MEDIANTHUMODEL'
    end
    object qDepCovrProspectMEDIANMUSAMPLES: TFloatField
      FieldName = 'MEDIANMUSAMPLES'
    end
    object qDepCovrProspectMEAN64: TFloatField
      FieldName = 'MEAN64'
    end
    object qDepCovrProspectMEAN74: TFloatField
      FieldName = 'MEAN74'
    end
    object qDepCovrProspectMEAN84: TFloatField
      FieldName = 'MEAN84'
    end
    object qDepCovrProspectMEAN76: TFloatField
      FieldName = 'MEAN76'
    end
    object qDepCovrProspectMEAN86: TFloatField
      FieldName = 'MEAN86'
    end
    object qDepCovrProspectMEANMU: TFloatField
      FieldName = 'MEANMU'
    end
    object qDepCovrProspectMEAN64MODEL: TFloatField
      FieldName = 'MEAN64MODEL'
    end
    object qDepCovrProspectMEAN74MODEL: TFloatField
      FieldName = 'MEAN74MODEL'
    end
    object qDepCovrProspectMEANTHUMODEL: TFloatField
      FieldName = 'MEANTHUMODEL'
    end
    object qDepCovrProspectMEANMUSAMPLES: TFloatField
      FieldName = 'MEANMUSAMPLES'
    end
    object qDepCovrProspectNUMSAMPLES64: TFloatField
      FieldName = 'NUMSAMPLES64'
    end
    object qDepCovrProspectNUMSAMPLES74: TFloatField
      FieldName = 'NUMSAMPLES74'
    end
    object qDepCovrProspectNUMSAMPLES84: TFloatField
      FieldName = 'NUMSAMPLES84'
    end
    object qDepCovrProspectNUMSAMPLES76: TFloatField
      FieldName = 'NUMSAMPLES76'
    end
    object qDepCovrProspectNUMSAMPLES86: TFloatField
      FieldName = 'NUMSAMPLES86'
    end
    object qDepCovrProspectNUMSAMPLESMU: TFloatField
      FieldName = 'NUMSAMPLESMU'
    end
    object qDepCovrProspectNUMSAMPLES64MODEL: TFloatField
      FieldName = 'NUMSAMPLES64MODEL'
    end
    object qDepCovrProspectNUMSAMPLES74MODEL: TFloatField
      FieldName = 'NUMSAMPLES74MODEL'
    end
    object qDepCovrProspectNUMSAMPLESTHUMODEL: TFloatField
      FieldName = 'NUMSAMPLESTHUMODEL'
    end
    object qDepCovrProspectNUMSAMPLESMUSMP: TFloatField
      FieldName = 'NUMSAMPLESMUSMP'
    end
    object qDepCovrProspectSDEV64: TFloatField
      FieldName = 'SDEV64'
    end
    object qDepCovrProspectSDEV74: TFloatField
      FieldName = 'SDEV74'
    end
    object qDepCovrProspectSDEV84: TFloatField
      FieldName = 'SDEV84'
    end
    object qDepCovrProspectSDEV76: TFloatField
      FieldName = 'SDEV76'
    end
    object qDepCovrProspectSDEV86: TFloatField
      FieldName = 'SDEV86'
    end
    object qDepCovrProspectSDEVMU: TFloatField
      FieldName = 'SDEVMU'
    end
    object qDepCovrProspectSDEV64MODEL: TFloatField
      FieldName = 'SDEV64MODEL'
    end
    object qDepCovrProspectSDEV74MODEL: TFloatField
      FieldName = 'SDEV74MODEL'
    end
    object qDepCovrProspectSDEVTHUMODEL: TFloatField
      FieldName = 'SDEVTHUMODEL'
    end
    object qDepCovrProspectSDEVMUSMP: TFloatField
      FieldName = 'SDEVMUSMP'
    end
    object qDepCovrProspectCOEFFVAR64: TFloatField
      FieldName = 'COEFFVAR64'
    end
    object qDepCovrProspectCOEFFVAR74: TFloatField
      FieldName = 'COEFFVAR74'
    end
    object qDepCovrProspectCOEFFVAR84: TFloatField
      FieldName = 'COEFFVAR84'
    end
    object qDepCovrProspectCOEFFVAR76: TFloatField
      FieldName = 'COEFFVAR76'
    end
    object qDepCovrProspectCOEFFVAR86: TFloatField
      FieldName = 'COEFFVAR86'
    end
    object qDepCovrProspectCOEFFVARMU: TFloatField
      FieldName = 'COEFFVARMU'
    end
    object qDepCovrProspectCOEFFVAR64MODEL: TFloatField
      FieldName = 'COEFFVAR64MODEL'
    end
    object qDepCovrProspectCOEFFVAR74MODEL: TFloatField
      FieldName = 'COEFFVAR74MODEL'
    end
    object qDepCovrProspectCOEFFVARTHUMODEL: TFloatField
      FieldName = 'COEFFVARTHUMODEL'
    end
    object qDepCovrProspectCOEFFVARMUSMP: TFloatField
      FieldName = 'COEFFVARMUSMP'
    end
    object qDepCovrProspectCORREL76: TFloatField
      FieldName = 'CORREL76'
    end
    object qDepCovrProspectCORREL86: TFloatField
      FieldName = 'CORREL86'
    end
    object qDepCovrProspectMODELID: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object qDepCovrProspectAVERAGELEAST: TStringField
      FieldName = 'AVERAGELEAST'
      ProviderFlags = []
      ReadOnly = True
    end
    object qDepCovrProspectIQR64: TFloatField
      FieldName = 'IQR64'
      Required = True
    end
    object qDepCovrProspectIQR74: TFloatField
      FieldName = 'IQR74'
    end
    object qDepCovrProspectIQR84: TFloatField
      FieldName = 'IQR84'
    end
    object qDepCovrProspectIQR76: TFloatField
      FieldName = 'IQR76'
    end
    object qDepCovrProspectIQR86: TFloatField
      FieldName = 'IQR86'
    end
    object qDepCovrProspectIQRMU: TFloatField
      FieldName = 'IQRMU'
    end
    object qDepCovrProspectIQR64MODEL: TFloatField
      FieldName = 'IQR64MODEL'
    end
    object qDepCovrProspectIQR74MODEL: TFloatField
      FieldName = 'IQR74MODEL'
    end
    object qDepCovrProspectIQRTHUMODEL: TFloatField
      FieldName = 'IQRTHUMODEL'
    end
    object qDepCovrProspectIQRMUSMP: TFloatField
      FieldName = 'IQRMUSMP'
    end
    object qDepCovrProspectMEDIANSR87INITIAL: TFloatField
      FieldName = 'MEDIANSR87INITIAL'
    end
    object qDepCovrProspectMEDIANND143INITIAL: TFloatField
      FieldName = 'MEDIANND143INITIAL'
    end
    object qDepCovrProspectMEDIANOS187INITIAL: TFloatField
      FieldName = 'MEDIANOS187INITIAL'
    end
    object qDepCovrProspectMEDIANS34: TFloatField
      FieldName = 'MEDIANS34'
    end
    object qDepCovrProspectMEDIANSO434: TFloatField
      FieldName = 'MEDIANSO434'
    end
    object qDepCovrProspectMEDIANO18: TFloatField
      FieldName = 'MEDIANO18'
    end
    object qDepCovrProspectNUMSAMPLESSR87INITIAL: TFloatField
      FieldName = 'NUMSAMPLESSR87INITIAL'
    end
    object qDepCovrProspectNUMSAMPLESND143INITIAL: TFloatField
      FieldName = 'NUMSAMPLESND143INITIAL'
    end
    object qDepCovrProspectNUMSAMPLESOS187INITIAL: TFloatField
      FieldName = 'NUMSAMPLESOS187INITIAL'
    end
    object qDepCovrProspectNUMSAMPLESS34: TFloatField
      FieldName = 'NUMSAMPLESS34'
    end
    object qDepCovrProspectNUMSAMPLESSO434: TFloatField
      FieldName = 'NUMSAMPLESSO434'
    end
    object qDepCovrProspectNUMSAMPLESO18: TFloatField
      FieldName = 'NUMSAMPLESO18'
    end
    object qDepCovrProspectIQRSR87INITIAL: TFloatField
      FieldName = 'IQRSR87INITIAL'
    end
    object qDepCovrProspectIQRND143INITIAL: TFloatField
      FieldName = 'IQRND143INITIAL'
    end
    object qDepCovrProspectIQROS187INITIAL: TFloatField
      FieldName = 'IQROS187INITIAL'
    end
    object qDepCovrProspectIQRS34: TFloatField
      FieldName = 'IQRS34'
    end
    object qDepCovrProspectIQRSO434: TFloatField
      FieldName = 'IQRSO434'
    end
    object qDepCovrProspectIQRO18: TFloatField
      FieldName = 'IQRO18'
    end
    object qDepCovrProspectMEANSR87INITIAL: TFloatField
      FieldName = 'MEANSR87INITIAL'
    end
    object qDepCovrProspectMEANND143INITIAL: TFloatField
      FieldName = 'MEANND143INITIAL'
    end
    object qDepCovrProspectMEANOS187INITIAL: TFloatField
      FieldName = 'MEANOS187INITIAL'
    end
    object qDepCovrProspectMEANS34: TFloatField
      FieldName = 'MEANS34'
    end
    object qDepCovrProspectMEANSO434: TFloatField
      FieldName = 'MEANSO434'
    end
    object qDepCovrProspectMEANO18: TFloatField
      FieldName = 'MEANO18'
    end
    object qDepCovrProspectSDEVSR87INITIAL: TFloatField
      FieldName = 'SDEVSR87INITIAL'
    end
    object qDepCovrProspectSDEVND143INITIAL: TFloatField
      FieldName = 'SDEVND143INITIAL'
    end
    object qDepCovrProspectSDEVOS187INITIAL: TFloatField
      FieldName = 'SDEVOS187INITIAL'
    end
    object qDepCovrProspectSDEVS34: TFloatField
      FieldName = 'SDEVS34'
    end
    object qDepCovrProspectSDEVSO434: TFloatField
      FieldName = 'SDEVSO434'
    end
    object qDepCovrProspectSDEVO18: TFloatField
      FieldName = 'SDEVO18'
    end
    object qDepCovrProspectCOEFFVARSR87INITIAL: TFloatField
      FieldName = 'COEFFVARSR87INITIAL'
    end
    object qDepCovrProspectCOEFFVARND143INITIAL: TFloatField
      FieldName = 'COEFFVARND143INITIAL'
    end
    object qDepCovrProspectCOEFFVAROS187INITIAL: TFloatField
      FieldName = 'COEFFVAROS187INITIAL'
    end
    object qDepCovrProspectCOEFFVARS34: TFloatField
      FieldName = 'COEFFVARS34'
    end
    object qDepCovrProspectCOEFFVARSO434: TFloatField
      FieldName = 'COEFFVARSO434'
    end
    object qDepCovrProspectCOEFFVARO18: TFloatField
      FieldName = 'COEFFVARO18'
    end
    object qDepCovrProspectMEDIAN84MODEL: TFloatField
      FieldName = 'MEDIAN84MODEL'
    end
    object qDepCovrProspectMEDIANTHUSAMPLES: TFloatField
      FieldName = 'MEDIANTHUSAMPLES'
    end
    object qDepCovrProspectMEDIANHF176INITIAL: TFloatField
      FieldName = 'MEDIANHF176INITIAL'
    end
    object qDepCovrProspectMEANHF176INITIAL: TFloatField
      FieldName = 'MEANHF176INITIAL'
    end
    object qDepCovrProspectNUMSAMPLESHF176INITIAL: TFloatField
      FieldName = 'NUMSAMPLESHF176INITIAL'
    end
    object qDepCovrProspectSDEVHF176INITIAL: TFloatField
      FieldName = 'SDEVHF176INITIAL'
    end
    object qDepCovrProspectCOEFFVARHF176INITIAL: TFloatField
      FieldName = 'COEFFVARHF176INITIAL'
    end
    object qDepCovrProspectIQRHF176INITIAL: TFloatField
      FieldName = 'IQRHF176INITIAL'
    end
    object qDepCovrProspectMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
  end
  object qDeleteDepositSampleFrac: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM DEPOSITSAMPLES'
      'WHERE DEPOSITID = :DepositID'
      'AND SAMPLENO = :SampleNo'
      'AND FRAC = :Frac')
    SQLConnection = sqlcDateView
    Left = 624
    Top = 23
  end
  object qMarkSampleFracAsUnknownDeposit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE DEPOSITSAMPLES'
      'SET DEPOSITID = 0'
      'WHERE DEPOSITID = :DepositID'
      'AND SAMPLENO = :SampleNo'
      'AND FRAC = :Frac')
    SQLConnection = sqlcDateView
    Left = 624
    Top = 71
  end
  object qCountDepositSamplesProspect: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT Count(SampleNo)'
      'FROM DEPOSITSAMPLES'
      'WHERE DEPOSITSAMPLES.DEPOSITID = :DepositID'
      'AND DEPOSITSAMPLES.INCL4STATS = '#39'Y'#39)
    SQLConnection = sqlcDateView
    Left = 624
    Top = 135
  end
  object dspCountDepositSamplesProspect: TDataSetProvider
    DataSet = qCountDepositSamplesProspect
    Left = 656
    Top = 135
  end
  object cdsCountDepositSamplesProspect: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountDepositSamplesProspect'
    Left = 688
    Top = 135
    object cdsCountDepositSamplesProspectCOUNT: TFMTBCDField
      FieldName = 'COUNT'
      Precision = 20
      Size = 0
    end
  end
  object dsCountDepositSamplesProspect: TDataSource
    DataSet = cdsCountDepositSamplesProspect
    Left = 720
    Top = 135
  end
  object qDeleteDepCovr: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM DEPCOVR'
      'WHERE DEPOSITID = :DepositID'
      '')
    SQLConnection = sqlcDateView
    Left = 752
    Top = 23
  end
  object qDeleteSampleFracVariable: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VariableID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM SMPDATA'
      'WHERE SAMPLENO = :SampleNo'
      'AND FRAC = :Frac'
      'AND VARIABLEID = :VariableID')
    SQLConnection = sqlcDateView
    Left = 752
    Top = 71
  end
  object qInterpretations: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM INTERPRETATION'
      '')
    SQLConnection = sqlcDateView
    Left = 14
    Top = 505
  end
  object dspInterpretations: TDataSetProvider
    DataSet = qInterpretations
    Left = 42
    Top = 505
  end
  object cdsInterpretations: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInterpretations'
    Left = 70
    Top = 505
    object cdsInterpretationsINTERPABR: TStringField
      FieldName = 'INTERPABR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object cdsInterpretationsINTERPRETATION: TStringField
      FieldName = 'INTERPRETATION'
      Required = True
      Size = 30
    end
    object cdsInterpretationsINTERPGROUP: TIntegerField
      FieldName = 'INTERPGROUP'
      Required = True
    end
    object cdsInterpretationsINTERPIGNEOUS: TIntegerField
      FieldName = 'INTERPIGNEOUS'
      Required = True
    end
  end
  object dsInterpretations: TDataSource
    AutoEdit = False
    DataSet = cdsInterpretations
    Left = 98
    Top = 505
  end
  object qDepCount: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select distinct deposits.sdbdepositid, deposits.depositname, dep' +
        'osits.depositparentid,'
      '  deposits.depositclanid, depositclans.depositclan,'
      '  deposits.deplongitude, deposits.deplatitude,'
      
        '  deposits.approxage, deposits.approxageuncertainty, deposits.da' +
        'tingtypeid,'
      
        '  deposits.databaseid, deposits.countryid, deposits.geodynamicid' +
        ','
      
        '  deposits.hostunitid, deposits.approxstratage, deposits.approxs' +
        'tratageuncertainty,'
      '  deposits.depositstatusid,'
      
        '  depisotopecount.countpb, depisotopecount.countsr, depisotopeco' +
        'unt.countnd,'
      '  depisotopecount.counthf,depisotopecount.countos,'
      
        '  depisotopecount.counts, depisotopecount.countso4, depisotopeco' +
        'unt.counto'
      
        'from deposits,depisotopecount,userswhofor,depositfor,depositclan' +
        's'
      'where userswhofor.USERID = :UserID'
      'and userswhofor.whoforid = depositfor.whoforid'
      'and depositfor.sdbdepositid = depisotopecount.depositid'
      'and depositfor.sdbdepositid = deposits.sdbdepositid'
      'and depositclans.depositclanid=deposits.depositclanid'
      
        'order by deposits.countryid,deposits.depositclanid,deposits.depo' +
        'sitname')
    SQLConnection = sqlcDateView
    Left = 728
    Top = 271
  end
  object dspDepCount: TDataSetProvider
    DataSet = qDepCount
    Left = 760
    Top = 271
  end
  object cdsDepCount: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepCount'
    Left = 792
    Top = 271
    object cdsDepCountSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepCountDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsDepCountDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDepCountDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsDepCountDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object cdsDepCountDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object cdsDepCountAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object cdsDepCountAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object cdsDepCountDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      Required = True
    end
    object cdsDepCountDATABASEID: TIntegerField
      FieldName = 'DATABASEID'
      Required = True
    end
    object cdsDepCountCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepCountGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      Required = True
    end
    object cdsDepCountHOSTUNITID: TIntegerField
      FieldName = 'HOSTUNITID'
      Required = True
    end
    object cdsDepCountAPPROXSTRATAGE: TFloatField
      FieldName = 'APPROXSTRATAGE'
    end
    object cdsDepCountAPPROXSTRATAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXSTRATAGEUNCERTAINTY'
    end
    object cdsDepCountDEPOSITSTATUSID: TIntegerField
      FieldName = 'DEPOSITSTATUSID'
      Required = True
    end
    object cdsDepCountCOUNTPB: TIntegerField
      FieldName = 'COUNTPB'
    end
    object cdsDepCountCOUNTSR: TIntegerField
      FieldName = 'COUNTSR'
    end
    object cdsDepCountCOUNTND: TIntegerField
      FieldName = 'COUNTND'
    end
    object cdsDepCountCOUNTOS: TIntegerField
      FieldName = 'COUNTOS'
    end
    object cdsDepCountCOUNTS: TIntegerField
      FieldName = 'COUNTS'
    end
    object cdsDepCountCOUNTSO4: TIntegerField
      FieldName = 'COUNTSO4'
    end
    object cdsDepCountCOUNTO: TIntegerField
      FieldName = 'COUNTO'
    end
    object cdsDepCountCOUNTHF: TIntegerField
      FieldName = 'COUNTHF'
      Required = True
    end
    object cdsDepCountDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 75
    end
  end
  object dsDepCount: TDataSource
    DataSet = cdsDepCount
    Left = 824
    Top = 271
  end
  object qDepStatistics: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'AverLeast'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select distinct deposits.sdbdepositid, deposits.depositname, dep' +
        'osits.depositparentid,'
      '  deposits.depositclanid, depositclans.depositclan,'
      '  deposits.deplongitude, deposits.deplatitude,'
      
        '  deposits.approxage, deposits.approxageuncertainty, deposits.da' +
        'tingtypeid,'
      
        '  deposits.databaseid, deposits.countryid, deposits.geodynamicid' +
        ','
      
        '  deposits.hostunitid, deposits.approxstratage, deposits.approxs' +
        'tratageuncertainty,'
      '  deposits.depositstatusid, '
      
        '  depisotopecount.countpb, depisotopecount.countsr, depisotopeco' +
        'unt.countnd,'
      
        '  depisotopecount.countos,depisotopecount.counts,depisotopecount' +
        '.countso4,'
      '  depisotopecount.counto,depisotopecount.counthf,'
      
        '  depcovr.averleast,depcovr.median64,depcovr.median74,depcovr.me' +
        'dian84,'
      '  depcovr.median76,depcovr.median86,'
      
        '  depcovr.median64model,depcovr.median74model,depcovr.median84mo' +
        'del,'
      '  depcovr.medianmu, depcovr.medianmusamples,'
      '  depcovr.medianthumodel, depcovr.medianthusamples,'
      
        '  depcovr.medianSr87initial,depcovr.medianNd143initial,depcovr.m' +
        'edianos187initial,medianHf176Initial,'
      '  depcovr.medians34, depcovr.medianso434,depcovr.mediano18,'
      '  depcovr.numsamples64, depcovr.modelid,'
      
        '  depcovr.numsamplesSr87Initial,depcovr.numsamplesNd143Initial,d' +
        'epcovr.numsamplesOs187Initial,'
      
        '  depcovr.numsampless34,depcovr.numsamplesso434,depcovr.numsampl' +
        'esO18,numsamplesHf176Initial,'
      
        '  depcovr.sdev64,depcovr.sdev74,depcovr.sdev84,depcovr.sdev76,de' +
        'pcovr.sdev86,'
      
        '  depcovr.sdevmu,depcovr.sdev64model,depcovr.sdev74model,depcovr' +
        '.sdevmusmp,'
      '  depcovr.coeffvar64,depcovr.coeffvar74,depcovr.coeffvar84,'
      '  depcovr.coeffvar76,depcovr.coeffvar86,'
      
        '  depcovr.coeffvarmu,depcovr.coeffvar64model,depcovr.coeffvar74m' +
        'odel,'
      '  averleast.averageleast,'
      '  depcovr.iqr64, depcovr.iqr74,depcovr.iqr84,depcovr.iqr64model,'
      '  depcovr.iqr74model,depcovr.iqrmu,depcovr.iqr76,depcovr.iqr86,'
      '  depcovr.iqrmusmp,'
      
        '  depcovr.iqrSr87Initial,depcovr.iqrNd143Initial,depcovr.iqrOs18' +
        '7Initial,depcovr.iqrHf176Initial,'
      
        '  depcovr.iqrS34,depcovr.iqrSO434,depcovr.iqrO18,depcovr.materia' +
        'labr'
      
        'from deposits,depisotopecount,depcovr,userswhofor,depositfor,ave' +
        'rleast,depositclans'
      'where userswhofor.USERID = :UserID'
      'and userswhofor.whoforid = depositfor.whoforid'
      'and depositfor.sdbdepositid = depisotopecount.depositid'
      'and depositfor.sdbdepositid = depcovr.depositid'
      'and depositfor.sdbdepositid = deposits.sdbdepositid'
      'and depositclans.depositclanid = deposits.depositclanid'
      'and depcovr.averleast = :AverLeast'
      'and depcovr.averleast = averleast.averleast'
      
        'order by deposits.depositclanid,deposits.countryid,deposits.depo' +
        'sitname')
    SQLConnection = sqlcDateView
    Left = 728
    Top = 327
  end
  object dspDepStatistics: TDataSetProvider
    DataSet = qDepStatistics
    Left = 760
    Top = 327
  end
  object cdsDepStatistics: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDepStatistics'
    Left = 792
    Top = 327
    object cdsDepStatisticsSDBDEPOSITID: TIntegerField
      FieldName = 'SDBDEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDepStatisticsDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsDepStatisticsDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsDepStatisticsDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsDepStatisticsDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object cdsDepStatisticsDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object cdsDepStatisticsAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object cdsDepStatisticsAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object cdsDepStatisticsDATINGTYPEID: TIntegerField
      FieldName = 'DATINGTYPEID'
      Required = True
    end
    object cdsDepStatisticsDATABASEID: TIntegerField
      FieldName = 'DATABASEID'
      Required = True
    end
    object cdsDepStatisticsCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsDepStatisticsGEODYNAMICID: TIntegerField
      FieldName = 'GEODYNAMICID'
      Required = True
    end
    object cdsDepStatisticsHOSTUNITID: TIntegerField
      FieldName = 'HOSTUNITID'
      Required = True
    end
    object cdsDepStatisticsAPPROXSTRATAGE: TFloatField
      FieldName = 'APPROXSTRATAGE'
    end
    object cdsDepStatisticsAPPROXSTRATAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXSTRATAGEUNCERTAINTY'
    end
    object cdsDepStatisticsDEPOSITSTATUSID: TIntegerField
      FieldName = 'DEPOSITSTATUSID'
      Required = True
    end
    object cdsDepStatisticsCOUNTPB: TIntegerField
      FieldName = 'COUNTPB'
    end
    object cdsDepStatisticsCOUNTSR: TIntegerField
      FieldName = 'COUNTSR'
    end
    object cdsDepStatisticsCOUNTND: TIntegerField
      FieldName = 'COUNTND'
    end
    object cdsDepStatisticsCOUNTOS: TIntegerField
      FieldName = 'COUNTOS'
    end
    object cdsDepStatisticsAVERLEAST: TStringField
      FieldName = 'AVERLEAST'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDepStatisticsMEDIAN64: TFloatField
      FieldName = 'MEDIAN64'
    end
    object cdsDepStatisticsMEDIAN74: TFloatField
      FieldName = 'MEDIAN74'
    end
    object cdsDepStatisticsMEDIAN84: TFloatField
      FieldName = 'MEDIAN84'
    end
    object cdsDepStatisticsMEDIAN76: TFloatField
      FieldName = 'MEDIAN76'
    end
    object cdsDepStatisticsMEDIAN86: TFloatField
      FieldName = 'MEDIAN86'
    end
    object cdsDepStatisticsMEDIAN64MODEL: TFloatField
      FieldName = 'MEDIAN64MODEL'
    end
    object cdsDepStatisticsMEDIAN74MODEL: TFloatField
      FieldName = 'MEDIAN74MODEL'
    end
    object cdsDepStatisticsMEDIAN84MODEL: TFloatField
      FieldName = 'MEDIAN84MODEL'
    end
    object cdsDepStatisticsMEDIANMU: TFloatField
      FieldName = 'MEDIANMU'
    end
    object cdsDepStatisticsMEDIANMUSAMPLES: TFloatField
      FieldName = 'MEDIANMUSAMPLES'
    end
    object cdsDepStatisticsMEDIANTHUMODEL: TFloatField
      FieldName = 'MEDIANTHUMODEL'
    end
    object cdsDepStatisticsMEDIANTHUSAMPLES: TFloatField
      FieldName = 'MEDIANTHUSAMPLES'
    end
    object cdsDepStatisticsNUMSAMPLES64: TFloatField
      FieldName = 'NUMSAMPLES64'
    end
    object cdsDepStatisticsAVERAGELEAST: TStringField
      FieldName = 'AVERAGELEAST'
      Required = True
    end
    object cdsDepStatisticsMATERIALABR: TStringField
      FieldName = 'MATERIALABR'
      Required = True
      Size = 5
    end
    object cdsDepStatisticsMODELID: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object cdsDepStatisticsSDEV64: TFloatField
      FieldName = 'SDEV64'
    end
    object cdsDepStatisticsSDEV74: TFloatField
      FieldName = 'SDEV74'
    end
    object cdsDepStatisticsSDEV84: TFloatField
      FieldName = 'SDEV84'
    end
    object cdsDepStatisticsSDEV76: TFloatField
      FieldName = 'SDEV76'
    end
    object cdsDepStatisticsSDEV86: TFloatField
      FieldName = 'SDEV86'
    end
    object cdsDepStatisticsSDEVMU: TFloatField
      FieldName = 'SDEVMU'
    end
    object cdsDepStatisticsSDEV64MODEL: TFloatField
      FieldName = 'SDEV64MODEL'
    end
    object cdsDepStatisticsSDEV74MODEL: TFloatField
      FieldName = 'SDEV74MODEL'
    end
    object cdsDepStatisticsSDEVMUSMP: TFloatField
      FieldName = 'SDEVMUSMP'
    end
    object cdsDepStatisticsCOEFFVAR64: TFloatField
      FieldName = 'COEFFVAR64'
    end
    object cdsDepStatisticsCOEFFVAR74: TFloatField
      FieldName = 'COEFFVAR74'
    end
    object cdsDepStatisticsCOEFFVAR84: TFloatField
      FieldName = 'COEFFVAR84'
    end
    object cdsDepStatisticsCOEFFVAR76: TFloatField
      FieldName = 'COEFFVAR76'
    end
    object cdsDepStatisticsCOEFFVAR86: TFloatField
      FieldName = 'COEFFVAR86'
    end
    object cdsDepStatisticsCOEFFVARMU: TFloatField
      FieldName = 'COEFFVARMU'
    end
    object cdsDepStatisticsCOEFFVAR64MODEL: TFloatField
      FieldName = 'COEFFVAR64MODEL'
    end
    object cdsDepStatisticsCOEFFVAR74MODEL: TFloatField
      FieldName = 'COEFFVAR74MODEL'
    end
    object cdsDepStatisticsIQR64: TFloatField
      FieldName = 'IQR64'
      Required = True
    end
    object cdsDepStatisticsIQR74: TFloatField
      FieldName = 'IQR74'
    end
    object cdsDepStatisticsIQR84: TFloatField
      FieldName = 'IQR84'
    end
    object cdsDepStatisticsIQR64MODEL: TFloatField
      FieldName = 'IQR64MODEL'
    end
    object cdsDepStatisticsIQR74MODEL: TFloatField
      FieldName = 'IQR74MODEL'
    end
    object cdsDepStatisticsIQRMU: TFloatField
      FieldName = 'IQRMU'
    end
    object cdsDepStatisticsIQR76: TFloatField
      FieldName = 'IQR76'
    end
    object cdsDepStatisticsIQR86: TFloatField
      FieldName = 'IQR86'
    end
    object cdsDepStatisticsIQRMUSMP: TFloatField
      FieldName = 'IQRMUSMP'
    end
    object cdsDepStatisticsCOUNTS: TIntegerField
      FieldName = 'COUNTS'
    end
    object cdsDepStatisticsCOUNTSO4: TIntegerField
      FieldName = 'COUNTSO4'
    end
    object cdsDepStatisticsCOUNTO: TIntegerField
      FieldName = 'COUNTO'
    end
    object cdsDepStatisticsMEDIANSR87INITIAL: TFloatField
      FieldName = 'MEDIANSR87INITIAL'
    end
    object cdsDepStatisticsMEDIANND143INITIAL: TFloatField
      FieldName = 'MEDIANND143INITIAL'
    end
    object cdsDepStatisticsMEDIANOS187INITIAL: TFloatField
      FieldName = 'MEDIANOS187INITIAL'
    end
    object cdsDepStatisticsMEDIANS34: TFloatField
      FieldName = 'MEDIANS34'
    end
    object cdsDepStatisticsMEDIANSO434: TFloatField
      FieldName = 'MEDIANSO434'
    end
    object cdsDepStatisticsMEDIANO18: TFloatField
      FieldName = 'MEDIANO18'
    end
    object cdsDepStatisticsNUMSAMPLESSR87INITIAL: TFloatField
      FieldName = 'NUMSAMPLESSR87INITIAL'
    end
    object cdsDepStatisticsNUMSAMPLESND143INITIAL: TFloatField
      FieldName = 'NUMSAMPLESND143INITIAL'
    end
    object cdsDepStatisticsNUMSAMPLESOS187INITIAL: TFloatField
      FieldName = 'NUMSAMPLESOS187INITIAL'
    end
    object cdsDepStatisticsNUMSAMPLESS34: TFloatField
      FieldName = 'NUMSAMPLESS34'
    end
    object cdsDepStatisticsNUMSAMPLESSO434: TFloatField
      FieldName = 'NUMSAMPLESSO434'
    end
    object cdsDepStatisticsNUMSAMPLESO18: TFloatField
      FieldName = 'NUMSAMPLESO18'
    end
    object cdsDepStatisticsIQRSR87INITIAL: TFloatField
      FieldName = 'IQRSR87INITIAL'
    end
    object cdsDepStatisticsIQRND143INITIAL: TFloatField
      FieldName = 'IQRND143INITIAL'
    end
    object cdsDepStatisticsIQROS187INITIAL: TFloatField
      FieldName = 'IQROS187INITIAL'
    end
    object cdsDepStatisticsIQRS34: TFloatField
      FieldName = 'IQRS34'
    end
    object cdsDepStatisticsIQRSO434: TFloatField
      FieldName = 'IQRSO434'
    end
    object cdsDepStatisticsIQRO18: TFloatField
      FieldName = 'IQRO18'
    end
    object cdsDepStatisticsDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 75
    end
    object cdsDepStatisticsCOUNTHF: TIntegerField
      FieldName = 'COUNTHF'
      Required = True
    end
    object cdsDepStatisticsMEDIANHF176INITIAL: TFloatField
      FieldName = 'MEDIANHF176INITIAL'
    end
    object cdsDepStatisticsNUMSAMPLESHF176INITIAL: TFloatField
      FieldName = 'NUMSAMPLESHF176INITIAL'
    end
    object cdsDepStatisticsIQRHF176INITIAL: TFloatField
      FieldName = 'IQRHF176INITIAL'
    end
  end
  object dsDepStatistics: TDataSource
    DataSet = cdsDepStatistics
    Left = 824
    Top = 327
  end
  object qUserDepData: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select userdepsamplevalues.depositid, userdepsamplevalues.sample' +
        'no,'
      '  userdepsamplevalues.frac, userdepsamplevalues.inc4stats,'
      
        '  userdepsamplevalues.pb64,  userdepsamplevalues.spb64,  userdep' +
        'samplevalues.epb64,'
      
        '  userdepsamplevalues.pb74, userdepsamplevalues.spb74,userdepsam' +
        'plevalues.epb74,'
      
        '  userdepsamplevalues.pb84, userdepsamplevalues.spb84, userdepsa' +
        'mplevalues.epb84, '
      '  userdepsamplevalues.mu, userdepsamplevalues.smu,'
      
        '  userdepsamplevalues.pb76, userdepsamplevalues.spb76, userdepsa' +
        'mplevalues.epb76, '
      '  userdepsamplevalues.rho76,'
      
        '  userdepsamplevalues.pb86, userdepsamplevalues.spb86, userdepsa' +
        'mplevalues.epb86,'
      '  userdepsamplevalues.rho86,'
      '  userdepsamplevalues.musmp, '
      '  userdepsamplevalues.kappasrc, userdepsamplevalues.skappasrc,'
      '  userdepsamplevalues.kappasmp, userdepsamplevalues.skappasmp,'
      
        '  userdepsamplevalues.sr87i, userdepsamplevalues.ssr87i, userdep' +
        'samplevalues.esr87i,'
      
        '  userdepsamplevalues.nd143i, userdepsamplevalues.snd143i, userd' +
        'epsamplevalues.end143i,'
      
        '  userdepsamplevalues.os187i, userdepsamplevalues.sos187i, userd' +
        'epsamplevalues.eos187i,'
      
        '  userdepsamplevalues.hf176i, userdepsamplevalues.shf176i,  user' +
        'depsamplevalues.ehf176i,'
      '  userdepsamplevalues.s34, userdepsamplevalues.ss34,'
      '  userdepsamplevalues.so434, userdepsamplevalues.sso434, '
      '  userdepsamplevalues.o18, userdepsamplevalues.so18,'
      '  deposits.depositname, deposits.countryid,'
      '  deposits.deplatitude, deposits.deplongitude,'
      '  deposits.depositparentid, deposits.depositclanid,'
      '  deposits.approxage, deposits.approxageuncertainty, '
      '  depositclans.depositclan, deposits.depositstatusid'
      'from userdepsamplevalues,deposits,depositclans'
      'where userdepsamplevalues.userid = :UserID'
      'and userdepsamplevalues.depositid = deposits.sdbdepositid'
      'and deposits.depositclanid=depositclans.depositclanid')
    SQLConnection = sqlcDateView
    Left = 728
    Top = 439
  end
  object dspUserDepData: TDataSetProvider
    DataSet = qUserDepData
    Left = 760
    Top = 439
  end
  object cdsUserDepData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserDepData'
    Left = 792
    Top = 439
    object cdsUserDepDataDEPOSITID: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserDepDataSAMPLENO: TStringField
      FieldName = 'SAMPLENO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUserDepDataFRAC: TStringField
      FieldName = 'FRAC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object cdsUserDepDataINC4STATS: TStringField
      FieldName = 'INC4STATS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsUserDepDataPB64: TFloatField
      FieldName = 'PB64'
    end
    object cdsUserDepDataSPB64: TFloatField
      FieldName = 'SPB64'
    end
    object cdsUserDepDataEPB64: TFloatField
      FieldName = 'EPB64'
    end
    object cdsUserDepDataPB74: TFloatField
      FieldName = 'PB74'
    end
    object cdsUserDepDataSPB74: TFloatField
      FieldName = 'SPB74'
    end
    object cdsUserDepDataEPB74: TFloatField
      FieldName = 'EPB74'
    end
    object cdsUserDepDataPB84: TFloatField
      FieldName = 'PB84'
    end
    object cdsUserDepDataSPB84: TFloatField
      FieldName = 'SPB84'
    end
    object cdsUserDepDataEPB84: TFloatField
      FieldName = 'EPB84'
    end
    object cdsUserDepDataPB76: TFloatField
      FieldName = 'PB76'
    end
    object cdsUserDepDataSPB76: TFloatField
      FieldName = 'SPB76'
    end
    object cdsUserDepDataEPB76: TFloatField
      FieldName = 'EPB76'
    end
    object cdsUserDepDataRHO76: TFloatField
      FieldName = 'RHO76'
    end
    object cdsUserDepDataPB86: TFloatField
      FieldName = 'PB86'
    end
    object cdsUserDepDataSPB86: TFloatField
      FieldName = 'SPB86'
    end
    object cdsUserDepDataEPB86: TFloatField
      FieldName = 'EPB86'
    end
    object cdsUserDepDataRHO86: TFloatField
      FieldName = 'RHO86'
    end
    object cdsUserDepDataMUSMP: TFloatField
      FieldName = 'MUSMP'
    end
    object cdsUserDepDataSMU: TFloatField
      FieldName = 'SMU'
    end
    object cdsUserDepDataMU: TFloatField
      FieldName = 'MU'
    end
    object cdsUserDepDataSR87I: TFloatField
      FieldName = 'SR87I'
    end
    object cdsUserDepDataSSR87I: TFloatField
      FieldName = 'SSR87I'
    end
    object cdsUserDepDataESR87I: TFloatField
      FieldName = 'ESR87I'
    end
    object cdsUserDepDataND143I: TFloatField
      FieldName = 'ND143I'
    end
    object cdsUserDepDataSND143I: TFloatField
      FieldName = 'SND143I'
    end
    object cdsUserDepDataEND143I: TFloatField
      FieldName = 'END143I'
    end
    object cdsUserDepDataHF176I: TFloatField
      FieldName = 'HF176I'
    end
    object cdsUserDepDataSHF176I: TFloatField
      FieldName = 'SHF176I'
    end
    object cdsUserDepDataEHF176I: TFloatField
      FieldName = 'EHF176I'
    end
    object cdsUserDepDataOS187I: TFloatField
      FieldName = 'OS187I'
    end
    object cdsUserDepDataSOS187I: TFloatField
      FieldName = 'SOS187I'
    end
    object cdsUserDepDataEOS187I: TFloatField
      FieldName = 'EOS187I'
    end
    object cdsUserDepDataS34: TFloatField
      FieldName = 'S34'
    end
    object cdsUserDepDataSS34: TFloatField
      FieldName = 'SS34'
    end
    object cdsUserDepDataSO434: TFloatField
      FieldName = 'SO434'
    end
    object cdsUserDepDataSSO434: TFloatField
      FieldName = 'SSO434'
    end
    object cdsUserDepDataO18: TFloatField
      FieldName = 'O18'
    end
    object cdsUserDepDataSO18: TFloatField
      FieldName = 'SO18'
    end
    object cdsUserDepDataDEPOSITNAME: TStringField
      FieldName = 'DEPOSITNAME'
      Required = True
      Size = 50
    end
    object cdsUserDepDataCOUNTRYID: TStringField
      FieldName = 'COUNTRYID'
      Required = True
      Size = 3
    end
    object cdsUserDepDataDEPLATITUDE: TFloatField
      FieldName = 'DEPLATITUDE'
      Required = True
    end
    object cdsUserDepDataDEPLONGITUDE: TFloatField
      FieldName = 'DEPLONGITUDE'
      Required = True
    end
    object cdsUserDepDataDEPOSITPARENTID: TIntegerField
      FieldName = 'DEPOSITPARENTID'
      Required = True
    end
    object cdsUserDepDataDEPOSITCLANID: TIntegerField
      FieldName = 'DEPOSITCLANID'
      Required = True
    end
    object cdsUserDepDataAPPROXAGE: TFloatField
      FieldName = 'APPROXAGE'
    end
    object cdsUserDepDataDEPOSITCLAN: TStringField
      FieldName = 'DEPOSITCLAN'
      Required = True
      Size = 75
    end
    object cdsUserDepDataAPPROXAGEUNCERTAINTY: TFloatField
      FieldName = 'APPROXAGEUNCERTAINTY'
    end
    object cdsUserDepDataKAPPASRC: TFloatField
      FieldName = 'KAPPASRC'
    end
    object cdsUserDepDataSKAPPASRC: TFloatField
      FieldName = 'SKAPPASRC'
    end
    object cdsUserDepDataKAPPASMP: TFloatField
      FieldName = 'KAPPASMP'
    end
    object cdsUserDepDataSKAPPASMP: TFloatField
      FieldName = 'SKAPPASMP'
    end
    object cdsUserDepDataDEPOSITSTATUSID: TIntegerField
      FieldName = 'DEPOSITSTATUSID'
      Required = True
    end
  end
  object dsUserDepData: TDataSource
    DataSet = cdsUserDepData
    Left = 824
    Top = 439
  end
  object qDeleteDepCovrProspect: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE * FROM DEPCOVR'
      'WHERE DEPCOVR.DEPOSITID = :DepositID'
      '')
    SQLConnection = sqlcDateView
    Left = 104
    Top = 567
    object IntegerField1: TIntegerField
      FieldName = 'DEPOSITID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'AVERLEAST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 1
    end
    object FloatField1: TFloatField
      FieldName = 'MEDIAN64'
    end
    object FloatField2: TFloatField
      FieldName = 'MEDIAN74'
    end
    object FloatField3: TFloatField
      FieldName = 'MEDIAN84'
    end
    object FloatField4: TFloatField
      FieldName = 'MEDIAN76'
    end
    object FloatField5: TFloatField
      FieldName = 'MEDIAN86'
    end
    object FloatField6: TFloatField
      FieldName = 'MEDIANMU'
    end
    object FloatField7: TFloatField
      FieldName = 'MEDIAN64MODEL'
    end
    object FloatField8: TFloatField
      FieldName = 'MEDIAN74MODEL'
    end
    object FloatField9: TFloatField
      FieldName = 'MEDIANTHUMODEL'
    end
    object FloatField10: TFloatField
      FieldName = 'MEDIANMUSAMPLES'
    end
    object FloatField11: TFloatField
      FieldName = 'MEAN64'
    end
    object FloatField12: TFloatField
      FieldName = 'MEAN74'
    end
    object FloatField13: TFloatField
      FieldName = 'MEAN84'
    end
    object FloatField14: TFloatField
      FieldName = 'MEAN76'
    end
    object FloatField15: TFloatField
      FieldName = 'MEAN86'
    end
    object FloatField16: TFloatField
      FieldName = 'MEANMU'
    end
    object FloatField17: TFloatField
      FieldName = 'MEAN64MODEL'
    end
    object FloatField18: TFloatField
      FieldName = 'MEAN74MODEL'
    end
    object FloatField19: TFloatField
      FieldName = 'MEANTHUMODEL'
    end
    object FloatField20: TFloatField
      FieldName = 'MEANMUSAMPLES'
    end
    object FloatField21: TFloatField
      FieldName = 'NUMSAMPLES64'
    end
    object FloatField22: TFloatField
      FieldName = 'NUMSAMPLES74'
    end
    object FloatField23: TFloatField
      FieldName = 'NUMSAMPLES84'
    end
    object FloatField24: TFloatField
      FieldName = 'NUMSAMPLES76'
    end
    object FloatField25: TFloatField
      FieldName = 'NUMSAMPLES86'
    end
    object FloatField26: TFloatField
      FieldName = 'NUMSAMPLESMU'
    end
    object FloatField27: TFloatField
      FieldName = 'NUMSAMPLES64MODEL'
    end
    object FloatField28: TFloatField
      FieldName = 'NUMSAMPLES74MODEL'
    end
    object FloatField29: TFloatField
      FieldName = 'NUMSAMPLESTHUMODEL'
    end
    object FloatField30: TFloatField
      FieldName = 'NUMSAMPLESMUSMP'
    end
    object FloatField31: TFloatField
      FieldName = 'SDEV64'
    end
    object FloatField32: TFloatField
      FieldName = 'SDEV74'
    end
    object FloatField33: TFloatField
      FieldName = 'SDEV84'
    end
    object FloatField34: TFloatField
      FieldName = 'SDEV76'
    end
    object FloatField35: TFloatField
      FieldName = 'SDEV86'
    end
    object FloatField36: TFloatField
      FieldName = 'SDEVMU'
    end
    object FloatField37: TFloatField
      FieldName = 'SDEV64MODEL'
    end
    object FloatField38: TFloatField
      FieldName = 'SDEV74MODEL'
    end
    object FloatField39: TFloatField
      FieldName = 'SDEVTHUMODEL'
    end
    object FloatField40: TFloatField
      FieldName = 'SDEVMUSMP'
    end
    object FloatField41: TFloatField
      FieldName = 'COEFFVAR64'
    end
    object FloatField42: TFloatField
      FieldName = 'COEFFVAR74'
    end
    object FloatField43: TFloatField
      FieldName = 'COEFFVAR84'
    end
    object FloatField44: TFloatField
      FieldName = 'COEFFVAR76'
    end
    object FloatField45: TFloatField
      FieldName = 'COEFFVAR86'
    end
    object FloatField46: TFloatField
      FieldName = 'COEFFVARMU'
    end
    object FloatField47: TFloatField
      FieldName = 'COEFFVAR64MODEL'
    end
    object FloatField48: TFloatField
      FieldName = 'COEFFVAR74MODEL'
    end
    object FloatField49: TFloatField
      FieldName = 'COEFFVARTHUMODEL'
    end
    object FloatField50: TFloatField
      FieldName = 'COEFFVARMUSMP'
    end
    object FloatField51: TFloatField
      FieldName = 'CORREL76'
    end
    object FloatField52: TFloatField
      FieldName = 'CORREL86'
    end
    object StringField2: TStringField
      FieldName = 'MODELID'
      Required = True
      Size = 5
    end
    object StringField3: TStringField
      FieldName = 'AVERAGELEAST'
      ProviderFlags = []
      ReadOnly = True
    end
    object FloatField53: TFloatField
      FieldName = 'IQR64'
      Required = True
    end
    object FloatField54: TFloatField
      FieldName = 'IQR74'
    end
    object FloatField55: TFloatField
      FieldName = 'IQR84'
    end
    object FloatField56: TFloatField
      FieldName = 'IQR76'
    end
    object FloatField57: TFloatField
      FieldName = 'IQR86'
    end
    object FloatField58: TFloatField
      FieldName = 'IQRMU'
    end
    object FloatField59: TFloatField
      FieldName = 'IQR64MODEL'
    end
    object FloatField60: TFloatField
      FieldName = 'IQR74MODEL'
    end
    object FloatField61: TFloatField
      FieldName = 'IQRTHUMODEL'
    end
    object FloatField62: TFloatField
      FieldName = 'IQRMUSMP'
    end
  end
  object qS34: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS S34'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'34Ssulphide'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 663
  end
  object cdsS34: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqS34
    Params = <>
    Left = 420
    Top = 663
    object cdsS34S34: TFloatField
      FieldName = 'S34'
      Required = True
    end
  end
  object dsS34: TDataSource
    DataSet = cdsS34
    Left = 448
    Top = 663
  end
  object qSigS34: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS SigS34'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's34Ssulphide'#39
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 663
  end
  object cdsSigS34: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSigS34
    Params = <>
    Left = 524
    Top = 663
    object cdsSigS34SIGS34: TFloatField
      FieldName = 'SIGS34'
      Required = True
    end
  end
  object dsSigS34: TDataSource
    DataSet = cdsSigS34
    Left = 552
    Top = 663
  end
  object qES34: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS ES34'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e34Ssulphide'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 663
  end
  object cdsES34: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqES34
    Params = <>
    Left = 624
    Top = 663
    object cdsES34ES34: TFloatField
      FieldName = 'ES34'
      Required = True
    end
  end
  object dsES34: TDataSource
    DataSet = cdsES34
    Left = 652
    Top = 663
  end
  object qSO434: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS SO434'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'34Ssulphate'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 711
  end
  object cdsSO434: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSO434
    Params = <>
    Left = 420
    Top = 711
    object cdsSO434SO434: TFloatField
      FieldName = 'SO434'
      Required = True
    end
  end
  object dsSO434: TDataSource
    DataSet = cdsSO434
    Left = 448
    Top = 711
  end
  object qSigSO434: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS SigSO434'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's34Ssulphate'#39)
    SQLConnection = sqlcDateView
    Left = 496
    Top = 711
  end
  object cdsSigSO434: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSigSO434
    Params = <>
    Left = 524
    Top = 711
    object cdsSigSO434SIGSO434: TFloatField
      FieldName = 'SIGSO434'
      Required = True
    end
  end
  object dsSigSO434: TDataSource
    DataSet = cdsSigSO434
    Left = 552
    Top = 711
  end
  object qESO434: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS ESO434'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e34Ssulphate'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 711
  end
  object cdsESO434: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqESO434
    Params = <>
    Left = 624
    Top = 711
    object cdsESO434ESO434: TFloatField
      FieldName = 'ESO434'
      Required = True
    end
  end
  object dsESO434: TDataSource
    DataSet = cdsESO434
    Left = 652
    Top = 711
  end
  object qO18: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS O18'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'Delta18O'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 759
  end
  object cdsO18: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqO18
    Params = <>
    Left = 420
    Top = 759
    object cdsO18O18: TFloatField
      FieldName = 'O18'
      Required = True
    end
  end
  object dsO18: TDataSource
    DataSet = cdsO18
    Left = 448
    Top = 759
  end
  object qSigO18: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS SigO18'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'sDelta18O'#39
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 759
  end
  object cdsSigO18: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSigO18
    Params = <>
    Left = 524
    Top = 759
    object cdsSigO18SIGO18: TFloatField
      FieldName = 'SIGO18'
      Required = True
    end
  end
  object dsSigO18: TDataSource
    DataSet = cdsSigO18
    Left = 552
    Top = 759
  end
  object qEO18: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS EO18'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'eDeltaO18'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 759
  end
  object cdsEO18: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqEO18
    Params = <>
    Left = 624
    Top = 759
    object cdsEO18EO18: TFloatField
      FieldName = 'EO18'
      Required = True
    end
  end
  object dsEO18: TDataSource
    DataSet = cdsEO18
    Left = 652
    Top = 759
  end
  object qCountUserDepSmpIso: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'DepositID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select count(userdepsamplevalues.sampleno) as NumFound'
      'from userdepsamplevalues'
      'where userdepsamplevalues.pb64 > -999.0'
      'and userdepsamplevalues.inc4stats = '#39'Y'#39
      'and userdepsamplevalues.depositid = :DepositID'
      'and userdepsamplevalues.userid = :UserID')
    SQLConnection = sqlcDateView
    Left = 10
    Top = 627
  end
  object dspCountUserDepSmpIso: TDataSetProvider
    DataSet = qCountUserDepSmpIso
    Left = 38
    Top = 627
  end
  object cdsCountUserDepSmpIso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCountUserDepSmpIso'
    Left = 66
    Top = 627
    object cdsCountUserDepSmpIsoNUMFOUND: TFMTBCDField
      FieldName = 'NUMFOUND'
      Precision = 20
      Size = 0
    end
  end
  object dsCountUserDepSmpIso: TDataSource
    DataSet = cdsCountUserDepSmpIso
    Left = 94
    Top = 627
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcDateView
    Left = 104
    Top = 7
  end
  object sqlcDateView: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=c:\exe32\fbclient.dll'
      'DataBase=bromo2.usask.ca:s:\data\firebird\DateView2021v30.fdb'
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
      'DriverUnit=DbxDevartInterBase')
    Left = 32
    Top = 7
  end
  object qHF176: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS HF176i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'176Hf177Hf'#39
      '')
    SQLConnection = sqlcDateView
    Left = 392
    Top = 807
  end
  object cdsHF176: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqHF176
    Params = <>
    Left = 420
    Top = 807
    object cdsHF176HF176I: TFloatField
      FieldName = 'HF176I'
      Required = True
    end
  end
  object dsHF176: TDataSource
    DataSet = cdsHF176
    Left = 448
    Top = 807
  end
  object qSigHf176: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS SigHf176i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39's176Hf177Hf'#39
      '')
    SQLConnection = sqlcDateView
    Left = 496
    Top = 807
  end
  object cdsSigHf176: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqSigHf176
    Params = <>
    Left = 524
    Top = 807
    object cdsSigHf176SIGHF176I: TFloatField
      FieldName = 'SIGHF176I'
      Required = True
    end
  end
  object dsSigHf176: TDataSource
    DataSet = cdsSigHf176
    Left = 552
    Top = 807
  end
  object qeHf176: TSQLQuery
    DataSource = dsqDepositSamplesProspect
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SampleNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frac'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT SMPDATA.DATAVALUE AS EHF176i'
      'FROM SMPDATA'
      'WHERE SMPDATA.SAMPLENO = :SampleNo'
      'AND SMPDATA.FRAC = :Frac'
      'AND SMPDATA.VARIABLEID='#39'e176Hf177Hf'#39
      '')
    SQLConnection = sqlcDateView
    Left = 596
    Top = 807
  end
  object cdseHf176: TClientDataSet
    Aggregates = <>
    DataSetField = cdsDepositSamplesProspectqeHf176
    Params = <>
    Left = 624
    Top = 807
    object cdseHf176EHF176I: TFloatField
      FieldName = 'EHF176I'
      Required = True
    end
  end
  object dseHf176: TDataSource
    DataSet = cdseHf176
    Left = 652
    Top = 807
  end
  object qDeleteUserDepSampleValuesForUser: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'UserID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM USERDEPSAMPLEVALUES'
      'WHERE USERID = :UserID')
    SQLConnection = sqlcDateView
    Left = 688
    Top = 23
  end
end
