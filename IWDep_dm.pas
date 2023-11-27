
unit IWDep_dm;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox,
  WideStrings, IWDep_constants,
  DBXCommon, DBXDevartInterBase;

type
  TdmDep = class(TDataModule)
    Query1: TSQLQuery;
    dspQuery1: TDataSetProvider;
    cdsQuery1: TClientDataSet;
    dsQuery1: TDataSource;
    qContinents: TSQLQuery;
    dspContinents: TDataSetProvider;
    cdsContinents: TClientDataSet;
    qCountries: TSQLQuery;
    dspCountries: TDataSetProvider;
    cdsCountries: TClientDataSet;
    dsContinents: TDataSource;
    dsCountries: TDataSource;
    qYesNo: TSQLQuery;
    dspYesNo: TDataSetProvider;
    cdsYesNo: TClientDataSet;
    dsYesNo: TDataSource;
    cdsQuery1UNITID: TIntegerField;
    cdsQuery1COUNTRYID: TStringField;
    cdsQuery1UNITNAME: TStringField;
    cdsQuery1PARENTID: TIntegerField;
    cdsQuery1MINAGE: TFloatField;
    cdsQuery1MAXAGE: TFloatField;
    cdsQuery1COUNTRY: TStringField;
    qUnitQ: TSQLQuery;
    cdsUnitQ: TClientDataSet;
    dspUnitQ: TDataSetProvider;
    dsqUnitQ: TDataSource;
    dsUnitQ: TDataSource;
    Query1Rec: TSQLQuery;
    dspQuery1Rec: TDataSetProvider;
    cdsQuery1Rec: TClientDataSet;
    cdsQuery1RecUNITID: TIntegerField;
    cdsQuery1RANKID: TStringField;
    cdsQuery1UNITRANK: TStringField;
    cdsUnitQUNITID: TIntegerField;
    cdsUnitQUNITNAME: TStringField;
    cdsUnitQPARENTID: TIntegerField;
    cdsUnitQMINAGE: TFloatField;
    cdsUnitQMAXAGE: TFloatField;
    cdsUnitQDESCRIPTION: TMemoField;
    cdsUnitQCOUNTRY: TStringField;
    cdsUnitQqSubUnits: TDataSetField;
    cdsUnitQqParent: TDataSetField;
    cdsUnitQqValid: TDataSetField;
    cdsUnitQqPreceeding: TDataSetField;
    cdsUnitQqRefs: TDataSetField;
    cdsUnitQqSucceeding: TDataSetField;
    cdsUnitQqCorrelatives: TDataSetField;
    cdsUnitQqSynonyms: TDataSetField;
    cdsUnitQqRecords: TDataSetField;
    qUnitQUNITID: TIntegerField;
    qUnitQUNITNAME: TStringField;
    qUnitQPARENTID: TIntegerField;
    qUnitQRANKID: TStringField;
    qUnitQMINAGE: TFloatField;
    qUnitQMAXAGE: TFloatField;
    qUnitQDESCRIPTION: TMemoField;
    qUnitQCOUNTRYID: TStringField;
    qUnitQCOUNTRY: TStringField;
    cdsQuery1APPROVALSTATUS: TStringField;
    cdsUnitQqStratMaps: TDataSetField;
    qUnitQAGEUNITS: TStringField;
    cdsUnitQAGEUNITS: TStringField;
    cdsQuery1AGEUNITS: TStringField;
    cdsUnitQCOUNTRYID: TStringField;
    cdsUnitQRANKID: TStringField;
    cdsUnitQqLinkedApplications: TDataSetField;
    cdsUnitQqUnitSetting: TDataSetField;
    cdsUnitQqUnitRockClass: TDataSetField;
    cdsUnitQqStratDomain: TDataSetField;
    DomainQuery: TSQLQuery;
    dspDomainQuery: TDataSetProvider;
    cdsDomainQuery: TClientDataSet;
    dsDomainQuery: TDataSource;
    cdsDomainQueryDOMAINID: TIntegerField;
    cdsDomainQueryCONTINENTID: TStringField;
    cdsDomainQueryDOMAINNAME: TStringField;
    cdsDomainQueryDOMAINPARENTID: TIntegerField;
    cdsDomainQueryDOMAINTYPEID: TStringField;
    cdsDomainQuerySPOTLATITUDE: TFloatField;
    cdsDomainQuerySPOTLONGITUDE: TFloatField;
    cdsDomainQueryDOMAINTYPE: TStringField;
    cdsDomainQueryCONTINENT: TStringField;
    qUnitQAGEYEARS: TFMTBCDField;
    cdsUnitQAGEYEARS: TFMTBCDField;
    cdsQuery1AGEYEARS: TFMTBCDField;
    cdsUnitQqUnitPeriods: TDataSetField;
    qUnitQCONSTRAINTLEVELID: TSmallintField;
    qUnitQAPPROVALID: TStringField;
    cdsUnitQCONSTRAINTLEVELID: TSmallintField;
    cdsUnitQAPPROVALID: TStringField;
    cdsDomainQueryMINPLOTAGE: TFloatField;
    cdsDomainQueryMAXPLOTAGE: TFloatField;
    cdsUnitQqUnitFeature: TDataSetField;
    qCommodities: TSQLQuery;
    dspCommodities: TDataSetProvider;
    cdsCommodities: TClientDataSet;
    dsCommodities: TDataSource;
    cdsCommoditiesCOMMODITYID: TStringField;
    cdsCommoditiesCOMMODITY: TStringField;
    qDepositTypes: TSQLQuery;
    dspDepsoitTypes: TDataSetProvider;
    cdsDepositTypes: TClientDataSet;
    dsDepositTypes: TDataSource;
    cdsDepositTypesDEPOSITTYPEID: TStringField;
    cdsDepositTypesDEPOSITTYPE: TStringField;
    cdsUnitQqUnitSedEnv: TDataSetField;
    cdsUnitQqUnitCurrent: TDataSetField;
    cdsUnitQqUnitFor: TDataSetField;
    cdsYesNoYESNOID: TStringField;
    cdsYesNoYESNO: TStringField;
    qUsers: TSQLQuery;
    dspUsers: TDataSetProvider;
    cdsUsers: TClientDataSet;
    dsUsers: TDataSource;
    qUsersWhoFor: TSQLQuery;
    qUsersWhoForWHOFORID: TStringField;
    qUsersWhoForWHOFOR: TStringField;
    qUsersWhoForOWNER: TStringField;
    dspUsersWhoFor: TDataSetProvider;
    cdsUsersWhoFor: TClientDataSet;
    cdsUsersWhoForWHOFORID: TStringField;
    cdsUsersWhoForWHOFOR: TStringField;
    cdsUsersWhoForOWNER: TStringField;
    dsUsersWhoFor: TDataSource;
    dspDepCovrProspect: TDataSetProvider;
    cdsDepCovrProspect: TClientDataSet;
    dsDepCovrProspect: TDataSource;
    cdsDepCovrProspectDEPOSITID: TIntegerField;
    cdsDepCovrProspectCOEFFVAR64: TFloatField;
    cdsDepCovrProspectCOEFFVAR74: TFloatField;
    cdsDepCovrProspectCOEFFVAR84: TFloatField;
    cdsDepCovrProspectCOEFFVARMU: TFloatField;
    cdsDepCovrProspectCOEFFVAR76: TFloatField;
    cdsDepCovrProspectCOEFFVAR86: TFloatField;
    cdsDepCovrProspectCOEFFVAR64MODEL: TFloatField;
    cdsDepCovrProspectCOEFFVAR74MODEL: TFloatField;
    cdsDepCovrProspectCORREL76: TFloatField;
    cdsDepCovrProspectCORREL86: TFloatField;
    cdsDepCovrProspectMEAN64: TFloatField;
    cdsDepCovrProspectNUMSAMPLES64: TFloatField;
    cdsDepCovrProspectMEAN74: TFloatField;
    cdsDepCovrProspectNUMSAMPLES74: TFloatField;
    cdsDepCovrProspectMEAN84: TFloatField;
    cdsDepCovrProspectNUMSAMPLES84: TFloatField;
    cdsDepCovrProspectMEANMU: TFloatField;
    cdsDepCovrProspectNUMSAMPLESMU: TFloatField;
    cdsDepCovrProspectMEAN76: TFloatField;
    cdsDepCovrProspectNUMSAMPLES76: TFloatField;
    cdsDepCovrProspectMEAN86: TFloatField;
    cdsDepCovrProspectNUMSAMPLES86: TFloatField;
    cdsDepCovrProspectMEAN64MODEL: TFloatField;
    cdsDepCovrProspectNUMSAMPLES64MODEL: TFloatField;
    cdsDepCovrProspectMEAN74MODEL: TFloatField;
    cdsDepCovrProspectNUMSAMPLES74MODEL: TFloatField;
    cdsDepCovrProspectMEANTHUMODEL: TFloatField;
    cdsDepCovrProspectNUMSAMPLESTHUMODEL: TFloatField;
    cdsDepCovrProspectSDEV64: TFloatField;
    cdsDepCovrProspectSDEV74: TFloatField;
    cdsDepCovrProspectSDEV84: TFloatField;
    cdsDepCovrProspectSDEVMU: TFloatField;
    cdsDepCovrProspectSDEV76: TFloatField;
    cdsDepCovrProspectSDEV86: TFloatField;
    cdsDepCovrProspectSDEV64MODEL: TFloatField;
    cdsDepCovrProspectSDEV74MODEL: TFloatField;
    cdsDepCovrProspectSDEVTHUMODEL: TFloatField;
    cdsDepCovrProspectMEANMUSAMPLES: TFloatField;
    cdsDepCovrProspectMEDIAN64: TFloatField;
    cdsDepCovrProspectMEDIAN74: TFloatField;
    cdsDepCovrProspectMEDIAN84: TFloatField;
    cdsDepCovrProspectMEDIANMU: TFloatField;
    cdsDepCovrProspectMEDIAN76: TFloatField;
    cdsDepCovrProspectMEDIAN86: TFloatField;
    cdsDepCovrProspectMEDIAN64MODEL: TFloatField;
    cdsDepCovrProspectMEDIAN74MODEL: TFloatField;
    cdsDepCovrProspectMEDIANTHUMODEL: TFloatField;
    qDepCovrTarget1: TSQLQuery;
    dspDepCovrTarget1: TDataSetProvider;
    cdsDepCovrTarget1: TClientDataSet;
    dsDepCovrTarget1: TDataSource;
    qDepCovrTarget2: TSQLQuery;
    dspDepCovrTarget2: TDataSetProvider;
    cdsDepCovrTarget2: TClientDataSet;
    dsDepCovrTarget2: TDataSource;
    qVarProspect: TSQLQuery;
    cdsVarProspect: TClientDataSet;
    dsVarProspect: TDataSource;
    cdsContinentsCONTINENTID: TStringField;
    cdsContinentsCONTINENT: TStringField;
    cdsCountriesCONTINENTID: TStringField;
    cdsCountriesCOUNTRYABR: TStringField;
    cdsCountriesCOUNTRY: TStringField;
    cdsCountriesCONTINENT: TStringField;
    cdsCountriesCOUNTRYHASRECORDS: TStringField;
    cdsDepCovrProspectMEDIANMUSAMPLES: TFloatField;
    cdsDepCovrProspectCOEFFVARTHUMODEL: TFloatField;
    qPb64: TSQLQuery;
    cdsPb64: TClientDataSet;
    dsPb64: TDataSource;
    qPb74: TSQLQuery;
    cdsPb74: TClientDataSet;
    dsPb74: TDataSource;
    qPb84: TSQLQuery;
    cdsPb84: TClientDataSet;
    dsPb84: TDataSource;
    qSig64: TSQLQuery;
    cdsSig64: TClientDataSet;
    dsSig64: TDataSource;
    qE64: TSQLQuery;
    cdsE64: TClientDataSet;
    dsE64: TDataSource;
    qSig74: TSQLQuery;
    cdsSig74: TClientDataSet;
    dsSig74: TDataSource;
    qE74: TSQLQuery;
    cdsE74: TClientDataSet;
    dsE74: TDataSource;
    qSig84: TSQLQuery;
    cdsSig84: TClientDataSet;
    dsSig84: TDataSource;
    qE84: TSQLQuery;
    cdsE84: TClientDataSet;
    dsE84: TDataSource;
    cdsE84E84: TFloatField;
    cdsSig84SIG84: TFloatField;
    cdsPb84PB84: TFloatField;
    qPb76: TSQLQuery;
    cdsPb76: TClientDataSet;
    dsPb76: TDataSource;
    qSig76: TSQLQuery;
    cdsSig76: TClientDataSet;
    dsSig76: TDataSource;
    qE76: TSQLQuery;
    cdsE76: TClientDataSet;
    dsE76: TDataSource;
    qPb86: TSQLQuery;
    cdsPb86: TClientDataSet;
    dsPb86: TDataSource;
    qSig86: TSQLQuery;
    cdsSig86: TClientDataSet;
    dsSig86: TDataSource;
    qE86: TSQLQuery;
    cdsE86: TClientDataSet;
    dsE86: TDataSource;
    cdsPb76PB76: TFloatField;
    cdsSig76SIG76: TFloatField;
    cdsSig86SIG86: TFloatField;
    cdsE76E76: TFloatField;
    cdsE86E86: TFloatField;
    qR76: TSQLQuery;
    cdsR76: TClientDataSet;
    dsR76: TDataSource;
    qR86: TSQLQuery;
    cdsR86: TClientDataSet;
    dsR86: TDataSource;
    cdsR86R86: TFloatField;
    cdsDepCovrProspectAVERLEAST: TStringField;
    qAverLeast: TSQLQuery;
    dspAverLeast: TDataSetProvider;
    cdsAverLeast: TClientDataSet;
    dsAverLeast: TDataSource;
    cdsAverLeastAVERLEAST: TStringField;
    cdsAverLeastAVERAGELEAST: TStringField;
    qInsertDepCovrProspect: TSQLQuery;
    qUserDepSmp: TSQLQuery;
    dspUserDepSmp: TDataSetProvider;
    cdsUserDepSmp: TClientDataSet;
    dsUserDepSmp: TDataSource;
    cdsUserDepSmpUSERID: TStringField;
    cdsUserDepSmpDEPOSITID: TIntegerField;
    cdsUserDepSmpSAMPLENO: TStringField;
    cdsUserDepSmpFRAC: TStringField;
    cdsUserDepSmpINC4STATS: TStringField;
    cdsUserDepSmpPB64: TFloatField;
    cdsUserDepSmpPB74: TFloatField;
    cdsUserDepSmpPB84: TFloatField;
    cdsUserDepSmpPB76: TFloatField;
    cdsUserDepSmpPB86: TFloatField;
    qDeleteUserDepSmp: TSQLQuery;
    cdsDepCovrProspectAVERAGELEAST: TStringField;
    qSr87: TSQLQuery;
    cdsSr87: TClientDataSet;
    dsSr87: TDataSource;
    qSigSr87: TSQLQuery;
    cdsSigSr87: TClientDataSet;
    dsSigSr87: TDataSource;
    qESr87: TSQLQuery;
    cdsESr87: TClientDataSet;
    dsESr87: TDataSource;
    qNd143: TSQLQuery;
    cdsNd143: TClientDataSet;
    dsNd143: TDataSource;
    qSigNd143: TSQLQuery;
    cdsSigNd143: TClientDataSet;
    dsSigNd143: TDataSource;
    qENd143: TSQLQuery;
    cdsENd143: TClientDataSet;
    dsENd143: TDataSource;
    qOs187: TSQLQuery;
    cdsOs187: TClientDataSet;
    dsOs187: TDataSource;
    qSigOs187: TSQLQuery;
    cdsSigOs187: TClientDataSet;
    dsSigOs187: TDataSource;
    qEOs187: TSQLQuery;
    cdsEOs187: TClientDataSet;
    dsEOs187: TDataSource;
    cdsSigSr87SIGSR87: TFloatField;
    cdsESr87ESR87: TFloatField;
    cdsSigNd143SIGND143: TFloatField;
    cdsENd143END143: TFloatField;
    cdsSigOs187SIGOS187: TFloatField;
    cdsEOs187EOS187: TFloatField;
    cdsUserDepSmpMU: TFloatField;
    cdsDepCovrProspectNUMSAMPLESMUSMP: TFloatField;
    cdsDepCovrProspectSDEVMUSMP: TFloatField;
    cdsDepCovrProspectCOEFFVARMUSMP: TFloatField;
    cdsUserDepSmpMUSMP: TFloatField;
    cdsPb64PB64: TFloatField;
    cdsPb74PB74: TFloatField;
    cdsSig64SIG64: TFloatField;
    cdsSig74SIG74: TFloatField;
    cdsE64E64: TFloatField;
    cdsE74E74: TFloatField;
    cdsR76R76: TFloatField;
    qUsersUSERID: TStringField;
    cdsUsersUSERID: TStringField;
    qUsersWhoForUSERID: TStringField;
    cdsUsersWhoForUSERID: TStringField;
    cdsVarProspectSAMPLENO: TStringField;
    cdsVarProspectFRAC: TStringField;
    cdsVarProspectDATAVALUE: TFloatField;
    cdsVarProspectVARIABLEID: TStringField;
    cdsVarProspectNORMALISINGSTANDARD: TStringField;
    cdsVarProspectSTANDARDNAME: TStringField;
    cdsVarProspectREFNUM: TIntegerField;
    qDepositSamplesProspect: TSQLQuery;
    dspDepositSamplesProspect: TDataSetProvider;
    dsqDepositSamplesProspect: TDataSource;
    cdsDepositSamplesProspect: TClientDataSet;
    dsDepositSamplesProspect: TDataSource;
    qDepositSamplesProspectDEPOSITID: TIntegerField;
    qDepositSamplesProspectSAMPLENO: TStringField;
    qDepositSamplesProspectFRAC: TStringField;
    qDepositSamplesProspectINCL4STATS: TStringField;
    cdsDepositSamplesProspectDEPOSITID: TIntegerField;
    cdsDepositSamplesProspectSAMPLENO: TStringField;
    cdsDepositSamplesProspectFRAC: TStringField;
    cdsDepositSamplesProspectINCL4STATS: TStringField;
    cdsDepositSamplesProspectqVarProspect: TDataSetField;
    cdsDepositSamplesProspectqE64: TDataSetField;
    cdsDepositSamplesProspectqE74: TDataSetField;
    cdsDepositSamplesProspectqE84: TDataSetField;
    cdsDepositSamplesProspectqE76: TDataSetField;
    cdsDepositSamplesProspectqE86: TDataSetField;
    cdsDepositSamplesProspectqSig64: TDataSetField;
    cdsDepositSamplesProspectqSig74: TDataSetField;
    cdsDepositSamplesProspectqSig84: TDataSetField;
    cdsDepositSamplesProspectqSig76: TDataSetField;
    cdsDepositSamplesProspectqSig86: TDataSetField;
    cdsDepositSamplesProspectqESr87: TDataSetField;
    cdsDepositSamplesProspectqENd143: TDataSetField;
    cdsDepositSamplesProspectqEOs187: TDataSetField;
    cdsDepositSamplesProspectqSigSr87: TDataSetField;
    cdsDepositSamplesProspectqSigNd143: TDataSetField;
    cdsDepositSamplesProspectqSigOs187: TDataSetField;
    cdsDepositSamplesProspectqOs187: TDataSetField;
    cdsDepositSamplesProspectqNd143: TDataSetField;
    cdsDepositSamplesProspectqSr87: TDataSetField;
    cdsDepositSamplesProspectqR86: TDataSetField;
    cdsDepositSamplesProspectqR76: TDataSetField;
    cdsDepositSamplesProspectqPb86: TDataSetField;
    cdsDepositSamplesProspectqPb76: TDataSetField;
    cdsDepositSamplesProspectqPb84: TDataSetField;
    cdsDepositSamplesProspectqPb74: TDataSetField;
    cdsDepositSamplesProspectqPb64: TDataSetField;
    qDepCovrProspect: TSQLQuery;
    qDepCovrProspectDEPOSITID: TIntegerField;
    qDepCovrProspectAVERLEAST: TStringField;
    qDepCovrProspectMEDIAN64: TFloatField;
    qDepCovrProspectMEDIAN74: TFloatField;
    qDepCovrProspectMEDIAN84: TFloatField;
    qDepCovrProspectMEDIAN76: TFloatField;
    qDepCovrProspectMEDIAN86: TFloatField;
    qDepCovrProspectMEDIANMU: TFloatField;
    qDepCovrProspectMEDIAN64MODEL: TFloatField;
    qDepCovrProspectMEDIAN74MODEL: TFloatField;
    qDepCovrProspectMEDIANTHUMODEL: TFloatField;
    qDepCovrProspectMEDIANMUSAMPLES: TFloatField;
    qDepCovrProspectMEAN64: TFloatField;
    qDepCovrProspectMEAN74: TFloatField;
    qDepCovrProspectMEAN84: TFloatField;
    qDepCovrProspectMEAN76: TFloatField;
    qDepCovrProspectMEAN86: TFloatField;
    qDepCovrProspectMEANMU: TFloatField;
    qDepCovrProspectMEAN64MODEL: TFloatField;
    qDepCovrProspectMEAN74MODEL: TFloatField;
    qDepCovrProspectMEANTHUMODEL: TFloatField;
    qDepCovrProspectMEANMUSAMPLES: TFloatField;
    qDepCovrProspectNUMSAMPLES64: TFloatField;
    qDepCovrProspectNUMSAMPLES74: TFloatField;
    qDepCovrProspectNUMSAMPLES84: TFloatField;
    qDepCovrProspectNUMSAMPLES76: TFloatField;
    qDepCovrProspectNUMSAMPLES86: TFloatField;
    qDepCovrProspectNUMSAMPLESMU: TFloatField;
    qDepCovrProspectNUMSAMPLES64MODEL: TFloatField;
    qDepCovrProspectNUMSAMPLES74MODEL: TFloatField;
    qDepCovrProspectNUMSAMPLESTHUMODEL: TFloatField;
    qDepCovrProspectNUMSAMPLESMUSMP: TFloatField;
    qDepCovrProspectSDEV64: TFloatField;
    qDepCovrProspectSDEV74: TFloatField;
    qDepCovrProspectSDEV84: TFloatField;
    qDepCovrProspectSDEV76: TFloatField;
    qDepCovrProspectSDEV86: TFloatField;
    qDepCovrProspectSDEVMU: TFloatField;
    qDepCovrProspectSDEV64MODEL: TFloatField;
    qDepCovrProspectSDEV74MODEL: TFloatField;
    qDepCovrProspectSDEVTHUMODEL: TFloatField;
    qDepCovrProspectSDEVMUSMP: TFloatField;
    qDepCovrProspectCOEFFVAR64: TFloatField;
    qDepCovrProspectCOEFFVAR74: TFloatField;
    qDepCovrProspectCOEFFVAR84: TFloatField;
    qDepCovrProspectCOEFFVAR76: TFloatField;
    qDepCovrProspectCOEFFVAR86: TFloatField;
    qDepCovrProspectCOEFFVARMU: TFloatField;
    qDepCovrProspectCOEFFVAR64MODEL: TFloatField;
    qDepCovrProspectCOEFFVAR74MODEL: TFloatField;
    qDepCovrProspectCOEFFVARTHUMODEL: TFloatField;
    qDepCovrProspectCOEFFVARMUSMP: TFloatField;
    qDepCovrProspectCORREL76: TFloatField;
    qDepCovrProspectCORREL86: TFloatField;
    qDepCovrProspectMODELID: TStringField;
    qDepCovrProspectAVERAGELEAST: TStringField;
    cdsDepCovrProspectMODELID: TStringField;
    qDeleteDepositSampleFrac: TSQLQuery;
    qMarkSampleFracAsUnknownDeposit: TSQLQuery;
    qCountDepositSamplesProspect: TSQLQuery;
    dspCountDepositSamplesProspect: TDataSetProvider;
    cdsCountDepositSamplesProspect: TClientDataSet;
    dsCountDepositSamplesProspect: TDataSource;
    qDeleteDepCovr: TSQLQuery;
    qDeleteSampleFracVariable: TSQLQuery;
    qDepCovrTarget1DEPOSITID: TIntegerField;
    qDepCovrTarget1AVERLEAST: TStringField;
    qDepCovrTarget1MEDIAN64: TFloatField;
    qDepCovrTarget1MEDIAN74: TFloatField;
    qDepCovrTarget1MEDIAN84: TFloatField;
    qDepCovrTarget1MEDIAN76: TFloatField;
    qDepCovrTarget1MEDIAN86: TFloatField;
    qDepCovrTarget1MEDIANMU: TFloatField;
    qDepCovrTarget1MEDIAN64MODEL: TFloatField;
    qDepCovrTarget1MEDIAN74MODEL: TFloatField;
    qDepCovrTarget1MEDIANTHUMODEL: TFloatField;
    qDepCovrTarget1MEDIANMUSAMPLES: TFloatField;
    qDepCovrTarget1MEAN64: TFloatField;
    qDepCovrTarget1MEAN74: TFloatField;
    qDepCovrTarget1MEAN84: TFloatField;
    qDepCovrTarget1MEAN76: TFloatField;
    qDepCovrTarget1MEAN86: TFloatField;
    qDepCovrTarget1MEANMU: TFloatField;
    qDepCovrTarget1MEAN64MODEL: TFloatField;
    qDepCovrTarget1MEAN74MODEL: TFloatField;
    qDepCovrTarget1MEANTHUMODEL: TFloatField;
    qDepCovrTarget1MEANMUSAMPLES: TFloatField;
    qDepCovrTarget1NUMSAMPLES64: TFloatField;
    qDepCovrTarget1NUMSAMPLES74: TFloatField;
    qDepCovrTarget1NUMSAMPLES84: TFloatField;
    qDepCovrTarget1NUMSAMPLES76: TFloatField;
    qDepCovrTarget1NUMSAMPLES86: TFloatField;
    qDepCovrTarget1NUMSAMPLESMU: TFloatField;
    qDepCovrTarget1NUMSAMPLES64MODEL: TFloatField;
    qDepCovrTarget1NUMSAMPLES74MODEL: TFloatField;
    qDepCovrTarget1NUMSAMPLESTHUMODEL: TFloatField;
    qDepCovrTarget1NUMSAMPLESMUSMP: TFloatField;
    qDepCovrTarget1SDEV64: TFloatField;
    qDepCovrTarget1SDEV74: TFloatField;
    qDepCovrTarget1SDEV84: TFloatField;
    qDepCovrTarget1SDEV76: TFloatField;
    qDepCovrTarget1SDEV86: TFloatField;
    qDepCovrTarget1SDEVMU: TFloatField;
    qDepCovrTarget1SDEV64MODEL: TFloatField;
    qDepCovrTarget1SDEV74MODEL: TFloatField;
    qDepCovrTarget1SDEVTHUMODEL: TFloatField;
    qDepCovrTarget1SDEVMUSMP: TFloatField;
    qDepCovrTarget1COEFFVAR64: TFloatField;
    qDepCovrTarget1COEFFVAR74: TFloatField;
    qDepCovrTarget1COEFFVAR84: TFloatField;
    qDepCovrTarget1COEFFVAR76: TFloatField;
    qDepCovrTarget1COEFFVAR86: TFloatField;
    qDepCovrTarget1COEFFVARMU: TFloatField;
    qDepCovrTarget1COEFFVAR64MODEL: TFloatField;
    qDepCovrTarget1COEFFVAR74MODEL: TFloatField;
    qDepCovrTarget1COEFFVARTHUMODEL: TFloatField;
    qDepCovrTarget1COEFFVARMUSMP: TFloatField;
    qDepCovrTarget1CORREL76: TFloatField;
    qDepCovrTarget1CORREL86: TFloatField;
    qDepCovrTarget1MODELID: TStringField;
    qDepCovrTarget1AVERLEAST_1: TStringField;
    qDepCovrTarget1AVERAGELEAST: TStringField;
    qDepCovrTarget2DEPOSITID: TIntegerField;
    qDepCovrTarget2AVERLEAST: TStringField;
    qDepCovrTarget2MEDIAN64: TFloatField;
    qDepCovrTarget2MEDIAN74: TFloatField;
    qDepCovrTarget2MEDIAN84: TFloatField;
    qDepCovrTarget2MEDIAN76: TFloatField;
    qDepCovrTarget2MEDIAN86: TFloatField;
    qDepCovrTarget2MEDIANMU: TFloatField;
    qDepCovrTarget2MEDIAN64MODEL: TFloatField;
    qDepCovrTarget2MEDIAN74MODEL: TFloatField;
    qDepCovrTarget2MEDIANTHUMODEL: TFloatField;
    qDepCovrTarget2MEDIANMUSAMPLES: TFloatField;
    qDepCovrTarget2MEAN64: TFloatField;
    qDepCovrTarget2MEAN74: TFloatField;
    qDepCovrTarget2MEAN84: TFloatField;
    qDepCovrTarget2MEAN76: TFloatField;
    qDepCovrTarget2MEAN86: TFloatField;
    qDepCovrTarget2MEANMU: TFloatField;
    qDepCovrTarget2MEAN64MODEL: TFloatField;
    qDepCovrTarget2MEAN74MODEL: TFloatField;
    qDepCovrTarget2MEANTHUMODEL: TFloatField;
    qDepCovrTarget2MEANMUSAMPLES: TFloatField;
    qDepCovrTarget2NUMSAMPLES64: TFloatField;
    qDepCovrTarget2NUMSAMPLES74: TFloatField;
    qDepCovrTarget2NUMSAMPLES84: TFloatField;
    qDepCovrTarget2NUMSAMPLES76: TFloatField;
    qDepCovrTarget2NUMSAMPLES86: TFloatField;
    qDepCovrTarget2NUMSAMPLESMU: TFloatField;
    qDepCovrTarget2NUMSAMPLES64MODEL: TFloatField;
    qDepCovrTarget2NUMSAMPLES74MODEL: TFloatField;
    qDepCovrTarget2NUMSAMPLESTHUMODEL: TFloatField;
    qDepCovrTarget2NUMSAMPLESMUSMP: TFloatField;
    qDepCovrTarget2SDEV64: TFloatField;
    qDepCovrTarget2SDEV74: TFloatField;
    qDepCovrTarget2SDEV84: TFloatField;
    qDepCovrTarget2SDEV76: TFloatField;
    qDepCovrTarget2SDEV86: TFloatField;
    qDepCovrTarget2SDEVMU: TFloatField;
    qDepCovrTarget2SDEV64MODEL: TFloatField;
    qDepCovrTarget2SDEV74MODEL: TFloatField;
    qDepCovrTarget2SDEVTHUMODEL: TFloatField;
    qDepCovrTarget2SDEVMUSMP: TFloatField;
    qDepCovrTarget2COEFFVAR64: TFloatField;
    qDepCovrTarget2COEFFVAR74: TFloatField;
    qDepCovrTarget2COEFFVAR84: TFloatField;
    qDepCovrTarget2COEFFVAR76: TFloatField;
    qDepCovrTarget2COEFFVAR86: TFloatField;
    qDepCovrTarget2COEFFVARMU: TFloatField;
    qDepCovrTarget2COEFFVAR64MODEL: TFloatField;
    qDepCovrTarget2COEFFVAR74MODEL: TFloatField;
    qDepCovrTarget2COEFFVARTHUMODEL: TFloatField;
    qDepCovrTarget2COEFFVARMUSMP: TFloatField;
    qDepCovrTarget2CORREL76: TFloatField;
    qDepCovrTarget2CORREL86: TFloatField;
    qDepCovrTarget2MODELID: TStringField;
    qDepCovrTarget2AVERLEAST_1: TStringField;
    qDepCovrTarget2AVERAGELEAST: TStringField;
    cdsDepCovrTarget1DEPOSITID: TIntegerField;
    cdsDepCovrTarget1AVERLEAST: TStringField;
    cdsDepCovrTarget1MEDIAN64: TFloatField;
    cdsDepCovrTarget1MEDIAN74: TFloatField;
    cdsDepCovrTarget1MEDIAN84: TFloatField;
    cdsDepCovrTarget1MEDIAN76: TFloatField;
    cdsDepCovrTarget1MEDIAN86: TFloatField;
    cdsDepCovrTarget1MEDIANMU: TFloatField;
    cdsDepCovrTarget1MEDIAN64MODEL: TFloatField;
    cdsDepCovrTarget1MEDIAN74MODEL: TFloatField;
    cdsDepCovrTarget1MEDIANTHUMODEL: TFloatField;
    cdsDepCovrTarget1MEDIANMUSAMPLES: TFloatField;
    cdsDepCovrTarget1MEAN64: TFloatField;
    cdsDepCovrTarget1MEAN74: TFloatField;
    cdsDepCovrTarget1MEAN84: TFloatField;
    cdsDepCovrTarget1MEAN76: TFloatField;
    cdsDepCovrTarget1MEAN86: TFloatField;
    cdsDepCovrTarget1MEANMU: TFloatField;
    cdsDepCovrTarget1MEAN64MODEL: TFloatField;
    cdsDepCovrTarget1MEAN74MODEL: TFloatField;
    cdsDepCovrTarget1MEANTHUMODEL: TFloatField;
    cdsDepCovrTarget1MEANMUSAMPLES: TFloatField;
    cdsDepCovrTarget1NUMSAMPLES64: TFloatField;
    cdsDepCovrTarget1NUMSAMPLES74: TFloatField;
    cdsDepCovrTarget1NUMSAMPLES84: TFloatField;
    cdsDepCovrTarget1NUMSAMPLES76: TFloatField;
    cdsDepCovrTarget1NUMSAMPLES86: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESMU: TFloatField;
    cdsDepCovrTarget1NUMSAMPLES64MODEL: TFloatField;
    cdsDepCovrTarget1NUMSAMPLES74MODEL: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESTHUMODEL: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESMUSMP: TFloatField;
    cdsDepCovrTarget1SDEV64: TFloatField;
    cdsDepCovrTarget1SDEV74: TFloatField;
    cdsDepCovrTarget1SDEV84: TFloatField;
    cdsDepCovrTarget1SDEV76: TFloatField;
    cdsDepCovrTarget1SDEV86: TFloatField;
    cdsDepCovrTarget1SDEVMU: TFloatField;
    cdsDepCovrTarget1SDEV64MODEL: TFloatField;
    cdsDepCovrTarget1SDEV74MODEL: TFloatField;
    cdsDepCovrTarget1SDEVTHUMODEL: TFloatField;
    cdsDepCovrTarget1SDEVMUSMP: TFloatField;
    cdsDepCovrTarget1COEFFVAR64: TFloatField;
    cdsDepCovrTarget1COEFFVAR74: TFloatField;
    cdsDepCovrTarget1COEFFVAR84: TFloatField;
    cdsDepCovrTarget1COEFFVAR76: TFloatField;
    cdsDepCovrTarget1COEFFVAR86: TFloatField;
    cdsDepCovrTarget1COEFFVARMU: TFloatField;
    cdsDepCovrTarget1COEFFVAR64MODEL: TFloatField;
    cdsDepCovrTarget1COEFFVAR74MODEL: TFloatField;
    cdsDepCovrTarget1COEFFVARTHUMODEL: TFloatField;
    cdsDepCovrTarget1COEFFVARMUSMP: TFloatField;
    cdsDepCovrTarget1CORREL76: TFloatField;
    cdsDepCovrTarget1CORREL86: TFloatField;
    cdsDepCovrTarget1MODELID: TStringField;
    cdsDepCovrTarget1AVERLEAST_1: TStringField;
    cdsDepCovrTarget1AVERAGELEAST: TStringField;
    cdsDepCovrTarget2DEPOSITID: TIntegerField;
    cdsDepCovrTarget2AVERLEAST: TStringField;
    cdsDepCovrTarget2MEDIAN64: TFloatField;
    cdsDepCovrTarget2MEDIAN74: TFloatField;
    cdsDepCovrTarget2MEDIAN84: TFloatField;
    cdsDepCovrTarget2MEDIAN76: TFloatField;
    cdsDepCovrTarget2MEDIAN86: TFloatField;
    cdsDepCovrTarget2MEDIANMU: TFloatField;
    cdsDepCovrTarget2MEDIAN64MODEL: TFloatField;
    cdsDepCovrTarget2MEDIAN74MODEL: TFloatField;
    cdsDepCovrTarget2MEDIANTHUMODEL: TFloatField;
    cdsDepCovrTarget2MEDIANMUSAMPLES: TFloatField;
    cdsDepCovrTarget2MEAN64: TFloatField;
    cdsDepCovrTarget2MEAN74: TFloatField;
    cdsDepCovrTarget2MEAN84: TFloatField;
    cdsDepCovrTarget2MEAN76: TFloatField;
    cdsDepCovrTarget2MEAN86: TFloatField;
    cdsDepCovrTarget2MEANMU: TFloatField;
    cdsDepCovrTarget2MEAN64MODEL: TFloatField;
    cdsDepCovrTarget2MEAN74MODEL: TFloatField;
    cdsDepCovrTarget2MEANTHUMODEL: TFloatField;
    cdsDepCovrTarget2MEANMUSAMPLES: TFloatField;
    cdsDepCovrTarget2NUMSAMPLES64: TFloatField;
    cdsDepCovrTarget2NUMSAMPLES74: TFloatField;
    cdsDepCovrTarget2NUMSAMPLES84: TFloatField;
    cdsDepCovrTarget2NUMSAMPLES76: TFloatField;
    cdsDepCovrTarget2NUMSAMPLES86: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESMU: TFloatField;
    cdsDepCovrTarget2NUMSAMPLES64MODEL: TFloatField;
    cdsDepCovrTarget2NUMSAMPLES74MODEL: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESTHUMODEL: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESMUSMP: TFloatField;
    cdsDepCovrTarget2SDEV64: TFloatField;
    cdsDepCovrTarget2SDEV74: TFloatField;
    cdsDepCovrTarget2SDEV84: TFloatField;
    cdsDepCovrTarget2SDEV76: TFloatField;
    cdsDepCovrTarget2SDEV86: TFloatField;
    cdsDepCovrTarget2SDEVMU: TFloatField;
    cdsDepCovrTarget2SDEV64MODEL: TFloatField;
    cdsDepCovrTarget2SDEV74MODEL: TFloatField;
    cdsDepCovrTarget2SDEVTHUMODEL: TFloatField;
    cdsDepCovrTarget2SDEVMUSMP: TFloatField;
    cdsDepCovrTarget2COEFFVAR64: TFloatField;
    cdsDepCovrTarget2COEFFVAR74: TFloatField;
    cdsDepCovrTarget2COEFFVAR84: TFloatField;
    cdsDepCovrTarget2COEFFVAR76: TFloatField;
    cdsDepCovrTarget2COEFFVAR86: TFloatField;
    cdsDepCovrTarget2COEFFVARMU: TFloatField;
    cdsDepCovrTarget2COEFFVAR64MODEL: TFloatField;
    cdsDepCovrTarget2COEFFVAR74MODEL: TFloatField;
    cdsDepCovrTarget2COEFFVARTHUMODEL: TFloatField;
    cdsDepCovrTarget2COEFFVARMUSMP: TFloatField;
    cdsDepCovrTarget2CORREL76: TFloatField;
    cdsDepCovrTarget2CORREL86: TFloatField;
    cdsDepCovrTarget2MODELID: TStringField;
    cdsDepCovrTarget2AVERLEAST_1: TStringField;
    cdsDepCovrTarget2AVERAGELEAST: TStringField;
    qInterpretations: TSQLQuery;
    dspInterpretations: TDataSetProvider;
    cdsInterpretations: TClientDataSet;
    dsInterpretations: TDataSource;
    cdsInterpretationsINTERPABR: TStringField;
    cdsInterpretationsINTERPRETATION: TStringField;
    cdsInterpretationsINTERPGROUP: TIntegerField;
    cdsInterpretationsINTERPIGNEOUS: TIntegerField;
    cdsVarProspectSOURCESHORT: TStringField;
    qDepCount: TSQLQuery;
    dspDepCount: TDataSetProvider;
    cdsDepCount: TClientDataSet;
    dsDepCount: TDataSource;
    qDepStatistics: TSQLQuery;
    dspDepStatistics: TDataSetProvider;
    cdsDepStatistics: TClientDataSet;
    dsDepStatistics: TDataSource;
    cdsDepCountSDBDEPOSITID: TIntegerField;
    cdsDepCountDEPOSITNAME: TStringField;
    cdsDepCountDEPOSITPARENTID: TIntegerField;
    cdsDepCountDEPOSITCLANID: TIntegerField;
    cdsDepCountDEPLONGITUDE: TFloatField;
    cdsDepCountDEPLATITUDE: TFloatField;
    cdsDepCountAPPROXAGE: TFloatField;
    cdsDepCountAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepCountDATINGTYPEID: TIntegerField;
    cdsDepCountDATABASEID: TIntegerField;
    cdsDepCountCOUNTRYID: TStringField;
    cdsDepCountGEODYNAMICID: TIntegerField;
    cdsDepCountHOSTUNITID: TIntegerField;
    cdsDepCountAPPROXSTRATAGE: TFloatField;
    cdsDepCountAPPROXSTRATAGEUNCERTAINTY: TFloatField;
    cdsDepCountDEPOSITSTATUSID: TIntegerField;
    cdsDepCountCOUNTPB: TIntegerField;
    cdsDepCountCOUNTSR: TIntegerField;
    cdsDepCountCOUNTND: TIntegerField;
    cdsDepCountCOUNTOS: TIntegerField;
    cdsDepStatisticsSDBDEPOSITID: TIntegerField;
    cdsDepStatisticsDEPOSITNAME: TStringField;
    cdsDepStatisticsDEPOSITPARENTID: TIntegerField;
    cdsDepStatisticsDEPOSITCLANID: TIntegerField;
    cdsDepStatisticsDEPLONGITUDE: TFloatField;
    cdsDepStatisticsDEPLATITUDE: TFloatField;
    cdsDepStatisticsAPPROXAGE: TFloatField;
    cdsDepStatisticsAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepStatisticsDATINGTYPEID: TIntegerField;
    cdsDepStatisticsDATABASEID: TIntegerField;
    cdsDepStatisticsCOUNTRYID: TStringField;
    cdsDepStatisticsGEODYNAMICID: TIntegerField;
    cdsDepStatisticsHOSTUNITID: TIntegerField;
    cdsDepStatisticsAPPROXSTRATAGE: TFloatField;
    cdsDepStatisticsAPPROXSTRATAGEUNCERTAINTY: TFloatField;
    cdsDepStatisticsDEPOSITSTATUSID: TIntegerField;
    cdsDepStatisticsCOUNTPB: TIntegerField;
    cdsDepStatisticsCOUNTSR: TIntegerField;
    cdsDepStatisticsCOUNTND: TIntegerField;
    cdsDepStatisticsCOUNTOS: TIntegerField;
    cdsDepStatisticsAVERLEAST: TStringField;
    cdsDepStatisticsMEDIAN64: TFloatField;
    cdsDepStatisticsMEDIAN74: TFloatField;
    cdsDepStatisticsMEDIAN84: TFloatField;
    cdsDepStatisticsMEDIAN76: TFloatField;
    cdsDepStatisticsMEDIAN86: TFloatField;
    cdsDepStatisticsMEDIAN64MODEL: TFloatField;
    cdsDepStatisticsMEDIAN74MODEL: TFloatField;
    cdsDepStatisticsMEDIANMU: TFloatField;
    cdsDepStatisticsMEDIANMUSAMPLES: TFloatField;
    cdsDepStatisticsMEDIANTHUMODEL: TFloatField;
    cdsDepStatisticsNUMSAMPLES64: TFloatField;
    cdsDepStatisticsAVERAGELEAST: TStringField;
    cdsDepStatisticsMODELID: TStringField;
    cdsDepStatisticsSDEV64: TFloatField;
    cdsDepStatisticsSDEV74: TFloatField;
    cdsDepStatisticsSDEV84: TFloatField;
    cdsDepStatisticsSDEV76: TFloatField;
    cdsDepStatisticsSDEV86: TFloatField;
    cdsDepStatisticsSDEVMU: TFloatField;
    cdsDepStatisticsSDEV64MODEL: TFloatField;
    cdsDepStatisticsSDEV74MODEL: TFloatField;
    cdsDepStatisticsSDEVMUSMP: TFloatField;
    cdsDepStatisticsCOEFFVAR64: TFloatField;
    cdsDepStatisticsCOEFFVAR74: TFloatField;
    cdsDepStatisticsCOEFFVAR84: TFloatField;
    cdsDepStatisticsCOEFFVAR76: TFloatField;
    cdsDepStatisticsCOEFFVAR86: TFloatField;
    cdsDepStatisticsCOEFFVARMU: TFloatField;
    cdsDepStatisticsCOEFFVAR64MODEL: TFloatField;
    cdsDepStatisticsCOEFFVAR74MODEL: TFloatField;
    qDepCovrProspectIQR64: TFloatField;
    qDepCovrProspectIQR74: TFloatField;
    qDepCovrProspectIQR84: TFloatField;
    qDepCovrProspectIQR76: TFloatField;
    qDepCovrProspectIQR86: TFloatField;
    qDepCovrProspectIQRMU: TFloatField;
    qDepCovrProspectIQR64MODEL: TFloatField;
    qDepCovrProspectIQR74MODEL: TFloatField;
    qDepCovrProspectIQRTHUMODEL: TFloatField;
    qDepCovrProspectIQRMUSMP: TFloatField;
    cdsDepCovrProspectIQR64: TFloatField;
    cdsDepCovrProspectIQR74: TFloatField;
    cdsDepCovrProspectIQR84: TFloatField;
    cdsDepCovrProspectIQR76: TFloatField;
    cdsDepCovrProspectIQR86: TFloatField;
    cdsDepCovrProspectIQRMU: TFloatField;
    cdsDepCovrProspectIQR64MODEL: TFloatField;
    cdsDepCovrProspectIQR74MODEL: TFloatField;
    cdsDepCovrProspectIQRTHUMODEL: TFloatField;
    cdsDepCovrProspectIQRMUSMP: TFloatField;
    qDepCovrTarget1IQR64: TFloatField;
    qDepCovrTarget1IQR74: TFloatField;
    qDepCovrTarget1IQR84: TFloatField;
    qDepCovrTarget1IQR76: TFloatField;
    qDepCovrTarget1IQR86: TFloatField;
    qDepCovrTarget1IQRMU: TFloatField;
    qDepCovrTarget1IQR64MODEL: TFloatField;
    qDepCovrTarget1IQR74MODEL: TFloatField;
    qDepCovrTarget1IQRTHUMODEL: TFloatField;
    qDepCovrTarget1IQRMUSMP: TFloatField;
    cdsDepCovrTarget1IQR64: TFloatField;
    cdsDepCovrTarget1IQR74: TFloatField;
    cdsDepCovrTarget1IQR84: TFloatField;
    cdsDepCovrTarget1IQR76: TFloatField;
    cdsDepCovrTarget1IQR86: TFloatField;
    cdsDepCovrTarget1IQRMU: TFloatField;
    cdsDepCovrTarget1IQR64MODEL: TFloatField;
    cdsDepCovrTarget1IQR74MODEL: TFloatField;
    cdsDepCovrTarget1IQRTHUMODEL: TFloatField;
    cdsDepCovrTarget1IQRMUSMP: TFloatField;
    qDepCovrTarget2IQR64: TFloatField;
    qDepCovrTarget2IQR74: TFloatField;
    qDepCovrTarget2IQR84: TFloatField;
    qDepCovrTarget2IQR76: TFloatField;
    qDepCovrTarget2IQR86: TFloatField;
    qDepCovrTarget2IQRMU: TFloatField;
    qDepCovrTarget2IQR64MODEL: TFloatField;
    qDepCovrTarget2IQR74MODEL: TFloatField;
    qDepCovrTarget2IQRTHUMODEL: TFloatField;
    qDepCovrTarget2IQRMUSMP: TFloatField;
    cdsDepCovrTarget2IQR64: TFloatField;
    cdsDepCovrTarget2IQR74: TFloatField;
    cdsDepCovrTarget2IQR84: TFloatField;
    cdsDepCovrTarget2IQR76: TFloatField;
    cdsDepCovrTarget2IQR86: TFloatField;
    cdsDepCovrTarget2IQRMU: TFloatField;
    cdsDepCovrTarget2IQR64MODEL: TFloatField;
    cdsDepCovrTarget2IQR74MODEL: TFloatField;
    cdsDepCovrTarget2IQRTHUMODEL: TFloatField;
    cdsDepCovrTarget2IQRMUSMP: TFloatField;
    qUserDepData: TSQLQuery;
    dspUserDepData: TDataSetProvider;
    cdsUserDepData: TClientDataSet;
    dsUserDepData: TDataSource;
    cdsUserDepDataDEPOSITID: TIntegerField;
    cdsUserDepDataSAMPLENO: TStringField;
    cdsUserDepDataFRAC: TStringField;
    cdsUserDepDataINC4STATS: TStringField;
    cdsUserDepDataPB64: TFloatField;
    cdsUserDepDataPB74: TFloatField;
    cdsUserDepDataPB84: TFloatField;
    cdsUserDepDataMU: TFloatField;
    cdsUserDepDataPB76: TFloatField;
    cdsUserDepDataPB86: TFloatField;
    cdsUserDepDataMUSMP: TFloatField;
    cdsUserDepDataDEPOSITNAME: TStringField;
    cdsUserDepDataCOUNTRYID: TStringField;
    cdsUserDepDataDEPLATITUDE: TFloatField;
    cdsUserDepDataDEPLONGITUDE: TFloatField;
    cdsUserDepDataDEPOSITPARENTID: TIntegerField;
    cdsUserDepDataDEPOSITCLANID: TIntegerField;
    cdsDepStatisticsIQR64: TFloatField;
    cdsDepStatisticsIQR74: TFloatField;
    cdsDepStatisticsIQR84: TFloatField;
    cdsDepStatisticsIQR64MODEL: TFloatField;
    cdsDepStatisticsIQR74MODEL: TFloatField;
    cdsDepStatisticsIQRMU: TFloatField;
    cdsDepStatisticsIQR76: TFloatField;
    cdsDepStatisticsIQR86: TFloatField;
    cdsDepStatisticsIQRMUSMP: TFloatField;
    qUsersLASTUSED: TSQLTimeStampField;
    cdsUsersLASTUSED: TSQLTimeStampField;
    cdsDepCountCOUNTS: TIntegerField;
    cdsDepCountCOUNTSO4: TIntegerField;
    cdsDepCountCOUNTO: TIntegerField;
    qDeleteDepCovrProspect: TSQLQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    cdsUserDepSmpS34: TFloatField;
    cdsUserDepSmpSO434: TFloatField;
    cdsUserDepSmpO18: TFloatField;
    qDepCovrProspectMEDIANSR87INITIAL: TFloatField;
    qDepCovrProspectMEDIANND143INITIAL: TFloatField;
    qDepCovrProspectMEDIANOS187INITIAL: TFloatField;
    qDepCovrProspectMEDIANS34: TFloatField;
    qDepCovrProspectMEDIANSO434: TFloatField;
    qDepCovrProspectMEDIANO18: TFloatField;
    qDepCovrProspectNUMSAMPLESSR87INITIAL: TFloatField;
    qDepCovrProspectNUMSAMPLESND143INITIAL: TFloatField;
    qDepCovrProspectNUMSAMPLESOS187INITIAL: TFloatField;
    qDepCovrProspectNUMSAMPLESS34: TFloatField;
    qDepCovrProspectNUMSAMPLESSO434: TFloatField;
    qDepCovrProspectNUMSAMPLESO18: TFloatField;
    cdsDepCovrProspectMEDIANSR87INITIAL: TFloatField;
    cdsDepCovrProspectMEDIANND143INITIAL: TFloatField;
    cdsDepCovrProspectMEDIANOS187INITIAL: TFloatField;
    cdsDepCovrProspectMEDIANS34: TFloatField;
    cdsDepCovrProspectMEDIANSO434: TFloatField;
    cdsDepCovrProspectMEDIANO18: TFloatField;
    cdsDepCovrProspectNUMSAMPLESSR87INITIAL: TFloatField;
    cdsDepCovrProspectNUMSAMPLESND143INITIAL: TFloatField;
    cdsDepCovrProspectNUMSAMPLESOS187INITIAL: TFloatField;
    cdsDepCovrProspectNUMSAMPLESS34: TFloatField;
    cdsDepCovrProspectNUMSAMPLESSO434: TFloatField;
    cdsDepCovrProspectNUMSAMPLESO18: TFloatField;
    qS34: TSQLQuery;
    cdsS34: TClientDataSet;
    dsS34: TDataSource;
    qSigS34: TSQLQuery;
    cdsSigS34: TClientDataSet;
    dsSigS34: TDataSource;
    qES34: TSQLQuery;
    cdsES34: TClientDataSet;
    dsES34: TDataSource;
    qSO434: TSQLQuery;
    cdsSO434: TClientDataSet;
    dsSO434: TDataSource;
    qSigSO434: TSQLQuery;
    cdsSigSO434: TClientDataSet;
    dsSigSO434: TDataSource;
    qESO434: TSQLQuery;
    cdsESO434: TClientDataSet;
    dsESO434: TDataSource;
    qO18: TSQLQuery;
    cdsO18: TClientDataSet;
    dsO18: TDataSource;
    qSigO18: TSQLQuery;
    cdsSigO18: TClientDataSet;
    dsSigO18: TDataSource;
    qEO18: TSQLQuery;
    cdsEO18: TClientDataSet;
    dsEO18: TDataSource;
    cdsDepositSamplesProspectqEO18: TDataSetField;
    cdsDepositSamplesProspectqSigO18: TDataSetField;
    cdsDepositSamplesProspectqO18: TDataSetField;
    cdsDepositSamplesProspectqESO434: TDataSetField;
    cdsDepositSamplesProspectqSigSO434: TDataSetField;
    cdsDepositSamplesProspectqSO434: TDataSetField;
    cdsDepositSamplesProspectqES34: TDataSetField;
    cdsDepositSamplesProspectqSigS34: TDataSetField;
    cdsDepositSamplesProspectqS34: TDataSetField;
    cdsS34S34: TFloatField;
    cdsSigS34SIGS34: TFloatField;
    cdsES34ES34: TFloatField;
    cdsSO434SO434: TFloatField;
    cdsSigSO434SIGSO434: TFloatField;
    cdsESO434ESO434: TFloatField;
    cdsEO18EO18: TFloatField;
    qDepCovrProspectIQRSR87INITIAL: TFloatField;
    qDepCovrProspectIQRND143INITIAL: TFloatField;
    qDepCovrProspectIQROS187INITIAL: TFloatField;
    qDepCovrProspectIQRS34: TFloatField;
    qDepCovrProspectIQRSO434: TFloatField;
    qDepCovrProspectIQRO18: TFloatField;
    cdsDepCovrProspectIQRSR87INITIAL: TFloatField;
    cdsDepCovrProspectIQRND143INITIAL: TFloatField;
    cdsDepCovrProspectIQROS187INITIAL: TFloatField;
    cdsDepCovrProspectIQRS34: TFloatField;
    cdsDepCovrProspectIQRSO434: TFloatField;
    cdsDepCovrProspectIQRO18: TFloatField;
    qCountUserDepSmpIso: TSQLQuery;
    dspCountUserDepSmpIso: TDataSetProvider;
    cdsCountUserDepSmpIso: TClientDataSet;
    dsCountUserDepSmpIso: TDataSource;
    cdsDepStatisticsCOUNTS: TIntegerField;
    cdsDepStatisticsCOUNTSO4: TIntegerField;
    cdsDepStatisticsCOUNTO: TIntegerField;
    cdsDepStatisticsMEDIANSR87INITIAL: TFloatField;
    cdsDepStatisticsMEDIANND143INITIAL: TFloatField;
    cdsDepStatisticsMEDIANOS187INITIAL: TFloatField;
    cdsDepStatisticsMEDIANS34: TFloatField;
    cdsDepStatisticsMEDIANSO434: TFloatField;
    cdsDepStatisticsMEDIANO18: TFloatField;
    cdsDepStatisticsNUMSAMPLESSR87INITIAL: TFloatField;
    cdsDepStatisticsNUMSAMPLESND143INITIAL: TFloatField;
    cdsDepStatisticsNUMSAMPLESOS187INITIAL: TFloatField;
    cdsDepStatisticsNUMSAMPLESS34: TFloatField;
    cdsDepStatisticsNUMSAMPLESSO434: TFloatField;
    cdsDepStatisticsNUMSAMPLESO18: TFloatField;
    cdsDepStatisticsIQRSR87INITIAL: TFloatField;
    cdsDepStatisticsIQRND143INITIAL: TFloatField;
    cdsDepStatisticsIQROS187INITIAL: TFloatField;
    cdsDepStatisticsIQRS34: TFloatField;
    cdsDepStatisticsIQRSO434: TFloatField;
    cdsDepStatisticsIQRO18: TFloatField;
    qDepCovrProspectMEANSR87INITIAL: TFloatField;
    qDepCovrProspectMEANND143INITIAL: TFloatField;
    qDepCovrProspectMEANOS187INITIAL: TFloatField;
    qDepCovrProspectMEANS34: TFloatField;
    qDepCovrProspectMEANSO434: TFloatField;
    qDepCovrProspectMEANO18: TFloatField;
    qDepCovrProspectSDEVSR87INITIAL: TFloatField;
    qDepCovrProspectSDEVND143INITIAL: TFloatField;
    qDepCovrProspectSDEVOS187INITIAL: TFloatField;
    qDepCovrProspectSDEVS34: TFloatField;
    qDepCovrProspectSDEVSO434: TFloatField;
    qDepCovrProspectSDEVO18: TFloatField;
    qDepCovrProspectCOEFFVARSR87INITIAL: TFloatField;
    qDepCovrProspectCOEFFVARND143INITIAL: TFloatField;
    qDepCovrProspectCOEFFVAROS187INITIAL: TFloatField;
    qDepCovrProspectCOEFFVARS34: TFloatField;
    qDepCovrProspectCOEFFVARSO434: TFloatField;
    qDepCovrProspectCOEFFVARO18: TFloatField;
    cdsDepCovrProspectMEANSR87INITIAL: TFloatField;
    cdsDepCovrProspectMEANND143INITIAL: TFloatField;
    cdsDepCovrProspectMEANOS187INITIAL: TFloatField;
    cdsDepCovrProspectMEANS34: TFloatField;
    cdsDepCovrProspectMEANSO434: TFloatField;
    cdsDepCovrProspectMEANO18: TFloatField;
    cdsDepCovrProspectSDEVSR87INITIAL: TFloatField;
    cdsDepCovrProspectSDEVND143INITIAL: TFloatField;
    cdsDepCovrProspectSDEVOS187INITIAL: TFloatField;
    cdsDepCovrProspectSDEVS34: TFloatField;
    cdsDepCovrProspectSDEVSO434: TFloatField;
    cdsDepCovrProspectSDEVO18: TFloatField;
    cdsDepCovrProspectCOEFFVARSR87INITIAL: TFloatField;
    cdsDepCovrProspectCOEFFVARND143INITIAL: TFloatField;
    cdsDepCovrProspectCOEFFVAROS187INITIAL: TFloatField;
    cdsDepCovrProspectCOEFFVARS34: TFloatField;
    cdsDepCovrProspectCOEFFVARSO434: TFloatField;
    cdsDepCovrProspectCOEFFVARO18: TFloatField;
    qDepCovrTarget1MEDIANSR87INITIAL: TFloatField;
    qDepCovrTarget1MEDIANND143INITIAL: TFloatField;
    qDepCovrTarget1MEDIANOS187INITIAL: TFloatField;
    qDepCovrTarget1MEDIANS34: TFloatField;
    qDepCovrTarget1MEDIANSO434: TFloatField;
    qDepCovrTarget1MEDIANO18: TFloatField;
    qDepCovrTarget1MEANSR87INITIAL: TFloatField;
    qDepCovrTarget1MEANND143INITIAL: TFloatField;
    qDepCovrTarget1MEANOS187INITIAL: TFloatField;
    qDepCovrTarget1MEANS34: TFloatField;
    qDepCovrTarget1MEANSO434: TFloatField;
    qDepCovrTarget1MEANO18: TFloatField;
    qDepCovrTarget1NUMSAMPLESSR87INITIAL: TFloatField;
    qDepCovrTarget1NUMSAMPLESND143INITIAL: TFloatField;
    qDepCovrTarget1NUMSAMPLESOS187INITIAL: TFloatField;
    qDepCovrTarget1NUMSAMPLESS34: TFloatField;
    qDepCovrTarget1NUMSAMPLESSO434: TFloatField;
    qDepCovrTarget1NUMSAMPLESO18: TFloatField;
    qDepCovrTarget1SDEVSR87INITIAL: TFloatField;
    qDepCovrTarget1SDEVND143INITIAL: TFloatField;
    qDepCovrTarget1SDEVOS187INITIAL: TFloatField;
    qDepCovrTarget1SDEVS34: TFloatField;
    qDepCovrTarget1SDEVSO434: TFloatField;
    qDepCovrTarget1SDEVO18: TFloatField;
    qDepCovrTarget1COEFFVARSR87INITIAL: TFloatField;
    qDepCovrTarget1COEFFVARND143INITIAL: TFloatField;
    qDepCovrTarget1COEFFVAROS187INITIAL: TFloatField;
    qDepCovrTarget1COEFFVARS34: TFloatField;
    qDepCovrTarget1COEFFVARSO434: TFloatField;
    qDepCovrTarget1COEFFVARO18: TFloatField;
    qDepCovrTarget1IQRSR87INITIAL: TFloatField;
    qDepCovrTarget1IQRND143INITIAL: TFloatField;
    qDepCovrTarget1IQROS187INITIAL: TFloatField;
    qDepCovrTarget1IQRS34: TFloatField;
    qDepCovrTarget1IQRSO434: TFloatField;
    qDepCovrTarget1IQRO18: TFloatField;
    cdsDepCovrTarget1MEDIANSR87INITIAL: TFloatField;
    cdsDepCovrTarget1MEDIANND143INITIAL: TFloatField;
    cdsDepCovrTarget1MEDIANOS187INITIAL: TFloatField;
    cdsDepCovrTarget1MEDIANS34: TFloatField;
    cdsDepCovrTarget1MEDIANSO434: TFloatField;
    cdsDepCovrTarget1MEDIANO18: TFloatField;
    cdsDepCovrTarget1MEANSR87INITIAL: TFloatField;
    cdsDepCovrTarget1MEANND143INITIAL: TFloatField;
    cdsDepCovrTarget1MEANOS187INITIAL: TFloatField;
    cdsDepCovrTarget1MEANS34: TFloatField;
    cdsDepCovrTarget1MEANSO434: TFloatField;
    cdsDepCovrTarget1MEANO18: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESSR87INITIAL: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESND143INITIAL: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESOS187INITIAL: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESS34: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESSO434: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESO18: TFloatField;
    cdsDepCovrTarget1SDEVSR87INITIAL: TFloatField;
    cdsDepCovrTarget1SDEVND143INITIAL: TFloatField;
    cdsDepCovrTarget1SDEVOS187INITIAL: TFloatField;
    cdsDepCovrTarget1SDEVS34: TFloatField;
    cdsDepCovrTarget1SDEVSO434: TFloatField;
    cdsDepCovrTarget1SDEVO18: TFloatField;
    cdsDepCovrTarget1COEFFVARSR87INITIAL: TFloatField;
    cdsDepCovrTarget1COEFFVARND143INITIAL: TFloatField;
    cdsDepCovrTarget1COEFFVAROS187INITIAL: TFloatField;
    cdsDepCovrTarget1COEFFVARS34: TFloatField;
    cdsDepCovrTarget1COEFFVARSO434: TFloatField;
    cdsDepCovrTarget1COEFFVARO18: TFloatField;
    cdsDepCovrTarget1IQRSR87INITIAL: TFloatField;
    cdsDepCovrTarget1IQRND143INITIAL: TFloatField;
    cdsDepCovrTarget1IQROS187INITIAL: TFloatField;
    cdsDepCovrTarget1IQRS34: TFloatField;
    cdsDepCovrTarget1IQRSO434: TFloatField;
    cdsDepCovrTarget1IQRO18: TFloatField;
    qDepCovrTarget2MEDIANSR87INITIAL: TFloatField;
    qDepCovrTarget2MEDIANND143INITIAL: TFloatField;
    qDepCovrTarget2MEDIANOS187INITIAL: TFloatField;
    qDepCovrTarget2MEDIANS34: TFloatField;
    qDepCovrTarget2MEDIANSO434: TFloatField;
    qDepCovrTarget2MEDIANO18: TFloatField;
    qDepCovrTarget2MEANSR87INITIAL: TFloatField;
    qDepCovrTarget2MEANND143INITIAL: TFloatField;
    qDepCovrTarget2MEANOS187INITIAL: TFloatField;
    qDepCovrTarget2MEANS34: TFloatField;
    qDepCovrTarget2MEANSO434: TFloatField;
    qDepCovrTarget2MEANO18: TFloatField;
    qDepCovrTarget2NUMSAMPLESSR87INITIAL: TFloatField;
    qDepCovrTarget2NUMSAMPLESND143INITIAL: TFloatField;
    qDepCovrTarget2NUMSAMPLESOS187INITIAL: TFloatField;
    qDepCovrTarget2NUMSAMPLESS34: TFloatField;
    qDepCovrTarget2NUMSAMPLESSO434: TFloatField;
    qDepCovrTarget2NUMSAMPLESO18: TFloatField;
    qDepCovrTarget2SDEVSR87INITIAL: TFloatField;
    qDepCovrTarget2SDEVND143INITIAL: TFloatField;
    qDepCovrTarget2SDEVOS187INITIAL: TFloatField;
    qDepCovrTarget2SDEVS34: TFloatField;
    qDepCovrTarget2SDEVSO434: TFloatField;
    qDepCovrTarget2SDEVO18: TFloatField;
    qDepCovrTarget2COEFFVARSR87INITIAL: TFloatField;
    qDepCovrTarget2COEFFVARND143INITIAL: TFloatField;
    qDepCovrTarget2COEFFVAROS187INITIAL: TFloatField;
    qDepCovrTarget2COEFFVARS34: TFloatField;
    qDepCovrTarget2COEFFVARSO434: TFloatField;
    qDepCovrTarget2COEFFVARO18: TFloatField;
    qDepCovrTarget2IQRSR87INITIAL: TFloatField;
    qDepCovrTarget2IQRND143INITIAL: TFloatField;
    qDepCovrTarget2IQROS187INITIAL: TFloatField;
    qDepCovrTarget2IQRS34: TFloatField;
    qDepCovrTarget2IQRSO434: TFloatField;
    qDepCovrTarget2IQRO18: TFloatField;
    cdsDepCovrTarget2MEDIANSR87INITIAL: TFloatField;
    cdsDepCovrTarget2MEDIANND143INITIAL: TFloatField;
    cdsDepCovrTarget2MEDIANOS187INITIAL: TFloatField;
    cdsDepCovrTarget2MEDIANS34: TFloatField;
    cdsDepCovrTarget2MEDIANSO434: TFloatField;
    cdsDepCovrTarget2MEDIANO18: TFloatField;
    cdsDepCovrTarget2MEANSR87INITIAL: TFloatField;
    cdsDepCovrTarget2MEANND143INITIAL: TFloatField;
    cdsDepCovrTarget2MEANOS187INITIAL: TFloatField;
    cdsDepCovrTarget2MEANS34: TFloatField;
    cdsDepCovrTarget2MEANSO434: TFloatField;
    cdsDepCovrTarget2MEANO18: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESSR87INITIAL: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESND143INITIAL: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESOS187INITIAL: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESS34: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESSO434: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESO18: TFloatField;
    cdsDepCovrTarget2SDEVSR87INITIAL: TFloatField;
    cdsDepCovrTarget2SDEVND143INITIAL: TFloatField;
    cdsDepCovrTarget2SDEVOS187INITIAL: TFloatField;
    cdsDepCovrTarget2SDEVS34: TFloatField;
    cdsDepCovrTarget2SDEVSO434: TFloatField;
    cdsDepCovrTarget2SDEVO18: TFloatField;
    cdsDepCovrTarget2COEFFVARSR87INITIAL: TFloatField;
    cdsDepCovrTarget2COEFFVARND143INITIAL: TFloatField;
    cdsDepCovrTarget2COEFFVAROS187INITIAL: TFloatField;
    cdsDepCovrTarget2COEFFVARS34: TFloatField;
    cdsDepCovrTarget2COEFFVARSO434: TFloatField;
    cdsDepCovrTarget2COEFFVARO18: TFloatField;
    cdsDepCovrTarget2IQRSR87INITIAL: TFloatField;
    cdsDepCovrTarget2IQRND143INITIAL: TFloatField;
    cdsDepCovrTarget2IQROS187INITIAL: TFloatField;
    cdsDepCovrTarget2IQRS34: TFloatField;
    cdsDepCovrTarget2IQRSO434: TFloatField;
    cdsDepCovrTarget2IQRO18: TFloatField;
    SQLMonitor1: TSQLMonitor;
    cdsUserDepDataAPPROXAGE: TFloatField;
    cdsUserDepDataS34: TFloatField;
    cdsUserDepDataSO434: TFloatField;
    cdsUserDepDataO18: TFloatField;
    cdsUserDepDataDEPOSITCLAN: TStringField;
    cdsPb86PB86: TFloatField;
    qDepositSamplesProspectDATAVALUE: TFloatField;
    cdsDepositSamplesProspectDATAVALUE: TFloatField;
    sqlcDateView: TSQLConnection;
    cdsCountDepositSamplesProspectCOUNT: TFMTBCDField;
    cdsCountUserDepSmpIsoNUMFOUND: TFMTBCDField;
    cdsDepCountCOUNTHF: TIntegerField;
    qHF176: TSQLQuery;
    cdsHF176: TClientDataSet;
    dsHF176: TDataSource;
    qSigHf176: TSQLQuery;
    cdsSigHf176: TClientDataSet;
    dsSigHf176: TDataSource;
    qeHf176: TSQLQuery;
    cdseHf176: TClientDataSet;
    dseHf176: TDataSource;
    cdsSigO18SIGO18: TFloatField;
    cdsO18O18: TFloatField;
    cdsUserDepDataSPB64: TFloatField;
    cdsUserDepDataEPB64: TFloatField;
    cdsUserDepDataSPB74: TFloatField;
    cdsUserDepDataEPB74: TFloatField;
    cdsUserDepDataSPB84: TFloatField;
    cdsUserDepDataEPB84: TFloatField;
    cdsUserDepDataSMU: TFloatField;
    cdsUserDepDataSPB76: TFloatField;
    cdsUserDepDataRHO76: TFloatField;
    cdsUserDepDataSPB86: TFloatField;
    cdsUserDepDataEPB86: TFloatField;
    cdsUserDepDataRHO86: TFloatField;
    cdsUserDepDataSR87I: TFloatField;
    cdsUserDepDataSSR87I: TFloatField;
    cdsUserDepDataESR87I: TFloatField;
    cdsUserDepDataND143I: TFloatField;
    cdsUserDepDataSND143I: TFloatField;
    cdsUserDepDataEND143I: TFloatField;
    cdsUserDepDataOS187I: TFloatField;
    cdsUserDepDataSOS187I: TFloatField;
    cdsUserDepDataEOS187I: TFloatField;
    cdsUserDepDataHF176I: TFloatField;
    cdsUserDepDataSHF176I: TFloatField;
    cdsUserDepDataEHF176I: TFloatField;
    cdsUserDepDataSS34: TFloatField;
    cdsUserDepDataSSO434: TFloatField;
    cdsUserDepDataSO18: TFloatField;
    cdsUserDepDataEPB76: TFloatField;
    cdsUserDepSmpSPB64: TFloatField;
    cdsUserDepSmpEPB64: TFloatField;
    cdsUserDepSmpSPB74: TFloatField;
    cdsUserDepSmpEPB74: TFloatField;
    cdsUserDepSmpSPB84: TFloatField;
    cdsUserDepSmpEPB84: TFloatField;
    cdsUserDepSmpSMU: TFloatField;
    cdsUserDepSmpSPB76: TFloatField;
    cdsUserDepSmpEPB76: TFloatField;
    cdsUserDepSmpRHO76: TFloatField;
    cdsUserDepSmpSPB86: TFloatField;
    cdsUserDepSmpEPB86: TFloatField;
    cdsUserDepSmpRHO86: TFloatField;
    cdsUserDepSmpSR87I: TFloatField;
    cdsUserDepSmpSSR87I: TFloatField;
    cdsUserDepSmpESR87I: TFloatField;
    cdsUserDepSmpND143I: TFloatField;
    cdsUserDepSmpSND143I: TFloatField;
    cdsUserDepSmpEND143I: TFloatField;
    cdsUserDepSmpHF176I: TFloatField;
    cdsUserDepSmpSHF176I: TFloatField;
    cdsUserDepSmpEHF176I: TFloatField;
    cdsUserDepSmpOS187I: TFloatField;
    cdsUserDepSmpSOS187I: TFloatField;
    cdsUserDepSmpEOS187I: TFloatField;
    cdsUserDepSmpSS34: TFloatField;
    cdsUserDepSmpSSO434: TFloatField;
    cdsUserDepSmpSO18: TFloatField;
    cdsSr87SR87I: TFloatField;
    cdsNd143ND143I: TFloatField;
    cdsOs187OS187I: TFloatField;
    cdsDepositSamplesProspectqeHf176: TDataSetField;
    cdsDepositSamplesProspectqSigHf176: TDataSetField;
    cdsDepositSamplesProspectqHF176: TDataSetField;
    cdsHF176HF176I: TFloatField;
    cdsSigHf176SIGHF176I: TFloatField;
    cdseHf176EHF176I: TFloatField;
    cdsDepCountDEPOSITCLAN: TStringField;
    cdsDepStatisticsDEPOSITCLAN: TStringField;
    cdsDepStatisticsCOUNTHF: TIntegerField;
    cdsDepStatisticsMEDIANHF176INITIAL: TFloatField;
    cdsDepStatisticsNUMSAMPLESHF176INITIAL: TFloatField;
    cdsDepStatisticsIQRHF176INITIAL: TFloatField;
    cdsUserDepDataAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepStatisticsMEDIAN84MODEL: TFloatField;
    cdsDepStatisticsMEDIANTHUSAMPLES: TFloatField;
    qDepCovrProspectMEDIAN84MODEL: TFloatField;
    qDepCovrProspectMEDIANTHUSAMPLES: TFloatField;
    qDepCovrProspectMEDIANHF176INITIAL: TFloatField;
    qDepCovrProspectMEANHF176INITIAL: TFloatField;
    qDepCovrProspectNUMSAMPLESHF176INITIAL: TFloatField;
    qDepCovrProspectSDEVHF176INITIAL: TFloatField;
    qDepCovrProspectCOEFFVARHF176INITIAL: TFloatField;
    qDepCovrProspectIQRHF176INITIAL: TFloatField;
    cdsDepCovrProspectMEDIAN84MODEL: TFloatField;
    cdsDepCovrProspectMEDIANTHUSAMPLES: TFloatField;
    cdsDepCovrProspectMEDIANHF176INITIAL: TFloatField;
    cdsDepCovrProspectMEANHF176INITIAL: TFloatField;
    cdsDepCovrProspectNUMSAMPLESHF176INITIAL: TFloatField;
    cdsDepCovrProspectSDEVHF176INITIAL: TFloatField;
    cdsDepCovrProspectCOEFFVARHF176INITIAL: TFloatField;
    cdsDepCovrProspectIQRHF176INITIAL: TFloatField;
    qDepCovrTarget1MEDIAN84MODEL: TFloatField;
    qDepCovrTarget1MEDIANTHUSAMPLES: TFloatField;
    qDepCovrTarget1MEDIANHF176INITIAL: TFloatField;
    qDepCovrTarget1MEANHF176INITIAL: TFloatField;
    qDepCovrTarget1NUMSAMPLESHF176INITIAL: TFloatField;
    qDepCovrTarget1SDEVHF176INITIAL: TFloatField;
    qDepCovrTarget1COEFFVARHF176INITIAL: TFloatField;
    qDepCovrTarget1IQRHF176INITIAL: TFloatField;
    cdsDepCovrTarget1MEDIAN84MODEL: TFloatField;
    cdsDepCovrTarget1MEDIANTHUSAMPLES: TFloatField;
    cdsDepCovrTarget1MEDIANHF176INITIAL: TFloatField;
    cdsDepCovrTarget1MEANHF176INITIAL: TFloatField;
    cdsDepCovrTarget1NUMSAMPLESHF176INITIAL: TFloatField;
    cdsDepCovrTarget1SDEVHF176INITIAL: TFloatField;
    cdsDepCovrTarget1COEFFVARHF176INITIAL: TFloatField;
    cdsDepCovrTarget1IQRHF176INITIAL: TFloatField;
    qDepCovrTarget2MEDIAN84MODEL: TFloatField;
    qDepCovrTarget2MEDIANTHUSAMPLES: TFloatField;
    qDepCovrTarget2MEDIANHF176INITIAL: TFloatField;
    qDepCovrTarget2MEANHF176INITIAL: TFloatField;
    qDepCovrTarget2NUMSAMPLESHF176INITIAL: TFloatField;
    qDepCovrTarget2SDEVHF176INITIAL: TFloatField;
    qDepCovrTarget2COEFFVARHF176INITIAL: TFloatField;
    qDepCovrTarget2IQRHF176INITIAL: TFloatField;
    cdsDepCovrTarget2MEDIAN84MODEL: TFloatField;
    cdsDepCovrTarget2MEDIANTHUSAMPLES: TFloatField;
    cdsDepCovrTarget2MEDIANHF176INITIAL: TFloatField;
    cdsDepCovrTarget2MEANHF176INITIAL: TFloatField;
    cdsDepCovrTarget2NUMSAMPLESHF176INITIAL: TFloatField;
    cdsDepCovrTarget2SDEVHF176INITIAL: TFloatField;
    cdsDepCovrTarget2COEFFVARHF176INITIAL: TFloatField;
    cdsDepCovrTarget2IQRHF176INITIAL: TFloatField;
    cdsUserDepDataKAPPASRC: TFloatField;
    cdsUserDepDataSKAPPASRC: TFloatField;
    cdsUserDepDataKAPPASMP: TFloatField;
    cdsUserDepDataSKAPPASMP: TFloatField;
    qDeleteUserDepSampleValuesForUser: TSQLQuery;
    cdsUserDepDataDEPOSITSTATUSID: TIntegerField;
    cdsUserDepSmpKAPPASRC: TFloatField;
    cdsUserDepSmpSKAPPASRC: TFloatField;
    cdsUserDepSmpKAPPASMP: TFloatField;
    cdsUserDepSmpSKAPPASMP: TFloatField;
    qUserDepSmpUSERID: TStringField;
    qUserDepSmpDEPOSITID: TIntegerField;
    qUserDepSmpSAMPLENO: TStringField;
    qUserDepSmpFRAC: TStringField;
    qUserDepSmpINC4STATS: TStringField;
    qUserDepSmpPB64: TFloatField;
    qUserDepSmpSPB64: TFloatField;
    qUserDepSmpEPB64: TFloatField;
    qUserDepSmpPB74: TFloatField;
    qUserDepSmpSPB74: TFloatField;
    qUserDepSmpEPB74: TFloatField;
    qUserDepSmpPB84: TFloatField;
    qUserDepSmpSPB84: TFloatField;
    qUserDepSmpEPB84: TFloatField;
    qUserDepSmpMU: TFloatField;
    qUserDepSmpSMU: TFloatField;
    qUserDepSmpMUSMP: TFloatField;
    qUserDepSmpPB76: TFloatField;
    qUserDepSmpSPB76: TFloatField;
    qUserDepSmpEPB76: TFloatField;
    qUserDepSmpRHO76: TFloatField;
    qUserDepSmpPB86: TFloatField;
    qUserDepSmpSPB86: TFloatField;
    qUserDepSmpEPB86: TFloatField;
    qUserDepSmpRHO86: TFloatField;
    qUserDepSmpKAPPASRC: TFloatField;
    qUserDepSmpSKAPPASRC: TFloatField;
    qUserDepSmpKAPPASMP: TFloatField;
    qUserDepSmpSKAPPASMP: TFloatField;
    qUserDepSmpSR87I: TFloatField;
    qUserDepSmpSSR87I: TFloatField;
    qUserDepSmpESR87I: TFloatField;
    qUserDepSmpND143I: TFloatField;
    qUserDepSmpSND143I: TFloatField;
    qUserDepSmpEND143I: TFloatField;
    qUserDepSmpHF176I: TFloatField;
    qUserDepSmpSHF176I: TFloatField;
    qUserDepSmpEHF176I: TFloatField;
    qUserDepSmpOS187I: TFloatField;
    qUserDepSmpSOS187I: TFloatField;
    qUserDepSmpEOS187I: TFloatField;
    qUserDepSmpS34: TFloatField;
    qUserDepSmpSS34: TFloatField;
    qUserDepSmpSO434: TFloatField;
    qUserDepSmpSSO434: TFloatField;
    qUserDepSmpO18: TFloatField;
    qUserDepSmpSO18: TFloatField;
    cdsDepStatisticsMATERIALABR: TStringField;
    qDepositSamplesProspectMATERIALABR: TStringField;
    cdsDepositSamplesProspectMATERIALABR: TStringField;
    qDepCovrProspectMATERIALABR: TStringField;
    cdsDepCovrProspectMATERIALABR: TStringField;
    qUserDepSmpMATERIALABR: TStringField;
    cdsUserDepSmpMATERIALABR: TStringField;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    function GetCurrent_Date: variant;
    function GetCurrentDate: variant;
  public
    //procedure GetFormData2(var SQLMemoField : string);
    //procedure SetFormData2(SQLMemoField : string);
    procedure SubmitQuery1;
    procedure CalcMuErr (     Age    : double;
                          XRatio : double;
                          YRatio : double;
                          XError : double;
                          YError : double;
                          R      : double;
                          T_Mult : double;
                          mu_StartAge : double;
                          mu_XRatio, mu_YRatio, mu_Mu : double;
                      var Mu     : double;
                      var MuErr  : double );
    procedure CalculateCoVarAvg(tDepositID : integer; tAge : double);
    procedure CopyDepositDataForUser( tUserID : string;
                                      tDepositID : string;
                                      tAge : double);
    procedure FindLeastRadiogenicSample(tDepositID : integer; var MinPb64 : double; var MinPb74 : double);
    procedure CalculateCoVarLeastRadiogenic(tDepositID : integer; tAge : double);
    procedure CalculateCoVarMostRadiogenic(tDepositID : integer; tAge : double);
    procedure CalcPbInitial ( Age    : double;
                          XRatio : double;
                          YRatio : double;
                          XError : double;
                          YError : double;
                          R      : double;
                          T_Mult : double;
                          mu_StartAge : double;
                          mu_XRatio, mu_YRatio : double;
                          Mu     : double;
                          MuErr  : double;
                      var Pb64i     : double;
                      var Pb64iErr  : double;
                      var Pb74i     : double;
                      var Pb74iErr  : double;
                      var MuSmp     : double;
                      var MuSmpErr  : double );
  procedure CalcModelSmpKappa ( Age    : double;
                          XRatio : double;
                          ZRatio : double;
                          XError : double;
                          ZError : double;
                          T_Mult : double;
                          mu_StartAge : double;
                          mu_XRatio, mu_ZRatio : double;
                          Mu     : double;
                          MuErr  : double;
                          KappaSrc     : double;
                          KappaSrcErr  : double;
                      var KappaSmp     : double;
                      var KappaSmpErr  : double );
    procedure CalcModelSourceKappa ( Age    : double;
                          XRatio : double;
                          ZRatio : double;
                          XError : double;
                          ZError : double;
                          T_Mult : double;
                          mu_StartAge : double;
                          mu_XRatio, mu_ZRatio : double;
                          Mu     : double;
                          MuErr  : double;
                      var Pb84i     : double;
                      var Pb84iErr  : double;
                      var KappaSrc     : double;
                      var KappaSrcErr  : double );
    procedure Sort   ( var A   : DoubleArray;
                    upr, lwr   : integer);
    procedure Hinges   (    A   : DoubleArray;
                        var HL  : double;
                        var HU  : double;
                            N   : integer);
    procedure DeleteDepositSampleFrac( tDepositID : integer;
                                       tSampleNo, tFrac : string;
                                   var WasSuccessful : boolean);
    procedure MarkSampleFracAsUnknownDeposit( tDepositID : integer;
                                       tSampleNo, tFrac : string;
                                   var WasSuccessful : boolean);
    procedure DeleteDepositStatistics( tDepositID : integer;
                                   var WasSuccessful : boolean);
    procedure DeleteSampleFracVariable( tSampleNo, tFrac, tVariableID : string;
                                   var WasSuccessful : boolean);
    procedure GetIsoSystemCounts(tUserID,tDepositID : string;
                                 var NumPb : integer;
                                 var NumSr : integer;
                                 var NumNd : integer;
                                 var NumOs : integer;
                                 var NumS : integer;
                                 var NumSO4 : integer;
                                 var NumO : integer);
    function PbModelAge(Slope: double): double;
    procedure DeleteUserDepSampleValuesForUser( tUserID : string;
                                   var WasSuccessful : boolean);
  published
    property Current_Date: variant read GetCurrent_Date;
    property CurrentDate: variant read GetCurrentDate;
  end;

// Procs
  function dmDep: TdmDep;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  Variants, usrIW_dm;

// Since we are threaded we cannot use global variables to store form / datamodule references
// so we store them in WebApplication.Data and we could reference that each time, but by creating
// a function like this our other code looks "normal" almost as if its referencing a global.
// This function is not necessary but it makes the code in the main form which references this
// datamodule a lot neater.
// Without this function every time we would reference this datamodule we would use:
//   TDataModule1(WebApplication.Data).Datamodule.<method / component>
// By creating this procedure it becomes:
//   TDataModule1.<method / component>
// Which is just like normal Delphi code.

function dmDep: TdmDep;
begin
  Result := TUserSession(WebApplication.Data).dmDep;
end;


procedure TdmDep.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  if UserSession.ShowWebErrorMessages then
  begin
    WebApplication.ShowMessage('Reconcile error - '+E.Message);
  end;
end;

function TdmDep.GetCurrent_Date: variant;
begin
  Result:=dmUser.GetUTCDateTime;
end;

function TdmDep.GetCurrentDate: variant;
begin
  Result:= double(dmUser.GetUTCDateTime); //Dates should be passed as numbers, and the corresponding cell in excel have Date format.
end;

procedure TdmDep.Sort   ( var A   : DoubleArray;
                       upr, lwr   : integer);
{shellsort routine}
var
  i, j : integer;
  d : integer;
  tempr : double;
begin
  d := upr - lwr + 1;
  while (d > 1) do
  begin
    if (d < 5) then d := 1
               else d := trunc(0.45454 * d);
    {do linear insertion sort in steps size d}
    for i := upr-d downto lwr do
    begin
      tempr := A[i];
      j := i+d;
      while (j <= upr) do
      begin
        if tempr > A[j] then
        begin
          A[j-d] := A[j];
          j := j+d
        end else
        begin
          Break;
        end;
        A[j-d] := tempr;
      end;
    end;
  end;
end;

procedure TdmDep.Hinges   (    A   : DoubleArray;
                           var HL  : double;
                           var HU  : double;
                               N   : integer);
var
  il : integer;
begin
  il := (N+3) div 4;
  HL := 1.0*A[il];
  HU := 1.0*A[N-il+1];
  if (N mod 4 = 0) then
  begin
    HL := 0.5 * (HL + A[il+1]);
    HU := 0.5 * (HU + A[N-il]);
  end;
end;

procedure TdmDep.SubmitQuery1;
begin
  dmDep.Query1.ParamByName('USERID').AsString := UserSession.UserID;
  dmUser.SetFormData2(dmDep.Query1.SQL.Text);
  dmUser.SetDeveloperData(dmDep.Query1.SQL.Text);
end;

procedure TdmDep.CalcMuErr (     Age    : double;
                          XRatio : double;
                          YRatio : double;
                          XError : double;
                          YError : double;
                          R      : double;
                          T_Mult : double;
                          mu_StartAge : double;
                          mu_XRatio, mu_YRatio, mu_Mu : double;
                      var Mu     : double;
                      var MuErr  : double );
{Mu and errors for individual points}
//const
  //DecayConst238 = 1.55125e-10;
  //DecayConst235 = 9.8485e-10;
var
  A, B, C, G,
  U, V, W,
  t1, t2,
  dUdXs,
  dUdYs, dVdXs,
  dWdXs, dVdYs,
  dWdYs,
  SigXsYs          : double;
  SigXs, SigYs,
  SigU             : double;
  mu_smp, mu_res   : double;

function Age5 ( tAge : double) : double;
begin
  Age5:=Exp(DecayConst235*tAge);
end;

function Age8 ( tAge : double) : double;
begin
  Age8:=Exp(DecayConst238*tAge);
end;

begin
  Mu := 0.0;
  MuErr := 0.0;
  if ((XRatio > 0.0) and (YRatio > 0.0)) then
  begin
    Age:=Age*1.0e6;
    t1 := XError;
    t2 := YError;
    t1:=t1*T_Mult;
    t2:=t2*T_Mult;
    if (t1<=0.0) then t1:=1.0e-5;
    if (t2<=0.0) then t2:=1.0e-5;
    SigXs:=t1;
    SigYs:=t2;
    A:=Age5(Age)-1.0;
    B:=Age8(Age)-1.0;
    C:=Age5(mu_StartAge)-Age5(Age);
    G:=Age8(mu_StartAge)-Age8(Age);
    mu_smp := A/(U238U235*B);
    mu_res := mu_smp*(mu_XRatio-XRatio) + YRatio-mu_YRatio;
    mu_res := mu_res/(C/U238U235-mu_smp*G);
    V:=(A/B)*(mu_XRatio-XRatio)/U238U235 + YRatio-mu_YRatio;
    W:=C/U238U235 - (A/B)*G/U238U235;
    U := mu_res;
    dVdXs:=(-1.0*A)/(U238U235*B);
    dWdXs:=0.0;
    dUdXs:=(W*dVdXs-V*dWdXs)/(W*W);
    dVdYs:=1.0;
    dWdYs:=0.0;
    dUdYs:=(W*dVdYs-V*dWdYs)/(W*W);
    SigXsYs:=R*SigXs*SigYs;
    SigU:=(dUdXs*SigXs)*(dUdXs*SigXs) + (dUdYs*SigYs)*(dUdYs*SigYs);
    SigU:=SigU + 2.0*dUdXs*dUdYs*SigXsYs;
    SigU:=Sqrt(SigU);
    MuErr:=SigU;
    Mu:=U;
  end;
end;

procedure TdmDep.CalcPbInitial ( Age    : double;
                          XRatio : double;
                          YRatio : double;
                          XError : double;
                          YError : double;
                          R      : double;
                          T_Mult : double;
                          mu_StartAge : double;
                          mu_XRatio, mu_YRatio : double;
                          Mu     : double;
                          MuErr  : double;
                      var Pb64i     : double;
                      var Pb64iErr  : double;
                      var Pb74i     : double;
                      var Pb74iErr  : double;
                      var MuSmp     : double;
                      var MuSmpErr  : double );
var
  //i : integer;
  t1 : double;
begin
  Pb64i := 0.0;
  Pb64iErr := 0.0;
  Pb74i := 0.0;
  Pb74iErr := 0.0;
  MuSmp := 0.0;
  MuSmpErr := 0.0;
  Age := Age * 1.0e6;
  t1 := XError;
  if (t1<=0.0) then t1:=1.0e-5;
  if ((XRatio > 0.0) and (YRatio > 0.0)) then
  begin
    Pb64i := mu_XRatio + Mu * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    Pb64iErr := mu_XRatio + (Mu+MuErr) * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    Pb64iErr := Pb64iErr + mu_XRatio + (Mu-MuErr) * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    Pb64iErr := Pb64iErr/2.0;
    Pb74i := mu_YRatio + Mu/U238U235 * (exp(mu_StartAge*DecayConst235) - exp(Age *DecayConst235));
    Pb74iErr := mu_YRatio + (Mu+MuErr)/U238U235 * (exp(mu_StartAge*DecayConst235) - exp(Age *DecayConst235));
    Pb74iErr := Pb74iErr + mu_YRatio + (Mu-MuErr)/U238U235 * (exp(mu_StartAge*DecayConst235) - exp(Age *DecayConst235));
    Pb74iErr := Pb74iErr/2.0;
    MuSmp := (XRatio - Pb64i) / (exp(Age*DecayConst238) - 1.0);
    MuSmpErr := (XRatio + t1 - Pb64i - Pb64iErr) / (exp(Age*DecayConst238) - 1.0);
  end;
end;

procedure TdmDep.CalcModelSmpKappa ( Age    : double;
                          XRatio : double;
                          ZRatio : double;
                          XError : double;
                          ZError : double;
                          T_Mult : double;
                          mu_StartAge : double;
                          mu_XRatio, mu_ZRatio : double;
                          Mu     : double;
                          MuErr  : double;
                          KappaSrc     : double;
                          KappaSrcErr  : double;
                      var KappaSmp     : double;
                      var KappaSmpErr  : double );
var
  //i : integer;
  t1 : double;
  Pb64i, Pb64iErr,
  Pb84i, Pb84iErr : double;
begin
  Pb64i := 0.0;
  Pb64iErr := 0.0;
  Pb84i := 0.0;
  Pb84iErr := 0.0;
  KappaSmp := 0.0;
  KappaSmpErr := 0.0;
  Age := Age * 1.0e6;
  t1 := ZError;
  if (t1<=0.0) then t1:=1.0e-5;
  if ((XRatio > 0.0) and (ZRatio > 0.0)) then
  begin
    Pb64i := mu_XRatio + Mu * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    //Pb64iErr := mu_XRatio + (Mu+MuErr) * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    //Pb64iErr := Pb64iErr + mu_XRatio + (Mu-MuErr) * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    //Pb64iErr := Pb64iErr/2.0;
    Pb84i := mu_ZRatio + (Mu*KappaSrc) * (exp(mu_StartAge*DecayConst232) - exp(Age *DecayConst232));
    //Pb84iErr := mu_ZRatio + ((Mu+MuErr)*(KappaSrc+KappaSrcError)) * (exp(mu_StartAge*DecayConst232) - exp(Age *DecayConst232));
    //Pb84iErr := Pb84iErr + mu_ZRatio + ((Mu-MuErr)*(KappaSrc-KappaSrcError)) * (exp(mu_StartAge*DecayConst232) - exp(Age *DecayConst232));
    //Pb84iErr := Pb84iErr/2.0;
    KappaSmp := (ZRatio - Pb84i) / (exp(Age*DecayConst232) - 1.0);
    //KappaSmpErr := (ZRatio + t1 - Pb84i - Pb84iErr) / (exp(Age*DecayConst232) - 1.0);
    //dmUser.SetDeveloperData('MuSrc = '+FormatFloat('###0.000',Mu));
    //dmUser.SetDeveloperData('KappaSrc = '+FormatFloat('###0.000',KappaSrc));
    //dmUser.SetDeveloperData('Pb84i = '+FormatFloat('###0.000',Pb84i));
    //dmUser.SetDeveloperData('KappaSmp = '+FormatFloat('###0.000',KappaSmp));
  end;
end;

procedure TdmDep.CalcModelSourceKappa ( Age    : double;
                          XRatio : double;
                          ZRatio : double;
                          XError : double;
                          ZError : double;
                          T_Mult : double;
                          mu_StartAge : double;
                          mu_XRatio, mu_ZRatio : double;
                          Mu     : double;
                          MuErr  : double;
                      var Pb84i     : double;
                      var Pb84iErr  : double;
                      var KappaSrc     : double;
                      var KappaSrcErr  : double );
var
  //i : integer;
  t1, t2 : double;
  Pb64i, Pb64iErr : double;
begin
  Pb64i := 0.0;
  Pb64iErr := 0.0;
  Pb84i := 0.0;
  Pb84iErr := 0.0;
  KappaSrc := 0.0;
  KappaSrcErr := 0.0;
  Age := Age * 1.0e6;
  t1 := ZError;
  if (t1<=0.0) then t1:=1.0e-5;
  if ((XRatio > 0.0) and (ZRatio > 0.0)) then
  begin
    //dmUser.SetDeveloperData('Mu = '+FormatFloat('###0.000',Mu));
    //dmUser.SetDeveloperData('ZRatio = '+FormatFloat('###0.000',ZRatio));
    //dmUser.SetDeveloperData('mu_ZRatio = '+FormatFloat('###0.000',mu_ZRatio));
    //dmUser.SetDeveloperData('XRatio = '+FormatFloat('###0.000',XRatio));
    //dmUser.SetDeveloperData('mu_XRatio = '+FormatFloat('###0.000',mu_XRatio));
    //dmUser.SetDeveloperData('DecayConst238 = '+FormatFloat('###0.00000',DecayConst238*1e10));
    //dmUser.SetDeveloperData('DecayConst232 = '+FormatFloat('###0.00000',DecayConst232*1e11));
    //dmUser.SetDeveloperData('mu_StartAge = '+FormatFloat('###0.000',mu_StartAge/1e6));
    //dmUser.SetDeveloperData('Age = '+FormatFloat('###0.000',Age/1e6));
    KappaSrc := (ZRatio - mu_ZRatio) * (exp(mu_StartAge*DecayConst238) - exp(Age*DecayConst238));
    //dmUser.SetDeveloperData('KappaSrc = '+FormatFloat('###0.000',KappaSrc));
    t2 := (XRatio - mu_XRatio) * (exp(mu_StartAge*DecayConst232) - exp(Age*DecayConst232));
    //dmUser.SetDeveloperData('t2 = '+FormatFloat('###0.000',t2));
    KappaSrc := KappaSrc/t2;
    //KappaSrcErr := (XRatio + t1 - Pb64i - Pb64iErr) / (exp(Age*DecayConst238) - 1.0);
    //Pb64i := mu_XRatio + Mu * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    //Pb64iErr := mu_XRatio + (Mu+MuErr) * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    //Pb64iErr := Pb64iErr + mu_XRatio + (Mu-MuErr) * (exp(mu_StartAge*DecayConst238) - exp(Age *DecayConst238));
    //Pb64iErr := Pb64iErr/2.0;
    Pb84i := mu_ZRatio + (Mu*KappaSrc) * (exp(mu_StartAge*DecayConst232) - exp(Age*DecayConst232));
    //Pb84iErr := mu_YRatio + (Mu+MuErr)/U238U235 * (exp(mu_StartAge*DecayConst235) - exp(Age *DecayConst235));
    //Pb84iErr := Pb74iErr + mu_YRatio + (Mu-MuErr)/U238U235 * (exp(mu_StartAge*DecayConst235) - exp(Age *DecayConst235));
    //Pb84iErr := Pb74iErr/2.0;
    //dmUser.SetDeveloperData('KappaSrc = '+FormatFloat('###0.000',KappaSrc));
    //dmUser.SetDeveloperData('Pb84i = '+FormatFloat('###0.000',Pb84i));
  end;
end;

procedure TdmDep.CalculateCoVarAvg(tDepositID : integer; tAge : double);
var
  SumX1, SumX2, SumX3, SumMu, SumX4, SumX5,
  SumX6, SumX7, SumX8,
  SumX9, SumX10, SumX11,
  SumX1Sq, SumX2Sq, SumX3Sq, SumMuSq, SumX4Sq, SumX5Sq,
  SumX6Sq, SumX7Sq, SumX8Sq,
  SumX9Sq, SumX10Sq, SumX11Sq,
  SumX1X2, SumX1X3,
  NS, NS1, NS2, NS3, NS4, NS5, NSMu, NS9, NS10, NS11,
  NS6, NS7, NS8,
  MedianX1, MedianX2, MedianX3, MedianX4, MedianX5,
  MedianMu, MedianX6, MedianX7, MedianX8,
  MedianX9, MedianX10, MedianX11,
  MeanX1, MeanX2, MeanX3, MeanMu, MeanX4, MeanX5,
  MeanX6, MeanX7, MeanX8,
  MeanX9, MeanX10, MeanX11,
  VarX1, VarX2, VarX3, VarMu, VarX4, VarX5,
  VarX6, VarX7, VarX8,
  VarX9, VarX10, VarX11,
  SDevX1, SDevX2, SDevX3, SDevMu, SDevX4, SDevX5,
  SDevX6, SDevX7, SDevX8,
  SDevX9, SDEVX10, SDEVX11,
  CoVar1, Correl1, CoVar2, Correl2, Correl4, Correl5,
  IQRX1, IQRX2, IQRX3, IQRX4, IQRX5,
  IQRMU, IQRX6, IQRX7, IQRX8,
  IQRX9, IQRX10, IQRX11,
  EWt1, EWt2, EWt3, EWtMu, EWt4, EWt5,
  EWt6, EWt7, EWt8,
  EWt9, EWt10, EWt11,
  SumEWt1, SumEWt2, SumEWt3, SumEWtMu, SumEWt4, SumEWt5,
  SumEWt6, SumEWt7, SumEWt8,
  SumEWt9, SumEWt10, SumEWt11,
  SDOM1, SDOM2, SDOM3, SDOMMu, SDOM4, SDOM5,
  SDOM6, SDOM7, SDOM8 : double;
  SDOM9, SDOM10, SDOM11,
  MuValue, MuError : double;
  XError, YError   : double;
  Correl           : double;
  TD: TDBXTransaction;
  Pb64i, Pb64iErr, Pb74i, Pb74iErr,
  MuSmp, MuSmpErr : double;
  HL, HU : double;
  i, ml, n : integer;
  DR : DoubleArray;
  NumSamplesAvailable : integer;
  tMaterialID : string;
begin
  //dmUser.SetDeveloperData('starting average calculation for deposit '+IntToStr(tDepositID));
  NumSamplesAvailable := 0;
  tMaterialID := 'na';
  MedianX1 := DefaultValue;
  MedianX2 := DefaultValue;
  MedianX3 := DefaultValue;
  MedianX4 := DefaultValue;
  MedianX5 := DefaultValue;
  MedianMu := DefaultValue;
  MedianX6 := DefaultValue;
  MedianX7 := DefaultValue;
  MedianX8 := DefaultValue;
  MedianX9 := DefaultValue;
  MedianX10 := DefaultValue;
  MedianX11 := DefaultValue;
  MeanX1 := DefaultValue;
  MeanX2 := DefaultValue;
  MeanX3 := DefaultValue;
  MeanX4 := DefaultValue;
  MeanX5 := DefaultValue;
  MeanMu := DefaultValue;
  MeanX6 := DefaultValue;
  MeanX7 := DefaultValue;
  MeanX8 := DefaultValue;
  MeanX9 := DefaultValue;
  MeanX10 := DefaultValue;
  MeanX11 := DefaultValue;
  Correl1 := 0.0;
  Correl2 := 0.0;
  Correl4 := 0.0;
  Correl5 := 0.0;
  SumX1 := 0.0;
  SumX2 := 0.0;
  SumX3 := 0.0;
  SumX4 := 0.0;
  SumX5 := 0.0;
  SumMu := 0.0;
  SumX6 := 0.0;
  SumX7 := 0.0;
  SumX8 := 0.0;
  SumX9 := 0.0;
  SumX10 := 0.0;
  SumX11 := 0.0;
  SumEWt1 := 0.0;
  SumEWt2 := 0.0;
  SumEWt3 := 0.0;
  SumEWt4 := 0.0;
  SumEWt5 := 0.0;
  SumEWtMu := 0.0;
  SumEWt6 := 0.0;
  SumEWt7 := 0.0;
  SumEWt8 := 0.0;
  SumEWt9 := 0.0;
  SumEWt10 := 0.0;
  SumEWt11 := 0.0;
  SumX1Sq := 0.0;
  SumX2Sq := 0.0;
  SumX3Sq := 0.0;
  SumX4Sq := 0.0;
  SumX5Sq := 0.0;
  SumMuSq := 0.0;
  SumX6Sq := 0.0;
  SumX7Sq := 0.0;
  SumX8Sq := 0.0;
  SumX9Sq := 0.0;
  SumX10Sq := 0.0;
  SumX11Sq := 0.0;
  SumX1X2 := 0.0;
  SumX1X3 := 0.0;
  NS1 := 0.0;
  NS2 := 0.0;
  NS3 := 0.0;
  NS4 := 0.0;
  NS5 := 0.0;
  NSMu := 0.0;
  NS6 := 0.0;
  NS7 := 0.0;
  NS8 := 0.0;
  NS9 := 0.0;
  NS10 := 0.0;
  NS11 := 0.0;
  SDOM1 := 0.0;
  SDOM2 := 0.0;
  SDOM3 := 0.0;
  SDOM4 := 0.0;
  SDOM5 := 0.0;
  SDOMMu := 0.0;
  SDOM6 := 0.0;
  SDOM7 := 0.0;
  SDOM8 := 0.0;
  SDOM9 := 0.0;
  SDOM10 := 0.0;
  SDOM11 := 0.0;

  dmDep.qCountDepositSamplesProspect.Close;
  dmDep.qCountDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
  dmDep.cdsCountDepositSamplesProspect.Close;
  dmDep.cdsCountDepositSamplesProspect.Open;
  NumSamplesAvailable := dmDep.cdsCountDepositSamplesProspectCOUNT.AsInteger;
  dmDep.cdsCountDepositSamplesProspect.Close;

  if (NumSamplesAvailable > 0) then
  begin
    dmDep.qDepositSamplesProspect.Close;
    dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
    dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
    dmDep.cdsDepositSamplesProspect.Close;
    dmDep.cdsDepositSamplesProspect.Open;

    try
      dmDep.qInsertDepCovrProspect.Close;
      dmDep.qInsertDepCovrProspect.ParamByName('DepositID').AsInteger := tDepositID;
      dmDep.qInsertDepCovrProspect.ParamByName('AverLeast').AsString := 'A';
      TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDep.qInsertDepCovrProspect.ExecSQL(false);
        dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
      end;
    except
    end;
    dmDep.qDepCovrProspect.Close;
    dmDep.qDepCovrProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
    dmDep.cdsDepCovrProspect.Close;
    dmDep.cdsDepCovrProspect.Open;
    dmDep.cdsDepCovrProspect.Filter := 'AVERLEAST = '+''''+'A'+'''';
    dmDep.cdsDepCovrProspect.Filtered := true;
    repeat
      //Pb
      if (((dmDep.cdsPb64PB64.AsFloat > 10.0) or
           (dmDep.cdsPb76PB76.AsFloat > 0.0)) and
           (dmDep.cdsPb64.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        EWt1 := 0.0;
        if (dmDep.cdsE64E64.AsFloat > 0.9) then
          EWt1 := dmDep.cdsSig64SIG64.AsFloat/100.0 * dmDep.cdsPb64Pb64.AsFloat
        else
          EWt1 := dmDep.cdsSig64SIG64.AsFloat;
        if (EWt1 > 0.0) then
        begin
          EWt1 := 1.0/(EWt1*EWt1+SDOM1*SDOM1);
        end else
        begin
          EWt1 := 1.0;
        end;
        if (dmDep.cdsPb64Pb64.AsFloat > 0.0) then
        begin
          NS1 := NS1 + 1.0;
          SumEWt1 := SumEWt1 + EWt1;
          SumX1 := SumX1 + dmDep.cdsPb64Pb64.AsFloat*EWt1;
        end;
        //WebApplication.ShowMessage(dmDep.cdsDepositSamplesProspectSAMPLENO.AsString+'  '+dmDep.cdsDepositSamplesProspectINCL4STATS.AsString+'  '+FormatFloat('#0.00',NS1)+'  '+FormatFloat('###########0.0000',SumEWt1)+'  '+FormatFloat('##########0.0000',SumX1));

        EWt2 := 0.0;
        if (dmDep.cdsE74E74.AsFloat > 0.9) then
          EWt2 := dmDep.cdsSig74SIG74.AsFloat/100.0 * dmDep.cdsPb74Pb74.AsFloat
        else
          EWt2 := dmDep.cdsSig74SIG74.AsFloat;
        if (EWt2 > 0.0) then
        begin
          EWt2 := 1.0/(EWt2*EWt2+SDOM2*SDOM2);
        end else
        begin
          EWt2 := 1.0;
        end;
        if (dmDep.cdsPb74Pb74.AsFloat > 0.0) then
        begin
          NS2 := NS2 + 1.0;
          SumEWt2 := SumEWt2 + EWt2;
          SumX2 := SumX2 + dmDep.cdsPb74Pb74.AsFloat*EWt2;
        end;

        EWt3 := 0.0;
        if (dmDep.cdsE74E74.AsFloat > 0.9) then
          EWt3 := dmDep.cdsSig84SIG84.AsFloat/100.0 * dmDep.cdsPb84Pb84.AsFloat
        else
          EWt3 := dmDep.cdsSig84SIG84.AsFloat;
        if (EWt3 > 0.0) then
        begin
          EWt3 := 1.0/(EWt3*EWt3+SDOM3*SDOM3);
        end else
        begin
          EWt3 := 1.0;
        end;
        if (dmDep.cdsPb84Pb84.AsFloat > 0.0) then
        begin
          NS3 := NS3 + 1.0;
          SumEWt3 := SumEWt3 + EWt3;
          SumX3 := SumX3 + dmDep.cdsPb84PB84.AsFloat*EWt3;
        end;

        EWt4 := 0.0;
        if (dmDep.cdsE76E76.AsFloat > 0.9) then
          EWt4 := dmDep.cdsSig76SIG76.AsFloat/100.0 * dmDep.cdsPb76PB76.AsFloat
        else
          EWt4 := dmDep.cdsPb76PB76.AsFloat;
        if (EWt4 > 0.0) then
        begin
          EWt4 := 1.0/(EWt4*EWt4);
        end else
        begin
          EWt4 := 1.0;
        end;
        if (dmDep.cdsPb76PB76.AsFloat > 0.0) then
        begin
          NS4 := NS4 + 1.0;
          SumEWt4 := SumEWt4 + EWt4;
          SumX4 := SumX4 + dmDep.cdsPb76PB76.AsFloat*EWt4;
        end;

        EWt5 := 0.0;
        if (dmDep.cdsE86E86.AsFloat > 0.9) then
          EWt5 := dmDep.cdsSig86SIG86.AsFloat/100.0 * dmDep.cdsPb86PB86.AsFloat
        else
          EWt5 := dmDep.cdsSig86SIG86.AsFloat;
        if (EWt5 > 0.0) then
        begin
          EWt5 := 1.0/(EWt5*EWt5);
        end else
        begin
          EWt5 := 1.0;
        end;
        if (dmDep.cdsPb86PB86.AsFloat > 0.0) then
        begin
          NS5 := NS5 + 1.0;
          SumEWt5 := SumEWt5 + EWt5;
          SumX5 := SumX5 + dmDep.cdsPb86PB86.AsFloat*EWt5;
        end;

        XError := 0.0;
        YError := 0.0;
        Correl := 0.0;
        if (dmDep.cdsR76R76.AsFloat > 0.0)
          then Correl := dmDep.cdsR76R76.AsFloat;
        if ((tAge > 0.0) and
            (tAge < SKAge_Stage2)) then
        begin
          if (dmDep.cdsE64E64.AsFloat > 0.9)
            then XError := dmDep.cdsSig64SIG64.AsFloat*dmDep.cdsPb64PB64.AsFloat/100.0
            else XError := dmDep.cdsSig64SIG64.AsFloat;
          if (dmDep.cdsE74E74.AsFloat > 0.9)
            then YError := dmDep.cdsSig74SIG74.AsFloat*dmDep.cdsPb74PB74.AsFloat/100.0
            else YError := dmDep.cdsSig74SIG74.AsFloat;
          MuValue := 0.0;
          MuError := 1.0;
          if ((tAge > 0.0) and
               (tAge < SKAge_Stage2)) then
          begin
            CalcMuErr( tAge,
                     dmDep.cdsPb64PB64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError,
                     YError,
                     Correl,
                     1.0,
                     SKAge_Stage2*1.0e6,
                     SK64_Stage2,
                     SK74_Stage2,
                     SKmu_Stage2,
                     MuValue,
                     MuError);
          end;
          if (MuError <= 0.0) then MuError := 1.0;
          EWtMu := 1.0/(MuError*MuError);
          if (MuValue > 0.0) then
          begin
            SumEWtMu := SumEWtMu + EWtMu;
            NSMu := NSMu + 1.0;
            SumMu := SumMu + MuValue*EWtMu;
          end;
          Pb64i := 0.0;
          Pb64iErr := 0.0;
          Pb74i := 0.0;
          Pb74iErr := 0.0;
          MuSmp := 0.0;
          MuSmpErr := 0.0;
          if ((tAge > 0.0) and
               (tAge < SKAge_Stage2)) then
          begin
            CalcPbInitial(tAge,
                     dmDep.cdsPb64PB64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError, YError, Correl,
                     1.0,
                     SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                     MuValue, MuError,
                     Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                     MuSmp, MuSmpErr);
          end;
          if (Pb64iErr <= 0.0) then Pb64iErr := 1.0;
          EWt6 := 1.0/(Pb64iErr*Pb64iErr);
          if (Pb64i > 0.0) then
          begin
            SumEWt6 := SumEWt6 + EWt6;
            NS6 := NS6 + 1.0;
            SumX6 := SumX6 + Pb64i*EWt6;
          end;
          if (Pb74iErr <= 0.0) then Pb74iErr := 1.0;
          EWt7 := 1.0/(Pb74iErr*Pb74iErr);
          if (Pb74i > 0.0) then
          begin
            SumEWt7 := SumEWt7 + EWt7;
            NS7 := NS7 + 1.0;
            SumX7 := SumX7 + Pb74i*EWt7;
          end;
          if (MuSmpErr <= 0.0) then MuSmpErr := 1.0;
          EWt8 := 1.0/(MuSmpErr*MuSmpErr);
          if (MuSmp <> 0.0) then
          begin
            SumEWt8 := SumEWt8 + EWt8;
            NS8 := NS8 + 1.0;
            SumX8 := SumX8 + MuSmp*EWt8;
          end;
        end;
      end;
      //S
      if ((dmDep.cdsS34S34.AsFloat > DefaultValue) and
          (dmDep.cdsS34.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        EWt9 := 0.0;
        if (dmDep.cdsES34ES34.AsFloat > 0.9) then
          EWt9 := dmDep.cdsSigS34SIGS34.AsFloat/100.0 * dmDep.cdsS34S34.AsFloat
        else
          EWt9 := dmDep.cdsSigS34SIGS34.AsFloat;
        if (EWt9 > 0.0) then
        begin
          EWt9 := 1.0/(EWt9*EWt9+SDOM9*SDOM9);
        end else
        begin
          EWt9 := 1.0;
        end;
        if (dmDep.cdsS34S34.AsFloat > DefaultValue) then
        begin
          NS9 := NS9 + 1.0;
          SumEWt9 := SumEWt9 + EWt9;
          SumX9 := SumX9 + dmDep.cdsS34S34.AsFloat*EWt9;
        end;
      end;
      //SO4
      if ((dmDep.cdsSO434SO434.AsFloat > DefaultValue) and
          (dmDep.cdsSO434.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        EWt10 := 0.0;
        if (dmDep.cdsESO434ESO434.AsFloat > 0.9) then
          EWt10 := dmDep.cdsSigSO434SIGSO434.AsFloat/100.0 * dmDep.cdsSO434SO434.AsFloat
        else
          EWt10 := dmDep.cdsSigSO434SIGSO434.AsFloat;
        if (EWt10 > 0.0) then
        begin
          EWt10 := 1.0/(EWt10*EWt10+SDOM10*SDOM10);
        end else
        begin
          EWt10 := 1.0;
        end;
        if (dmDep.cdsSO434SO434.AsFloat > DefaultValue) then
        begin
          NS10 := NS10 + 1.0;
          SumEWt10 := SumEWt10 + EWt10;
          SumX10 := SumX10 + dmDep.cdsSO434SO434.AsFloat*EWt10;
        end;
      end;
      //O
      if ((dmDep.cdsO18O18.AsFloat > DefaultValue) and
          (dmDep.cdsO18.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        EWt11 := 0.0;
        if (dmDep.cdsEO18EO18.AsFloat > 0.9) then
          EWt11 := dmDep.cdsSigO18SIGO18.AsFloat/100.0 * dmDep.cdsO18O18.AsFloat
        else
          EWt11 := dmDep.cdsSigO18SIGO18.AsFloat;
        if (EWt11 > 0.0) then
        begin
          EWt11 := 1.0/(EWt11*EWt11+SDOM11*SDOM11);
        end else
        begin
          EWt11 := 1.0;
        end;
        if (dmDep.cdsSO434SO434.AsFloat > DefaultValue) then
        begin
          NS11 := NS11 + 1.0;
          SumEWt11 := SumEWt11 + EWt11;
          SumX11 := SumX11 + dmDep.cdsO18O18.AsFloat*EWt11;
        end;
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;

    if ((SumEWt1 > 0.0)) then MeanX1 := SumX1 / SumEWt1;
    if ((SumEWt2 > 0.0)) then MeanX2 := SumX2 / SumEWt2;
    if ((SumEWt3 > 0.0)) then MeanX3 := SumX3 / SumEWt3;
    if ((SumEWt4 > 0.0)) then MeanX4 := SumX4 / SumEWt4;
    if ((SumEWt5 > 0.0)) then MeanX5 := SumX5 / SumEWt5;
    if ((SumEWtMu > 0.0)) then MeanMu := SumMu / SumEWtMu;
    if ((SumEWt6 > 0.0)) then MeanX6 := SumX6 / SumEWt6;
    if ((SumEWt7 > 0.0)) then MeanX7 := SumX7 / SumEWt7;
    if ((SumEWt8 > 0.0)) then MeanX8 := SumX8 / SumEWt8;
    if ((SumEWt9 > 0.0)) then MeanX9 := SumX9 / SumEWt9;
    if ((SumEWt10 > 0.0)) then MeanX10 := SumX10 / SumEWt10;
    if ((SumEWt11 > 0.0)) then MeanX11 := SumX11 / SumEWt11;
    if (SumEWt1 > 0.0) then SDOM1 := 1.0/Sqrt(SumEWt1);
    if (SumEWt2 > 0.0) then SDOM2 := 1.0/Sqrt(SumEWt2);
    if (SumEWt3 > 0.0) then SDOM3 := 1.0/Sqrt(SumEWt3);
    if (SumEWt4 > 0.0) then SDOM4 := 1.0/Sqrt(SumEWt4);
    if (SumEWt5 > 0.0) then SDOM5 := 1.0/Sqrt(SumEWt5);
    if (SumEWtMu > 0.0) then SDOMMu := 1.0/Sqrt(SumEWtMu);
    if (SumEWt6 > 0.0) then SDOM6 := 1.0/Sqrt(SumEWt6);
    if (SumEWt7 > 0.0) then SDOM7 := 1.0/Sqrt(SumEWt7);
    if (SumEWt8 > 0.0) then SDOM8 := 1.0/Sqrt(SumEWt8);
    if (SumEWt9 > 0.0) then SDOM9 := 1.0/Sqrt(SumEWt9);
    if (SumEWt10 > 0.0) then SDOM10 := 1.0/Sqrt(SumEWt10);
    if (SumEWt11 > 0.0) then SDOM11 := 1.0/Sqrt(SumEWt11);
    dmDep.cdsDepositSamplesProspect.First;
    //dmUser.SetDeveloperData('SumEWt1 = '+FormatFloat('#####0.00000',SumEWt1));
    //dmUser.SetDeveloperData('SumEWt9 = '+FormatFloat('#####0.00000',SumEWt9));
    //dmUser.SetDeveloperData('SDOM9 = '+FormatFloat('#####0.00000',SDOM9));

    SumEWt1 := 0.0;
    SumEWt2 := 0.0;
    SumEWt3 := 0.0;
    SumEWt4 := 0.0;
    SumEWt5 := 0.0;
    SumEWtMu := 0.0;
    SumEWt6 := 0.0;
    SumEWt7 := 0.0;
    SumEWt8 := 0.0;
    SumEWt9 := 0.0;
    SumEWt10 := 0.0;
    SumEWt11 := 0.0;
    repeat
      //Pb
      if (((dmDep.cdsPb64PB64.AsFloat > 10.0) or
           (dmDep.cdsPb76PB76.AsFloat > 0.0)) and
           (dmDep.cdsPb64.RecordCount > 0) and
           (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        EWt1 := 0.0;
        if (dmDep.cdsE64E64.AsFloat > 0.9) then
          EWt1 := dmDep.cdsSig64Sig64.AsFloat/100.0 * dmDep.cdsPb64Pb64.AsFloat
        else
          EWt1 := dmDep.cdsSig64Sig64.AsFloat;
        if (EWt1 > 0.0) then
        begin
          EWt1 := 1.0/(EWt1*EWt1+SDOM1*SDOM1);
        end else
        begin
          EWt1 := 1.0;
        end;
        if (dmDep.cdsPb64Pb64.AsFloat > 0.0) then
        begin
          SumEWt1 := SumEWt1 + EWt1;
          SumX1Sq := SumX1Sq + EWt1*(dmDep.cdsPb64Pb64.AsFloat-MeanX1)
                                   *(dmDep.cdsPb64Pb64.AsFloat-MeanX1);
        end;

        EWt2 := 0.0;
        if (dmDep.cdsE74E74.AsFloat > 0.9) then
          EWt2 := dmDep.cdsSig74Sig74.AsFloat/100.0 * dmDep.cdsPb74Pb74.AsFloat
        else
          EWt2 := dmDep.cdsSig74Sig74.AsFloat;
        if (EWt2 > 0.0) then
        begin
          EWt2 := 1.0/(EWt2*EWt2+SDOM2*SDOM2);
        end else
        begin
          EWt2 := 1.0;
        end;
        if (dmDep.cdsPb74Pb74.AsFloat > 0.0) then
        begin
          SumEWt2 := SumEWt2 + EWt2;
          SumX2Sq := SumX2Sq + EWt2*(dmDep.cdsPb74Pb74.AsFloat-MeanX2)
                                   *(dmDep.cdsPb74Pb74.AsFloat-MeanX2);
        end;

        EWt3 := 0.0;
        if (dmDep.cdsE84E84.AsFloat > 0.9) then
          EWt3 := dmDep.cdsSig84Sig84.AsFloat/100.0 * dmDep.cdsPb84Pb84.AsFloat
        else
          EWt3 := dmDep.cdsSig84Sig84.AsFloat;
        if (EWt3 > 0.0) then
        begin
          EWt3 := 1.0/(EWt3*EWt3+SDOM3*SDOM3);
        end else
        begin
          EWt3 := 1.0;
        end;
        if (dmDep.cdsPb84Pb84.AsFloat > 0.0) then
        begin
          SumEWt3 := SumEWt3 + EWt3;
          SumX3Sq := SumX3Sq + EWt3*(dmDep.cdsPb84Pb84.AsFloat-MeanX3)
                                   *(dmDep.cdsPb84Pb84.AsFloat-MeanX3);
        end;

        EWt4 := 0.0;
        if (dmDep.cdsE76E76.AsString = '%') then
          EWt4 := dmDep.cdsSig76Sig76.AsFloat/100.0 * dmDep.cdsPb76PB76.AsFloat
        else
          EWt4 := dmDep.cdsSig76Sig76.AsFloat;
        if (EWt4 > 0.0) then
        begin
          EWt4 := 1.0/(EWt4*EWt4);
        end else
        begin
          EWt4 := 1.0;
        end;
        if (dmDep.cdsPb76Pb76.AsFloat > 0.0) then
        begin
          SumEWt4 := SumEWt4 + EWt4;
          SumX4Sq := SumX4Sq + EWt4*(dmDep.cdsPb76Pb76.AsFloat-MeanX4)
                                   *(dmDep.cdsPb76Pb76.AsFloat-MeanX4);
        end;

        EWt5 := 0.0;
        if (dmDep.cdsE86E86.AsFloat > 0.9) then
          EWt5 := dmDep.cdsSig86SIG86.AsFloat/100.0 * dmDep.cdsPb86PB86.AsFloat
        else
          EWt5 := dmDep.cdsSig86SIG86.AsFloat;
        if (EWt5 > 0.0) then
        begin
          EWt5 := 1.0/(EWt5*EWt5);
        end else
        begin
          EWt5 := 1.0;
        end;
        if (dmDep.cdsPb86PB86.AsFloat > 0.0) then
        begin
          SumEWt5 := SumEWt5 + EWt5;
          SumX5Sq := SumX5Sq + EWt5*(dmDep.cdsPb86PB86.AsFloat-MeanX5)
                                   *(dmDep.cdsPb86PB86.AsFloat-MeanX5);
        end;

        XError := 0.0;
        YError := 0.0;
        Correl := 0.0;
        if (dmDep.cdsR76R76.AsFloat > 0.0)
          then Correl := dmDep.cdsR76R76.AsFloat;
        MuValue := 0.0;
        MuError := 0.0;
        if ((tAge > 0.0) and
            (tAge < SKAge_Stage2)) then
        begin
          if (dmDep.cdsE64E64.AsFloat > 0.9)
            then XError := dmDep.cdsSig64SIG64.AsFloat*dmDep.cdsPb64Pb64.AsFloat/100.0
            else XError := dmDep.cdsSig64SIG64.AsFloat;
          if (dmDep.cdsE74E74.AsFloat > 0.9)
            then YError := dmDep.cdsSig74Sig74.AsFloat*dmDep.cdsPb74PB74.AsFloat/100.0
            else YError := dmDep.cdsSig74Sig74.AsFloat;
          MuValue := 1.0;
          MuError := 1.0;
          if ((tAge > 0.0) and
               (tAge < SKAge_Stage2)) then
          begin
            CalcMuErr( tAge,
                     dmDep.cdsPb64Pb64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError,
                     YError,
                     Correl,
                     1.0,
                     SKAge_Stage2*1.0e6,
                     SK64_Stage2,
                     SK74_Stage2,
                     SKmu_Stage2,
                     MuValue,
                     MuError);
          end;
          if (MuError <= 0.0) then MuError := 1.0;
          EWtMu := 1.0/(MuError*MuError+SDOMMu*SDOMMu);
          if (MuValue > 0.0) then
          begin
            SumEWtMu := SumEWtMu + EWtMu;
            SumMuSq := SumMuSq + EWtMu*(MuValue-MeanMu)
                                      *(MuValue-MeanMu);
          end;
          Pb64i := 0.0;
          Pb64iErr := 0.0;
          Pb74i := 0.0;
          Pb74iErr := 0.0;
          MuSmp := 0.0;
          MuSmpErr := 0.0;
          if ((tAge > 0.0) and
               (tAge < SKAge_Stage2)) then
          begin
            CalcPbInitial(tAge,
                     dmDep.cdsPb64PB64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError, YError, Correl,
                     1.0,
                     SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                     MuValue, MuError,
                     Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                     MuSmp, MuSmpErr);
          end;
          if (Pb64iErr <= 0.0) then Pb64iErr := 1.0;
          EWt6 := 1.0/(Pb64iErr*Pb64iErr+SDOM6*SDOM6);
          if (Pb64i > 0.0) then
          begin
            SumEWt6 := SumEWt6 + EWt6;
            SumX6Sq := SumX6Sq + EWt6*(Pb64i-MeanX6)
                                     *(Pb64i-MeanX6);
          end;
          if (Pb74iErr <= 0.0) then Pb74iErr := 1.0;
          EWt7 := 1.0/(Pb74iErr*Pb74iErr+SDOM7*SDOM7);
          if (Pb74i > 0.0) then
          begin
            SumEWt7 := SumEWt7 + EWt7;
            SumX7Sq := SumX7Sq + EWt7*(Pb74i-MeanX7)
                                     *(Pb74i-MeanX7);
          end;
          if (MuSmpErr <= 0.0) then MuSmpErr := 1.0;
          EWt8 := 1.0/(MuSmpErr*MuSmpErr+SDOM8*SDOM8);
          if (MuSmp <> 0.0) then
          begin
            SumEWt8 := SumEWt8 + EWt8;
            SumX8Sq := SumX8Sq + EWt8*(MuSmp-MeanX8)
                                     *(MuSmp-MeanX8);
          end;
        end;
        SumX1X2 := SumX1X2 + dmDep.cdsPb64Pb64.AsFloat*dmDep.cdsPb74PB74.AsFloat;
        SumX1X3 := SumX1X3 + dmDep.cdsPb64Pb64.AsFloat*dmDep.cdsPb84Pb84.AsFloat;
      end;
      //S
      if ((dmDep.cdsS34S34.AsFloat > DefaultValue) and
           (dmDep.cdsS34.RecordCount > 0) and
           (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        EWt9 := 0.0;
        if (dmDep.cdsES34ES34.AsFloat > 0.9) then
          EWt9 := dmDep.cdsSigS34SIGS34.AsFloat/100.0 * dmDep.cdsS34S34.AsFloat
        else
          EWt9 := dmDep.cdsSigS34SIGS34.AsFloat;
        if (EWt9 > 0.0) then
        begin
          EWt9 := 1.0/(EWt9*EWt9+SDOM9*SDOM9);
        end else
        begin
          EWt9 := 1.0;
        end;
        if (dmDep.cdsS34S34.AsFloat > DefaultValue) then
        begin
          SumEWt9 := SumEWt9 + EWt9;
          SumX9Sq := SumX9Sq + EWt9*(dmDep.cdsS34S34.AsFloat-MeanX9)
                                   *(dmDep.cdsS34S34.AsFloat-MeanX9);
        end;
      end;
      //SO4
      if ((dmDep.cdsSO434SO434.AsFloat > DefaultValue) and
           (dmDep.cdsSO434.RecordCount > 0) and
           (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        EWt10 := 0.0;
        if (dmDep.cdsESO434ESO434.AsFloat > 0.9) then
          EWt10 := dmDep.cdsSigSO434SIGSO434.AsFloat/100.0 * dmDep.cdsSO434SO434.AsFloat
        else
          EWt10 := dmDep.cdsSigSO434SIGSO434.AsFloat;
        if (EWt10 > 0.0) then
        begin
          EWt10 := 1.0/(EWt10*EWt10+SDOM10*SDOM10);
        end else
        begin
          EWt10 := 1.0;
        end;
        if (dmDep.cdsSO434SO434.AsFloat > DefaultValue) then
        begin
          SumEWt10 := SumEWt10 + EWt10;
          SumX10Sq := SumX10Sq + EWt10*(dmDep.cdsSO434SO434.AsFloat-MeanX10)
                                   *(dmDep.cdsSO434SO434.AsFloat-MeanX10);
        end;
      end;
      //O
      if ((dmDep.cdsO18O18.AsFloat > DefaultValue) and
           (dmDep.cdsO18.RecordCount > 0) and
           (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        EWt11 := 0.0;
        if (dmDep.cdsEO18EO18.AsFloat > 0.9) then
          EWt11 := dmDep.cdsSigO18SIGO18.AsFloat/100.0 * dmDep.cdsO18O18.AsFloat
        else
          EWt11 := dmDep.cdsSigO18SIGO18.AsFloat;
        if (EWt11 > 0.0) then
        begin
          EWt11 := 1.0/(EWt11*EWt11+SDOM11*SDOM11);
        end else
        begin
          EWt11 := 1.0;
        end;
        if (dmDep.cdsO18O18.AsFloat > DefaultValue) then
        begin
          SumEWt11 := SumEWt11 + EWt11;
          SumX11Sq := SumX11Sq + EWt11*(dmDep.cdsO18O18.AsFloat-MeanX11)
                                   *(dmDep.cdsO18O18.AsFloat-MeanX11);
        end;
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.Eof;
    //dmUser.SetDeveloperData('SumEWt9 calculated');
    VarX1 := DefaultValue;
    VarX2 := DefaultValue;
    VarX3 := DefaultValue;
    VarX4 := DefaultValue;
    VarX5 := DefaultValue;
    VarMu := DefaultValue;
    VarX6 := DefaultValue;
    VarX7 := DefaultValue;
    VarX8 := DefaultValue;
    VarX9 := DefaultValue;
    VarX10 := DefaultValue;
    VarX11 := DefaultValue;
    SDevX1 := DefaultValue;
    SDevX2 := DefaultValue;
    SDevX3 := DefaultValue;
    SDevX4 := DefaultValue;
    SDevX5 := DefaultValue;
    SDevMu := DefaultValue;
    SDevX6 := DefaultValue;
    SDevX7 := DefaultValue;
    SDevX8 := DefaultValue;
    SDevX9 := DefaultValue;
    SDevX10 := DefaultValue;
    SDevX11 := DefaultValue;
    IQRX1 := DefaultValue;
    IQRX2 := DefaultValue;
    IQRX3 := DefaultValue;
    IQRX4 := DefaultValue;
    IQRX5 := DefaultValue;
    IQRMu := DefaultValue;
    IQRX6 := DefaultValue;
    IQRX7 := DefaultValue;
    IQRX8 := DefaultValue;
    IQRX9 := DefaultValue;
    IQRX10 := DefaultValue;
    IQRX11 := DefaultValue;

    NS := NS1;
    if (NS < NS2) then NS := NS2;
    if (NS < NS3) then NS := NS3;
    if (NS < NS4) then NS := NS4;
    if (NS < NS5) then NS := NS5;
    if (NS < NSMu) then NS := NSMu;
    if (NS < NS6) then NS := NS6;
    if (NS < NS7) then NS := NS7;
    if (NS < NS8) then NS := NS8;
    if (NS < NS9) then NS := NS9;
    if (NS < NS10) then NS := NS10;
    if (NS < NS11) then NS := NS11;
    if ((NS > 0)) then
    begin
      if ((SumEWt1 > 0.0) and (NS1 > 1.0)) then VarX1 := (SumX1Sq/SumEWt1)/(NS1-1.0);
      if ((SumEWt2 > 0.0) and (NS2 > 1.0)) then VarX2 := (SumX2Sq/SumEWt2)/(NS2-1.0);
      if ((SumEWt3 > 0.0) and (NS3 > 1.0)) then VarX3 := (SumX3Sq/SumEWt3)/(NS3-1.0);
      if ((SumEWt4 > 0.0) and (NS4 > 1.0)) then VarX4 := (SumX4Sq/SumEWt4)/(NS4-1.0);
      if ((SumEWt5 > 0.0) and (NS5 > 1.0)) then VarX5 := (SumX5Sq/SumEWt5)/(NS5-1.0);
      if ((SumEwtMu > 0.0) and (NSMu > 1.0)) then VarMu := (SumMuSq/SumEWtMu)/(NSMu-1.0);
      if ((SumEWt6 > 0.0) and (NS6 > 1.0)) then VarX6 := (SumX6Sq/SumEWt6)/(NS6-1.0);
      if ((SumEWt7 > 0.0) and (NS7 > 1.0)) then VarX7 := (SumX7Sq/SumEWt7)/(NS7-1.0);
      if ((SumEWt8 > 0.0) and (NS8 > 1.0)) then VarX8 := (SumX8Sq/SumEWt8)/(NS8-1.0);
      if ((SumEWt9 > 0.0) and (NS9 > 1.0)) then VarX9 := (SumX9Sq/SumEWt9)/(NS9-1.0);
      if ((SumEWt10 > 0.0) and (NS10 > 1.0)) then VarX10 := (SumX10Sq/SumEWt10)/(NS10-1.0);
      if ((SumEWt11 > 0.0) and (NS11 > 1.0)) then VarX11 := (SumX11Sq/SumEWt11)/(NS11-1.0);
      if (VarX1 > 0.0) then SDevX1 := Sqrt(VarX1);
      if (VarX2 > 0.0) then SDevX2 := Sqrt(VarX2);
      if (VarX3 > 0.0) then SDevX3 := Sqrt(VarX3);
      if (VarX4 > 0.0) then SDevX4 := Sqrt(VarX4);
      if (VarX5 > 0.0) then SDevX5 := Sqrt(VarX5);
      if (VarMu > 0.0) then SDevMu := Sqrt(VarMu);
      if (VarX6 > 0.0) then SDevX6 := Sqrt(VarX6);
      if (VarX7 > 0.0) then SDevX7 := Sqrt(VarX7);
      if (VarX8 > 0.0) then SDevX8 := Sqrt(VarX8);
      if (VarX9 > 0.0) then SDevX9 := Sqrt(VarX9);
      if (VarX10 > 0.0) then SDevX10 := Sqrt(VarX10);
      if (VarX11 > 0.0) then SDevX11 := Sqrt(VarX11);
      if ((MeanX1 > 0.0) and (MeanX2 > 0.0) and (MeanX4 > 0.0) and
          (VarX1 > 0.0) and (VarX2 > 0.0) and (VarX4 > 0.0))
      then
        Correl1 := (VarX1/(MeanX1*MeanX1) + VarX2/(MeanX2*MeanX2)
                                          - VarX4/(MeanX4*MeanX4))
                   /(2.0*Sqrt(VarX1/(MeanX1*MeanX1))*Sqrt(VarX2/(MeanX2*MeanX2)))
      else Correl1 := -9.9;
      if ((MeanX1 > 0.0) and (MeanX3 > 0.0) and (MeanX5 > 0.0) and
          (VarX1 > 0.0) and (VarX3 > 0.0) and (VarX5 > 0.0))
      then
        Correl2 := (VarX1/(MeanX1*MeanX1) + VarX3/(MeanX3*MeanX3)
                                          - VarX5/(MeanX5*MeanX5))
                   /(2.0*Sqrt(VarX1/(MeanX1*MeanX1))*Sqrt(VarX3/(MeanX3*MeanX3)))
      else Correl2 := -9.9;
      if ((NS1 > 0.0) or (NS2 > 0.0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX1 > 0.0) then dmDep.cdsDepCovrProspectMEAN64.AsFloat := MeanX1
                          else dmDep.cdsDepCovrProspectMEAN64.AsFloat := DefaultValue;
        if (MeanX2 > 0.0) then dmDep.cdsDepCovrProspectMEAN74.AsFloat := MeanX2
                          else dmDep.cdsDepCovrProspectMEAN74.AsFloat := DefaultValue;
        if (SDevX1 > 0.0) then dmDep.cdsDepCovrProspectSDEV64.AsFloat := SDevX1
                          else dmDep.cdsDepCovrProspectSDEV64.AsFloat := DefaultValue;
        if (SDevX2 > 0.0) then dmDep.cdsDepCovrProspectSDEV74.AsFloat := SDevX2
                          else dmDep.cdsDepCovrProspectSDEV74.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCORREL76.AsFloat := Correl1;
        if (MeanX1 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := SDevX1/MeanX1 * 100.0
                          else dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := DefaultValue;
        if (MeanX2 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR74.AsFloat := SDevX2/MeanX2 * 100.0
                          else dmDep.cdsDepCovrProspectCOEFFVAR74.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES64.AsInteger := Trunc(NS1);
        dmDep.cdsDepCovrProspectNUMSAMPLES74.AsInteger := Trunc(NS2);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (NS1 > 0.0) then
        begin
          dmDep.cdsDepCovrProspectMEAN64.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEV64.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := DefaultValue;
        end;
        if (NS2 > 0.0) then
        begin
          dmDep.cdsDepCovrProspectMEAN74.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEV74.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVAR74.AsFloat := DefaultValue;
        end;
        dmDep.cdsDepCovrProspectCORREL76.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES64.AsInteger := Trunc(NS1);
        dmDep.cdsDepCovrProspectNUMSAMPLES74.AsInteger := Trunc(NS2);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if ((NS1 > 0.0) or (NS3 > 0.0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX1 > 0.0) then dmDep.cdsDepCovrProspectMEAN64.AsFloat := MeanX1
                          else dmDep.cdsDepCovrProspectMEAN64.AsFloat := DefaultValue;
        if (MeanX3 > 0.0) then dmDep.cdsDepCovrProspectMEAN84.AsFloat := MeanX3
                          else dmDep.cdsDepCovrProspectMEAN84.AsFloat := DefaultValue;
        if (SDevX1 > 0.0) then dmDep.cdsDepCovrProspectSDEV64.AsFloat := SDevX1
                          else dmDep.cdsDepCovrProspectSDEV64.AsFloat := DefaultValue;
        if (SDevX3 > 0.0) then dmDep.cdsDepCovrProspectSDEV84.AsFloat := SDevX3
                          else dmDep.cdsDepCovrProspectSDEV84.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCORREL86.AsFloat := Correl2;
        if (MeanX1 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := SDevX1/MeanX1 * 100.0
                          else dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := DefaultValue;
        if (MeanX3 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat := SDevX3/MeanX3 * 100.0
                          else dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES64.AsInteger := Trunc(NS1);
        dmDep.cdsDepCovrProspectNUMSAMPLES84.AsInteger := Trunc(NS3);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (NS1 > 0.0) then
        begin
          dmDep.cdsDepCovrProspectMEAN64.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEV64.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := DefaultValue;
        end;
        if (NS3 > 0.0) then
        begin
          dmDep.cdsDepCovrProspectMEAN84.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEV84.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCORREL86.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat := DefaultValue;
        end;
        dmDep.cdsDepCovrProspectCORREL86.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES64.AsInteger := Trunc(NS1);
        dmDep.cdsDepCovrProspectNUMSAMPLES84.AsInteger := Trunc(NS3);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if ((NSMu > 0.0)) then
      begin
        if (MeanMu > 0.0) then
        begin
          dmDep.cdsDepCovrProspect.Edit;
          if (MeanX1 > 0.0) then dmDep.cdsDepCovrProspectMEAN64.AsFloat := MeanX1
                            else dmDep.cdsDepCovrProspectMEAN64.AsFloat := DefaultValue;
          if (MeanMu > 0.0) then dmDep.cdsDepCovrProspectMEANMU.AsFloat := MeanMu
                            else dmDep.cdsDepCovrProspectMEANMU.AsFloat := DefaultValue;
          if (SDevX1 > 0.0) then dmDep.cdsDepCovrProspectSDEV64.AsFloat := SDevX1
                            else dmDep.cdsDepCovrProspectSDEV64.AsFloat := DefaultValue;
          if (SDevMu > 0.0) then dmDep.cdsDepCovrProspectSDEVMU.AsFloat := SDevMu
                            else dmDep.cdsDepCovrProspectSDEVMU.AsFloat := DefaultValue;
          if (MeanX1 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := SDevX1/MeanX1 * 100.0
                            else dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := DefaultValue;
          if (MeanMu > 0.0) then dmDep.cdsDepCovrProspectCOEFFVARMU.AsFloat := SDevMu/MeanMu * 100.0
                            else dmDep.cdsDepCovrProspectCOEFFVARMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLES64.AsInteger := Trunc(NS1);
          dmDep.cdsDepCovrProspectNUMSAMPLESMU.AsInteger := Trunc(NSMu);
          dmDep.cdsDepCovrProspect.Post;
        end;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        //dmDep.cdsDepCovrProspectMEAN64.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectMEANMU.AsFloat := DefaultValue;
        //dmDep.cdsDepCovrProspectSDEV64.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEVMU.AsFloat := DefaultValue;
        //dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVARMU.AsFloat := DefaultValue;
        //dmDep.cdsDepCovrProspectNUMSAMPLES64.AsInteger := Trunc(NS1);
        dmDep.cdsDepCovrProspectNUMSAMPLESMU.AsInteger := Trunc(NSMu);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if ((NS4 > 0.0) or (NS5 > 0.0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX4 > 0.0) then dmDep.cdsDepCovrProspectMEAN76.AsFloat := MeanX4
                          else dmDep.cdsDepCovrProspectMEAN76.AsFloat := DefaultValue;
        if (MeanX5 > 0.0) then dmDep.cdsDepCovrProspectMEAN86.AsFloat := MeanX5
                          else dmDep.cdsDepCovrProspectMEAN86.AsFloat := DefaultValue;
        if (SDevX4 > 0.0) then dmDep.cdsDepCovrProspectSDEV76.AsFloat := SDevX4
                          else dmDep.cdsDepCovrProspectSDEV76.AsFloat := DefaultValue;
        if (SDevX5 > 0.0) then dmDep.cdsDepCovrProspectSDEV86.AsFloat := SDevX5
                          else dmDep.cdsDepCovrProspectSDEV86.AsFloat := DefaultValue;
        if (MeanX4 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR76.AsFloat := SDevX4/MeanX4 * 100.0
                          else dmDep.cdsDepCovrProspectCOEFFVAR76.AsFloat := DefaultValue;
        if (MeanX5 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR86.AsFloat := SDevX5/MeanX5 * 100.0
                          else dmDep.cdsDepCovrProspectCOEFFVAR86.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES76.AsInteger := Trunc(NS4);
        dmDep.cdsDepCovrProspectNUMSAMPLES86.AsInteger := Trunc(NS5);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMEAN76.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectMEAN86.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEV76.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEV86.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVAR76.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVAR86.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES76.AsInteger := Trunc(NS4);
        dmDep.cdsDepCovrProspectNUMSAMPLES86.AsInteger := Trunc(NS5);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if (NS6 > 0.0) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX6 > 0.0) then dmDep.cdsDepCovrProspectMEAN64MODEL.AsFloat := MeanX6
                          else dmDep.cdsDepCovrProspectMEAN64MODEL.AsFloat := DefaultValue;
        if (SDevX6 > 0.0) then dmDep.cdsDepCovrProspectSDEV64MODEL.AsFloat := SDevX6
                          else dmDep.cdsDepCovrProspectSDEV64MODEL.AsFloat := DefaultValue;
        if (MeanX6 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat := SDevX6/MeanX6 * 100.0
                          else dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES64MODEL.AsInteger := Trunc(NS6);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMEAN64MODEL.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEV64MODEL.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES64MODEL.AsInteger := Trunc(NS6);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if (NS7 > 0.0) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX7 > 0.0) then dmDep.cdsDepCovrProspectMEAN74MODEL.AsFloat := MeanX7
                          else dmDep.cdsDepCovrProspectMEAN74MODEL.AsFloat := DefaultValue;
        if (SDevX7 > 0.0) then dmDep.cdsDepCovrProspectSDEV74MODEL.AsFloat := SDevX7
                          else dmDep.cdsDepCovrProspectSDEV74MODEL.AsFloat := DefaultValue;
        if (MeanX7 > 0.0) then dmDep.cdsDepCovrProspectCOEFFVAR74MODEL.AsFloat := SDevX7/MeanX7 * 100.0
                          else dmDep.cdsDepCovrProspectCOEFFVAR74MODEL.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES74MODEL.AsInteger := Trunc(NS7);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMEAN74MODEL.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEV74MODEL.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVAR74MODEL.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLES74MODEL.AsInteger := Trunc(NS7);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if (NS8 > 0.0) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX8 <> 0.0) then dmDep.cdsDepCovrProspectMEANMUSAMPLES.AsFloat := MeanX8
                           else dmDep.cdsDepCovrProspectMEANMUSAMPLES.AsFloat := DefaultValue;
        if (SDevX8 > 0.0) then dmDep.cdsDepCovrProspectSDEVMUSMP.AsFloat := SDevX8
                          else dmDep.cdsDepCovrProspectSDEVMUSMP.AsFloat := DefaultValue;
        if (MeanX8 <> 0.0) then dmDep.cdsDepCovrProspectCOEFFVARMUSMP.AsFloat := Abs(SDevX8/MeanX8 * 100.0)
                           else dmDep.cdsDepCovrProspectCOEFFVARMUSMP.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLESMUSMP.AsInteger := Trunc(NS8);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMEANMUSAMPLES.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEVMUSMP.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVARMUSMP.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLESMUSMP.AsInteger := Trunc(NS8);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if (NS9 > 0.0) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX9 <> 0.0) then dmDep.cdsDepCovrProspectMEANS34.AsFloat := MeanX9        //to change     several lines here
                           else dmDep.cdsDepCovrProspectMEANS34.AsFloat := DefaultValue;
        if (SDevX9 > 0.0) then dmDep.cdsDepCovrProspectSDEVS34.AsFloat := SDevX9
                          else dmDep.cdsDepCovrProspectSDEVS34.AsFloat := DefaultValue;
        if (MeanX9 <> 0.0) then dmDep.cdsDepCovrProspectCOEFFVARS34.AsFloat := Abs(SDevX9/MeanX9 * 100.0)
                           else dmDep.cdsDepCovrProspectCOEFFVARS34.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLESS34.AsInteger := Trunc(NS9);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMEANS34.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEVS34.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVARS34.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLESS34.AsInteger := Trunc(NS9);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if (NS10 > 0.0) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX10 <> 0.0) then dmDep.cdsDepCovrProspectMEANSO434.AsFloat := MeanX10        //to change     several lines here
                           else dmDep.cdsDepCovrProspectMEANSO434.AsFloat := DefaultValue;
        if (SDevX10 > 0.0) then dmDep.cdsDepCovrProspectSDEVSO434.AsFloat := SDevX10
                          else dmDep.cdsDepCovrProspectSDEVSO434.AsFloat := DefaultValue;
        if (MeanX10 <> 0.0) then dmDep.cdsDepCovrProspectCOEFFVARSO434.AsFloat := Abs(SDevX10/MeanX10 * 100.0)
                           else dmDep.cdsDepCovrProspectCOEFFVARSO434.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLESSO434.AsInteger := Trunc(NS10);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMEANSO434.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEVSO434.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVARSO434.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLESSO434.AsInteger := Trunc(NS10);
        dmDep.cdsDepCovrProspect.Post;
      end;

      if (NS11 > 0.0) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        if (MeanX11 <> 0.0) then dmDep.cdsDepCovrProspectMEANO18.AsFloat := MeanX11        //to change     several lines here
                           else dmDep.cdsDepCovrProspectMEANO18.AsFloat := DefaultValue;
        if (SDevX11 > 0.0) then dmDep.cdsDepCovrProspectSDEVO18.AsFloat := SDevX11
                          else dmDep.cdsDepCovrProspectSDEVO18.AsFloat := DefaultValue;
        if (MeanX11 <> 0.0) then dmDep.cdsDepCovrProspectCOEFFVARO18.AsFloat := Abs(SDevX11/MeanX11 * 100.0)
                           else dmDep.cdsDepCovrProspectCOEFFVARO18.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLESO18.AsInteger := Trunc(NS11);
        dmDep.cdsDepCovrProspect.Post;
      end else
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMEANO18.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectSDEVO18.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectCOEFFVARO18.AsFloat := DefaultValue;
        dmDep.cdsDepCovrProspectNUMSAMPLESO18.AsInteger := Trunc(NS11);
        dmDep.cdsDepCovrProspect.Post;
      end;
      //dmUser.SetDeveloperData('ready to calculate Medians');
      MedianX1 := 0.0;
      MedianX2 := 0.0;
      MedianX3 := 0.0;
      //calculate medians
      //Pb64
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      repeat
        if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
            (dmDep.cdsPb64.RecordCount > 0) and
            (dmDep.cdsPb64PB64.AsFloat > 10.0)) then
        begin
          DR[i] := dmDep.cdsPb64PB64.AsFloat;
          i := i+1;
        end;
        dmDep.cdsDepositSamplesProspect.Next;
      until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
      n := Trunc(NS1);
      if (n > MaxMedianSamp) then n:= MaxMedianSamp;
      if (i >= 2) then
      begin
        dmDep.Sort(DR,n,1);
        ml := (n+1) div 2;
        MedianX1 := 0.5*(DR[ml] + DR[n-ml+1]);
        Hinges(DR,HL,HU,n);
        IQRX1 := HU - HL;
        //tMAD := MAD(DR,XMed,n);
      end;
      //Pb74
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      repeat
        if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
            (dmDep.cdsPb74.RecordCount > 0) and
            (dmDep.cdsPb74PB74.AsFloat > 10.0)) then
        begin
          DR[i] := dmDep.cdsPb74PB74.AsFloat;
          i := i+1;
        end;
        dmDep.cdsDepositSamplesProspect.Next;
      until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
      n := Trunc(NS2);
      if (n > MaxMedianSamp) then n:= MaxMedianSamp;
      if (i >= 2) then
      begin
        dmDep.Sort(DR,n,1);
        ml := (n+1) div 2;
        MedianX2 := 0.5*(DR[ml] + DR[n-ml+1]);
        Hinges(DR,HL,HU,n);
        IQRX2 := HU - HL;
        //tMAD := MAD(DR,XMed,n);
      end;
      //Pb84
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      repeat
        if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
            (dmDep.cdsPb84.RecordCount > 0) and
            (dmDep.cdsPb84PB84.AsFloat > 10.0)) then
        begin
          DR[i] := dmDep.cdsPb84PB84.AsFloat;
          i := i+1;
        end;
        dmDep.cdsDepositSamplesProspect.Next;
      until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
      n := Trunc(NS3);
      if (n > MaxMedianSamp) then n:= MaxMedianSamp;
      if (i >= 2) then
      begin
        dmDep.Sort(DR,n,1);
        ml := (n+1) div 2;
        MedianX3 := 0.5*(DR[ml] + DR[n-ml+1]);
        Hinges(DR,HL,HU,n);
        IQRX3 := HU - HL;
        //tMAD := MAD(DR,XMed,n);
      end;
      //Pb76
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      repeat
        if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
            (dmDep.cdsPb76.RecordCount > 0) and
            (dmDep.cdsPb76PB76.AsFloat > 0.1)) then
        begin
          DR[i] := dmDep.cdsPb76PB76.AsFloat;
          i := i+1;
        end;
        dmDep.cdsDepositSamplesProspect.Next;
      until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
      n := Trunc(NS4);
      if (n > MaxMedianSamp) then n:= MaxMedianSamp;
      if (i >= 2) then
      begin
        dmDep.Sort(DR,n,1);
        ml := (n+1) div 2;
        MedianX4 := 0.5*(DR[ml] + DR[n-ml+1]);
        Hinges(DR,HL,HU,n);
        IQRX4 := HU - HL;
        //tMAD := MAD(DR,XMed,n);
      end;
      //Pb86
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      repeat
        if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
            (dmDep.cdsPb86.RecordCount > 0) and
            (dmDep.cdsPb86PB86.AsFloat > 0.1)) then
        begin
          DR[i] := dmDep.cdsPb86PB86.AsFloat;
          i := i+1;
        end;
        dmDep.cdsDepositSamplesProspect.Next;
      until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
      n := Trunc(NS5);
      if (n > MaxMedianSamp) then n:= MaxMedianSamp;
      if (i >= 2) then
      begin
        dmDep.Sort(DR,n,1);
        ml := (n+1) div 2;
        MedianX5 := 0.5*(DR[ml] + DR[n-ml+1]);
        Hinges(DR,HL,HU,n);
        IQRX5 := HU - HL;
        //tMAD := MAD(DR,XMed,n);
      end;
      //Mu src
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      if ((tAge > 0.0) and
           (tAge < SKAge_Stage2)) then
      begin
        repeat
          if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
              (dmDep.cdsPb64PB64.AsFloat > 10.0) and
              (dmDep.cdsPb64.RecordCount > 0) and
              (dmDep.cdsPb74PB74.AsFloat > 10.0)) then
          begin
            MuValue := 1.0;
            MuError := 1.0;
            CalcMuErr( tAge,
                     dmDep.cdsPb64Pb64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError,
                     YError,
                     Correl,
                     1.0,
                     SKAge_Stage2*1.0e6,
                     SK64_Stage2,
                     SK74_Stage2,
                     SKmu_Stage2,
                     MuValue,
                     MuError);
            if (MuError <= 0.0) then MuError := 1.0;
            Pb64i := 0.0;
            Pb64iErr := 0.0;
            Pb74i := 0.0;
            Pb74iErr := 0.0;
            MuSmp := 0.0;
            MuSmpErr := 0.0;
            CalcPbInitial(tAge,
                     dmDep.cdsPb64PB64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError, YError, Correl,
                     1.0,
                     SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                     MuValue, MuError,
                     Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                     MuSmp, MuSmpErr);
            DR[i] := MuValue;
            i := i+1;
          end;
          dmDep.cdsDepositSamplesProspect.Next;
        until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
        n := Trunc(NSMu);
        if (n > MaxMedianSamp) then n:= MaxMedianSamp;
        if (i >= 2) then
        begin
          dmDep.Sort(DR,n,1);
          ml := (n+1) div 2;
          MedianMu := 0.5*(DR[ml] + DR[n-ml+1]);
          Hinges(DR,HL,HU,n);
          IQRMU := HU - HL;
          //tMAD := MAD(DR,XMed,n);
        end;
        //Pb64i
        i := 1;
        dmDep.cdsDepositSamplesProspect.First;
        repeat
          if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
              (dmDep.cdsPb64.RecordCount > 0) and
              (dmDep.cdsPb64PB64.AsFloat > 10.0) and
              (dmDep.cdsPb74PB74.AsFloat > 10.0)) then
          begin
            MuValue := 1.0;
            MuError := 1.0;
            CalcMuErr( tAge,
                     dmDep.cdsPb64Pb64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError,
                     YError,
                     Correl,
                     1.0,
                     SKAge_Stage2*1.0e6,
                     SK64_Stage2,
                     SK74_Stage2,
                     SKmu_Stage2,
                     MuValue,
                     MuError);
            if (MuError <= 0.0) then MuError := 1.0;
            Pb64i := 0.0;
            Pb64iErr := 0.0;
            Pb74i := 0.0;
            Pb74iErr := 0.0;
            MuSmp := 0.0;
            MuSmpErr := 0.0;
            CalcPbInitial(tAge,
                     dmDep.cdsPb64PB64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError, YError, Correl,
                     1.0,
                     SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                     MuValue, MuError,
                     Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                     MuSmp, MuSmpErr);
            DR[i] := Pb64i;
            i := i+1;
          end;
          dmDep.cdsDepositSamplesProspect.Next;
        until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
        n := Trunc(NS6);
        if (n > MaxMedianSamp) then n:= MaxMedianSamp;
        if (i >= 2) then
        begin
          dmDep.Sort(DR,n,1);
          ml := (n+1) div 2;
          MedianX6 := 0.5*(DR[ml] + DR[n-ml+1]);
          Hinges(DR,HL,HU,n);
          IQRX6 := HU - HL;
          //tMAD := MAD(DR,XMed,n);
        end;
        //Pb74i
        i := 1;
        dmDep.cdsDepositSamplesProspect.First;
        repeat
          if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
              (dmDep.cdsPb64.RecordCount > 0) and
              (dmDep.cdsPb64PB64.AsFloat > 10.0) and
              (dmDep.cdsPb74PB74.AsFloat > 10.0)) then
          begin
            MuValue := 1.0;
            MuError := 1.0;
            CalcMuErr( tAge,
                     dmDep.cdsPb64Pb64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError,
                     YError,
                     Correl,
                     1.0,
                     SKAge_Stage2*1.0e6,
                     SK64_Stage2,
                     SK74_Stage2,
                     SKmu_Stage2,
                     MuValue,
                     MuError);
            if (MuError <= 0.0) then MuError := 1.0;
            Pb64i := 0.0;
            Pb64iErr := 0.0;
            Pb74i := 0.0;
            Pb74iErr := 0.0;
            MuSmp := 0.0;
            MuSmpErr := 0.0;
            CalcPbInitial(tAge,
                     dmDep.cdsPb64PB64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError, YError, Correl,
                     1.0,
                     SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                     MuValue, MuError,
                     Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                     MuSmp, MuSmpErr);
            DR[i] := Pb74i;
            i := i+1;
          end;
          dmDep.cdsDepositSamplesProspect.Next;
        until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
        n := Trunc(NS7);
        if (n > MaxMedianSamp) then n:= MaxMedianSamp;
        if (i >= 2) then
        begin
          dmDep.Sort(DR,n,1);
          ml := (n+1) div 2;
          MedianX7 := 0.5*(DR[ml] + DR[n-ml+1]);
          Hinges(DR,HL,HU,n);
          IQRX7 := HU - HL;
          //tMAD := MAD(DR,XMed,n);
        end;
        //Mu smp
        i := 1;
        dmDep.cdsDepositSamplesProspect.First;
        repeat
          if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
              (dmDep.cdsPb64.RecordCount > 0) and
              (dmDep.cdsPb64PB64.AsFloat > 10.0) and
              (dmDep.cdsPb74PB74.AsFloat > 10.0)) then
          begin
            MuValue := 1.0;
            MuError := 1.0;
            CalcMuErr( tAge,
                     dmDep.cdsPb64Pb64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError,
                     YError,
                     Correl,
                     1.0,
                     SKAge_Stage2*1.0e6,
                     SK64_Stage2,
                     SK74_Stage2,
                     SKmu_Stage2,
                     MuValue,
                     MuError);
            if (MuError <= 0.0) then MuError := 1.0;
            Pb64i := 0.0;
            Pb64iErr := 0.0;
            Pb74i := 0.0;
            Pb74iErr := 0.0;
            MuSmp := 0.0;
            MuSmpErr := 0.0;
            CalcPbInitial(tAge,
                     dmDep.cdsPb64PB64.AsFloat,
                     dmDep.cdsPb74PB74.AsFloat,
                     XError, YError, Correl,
                     1.0,
                     SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                     MuValue, MuError,
                     Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                     MuSmp, MuSmpErr);
            DR[i] := MuSmp;
            i := i+1;
          end;
          dmDep.cdsDepositSamplesProspect.Next;
        until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
        n := Trunc(NS8);
        if (n > MaxMedianSamp) then n:= MaxMedianSamp;
        if (i >= 2) then
        begin
          dmDep.Sort(DR,n,1);
          ml := (n+1) div 2;
          MedianX8 := 0.5*(DR[ml] + DR[n-ml+1]);
          Hinges(DR,HL,HU,n);
          IQRX8 := HU - HL;
          //tMAD := MAD(DR,XMed,n);
        end;
      end;
      //dmUser.SetDeveloperData('Pb medians calculated');
      //S34
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      repeat
        if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
            (dmDep.cdsS34.RecordCount > 0) and
            (dmDep.cdsS34S34.AsFloat > DefaultValue)) then   //change here
        begin
          DR[i] := dmDep.cdsS34S34.AsFloat;    //change here
          i := i+1;
        end;
        dmDep.cdsDepositSamplesProspect.Next;
      until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
      n := Trunc(NS9);    //change here
      //dmUser.SetDeveloperData('S calc.  i = '+IntToStr(i)+'   n = '+IntToStr(n));
      if (n > MaxMedianSamp) then n:= MaxMedianSamp;
      if (i >= 2) then
      begin
        dmDep.Sort(DR,n,1);
        ml := (n+1) div 2;
        MedianX9 := 0.5*(DR[ml] + DR[n-ml+1]);  //change here
        Hinges(DR,HL,HU,n);
        IQRX9 := HU - HL;     //change here
        //tMAD := MAD(DR,XMed,n);
      end;
      //dmUser.SetDeveloperData('S median calculated');
      //SO4_34
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      repeat
        if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
            (dmDep.cdsSO434.RecordCount > 0) and
            (dmDep.cdsSO434SO434.AsFloat > DefaultValue)) then   //change here
        begin
          DR[i] := dmDep.cdsSO434SO434.AsFloat;    //change here
          i := i+1;
        end;
        dmDep.cdsDepositSamplesProspect.Next;
      until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
      n := Trunc(NS10);    //change here
      if (n > MaxMedianSamp) then n:= MaxMedianSamp;
      if (i >= 2) then
      begin
        dmDep.Sort(DR,n,1);
        ml := (n+1) div 2;
        MedianX10 := 0.5*(DR[ml] + DR[n-ml+1]);  //change here
        Hinges(DR,HL,HU,n);
        IQRX10 := HU - HL;     //change here
        //tMAD := MAD(DR,XMed,n);
      end;
      //dmUser.SetDeveloperData('SO4 median calculated');
      //O18
      i := 1;
      dmDep.cdsDepositSamplesProspect.First;
      repeat
        if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y') and
            (dmDep.cdsO18.RecordCount > 0) and
            (dmDep.cdsO18O18.AsFloat > DefaultValue)) then   //change here
        begin
          DR[i] := dmDep.cdsO18O18.AsFloat;    //change here
          i := i+1;
        end;
        dmDep.cdsDepositSamplesProspect.Next;
      until (dmDep.cdsDepositSamplesProspect.Eof OR (i > (MaxMedianSamp-1)));
      n := Trunc(NS11);    //change here
      if (n > MaxMedianSamp) then n:= MaxMedianSamp;
      if (i >= 2) then
      begin
        dmDep.Sort(DR,n,1);
        ml := (n+1) div 2;
        MedianX11 := 0.5*(DR[ml] + DR[n-ml+1]);  //change here
        Hinges(DR,HL,HU,n);
        IQRX11 := HU - HL;     //change here
        //tMAD := MAD(DR,XMed,n);
      end;
      //dmUser.SetDeveloperData('O18 median calculated');
      dmDep.cdsDepCovrProspect.Edit;
      if (MedianX1 > 0.0) then dmDep.cdsDepCovrProspectMEDIAN64.AsFloat := MedianX1
                          else dmDep.cdsDepCovrProspectMEDIAN64.AsFloat := DefaultValue;
      if (MedianX2 > 0.0) then dmDep.cdsDepCovrProspectMEDIAN74.AsFloat := MedianX2
                          else dmDep.cdsDepCovrProspectMEDIAN74.AsFloat := DefaultValue;
      if (MedianX3 > 0.0) then dmDep.cdsDepCovrProspectMEDIAN84.AsFloat := MedianX3
                          else dmDep.cdsDepCovrProspectMEDIAN84.AsFloat := DefaultValue;
      if (MedianX4 > 0.0) then dmDep.cdsDepCovrProspectMEDIAN76.AsFloat := MedianX4
                          else dmDep.cdsDepCovrProspectMEDIAN76.AsFloat := DefaultValue;
      if (MedianX5 > 0.0) then dmDep.cdsDepCovrProspectMEDIAN86.AsFloat := MedianX5
                          else dmDep.cdsDepCovrProspectMEDIAN86.AsFloat := DefaultValue;
      if (MedianMu > 0.0) then dmDep.cdsDepCovrProspectMEDIANMU.AsFloat := MedianMu
                          else dmDep.cdsDepCovrProspectMEDIANMU.AsFloat := DefaultValue;
      if (MedianX6 > 0.0) then dmDep.cdsDepCovrProspectMEDIAN64MODEL.AsFloat := MedianX6
                          else dmDep.cdsDepCovrProspectMEDIAN64MODEL.AsFloat := DefaultValue;
      if (MedianX7 > 0.0) then dmDep.cdsDepCovrProspectMEDIAN74MODEL.AsFloat := MedianX7
                          else dmDep.cdsDepCovrProspectMEDIAN74MODEL.AsFloat := DefaultValue;
      if (MedianX8 > DefaultValue) then dmDep.cdsDepCovrProspectMEDIANMUSAMPLES.AsFloat := MedianX8
                           else dmDep.cdsDepCovrProspectMEDIANMUSAMPLES.AsFloat := DefaultValue;
      if (MedianX9 > DefaultValue) then dmDep.cdsDepCovrProspectMEDIANS34.AsFloat := MedianX9
                           else dmDep.cdsDepCovrProspectMEDIANS34.AsFloat := DefaultValue;
      if (MedianX10 > DefaultValue) then dmDep.cdsDepCovrProspectMEDIANSO434.AsFloat := MedianX10
                           else dmDep.cdsDepCovrProspectMEDIANSO434.AsFloat := DefaultValue;
      if (MedianX11 > DefaultValue) then dmDep.cdsDepCovrProspectMEDIANO18.AsFloat := MedianX11
                           else dmDep.cdsDepCovrProspectMEDIANO18.AsFloat := DefaultValue;
      if (IQRX1 > 0.0) then dmDep.cdsDepCovrProspectIQR64.AsFloat := IQRX1
                          else dmDep.cdsDepCovrProspectIQR64.AsFloat := DefaultValue;
      if (IQRX2 > 0.0) then dmDep.cdsDepCovrProspectIQR74.AsFloat := IQRX2
                          else dmDep.cdsDepCovrProspectIQR74.AsFloat := DefaultValue;
      if (IQRX3 > 0.0) then dmDep.cdsDepCovrProspectIQR84.AsFloat := IQRX3
                          else dmDep.cdsDepCovrProspectIQR84.AsFloat := DefaultValue;
      if (IQRX4 > 0.0) then dmDep.cdsDepCovrProspectIQR76.AsFloat := IQRX4
                          else dmDep.cdsDepCovrProspectIQR76.AsFloat := DefaultValue;
      if (IQRX5 > 0.0) then dmDep.cdsDepCovrProspectIQR86.AsFloat := IQRX5
                          else dmDep.cdsDepCovrProspectIQR86.AsFloat := DefaultValue;
      if (IQRMu > 0.0) then dmDep.cdsDepCovrProspectIQRMU.AsFloat := IQRMu
                          else dmDep.cdsDepCovrProspectIQRMU.AsFloat := DefaultValue;
      if (IQRX6 > 0.0) then dmDep.cdsDepCovrProspectIQR64MODEL.AsFloat := IQRX6
                          else dmDep.cdsDepCovrProspectIQR64MODEL.AsFloat := DefaultValue;
      if (IQRX7 > 0.0) then dmDep.cdsDepCovrProspectIQR74MODEL.AsFloat := IQRX7
                          else dmDep.cdsDepCovrProspectIQR74MODEL.AsFloat := DefaultValue;
      if (IQRX8 > DefaultValue) then dmDep.cdsDepCovrProspectIQRMUSMP.AsFloat := IQRX8
                           else dmDep.cdsDepCovrProspectIQRMUSMP.AsFloat := DefaultValue;
      if (IQRX9 > DefaultValue) then dmDep.cdsDepCovrProspectIQRS34.AsFloat := IQRX9
                           else dmDep.cdsDepCovrProspectIQRS34.AsFloat := DefaultValue;
      if (IQRX10 > DefaultValue) then dmDep.cdsDepCovrProspectIQRSO434.AsFloat := IQRX10
                           else dmDep.cdsDepCovrProspectIQRSO434.AsFloat := DefaultValue;
      if (IQRX11 > DefaultValue) then dmDep.cdsDepCovrProspectIQRO18.AsFloat := IQRX11
                           else dmDep.cdsDepCovrProspectIQRO18.AsFloat := DefaultValue;
      dmDep.cdsDepCovrProspect.Post;
      dmDep.cdsDepCovrProspect.ApplyUpdates(0);
    end
    else begin
      //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
    end;
    dmDep.cdsDepCovrProspect.Filtered := false;
  end;
end;

procedure TdmDep.CopyDepositDataForUser( tUserID : string;
                                         tDepositID : string;
                                         tAge : double);
var
  TD: TDBXTransaction;
  //TD: TTransactionDesc;
  XError, YError,
  Correl,
  MuValue, MuError : double;
  Pb64i, Pb64iErr, Pb74i, Pb74iErr,
  MuSmp, MuSmpErr : double;
  iCount, iCountSamplesIncluded : integer;
begin
  //dmUser.SetDeveloperData('CopyDepositDataForUser');
  try
    dmDep.qDeleteUserDepSmp.Close;
    dmDep.qDeleteUserDepSmp.ParamByName('UserID').AsString := tUserID;
    dmDep.qDeleteUserDepSmp.ParamByName('DepositID').AsString := tDepositID;
    TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmDep.qDeleteUserDepSmp.ExecSQL(false);
      dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
    except
      dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
      //WasSuccessful := false;
    end;
  except
  end;
  dmDep.qUserDepSmp.Close;
  dmDep.qUserDepSmp.ParamByName('UserID').AsString := tUserID;
  dmDep.qUserDepSmp.ParamByName('DepositID').AsString := tDepositID;
  dmDep.cdsUserDepSmp.Close;
  dmDep.cdsUserDepSmp.Open;
  dmDep.qDepositSamplesProspect.Close;
  dmDep.qDepositSamplesProspect.ParamByName('DepositID').AsString := tDepositID;
  dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
  dmDep.cdsDepositSamplesProspect.Close;
  dmDep.cdsDepositSamplesProspect.Open;
  iCount := 0;
  iCountSamplesIncluded := dmDep.cdsDepositSamplesProspect.RecordCount;
  if (iCountSamplesIncluded > 0) then
  begin
    repeat
      try
        if ((dmDep.cdsPb64PB64.AsFloat > 10.0) or
        (dmDep.cdsSr87SR87i.AsFloat > 0.6998) or
        (dmDep.cdsNd143ND143i.AsFloat > 0.50) or
        (dmDep.cdsHf176HF176i.AsFloat > 0.27) or
        (dmDep.cdsS34S34.AsFloat > -999.0) or
        (dmDep.cdsSO434SO434.AsFloat > -999.0) or
        (dmDep.cdsO18O18.AsFloat > -999.0) or
        (dmDep.cdsOs187OS187i.AsFloat > 0.0)) then
        begin
          if ((dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')
            or (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'N')) then
          begin
            dmDep.cdsUserDepSmp.Append;
            dmDep.cdsUserDepSmpUSERID.AsString := tUserID;
            dmDep.cdsUserDepSmpDEPOSITID.AsString := tDepositID;
            dmDep.cdsUserDepSmpSAMPLENO.AsString := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
            dmDep.cdsUserDepSmpFRAC.AsString := dmDep.cdsDepositSamplesProspectFRAC.AsString;
            dmDep.cdsUserDepSmpMATERIALABR.AsString := dmDep.cdsDepositSamplesProspectMATERIALABR.AsString;
            dmDep.cdsUserDepSmpINC4STATS.AsString := dmDep.cdsDepositSamplesProspectINCL4STATS.AsString;
            if (dmDep.cdsPb64.RecordCount > 0) then
              dmDep.cdsUserDepSmpPB64.AsFloat := dmDep.cdsPb64PB64.AsFloat
            else
              dmDep.cdsUserDepSmpPB64.AsFloat := DefaultValue;
            if (dmDep.cdsSig64.RecordCount > 0) then
              dmDep.cdsUserDepSmpSPB64.AsFloat := dmDep.cdsSig64SIG64.AsFloat
            else
              dmDep.cdsUserDepSmpSPB64.AsFloat := DefaultValue;
            if (dmDep.cdsE64.RecordCount > 0) then
              dmDep.cdsUserDepSmpEPB64.AsFloat := dmDep.cdsE64E64.AsFloat
            else
              dmDep.cdsUserDepSmpEPB64.AsFloat := DefaultValue;

            if (dmDep.cdsPb74.RecordCount > 0) then
              dmDep.cdsUserDepSmpPB74.AsFloat := dmDep.cdsPb74PB74.AsFloat
            else
              dmDep.cdsUserDepSmpPB74.AsFloat := DefaultValue;
            if (dmDep.cdsSig74.RecordCount > 0) then
              dmDep.cdsUserDepSmpSPB74.AsFloat := dmDep.cdsSig74SIG74.AsFloat
            else
              dmDep.cdsUserDepSmpSPB74.AsFloat := DefaultValue;
            if (dmDep.cdsE74.RecordCount > 0) then
              dmDep.cdsUserDepSmpEPB74.AsFloat := dmDep.cdsE74E74.AsFloat
            else
              dmDep.cdsUserDepSmpEPB74.AsFloat := DefaultValue;

            if (dmDep.cdsPb84.RecordCount > 0) then
              dmDep.cdsUserDepSmpPB84.AsFloat := dmDep.cdsPb84PB84.AsFloat
            else
              dmDep.cdsUserDepSmpPB84.AsFloat := DefaultValue;
            if (dmDep.cdsSig84.RecordCount > 0) then
              dmDep.cdsUserDepSmpSPB84.AsFloat := dmDep.cdsSig84SIG84.AsFloat
            else
              dmDep.cdsUserDepSmpSPB84.AsFloat := DefaultValue;
            if (dmDep.cdsE84.RecordCount > 0) then
              dmDep.cdsUserDepSmpEPB84.AsFloat := dmDep.cdsE84E84.AsFloat
            else
              dmDep.cdsUserDepSmpEPB84.AsFloat := DefaultValue;

            if (dmDep.cdsPb76.RecordCount > 0) then
              dmDep.cdsUserDepSmpPB76.AsFloat := dmDep.cdsPb76PB76.AsFloat
            else
              dmDep.cdsUserDepSmpPB76.AsFloat := DefaultValue;
            if (dmDep.cdsSig76.RecordCount > 0) then
              dmDep.cdsUserDepSmpSPB76.AsFloat := dmDep.cdsSig76Sig76.AsFloat
            else
              dmDep.cdsUserDepSmpSPB76.AsFloat := DefaultValue;
            if (dmDep.cdsE76.RecordCount > 0) then
              dmDep.cdsUserDepSmpEPB76.AsFloat := dmDep.cdsE76E76.AsFloat
            else
              dmDep.cdsUserDepSmpEPB76.AsFloat := DefaultValue;

            if (dmDep.cdsPb86.RecordCount > 0) then
              dmDep.cdsUserDepSmpPB86.AsFloat := dmDep.cdsPb86PB86.AsFloat
            else
              dmDep.cdsUserDepSmpPB86.AsFloat := DefaultValue;
            if (dmDep.cdsSig86.RecordCount > 0) then
              dmDep.cdsUserDepSmpSPB86.AsFloat := dmDep.cdsSig86Sig86.AsFloat
            else
              dmDep.cdsUserDepSmpSPB86.AsFloat := DefaultValue;
            if (dmDep.cdsE86.RecordCount > 0) then
              dmDep.cdsUserDepSmpEPB86.AsFloat := dmDep.cdsE86E86.AsFloat
            else
              dmDep.cdsUserDepSmpEPB86.AsFloat := DefaultValue;

            if (dmDep.cdsR76.RecordCount > 0) then
              dmDep.cdsUserDepSmpRHO76.AsFloat := dmDep.cdsR76R76.AsFloat
            else
              dmDep.cdsUserDepSmpRHO76.AsFloat := DefaultValue;
            if (dmDep.cdsR86.RecordCount > 0) then
              dmDep.cdsUserDepSmpRHO86.AsFloat := dmDep.cdsR86R86.AsFloat
            else
              dmDep.cdsUserDepSmpRHO86.AsFloat := DefaultValue;

            if (dmDep.cdsSr87.RecordCount > 0) then
              dmDep.cdsUserDepSmpSR87I.AsFloat := dmDep.cdsSr87SR87I.AsFloat
            else
              dmDep.cdsUserDepSmpSR87I.AsFloat := DefaultValue;
            if (dmDep.cdsSigSr87.RecordCount > 0) then
              dmDep.cdsUserDepSmpSSR87I.AsFloat := dmDep.cdsSigSr87SIGSR87.AsFloat
            else
              dmDep.cdsUserDepSmpSSR87I.AsFloat := DefaultValue;
            if (dmDep.cdsESr87.RecordCount > 0) then
              dmDep.cdsUserDepSmpESR87I.AsFloat := dmDep.cdsESr87ESR87.AsFloat
            else
              dmDep.cdsUserDepSmpESR87I.AsFloat := DefaultValue;

            if (dmDep.cdsNd143.RecordCount > 0) then
              dmDep.cdsUserDepSmpND143I.AsFloat := dmDep.cdsNd143ND143I.AsFloat
            else
              dmDep.cdsUserDepSmpND143I.AsFloat := DefaultValue;
            if (dmDep.cdsSigNd143.RecordCount > 0) then
              dmDep.cdsUserDepSmpSND143I.AsFloat := dmDep.cdsSigNd143SIGND143.AsFloat
            else
              dmDep.cdsUserDepSmpSND143I.AsFloat := DefaultValue;
            if (dmDep.cdsENd143.RecordCount > 0) then
              dmDep.cdsUserDepSmpEND143I.AsFloat := dmDep.cdsENd143END143.AsFloat
            else
              dmDep.cdsUserDepSmpEND143I.AsFloat := DefaultValue;

            if (dmDep.cdsHF176.RecordCount > 0) then
              dmDep.cdsUserDepSmpHF176I.AsFloat := dmDep.cdsHF176HF176I.AsFloat
            else
              dmDep.cdsUserDepSmpHF176I.AsFloat := DefaultValue;
            if (dmDep.cdsSigHf176.RecordCount > 0) then
              dmDep.cdsUserDepSmpSHF176I.AsFloat := dmDep.cdsSigHf176SIGHF176I.AsFloat
            else
              dmDep.cdsUserDepSmpSHF176I.AsFloat := DefaultValue;
            if (dmDep.cdseHf176.RecordCount > 0) then
              dmDep.cdsUserDepSmpEHF176I.AsFloat := dmDep.cdseHf176EHF176I.AsFloat
            else
              dmDep.cdsUserDepSmpEHF176I.AsFloat := DefaultValue;

            if (dmDep.cdsOs187.RecordCount > 0) then
              dmDep.cdsUserDepSmpOS187I.AsFloat := dmDep.cdsOs187OS187I.AsFloat
            else
              dmDep.cdsUserDepSmpOS187I.AsFloat := DefaultValue;
            if (dmDep.cdsSigOs187.RecordCount > 0) then
              dmDep.cdsUserDepSmpSOS187I.AsFloat := dmDep.cdsSigOs187SIGOS187.AsFloat
            else
              dmDep.cdsUserDepSmpSOS187I.AsFloat := DefaultValue;
            if (dmDep.cdsEOs187.RecordCount > 0) then
              dmDep.cdsUserDepSmpEOS187I.AsFloat := dmDep.cdsEOs187EOS187.AsFloat
            else
              dmDep.cdsUserDepSmpEOS187I.AsFloat := DefaultValue;

            if (dmDep.cdsS34.RecordCount > 0) then
              dmDep.cdsUserDepSmpS34.AsFloat := dmDep.cdsS34S34.AsFloat
            else
              dmDep.cdsUserDepSmpS34.AsFloat := DefaultValue;
            if (dmDep.cdsSigS34.RecordCount > 0) then
              dmDep.cdsUserDepSmpSS34.AsFloat := dmDep.cdsSigS34SIGS34.AsFloat
            else
              dmDep.cdsUserDepSmpSS34.AsFloat := DefaultValue;

            if (dmDep.cdsSO434.RecordCount > 0) then
              dmDep.cdsUserDepSmpSO434.AsFloat := dmDep.cdsSO434SO434.AsFloat
            else
              dmDep.cdsUserDepSmpSO434.AsFloat := DefaultValue;
            if (dmDep.cdsSigSO434.RecordCount > 0) then
              dmDep.cdsUserDepSmpSSO434.AsFloat := dmDep.cdsSigSO434SIGSO434.AsFloat
            else
              dmDep.cdsUserDepSmpSSO434.AsFloat := DefaultValue;

            if (dmDep.cdsO18.RecordCount > 0) then
              dmDep.cdsUserDepSmpO18.AsFloat := dmDep.cdsO18O18.AsFloat
            else
              dmDep.cdsUserDepSmpO18.AsFloat := DefaultValue;
            if (dmDep.cdsSigO18.RecordCount > 0) then
              dmDep.cdsUserDepSmpSO18.AsFloat := dmDep.cdsSigO18SIGO18.AsFloat
            else
              dmDep.cdsUserDepSmpSO18.AsFloat := DefaultValue;

            if ((tAge > 0.0) and (tAge < SKAge_Stage2)) then
            begin
              if (dmDep.cdsPb64.RecordCount > 0) then
              begin
                XError := 0.0;
                YError := 0.0;
                Correl := 0.0;
                if (dmDep.cdsR76R76.AsFloat > 0.0)
                  then Correl := dmDep.cdsR76R76.AsFloat;
                if (dmDep.cdsE64E64.AsFloat > 0.9)
                  then XError := dmDep.cdsSig64SIG64.AsFloat*dmDep.cdsPb64PB64.AsFloat/100.0
                  else XError := dmDep.cdsSig64SIG64.AsFloat;
                if (dmDep.cdsE74E74.AsFloat > 0.9)
                  then YError := dmDep.cdsSig74SIG74.AsFloat*dmDep.cdsPb74PB74.AsFloat/100.0
                  else YError := dmDep.cdsSig74SIG74.AsFloat;
                MuValue := 0.0;
                MuError := 1.0;
                CalcMuErr( tAge,
                         dmDep.cdsPb64PB64.AsFloat,
                         dmDep.cdsPb74PB74.AsFloat,
                         XError,
                         YError,
                         Correl,
                         1.0,
                         SKAge_Stage2*1.0e6,
                         SK64_Stage2,
                         SK74_Stage2,
                         SKmu_Stage2,
                         MuValue,
                         MuError);
                  Pb64i := 0.0;
                  Pb64iErr := 0.0;
                  Pb74i := 0.0;
                  Pb74iErr := 0.0;
                  MuSmp := 0.0;
                  MuSmpErr := 0.0;
                  CalcPbInitial(tAge,
                           dmDep.cdsPb64PB64.AsFloat,
                           dmDep.cdsPb74PB74.AsFloat,
                           XError, YError, Correl,
                           1.0,
                           SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                           MuValue, MuError,
                           Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                           MuSmp, MuSmpErr);
              end else
              begin
                MuValue := DefaultValue;
                MuSmp := DefaultValue;
              end;
            end;
            dmDep.cdsUserDepSmpMU.AsFloat := MuValue;
            dmDep.cdsUserDepSmpMUSMP.AsFloat := MuSmp;
            dmDep.cdsUserDepSmpKappaSrc.AsFloat := DefaultValue;
            dmDep.cdsUserDepSmpsKappaSrc.AsFloat := DefaultValue;
            dmDep.cdsUserDepSmpKappaSmp.AsFloat := DefaultValue;
            dmDep.cdsUserDepSmpsKappaSmp.AsFloat := DefaultValue;
            dmDep.cdsUserDepSmp.Post;
            dmDep.cdsUserDepSmp.ApplyUpdates(0);
            iCount := iCount + 1;
          end;
        end;
      except
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.Eof;
    {
    dmDep.cdsDepositSamplesProspect.First;
    repeat
      dmDep.cdsUserDepSmp.Edit;
      if (dmDep.cdsUserDepSmpPB64.AsFloat = 0.0) then dmDep.cdsUserDepSmpPB64.AsString := '';
      if (dmDep.cdsUserDepSmpPB74.AsFloat = 0.0) then dmDep.cdsUserDepSmpPB74.AsString := '';
      if (dmDep.cdsUserDepSmpPB84.AsFloat = 0.0) then dmDep.cdsUserDepSmpPB84.AsString := '';
      if (dmDep.cdsUserDepSmpPB76.AsFloat = 0.0) then dmDep.cdsUserDepSmpPB76.AsString := '';
      if (dmDep.cdsUserDepSmpPB86.AsFloat = 0.0) then dmDep.cdsUserDepSmpPB86.AsString := '';
      if (dmDep.cdsUserDepSmpSR87.AsFloat = 0.0) then dmDep.cdsUserDepSmpSR87.AsString := '';
      if (dmDep.cdsUserDepSmpND143.AsFloat = 0.0) then dmDep.cdsUserDepSmpND143.AsString := '';
      if (dmDep.cdsUserDepSmpOS187.AsFloat = 0.0) then dmDep.cdsUserDepSmpOS187.AsString := '';
      if (dmDep.cdsUserDepSmpS34.AsFloat = 0.0) then dmDep.cdsUserDepSmpS34.AsString := '';
      if (dmDep.cdsUserDepSmpSO434.AsFloat = 0.0) then dmDep.cdsUserDepSmpSO434.AsString := '';
      if (dmDep.cdsUserDepSmpO18.AsFloat = 0.0) then dmDep.cdsUserDepSmpO18.AsString := '';
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.Eof;
    }
  end;
  dmDep.cdsUserDepSmp.Close;
  dmDep.cdsDepositSamplesProspect.Close;
end;

procedure TdmDep.FindLeastRadiogenicSample(tDepositID : integer; var MinPb64 : double; var MinPb74 : double);
var
  tSampleNo, tFrac : string;
  tMin64, tMin74 : double;
  NumSamplesAvailable : integer;
  NS : integer;
begin
  //dmUser.SetDeveloperData('starting least radiogenic calculation for deposit '+IntToStr(tDepositID));
  tMin74 := 1.0e12;
  tMin64 := 1.0e12;
  tSampleNo := '';
  tFrac := '';
  NS := 0;
  NumSamplesAvailable := 0;
  dmDep.qCountDepositSamplesProspect.Close;
  dmDep.qCountDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
  dmDep.cdsCountDepositSamplesProspect.Close;
  dmDep.cdsCountDepositSamplesProspect.Open;
  NumSamplesAvailable := dmDep.cdsCountDepositSamplesProspectCOUNT.AsInteger;
  dmDep.cdsCountDepositSamplesProspect.Close;
  if (NumSamplesAvailable > 0) then
  begin
    dmDep.qDepositSamplesProspect.Close;
    dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
    dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
    dmDep.cdsDepositSamplesProspect.Close;
    dmDep.cdsDepositSamplesProspect.IndexFieldNames := 'DATAVALUE;SAMPLENO;FRAC';
    dmDep.cdsDepositSamplesProspect.Open;
    //Pb
    dmDep.cdsDepositSamplesProspect.Last;
    tMin74 := 1.0e12;
    tMin64 := 1.0e12;
    repeat
      tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
      tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
      //dmUser.SetDeveloperData(tSampleNo+'***'+tFrac+'***'+FormatFloat('##0.000',tMin74));
      if ((tMin64 > dmDep.cdsPb64PB64.AsFloat) and
          (dmDep.cdsPb64PB64.AsFloat > 0.0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
        tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
        tMin64 := dmDep.cdsPb64PB64.AsFloat;
        if (dmDep.cdsPb74PB74.AsFloat > 0.01) then
        begin
          tMin74 := dmDep.cdsPb74PB74.AsFloat;
        end;
        //dmUser.SetDeveloperData('7/4***'+FormatFloat('##0.000',tMin74)+'***'+FormatFloat('##0.000',YError));
        //dmUser.SetDeveloperData('6/4***'+FormatFloat('##0.000',tMin64)+'***'+FormatFloat('##0.000',XError));
      end;
      dmDep.cdsDepositSamplesProspect.Prior;
    until dmDep.cdsDepositSamplesProspect.BOF;
    if ((tMin64 > 1.0e5) and (tMin74 > 1.0e5)) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      //dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      //dmUser.SetDeveloperData(tSampleNo+'***'+tFrac+'***'+FormatFloat('##0.000',tMin64)+'***'+FormatFloat('##0.000',tMin74));
      //dmUser.SetDeveloperData('7/4***'+FormatFloat('##0.000',tMin74));
      //dmUser.SetDeveloperData('6/4***'+FormatFloat('##0.000',tMin64));
    end;
    dmDep.cdsDepositSamplesProspect.First;
  end;
  if (NS = 1) then
  begin
    MinPb64 := tMin64;
    MinPb74 := tMin74;
  end else
  begin
    MinPb64 := -999.99;
    MinPb74 := -999.99
  end;
end;

procedure TdmDep.CalculateCoVarLeastRadiogenic(tDepositID : integer; tAge : double);
var
  SumX1, SumX2, SumX3, SumMu, SumX4, SumX5,
  SumX6, SumX7, SumX8,
  SumX9, SumX10, SumX11,
  SumX1Sq, SumX2Sq, SumX3Sq, SumMuSq, SumX4Sq, SumX5Sq,
  SumX6Sq, SumX7Sq, SumX8Sq,
  SumX9Sq, SumX10Sq, SumX11Sq,
  SumX1X2, SumX1X3,
  NS, NS1, NS2, NS3, NS4, NS5, NSMu,
  NS6, NS7, NS8,
  NS9, NS10, NS11,
  MedianX1, MedianX2, MedianX3, MedianX4, MedianX5,
  MedianMu, MedianX6, MedianX7, MedianX8,
  MedianX9, MedianX10, Medianx11,
  MeanX1, MeanX2, MeanX3, MeanMu, MeanX4, MeanX5,
  MeanX6, MeanX7, MeanX8,
  MeanX9, MeanX10, MeanX11,
  VarX1, VarX2, VarX3, VarMu, VarX4, VarX5,
  VarX6, VarX7, VarX8,
  VarX9, VarX10, VarX11,
  SDevX1, SDevX2, SDevX3, SDevMu, SDevX4, SDevX5,
  SDevX6, SDevX7, SDevX8,
  SDevX9, SDevX10, SDevX11,
  CoVar1, Correl1, CoVar2, Correl2, Correl4, Correl5,
  EWt1, EWt2, EWt3, EWtMu, EWt4, EWt5,
  EWt6, EWt7, EWt8, EWt9, EWt10, EWt11,
  SumEWt1, SumEWt2, SumEWt3, SumEWtMu, SumEWt4, SumEWt5,
  SumEWt6, SumEWt7, SumEWt8, SumEWt9, SumEWt10, SumEWt11,
  SDOM1, SDOM2, SDOM3, SDOMMu, SDOM4, SDOM5,
  SDOM6, SDOM7, SDOM8, SDOM9, SDOM10, SDOM11,
  MuValue, MuError : double;
  XError, YError, ZError   : double;
  Z76Error, Z86Error : double;
  Correl           : double;
  TD: TDBXTransaction;
  Pb64i, Pb64iErr, Pb74i, Pb74iErr,
  Pb84i, Pb84iErr,
  KappaSmp, KappaSmpErr,
  KappaSrc, KappaSrcErr,
  MuSmp, MuSmpErr : double;
  tMinS34, tMinSO434, tMinO18 : double;
  tSampleNo, tFrac, tMaterialID : string;
  tMin84, tMin76, tMin86,
  tMin64, tMin74 : double;
  NumSamplesAvailable : integer;
begin
  //dmUser.SetDeveloperData('starting least radiogenic calculation for deposit '+IntToStr(tDepositID));
  tSampleNo := '';
  tFrac := '';
  NumSamplesAvailable := 0;
  MeanX1 := 0.0;
  MeanX2 := 0.0;
  MeanX3 := 0.0;
  MeanX4 := 0.0;
  MeanX5 := 0.0;
  MeanMu := 0.0;
  MeanX6 := 0.0;
  MeanX7 := 0.0;
  MeanX8 := 0.0;
  MeanX9 := 0.0;
  MeanX10 := 0.0;
  MeanX11 := 0.0;
  Correl1 := 0.0;
  Correl2 := 0.0;
  Correl4 := 0.0;
  Correl5 := 0.0;
  NS1 := 0.0;
  NS2 := 0.0;
  NS3 := 0.0;
  NS4 := 0.0;
  NS5 := 0.0;
  NSMu := 0.0;
  NS6 := 0.0;
  NS7 := 0.0;
  NS8 := 0.0;
  NS9 := 0.0;
  NS10 := 0.0;
  NS11 := 0.0;
  dmDep.qCountDepositSamplesProspect.Close;
  dmDep.qCountDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
  dmDep.cdsCountDepositSamplesProspect.Close;
  dmDep.cdsCountDepositSamplesProspect.Open;
  NumSamplesAvailable := dmDep.cdsCountDepositSamplesProspectCOUNT.AsInteger;
  dmDep.cdsCountDepositSamplesProspect.Close;
  if (NumSamplesAvailable > 0) then
  begin
    dmDep.qDepositSamplesProspect.Close;
    dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
    dmDep.cdsDepositSamplesProspect.Close;
    dmDep.cdsDepositSamplesProspect.IndexFieldNames := 'DATAVALUE;SAMPLENO;FRAC';
    dmDep.cdsDepositSamplesProspect.Open;
    try
      dmDep.qInsertDepCovrProspect.Close;
      dmDep.qInsertDepCovrProspect.ParamByName('DepositID').AsInteger := tDepositID;
      dmDep.qInsertDepCovrProspect.ParamByName('AverLeast').AsString := 'L';
      TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDep.qInsertDepCovrProspect.ExecSQL(false);
        dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
      end;
    except
    end;
    dmDep.qDepCovrProspect.Close;
    dmDep.qDepCovrProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
    dmDep.cdsDepCovrProspect.Close;
    dmDep.cdsDepCovrProspect.Open;
    dmDep.cdsDepCovrProspect.Filter := 'AVERLEAST = '+''''+'L'+'''';
    dmDep.cdsDepCovrProspect.Filtered := true;
    //Pb
    dmDep.cdsDepositSamplesProspect.Last;
    tMin74 := 1.0e12;
    tMin84 := 1.0e12;
    tMin64 := 1.0e12;
    tMin76 := 1.0e12;
    tMin86 := 1.0e12;
    {
    repeat
      tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
      tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
      dmUser.SetDeveloperData('All** '+tSampleNo+'***'+tFrac+'***'+FormatFloat('##0.000',dmDep.cdsPb74PB74.AsFloat));
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    dmDep.cdsDepositSamplesProspect.First;
    }
    repeat
      tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
      tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
      //tMaterialID := dmDep.cdsDepositSamplesProspectMATERIALABR.AsString;
      //dmUser.SetDeveloperData(tSampleNo+'***'+tFrac+'***'+FormatFloat('##0.000',tMin74));
      if (tAge >= Age74Dominant) then
      begin
        if ((tMin74 > dmDep.cdsPb74PB74.AsFloat) and
            (dmDep.cdsPb74PB74.AsFloat > 0.0) and
            (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
        begin
          tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
          tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
          tMaterialID := dmDep.cdsDepositSamplesProspectMATERIALABR.AsString;
          tMin74 := dmDep.cdsPb74PB74.AsFloat;
          if (dmDep.cdsPb64PB64.AsFloat > 0.01) then
          begin
            tMin64 := dmDep.cdsPb64PB64.AsFloat;
            if (dmDep.cdsE64E64.AsFloat > 0.9)
              then XError := dmDep.cdsSig64SIG64.AsFloat*tMin64/100.0
              else XError := dmDep.cdsSig64SIG64.AsFloat;
          end;
          if (dmDep.cdsPb84PB84.AsFloat > 0.01) then
          begin
            tMin84 := dmDep.cdsPb84PB84.AsFloat;
            if (dmDep.cdsE84E84.AsFloat > 0.9)
              then ZError := dmDep.cdsSig84SIG84.AsFloat*tMin84/100.0
              else ZError := dmDep.cdsSig84SIG84.AsFloat;
          end;
          if (dmDep.cdsPb76PB76.AsFloat > 0.01) then
          begin
            tMin76 := dmDep.cdsPb76PB76.AsFloat;
            if (dmDep.cdsE76E76.AsFloat > 0.9)
              then Z76Error := dmDep.cdsSig76SIG76.AsFloat*tMin76/100.0
              else Z76Error := dmDep.cdsSig76SIG76.AsFloat;
          end;
          if (dmDep.cdsPb86PB86.AsFloat > 0.01) then
          begin
            tMin86 := dmDep.cdsPb86PB86.AsFloat;
            if (dmDep.cdsE86E86.AsFloat > 0.9)
              then Z86Error := dmDep.cdsSig86SIG86.AsFloat*tMin86/100.0
              else Z86Error := dmDep.cdsSig86SIG86.AsFloat;
          end;
          //dmUser.SetDeveloperData('7/4***'+FormatFloat('##0.000',tMin74)+'***'+FormatFloat('##0.000',YError));
          //dmUser.SetDeveloperData('6/4***'+FormatFloat('##0.000',tMin64)+'***'+FormatFloat('##0.000',XError));
          //dmUser.SetDeveloperData('8/4***'+FormatFloat('##0.000',tMin84)+'***'+FormatFloat('##0.000',ZError));
          //dmUser.SetDeveloperData('7/6***'+FormatFloat('##0.00000',tMin76)+'***'+FormatFloat('##0.00000',Z76Error));
          //dmUser.SetDeveloperData('8/6***'+FormatFloat('##0.00000',tMin86)+'***'+FormatFloat('##0.00000',Z86Error));
        end;
      end else
      begin
        if ((tMin64 > dmDep.cdsPb64PB64.AsFloat) and
            (dmDep.cdsPb64PB64.AsFloat > 0.0) and
            (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
        begin
          tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
          tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
          tMaterialID := dmDep.cdsDepositSamplesProspectMATERIALABR.AsString;
          tMin64 := dmDep.cdsPb64PB64.AsFloat;
          if (dmDep.cdsPb74PB74.AsFloat > 0.01) then
          begin
            tMin74 := dmDep.cdsPb74PB74.AsFloat;
            if (dmDep.cdsE74E74.AsFloat > 0.9)
              then YError := dmDep.cdsSig74SIG74.AsFloat*tMin74/100.0
              else YError := dmDep.cdsSig74SIG74.AsFloat;
          end;
          if (dmDep.cdsPb84PB84.AsFloat > 0.01) then
          begin
            tMin84 := dmDep.cdsPb84PB84.AsFloat;
            if (dmDep.cdsE84E84.AsFloat > 0.9)
              then ZError := dmDep.cdsSig84SIG84.AsFloat*tMin84/100.0
              else ZError := dmDep.cdsSig84SIG84.AsFloat;
          end;
          if (dmDep.cdsPb76PB76.AsFloat > 0.01) then
          begin
            tMin76 := dmDep.cdsPb76PB76.AsFloat;
            if (dmDep.cdsE76E76.AsFloat > 0.9)
              then Z76Error := dmDep.cdsSig76SIG76.AsFloat*tMin76/100.0
              else Z76Error := dmDep.cdsSig76SIG76.AsFloat;
          end;
          if (dmDep.cdsPb86PB86.AsFloat > 0.01) then
          begin
            tMin86 := dmDep.cdsPb86PB86.AsFloat;
            if (dmDep.cdsE86E86.AsFloat > 0.9)
              then Z86Error := dmDep.cdsSig86SIG86.AsFloat*tMin86/100.0
              else Z86Error := dmDep.cdsSig86SIG86.AsFloat;
          end;
          //dmUser.SetDeveloperData('7/4***'+FormatFloat('##0.000',tMin74)+'***'+FormatFloat('##0.000',YError));
          //dmUser.SetDeveloperData('6/4***'+FormatFloat('##0.000',tMin64)+'***'+FormatFloat('##0.000',XError));
          //dmUser.SetDeveloperData('8/4***'+FormatFloat('##0.000',tMin84)+'***'+FormatFloat('##0.000',ZError));
          //dmUser.SetDeveloperData('7/6***'+FormatFloat('##0.00000',tMin76)+'***'+FormatFloat('##0.00000',Z76Error));
          //dmUser.SetDeveloperData('8/6***'+FormatFloat('##0.00000',tMin86)+'***'+FormatFloat('##0.00000',Z86Error));
        end;
      end;
      dmDep.cdsDepositSamplesProspect.Prior;
    until dmDep.cdsDepositSamplesProspect.BOF;
    if (tMin74 > 1.0e5) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      //if (dmDep.cdsE64E64.AsFloast > 0.9)
      //  then XError := dmDep.cdsSig64SIG64.AsFloat*dmDep.cdsPb64Pb64.AsFloat/100.0
      //  else XError := dmDep.cdsSig64SIG64.AsFloat;
      if (dmDep.cdsE64E64.AsFloat > 0.9)
        then XError := dmDep.cdsSig64Sig64.AsFloat*dmDep.cdsPb64PB64.AsFloat/100.0
        else XError := dmDep.cdsSig64Sig64.AsFloat;
      if (dmDep.cdsE74E74.AsFloat > 0.9)
        then YError := dmDep.cdsSig74Sig74.AsFloat*dmDep.cdsPb74PB74.AsFloat/100.0
        else YError := dmDep.cdsSig74Sig74.AsFloat;
      //if (dmDep.cdsE84E84.AsFloat > 0.9)
      //  then ZError := dmDep.cdsSig84SIG84.AsFloat*dmDep.cdsPb84Pb84.AsFloat/100.0
      //  else ZError := dmDep.cdsSig84SIG84.AsFloat;
      if ((NS > 0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMATERIALABR.AsString := tMaterialID;
        dmDep.cdsDepCovrProspectMEAN64.AsFloat := tMin64;
        dmDep.cdsDepCovrProspectMEAN74.AsFloat := tMin74;
        dmDep.cdsDepCovrProspectSDEV64.AsFloat := XError;  // used to be 0.0
        dmDep.cdsDepCovrProspectCORREL76.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := 0.0;
        if (tMin64 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := 100.0*XError/tMin64;  //used to be 0.0
        end;
        dmDep.cdsDepCovrProspectSDEV74.AsFloat := YError;  // used to be 0.0
        dmDep.cdsDepCovrProspectCOEFFVAR74.AsFloat := 0.0;
        if (tMin74 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR74.AsFloat := 100.0*YError/tMin74;  //used to be 0.0
        end;
        dmDep.cdsDepCovrProspectNUMSAMPLES64.AsInteger := 1;
        dmDep.cdsDepCovrProspectNUMSAMPLES74.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEAN84.AsFloat := dmDep.cdsPb84PB84.AsFloat;
        dmDep.cdsDepCovrProspectSDEV84.AsFloat := ZError;  // used to be 0.0
        dmDep.cdsDepCovrProspectCORREL86.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat := 0.0;
        if (tMin84 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat := 100.0*ZError/tMin84;  // used to be 0.0
        end;
        dmDep.cdsDepCovrProspectNUMSAMPLES84.AsInteger := 1;
        Correl := 0.0;
        dmDep.cdsDepCovrProspectMEAN76.AsFloat := tMin76;
        dmDep.cdsDepCovrProspectMEAN86.AsFloat := tMin86;
        dmDep.cdsDepCovrProspectSDEV76.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectSDEV86.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR76.AsFloat := 0.0;
        if (tMin76 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR76.AsFloat := 100.0*Z76Error/tMin76;  // used to be 0.0
        end;
        dmDep.cdsDepCovrProspectSDEV86.AsFloat := Z86Error;
        dmDep.cdsDepCovrProspectCOEFFVAR86.AsFloat := 0.0;
        if (tMin86 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR86.AsFloat := 100.0*Z86Error/tMin86;  // used to be 0.0
        end;
        dmDep.cdsDepCovrProspectMEDIAN64.AsFloat := tMin64;
        dmDep.cdsDepCovrProspectMEDIAN74.AsFloat := tMin74;
        dmDep.cdsDepCovrProspectMEDIAN84.AsFloat := tMin84;
        dmDep.cdsDepCovrProspectMEDIAN76.AsFloat := tMin76;
        dmDep.cdsDepCovrProspectMEDIAN86.AsFloat := tMin86;
        dmDep.cdsDepCovrProspectNUMSAMPLES76.AsInteger := 1;
        dmDep.cdsDepCovrProspectNUMSAMPLES86.AsInteger := 1;
        MuValue := 1.0;
        MuError := 1.0;
        if ((tAge < 0.0) and
            (tAge >= SKAge_Stage2)) then
        begin
          //WebApplication.ShowMessage('Age not defined for Deposit '+IntToStr(tDepositID));
          MuValue := DefaultValue;
          MuError := DefaultValue;
          dmDep.cdsDepCovrProspectMEANMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEVMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVARMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLESMU.AsInteger := 0;
          dmDep.cdsDepCovrProspectMEAN64MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEV64MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLES64MODEL.AsInteger := 0;
          dmDep.cdsDepCovrProspectMEAN74MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEV74MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVAR74MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLES74MODEL.AsInteger := 0;
          dmDep.cdsDepCovrProspectMEANMUSAMPLES.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEVMUSMP.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVARMUSMP.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLESMUSMP.AsInteger := 0;
        end else
        begin
          CalcMuErr( tAge,
                   dmDep.cdsPb64Pb64.AsFloat,
                   dmDep.cdsPb74PB74.AsFloat,
                   XError,
                   YError,
                   Correl,
                   1.0,
                   SKAge_Stage2*1.0e6,
                   SK64_Stage2,
                   SK74_Stage2,
                   SKmu_Stage2,
                   MuValue,
                   MuError);
        end;
        dmDep.cdsDepCovrProspectMEANMU.AsFloat := MuValue;
        dmDep.cdsDepCovrProspectSDEVMU.AsFloat := MuError;  // used to be 0.0
        dmDep.cdsDepCovrProspectCOEFFVARMU.AsFloat := 0.0;
        if (MuValue > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVARMU.AsFloat := 100.0*MuError/MuValue;  // used to be 0.0
        end;
        dmDep.cdsDepCovrProspectNUMSAMPLESMU.AsInteger := 1;
        // model mu and model initial Pb64 and Pb74 calculations
        Pb64i := 0.0;
        Pb64iErr := 0.0;
        Pb74i := 0.0;
        Pb74iErr := 0.0;
        Pb84i := 0.0;
        Pb84iErr := 0.0;
        MuSmp := 0.0;
        MuSmpErr := 0.0;
        if ((tAge < 0.0) and
            (tAge >= SKAge_Stage2)) then
        begin
          //WebApplication.ShowMessage('Age not defined for Deposit '+IntToStr(tDepositID));
          dmDep.cdsDepCovrProspectMEDIANMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectMEDIAN64MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectMEDIAN74MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectMEDIANMUSAMPLES.AsFloat := DefaultValue;
        end else
        begin
          CalcPbInitial(tAge,
                   dmDep.cdsPb64PB64.AsFloat,
                   dmDep.cdsPb74PB74.AsFloat,
                   XError, YError, Correl,
                   1.0,
                   SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                   MuValue, MuError,
                   Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                   MuSmp, MuSmpErr);
          CalcModelSourceKappa ( tAge,
                          dmDep.cdsPb64PB64.AsFloat,
                          dmDep.cdsPb84PB84.AsFloat,
                          XError, ZError,
                          1.0,
                          SKAge_Stage2*1.0e6, SK64_Stage2, SK84_Stage2,
                          MuValue, MuError,
                          Pb84i, Pb84iErr,
                          KappaSrc, KappaSrcErr);
          CalcModelSmpKappa ( tAge,
                          dmDep.cdsPb64PB64.AsFloat,
                          dmDep.cdsPb84PB84.AsFloat,
                          XError, ZError,
                          1.0,
                          SKAge_Stage2*1.0e6, SK64_Stage2, SK84_Stage2,
                          MuValue, MuError,
                          KappaSrc, KappaSrcErr,
                          KappaSmp, KappaSmpErr);
        end;
        dmDep.cdsDepCovrProspectMEAN64MODEL.AsFloat := Pb64i;
        dmDep.cdsDepCovrProspectSDEV64MODEL.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectNUMSAMPLES64MODEL.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEAN74MODEL.AsFloat := Pb74i;
        dmDep.cdsDepCovrProspectSDEV74MODEL.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR74MODEL.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectNUMSAMPLES74MODEL.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEANMUSAMPLES.AsFloat := MuSmp;
        dmDep.cdsDepCovrProspectSDEVMUSMP.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVARMUSMP.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectNUMSAMPLESMUSMP.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEDIANMU.AsFloat := MuValue;
        dmDep.cdsDepCovrProspectMEDIAN64MODEL.AsFloat := Pb64i;
        dmDep.cdsDepCovrProspectMEDIAN74MODEL.AsFloat := Pb74i;
        dmDep.cdsDepCovrProspectMEDIAN84MODEL.AsFloat := Pb84i;
        dmDep.cdsDepCovrProspectMEDIANTHUMODEL.AsFloat := KappaSrc;
        dmDep.cdsDepCovrProspectMEDIANMUSAMPLES.AsFloat := MuSmp;
        dmDep.cdsDepCovrProspectMEDIANTHUSAMPLES.AsFloat := KappaSmp;
        dmDep.cdsDepCovrProspect.Post;
        try
          dmDep.cdsDepCovrProspect.ApplyUpdates(0);
        except
        end;
      end
      else begin
        //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
      end;
    end;
    //dmDep.cdsDepCovrProspect.Filtered := false;
    //Sulphide sulphur isotope calculations
    dmDep.cdsDepositSamplesProspect.First;
    tMinS34 := 1.0e12;
    repeat
      if ((tMinS34 > dmDep.cdsS34S34.AsFloat) and
          (dmDep.cdsS34S34.AsFloat > -999.0) and
          (dmDep.cdsS34.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
        tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
        tMinS34 := dmDep.cdsS34S34.AsFloat;
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    if (tMinS34 > 1.0e5) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      if (dmDep.cdsES34ES34.AsFloat > 0.9)
        then XError := dmDep.cdsSigS34SIGS34.AsFloat*dmDep.cdsS34S34.AsFloat/100.0
        else XError := dmDep.cdsSigS34SIGS34.AsFloat;
      //dmUser.SetDeveloperData('Least S SampleNo = '+tSampleNo);
      //dmUser.SetDeveloperData('Least S Frac = '+tFrac);
      //dmUser.SetDeveloperData('Least S d34S sulphide = '+FormatFloat('###0.000',dmDep.cdsS34S34.AsFloat));
      if ((NS > 0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectNUMSAMPLESS34.AsInteger := 1;
        //dmDep.cdsDepCovrProspectMEDIANS34.AsFloat := dmDep.cdsS34S34.AsFloat;
        dmDep.cdsDepCovrProspectMEDIANS34.AsFloat := tMinS34;
        dmDep.cdsDepCovrProspect.Post;
        try
          dmDep.cdsDepCovrProspect.ApplyUpdates(0);
        except
        end;
      end
      else begin
        //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
      end;
    end;
    //SO4 sulphur isotope calculations
    dmDep.cdsDepositSamplesProspect.First;
    tMinSO434 := 1.0e12;
    repeat
      if ((tMinSO434 > dmDep.cdsSO434SO434.AsFloat) and
          (dmDep.cdsSO434SO434.AsFloat > -999.0) and
          (dmDep.cdsSO434.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
        tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
        tMinSO434 := dmDep.cdsSO434SO434.AsFloat;
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    if (tMinSO434 > 1.0e5) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      if (dmDep.cdsESO434ESO434.AsFloat > 0.9)
        then XError := dmDep.cdsSigSO434SIGSO434.AsFloat*dmDep.cdsSO434SO434.AsFloat/100.0
        else XError := dmDep.cdsSigSO434SIGSO434.AsFloat;
      //dmUser.SetDeveloperData('Least SO4 SampleNo = '+tSampleNo);
      //dmUser.SetDeveloperData('Least SO4 Frac = '+tFrac);
      //dmUser.SetDeveloperData('Least SO4 d34S sulphide = '+FormatFloat('###0.000',dmDep.cdsSO434SO434.AsFloat));
      if ((NS > 0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectNUMSAMPLESSO434.AsInteger := 1;
        //dmDep.cdsDepCovrProspectMEDIANSO434.AsFloat := dmDep.cdsSO434SO434.AsFloat;
        dmDep.cdsDepCovrProspectMEDIANSO434.AsFloat := tMinSO434;
        dmDep.cdsDepCovrProspect.Post;
        try
          dmDep.cdsDepCovrProspect.ApplyUpdates(0);
        except
        end;
      end
      else begin
        //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
      end;
    end;
    //Oxygen isotope calculations
    dmDep.cdsDepositSamplesProspect.First;
    tMinO18 := 1.0e12;
    repeat
      if ((tMinO18 > dmDep.cdsO18O18.AsFloat) and
          (dmDep.cdsO18O18.AsFloat > -999.0) and
          (dmDep.cdsO18.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
        tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
        tMinO18 := dmDep.cdsO18O18.AsFloat;
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    if (tMinO18 > 1.0e5) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      if (dmDep.cdsEO18EO18.AsFloat > 0.9)
        then XError := dmDep.cdsSigO18SIGO18.AsFloat*dmDep.cdsO18O18.AsFloat/100.0
        else XError := dmDep.cdsSigO18SIGO18.AsFloat;
      //dmUser.SetDeveloperData('Least O SampleNo = '+tSampleNo);
      //dmUser.SetDeveloperData('Least O Frac = '+tFrac);
      //dmUser.SetDeveloperData('Least O d18O = '+FormatFloat('###0.000',dmDep.cdsO18O18.AsFloat));
      if ((NS > 0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectNUMSAMPLESO18.AsInteger := 1;
        //dmDep.cdsDepCovrProspectMEDIANO18.AsFloat := dmDep.cdsO18O18.AsFloat;
        dmDep.cdsDepCovrProspectMEDIANO18.AsFloat := tMinO18;
        dmDep.cdsDepCovrProspect.Post;
        try
          dmDep.cdsDepCovrProspect.ApplyUpdates(0);
        except
        end;
      end
      else begin
        //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
      end;
    end;
    dmDep.cdsDepCovrProspect.Filtered := false;
    dmDep.cdsDepositSamplesProspect.First;
  end;
end;

procedure TdmDep.CalculateCoVarMostRadiogenic(tDepositID : integer; tAge : double);
var
  SumX1, SumX2, SumX3, SumMu, SumX4, SumX5,
  SumX6, SumX7, SumX8,
  SumX1Sq, SumX2Sq, SumX3Sq, SumMuSq, SumX4Sq, SumX5Sq,
  SumX6Sq, SumX7Sq, SumX8Sq,
  SumX1X2, SumX1X3,
  NS, NS1, NS2, NS3, NS4, NS5, NSMu,
  NS6, NS7, NS8,
  NS9, NS10, NS11,
  MedianX1, MedianX2, MedianX3, MedianX4, MedianX5,
  MedianMu, MedianX6, MedianX7, MedianX8,
  MedianX9, MedianX10, Medianx11,
  MeanX1, MeanX2, MeanX3, MeanMu, MeanX4, MeanX5,
  MeanX6, MeanX7, MeanX8, MeanX9, MeanX10, MeanX11,
  SDOM1, SDOM2, SDOM3, SDOMMu, SDOM4, SDOM5,
  SDOM6, SDOM7, SDOM8 : double;
  VarX1, VarX2, VarX3, VarMu, VarX4, VarX5,
  VarX6, VarX7, VarX8,
  SDevX1, SDevX2, SDevX3, SDevMu, SDevX4, SDevX5,
  SDevX6, SDevX7, SDevX8,
  CoVar1, Correl1, CoVar2, Correl2, Correl4, Correl5,
  EWt1, EWt2, EWt3, EWtMu, EWt4, EWt5,
  EWt6, EWt7, EWt8,
  EWt9, EWt10, EWt11,
  SumEWt1, SumEWt2, SumEWt3, SumEWtMu, SumEWt4, SumEWt5,
  MuValue, MuError : double;
  XError, YError, ZError   : double;
  Z76Error, Z86Error : double;
  Correl           : double;
  TD: TDBXTransaction;
  Pb64i, Pb64iErr, Pb74i, Pb74iErr,
  MuSmp, MuSmpErr : double;
  tMinS34, tMinSO434, tMinO18 : double;
  tSampleNo, tFrac, tMaterialID : string;
  tMin64, tMin74 : double;
  NumSamplesAvailable : integer;
  tMax84, tMax76, tMax86,
  tMax64, tMax74, tMaxS34, tMaxSO434, tMaxo18 : double;
begin
  //dmUser.SetDeveloperData('starting most radiogenic calculation for deposit '+IntToStr(tDepositID));
  tSampleNo := '';
  tFrac := '';
  NumSamplesAvailable := 0;
  MeanX1 := 0.0;
  MeanX2 := 0.0;
  MeanX3 := 0.0;
  MeanX4 := 0.0;
  MeanX5 := 0.0;
  MeanMu := 0.0;
  MeanX6 := 0.0;
  MeanX7 := 0.0;
  MeanX8 := 0.0;
  MeanX9 := 0.0;
  MeanX10 := 0.0;
  MeanX11 := 0.0;
  Correl1 := 0.0;
  Correl2 := 0.0;
  Correl4 := 0.0;
  Correl5 := 0.0;
  NS1 := 0.0;
  NS2 := 0.0;
  NS3 := 0.0;
  NS4 := 0.0;
  NS5 := 0.0;
  NSMu := 0.0;
  NS6 := 0.0;
  NS7 := 0.0;
  NS8 := 0.0;
  NS9 := 0.0;
  NS10 := 0.0;
  NS11 := 0.0;
  dmDep.qCountDepositSamplesProspect.Close;
  dmDep.qCountDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
  dmDep.cdsCountDepositSamplesProspect.Close;
  dmDep.cdsCountDepositSamplesProspect.Open;
  NumSamplesAvailable := dmDep.cdsCountDepositSamplesProspectCOUNT.AsInteger;
  dmDep.cdsCountDepositSamplesProspect.Close;
  if (NumSamplesAvailable > 0) then
  begin
    dmDep.qDepositSamplesProspect.Close;
    dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
    dmDep.cdsDepositSamplesProspect.Close;
    dmDep.cdsDepositSamplesProspect.IndexFieldNames := 'DATAVALUE;SAMPLENO;FRAC';
    dmDep.cdsDepositSamplesProspect.Open;
    try
      dmDep.qInsertDepCovrProspect.Close;
      dmDep.qInsertDepCovrProspect.ParamByName('DepositID').AsInteger := tDepositID;
      dmDep.qInsertDepCovrProspect.ParamByName('AverLeast').AsString := 'M';
      TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmDep.qInsertDepCovrProspect.ExecSQL(false);
        dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
      except
        dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
      end;
    except
    end;
    dmDep.qDepCovrProspect.Close;
    dmDep.qDepCovrProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
    dmDep.cdsDepCovrProspect.Close;
    dmDep.cdsDepCovrProspect.Open;
    dmDep.cdsDepCovrProspect.Filter := 'AVERLEAST = '+''''+'M'+'''';
    dmDep.cdsDepCovrProspect.Filtered := true;
    //if (tDepositID = 7000630) then NumSamplesAvailable := dmDep.cdsDepCovrProspect.RecordCount;
    //if (tDepositID = 7000630) then dmUser.SetDeveloperData(IntToStr(tDepositID)+' '+IntToStr(NumSamplesAvailable));
    //here
    //Pb
    dmDep.cdsDepositSamplesProspect.First;
    tMax64 := -1.0e12;
    tMax74 := -1.0e12;
    tMax84 := -1.0e12;
    tMax76 := -1.0e12;
    tMax86 := -1.0e12;
    {
    repeat
      tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
      tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
      dmUser.SetDeveloperData('All** '+tSampleNo+'***'+tFrac+'***'+FormatFloat('##0.000',dmDep.cdsPb74PB74.AsFloat));
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    dmDep.cdsDepositSamplesProspect.First;
    }
    repeat
      tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
      tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
      //tMaterialID := dmDep.cdsDepositSamplesProspectMATERIALABR.AsString;
      //dmUser.SetDeveloperData(tSampleNo+'***'+tFrac+'***'+FormatFloat('##0.000',tMax74));
      if (tAge >= Age74Dominant) then
      begin
        if ((tMax74 < dmDep.cdsPb74PB74.AsFloat) and
            (dmDep.cdsPb74PB74.AsFloat > 0.0) and
            (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
        begin
          tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
          tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
          tMaterialID := dmDep.cdsDepositSamplesProspectMATERIALABR.AsString;
          tMax74 := dmDep.cdsPb74PB74.AsFloat;
          //dmUser.SetDeveloperData('7/4***'+tSampleNo+'***'+tFrac+'***'+FormatFloat('##0.000',tMax74));
          if (dmDep.cdsPb64PB64.AsFloat > 0.01) then
          begin
            tMax64 := dmDep.cdsPb64PB64.AsFloat;
            if (dmDep.cdsE64E64.AsFloat > 0.9)
              then XError := dmDep.cdsSig64SIG64.AsFloat*tMax64/100.0
              else XError := dmDep.cdsSig64SIG64.AsFloat;
          end;
          if (dmDep.cdsPb84PB84.AsFloat > 0.01) then
          begin
            tMax84 := dmDep.cdsPb84PB84.AsFloat;
            if (dmDep.cdsE84E84.AsFloat > 0.9)
              then ZError := dmDep.cdsSig84SIG84.AsFloat*tMax84/100.0
              else ZError := dmDep.cdsSig84SIG84.AsFloat;
          end;
          if (dmDep.cdsPb76PB76.AsFloat > 0.01) then
          begin
            tMax76 := dmDep.cdsPb76PB76.AsFloat;
            if (dmDep.cdsE76E76.AsFloat > 0.9)
              then Z76Error := dmDep.cdsSig76SIG76.AsFloat*tMax76/100.0
              else Z76Error := dmDep.cdsSig76SIG76.AsFloat;
          end;
          if (dmDep.cdsPb86PB86.AsFloat > 0.01) then
          begin
            tMax86 := dmDep.cdsPb86PB86.AsFloat;
            if (dmDep.cdsE86E86.AsFloat > 0.9)
              then Z86Error := dmDep.cdsSig86SIG86.AsFloat*tMax86/100.0
              else Z86Error := dmDep.cdsSig86SIG86.AsFloat;
          end;
          //dmUser.SetDeveloperData('7/4***'+FormatFloat('##0.000',tMax74)+'***'+FormatFloat('##0.000',YError));
          //dmUser.SetDeveloperData('6/4***'+FormatFloat('##0.000',tMax64)+'***'+FormatFloat('##0.000',XError));
          //dmUser.SetDeveloperData('8/4***'+FormatFloat('##0.000',tMax84)+'***'+FormatFloat('##0.000',ZError));
          //dmUser.SetDeveloperData('7/6***'+FormatFloat('##0.00000',tMax76)+'***'+FormatFloat('##0.00000',Z76Error));
          //dmUser.SetDeveloperData('8/6***'+FormatFloat('##0.00000',tMax86)+'***'+FormatFloat('##0.00000',Z86Error));
        end;
      end else
      begin
        if ((tMax64 < dmDep.cdsPb64PB64.AsFloat) and
            (dmDep.cdsPb64PB64.AsFloat > 0.0) and
            (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
        begin
          tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
          tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
          tMaterialID := dmDep.cdsDepositSamplesProspectMATERIALABR.AsString;
          tMax64 := dmDep.cdsPb64PB64.AsFloat;
          //dmUser.SetDeveloperData('7/4***'+tSampleNo+'***'+tFrac+'***'+FormatFloat('##0.000',tMax74));
          if (dmDep.cdsPb74PB74.AsFloat > 0.01) then
          begin
            tMax74 := dmDep.cdsPb74PB74.AsFloat;
            if (dmDep.cdsE74E74.AsFloat > 0.9)
              then YError := dmDep.cdsSig74SIG74.AsFloat*tMax74/100.0
              else YError := dmDep.cdsSig74SIG74.AsFloat;
          end;
          if (dmDep.cdsPb84PB84.AsFloat > 0.01) then
          begin
            tMax84 := dmDep.cdsPb84PB84.AsFloat;
            if (dmDep.cdsE84E84.AsFloat > 0.9)
              then ZError := dmDep.cdsSig84SIG84.AsFloat*tMax84/100.0
              else ZError := dmDep.cdsSig84SIG84.AsFloat;
          end;
          if (dmDep.cdsPb76PB76.AsFloat > 0.01) then
          begin
            tMax76 := dmDep.cdsPb76PB76.AsFloat;
            if (dmDep.cdsE76E76.AsFloat > 0.9)
              then Z76Error := dmDep.cdsSig76SIG76.AsFloat*tMax76/100.0
              else Z76Error := dmDep.cdsSig76SIG76.AsFloat;
          end;
          if (dmDep.cdsPb86PB86.AsFloat > 0.01) then
          begin
            tMax86 := dmDep.cdsPb86PB86.AsFloat;
            if (dmDep.cdsE86E86.AsFloat > 0.9)
              then Z86Error := dmDep.cdsSig86SIG86.AsFloat*tMax86/100.0
              else Z86Error := dmDep.cdsSig86SIG86.AsFloat;
          end;
          //dmUser.SetDeveloperData('7/4***'+FormatFloat('##0.000',tMax74)+'***'+FormatFloat('##0.000',YError));
          //dmUser.SetDeveloperData('6/4***'+FormatFloat('##0.000',tMax64)+'***'+FormatFloat('##0.000',XError));
          //dmUser.SetDeveloperData('8/4***'+FormatFloat('##0.000',tMax84)+'***'+FormatFloat('##0.000',ZError));
          //dmUser.SetDeveloperData('7/6***'+FormatFloat('##0.00000',tMax76)+'***'+FormatFloat('##0.00000',Z76Error));
          //dmUser.SetDeveloperData('8/6***'+FormatFloat('##0.00000',tMax86)+'***'+FormatFloat('##0.00000',Z86Error));
        end;
      end;
      //if (tDepositID = 7000630) then dmUser.SetDeveloperData(tSampleNo+' '+tFrac+' '+FormatFloat('###0.000',tMax74));
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    if (tMax74 < -1.0e5) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      if (dmDep.cdsE64E64.AsFloat > 0.9)
        then XError := dmDep.cdsSig64SIG64.AsFloat*dmDep.cdsPb64Pb64.AsFloat/100.0
        else XError := dmDep.cdsSig64SIG64.AsFloat;
      if (dmDep.cdsE74E74.AsFloat > 0.9)
        then YError := dmDep.cdsSig74Sig74.AsFloat*dmDep.cdsPb74PB74.AsFloat/100.0
        else YError := dmDep.cdsSig74Sig74.AsFloat;
      //if (dmDep.cdsE84E84.AsFloat > 0.9)
      //  then ZError := dmDep.cdsSig84SIG84.AsFloat*dmDep.cdsPb84Pb84.AsFloat/100.0
      //  else ZError := dmDep.cdsSig84SIG84.AsFloat;
      if ((NS > 0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectMATERIALABR.AsString := tMaterialID;
        dmDep.cdsDepCovrProspectSDEV76.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectSDEV86.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR76.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR86.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectMEAN64.AsFloat := tMax64;
        dmDep.cdsDepCovrProspectMEAN74.AsFloat := tMax74;
        dmDep.cdsDepCovrProspectSDEV64.AsFloat := XError;  // used to be 0.0
        dmDep.cdsDepCovrProspectCORREL76.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := 0.0;
        if (tMax64 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat := 100.0*XError/tMax64;  //used to be 0.0
        end;
        dmDep.cdsDepCovrProspectSDEV74.AsFloat := YError;  // used to be 0.0
        dmDep.cdsDepCovrProspectCOEFFVAR74.AsFloat := 0.0;
        if (tMax74 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR74.AsFloat := 100.0*YError/tMax74;  //used to be 0.0
        end;
        dmDep.cdsDepCovrProspectNUMSAMPLES64.AsInteger := 1;
        dmDep.cdsDepCovrProspectNUMSAMPLES74.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEAN84.AsFloat := tMax84;
        dmDep.cdsDepCovrProspectSDEV84.AsFloat := ZError;  // used to be 0.0
        dmDep.cdsDepCovrProspectCORREL86.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat := 0.0;
        if (tMax84 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat := 100.0*ZError/tMax84;  // used to be 0.0
        end;
        dmDep.cdsDepCovrProspectNUMSAMPLES84.AsInteger := 1;
        Correl := 0.0;
        dmDep.cdsDepCovrProspectMEAN76.AsFloat := tMax76;
        dmDep.cdsDepCovrProspectMEAN86.AsFloat := tMax86;
        dmDep.cdsDepCovrProspectNUMSAMPLES76.AsInteger := 1;
        dmDep.cdsDepCovrProspectNUMSAMPLES86.AsInteger := 1;
        dmDep.cdsDepCovrProspectSDEV76.AsFloat := Z76Error;
        dmDep.cdsDepCovrProspectCOEFFVAR76.AsFloat := 0.0;
        if (tMax76 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR76.AsFloat := 100.0*Z76Error/tMax76;  // used to be 0.0
        end;
        dmDep.cdsDepCovrProspectSDEV86.AsFloat := Z86Error;
        dmDep.cdsDepCovrProspectCOEFFVAR86.AsFloat := 0.0;
        if (tMax86 > 0) then
        begin
          dmDep.cdsDepCovrProspectCOEFFVAR86.AsFloat := 100.0*Z86Error/tMax86;  // used to be 0.0
        end;
        dmDep.cdsDepCovrProspectMEDIAN64.AsFloat := tMax64;
        dmDep.cdsDepCovrProspectMEDIAN74.AsFloat := tMax74;
        dmDep.cdsDepCovrProspectMEDIAN84.AsFloat := tMax84;
        dmDep.cdsDepCovrProspectMEDIAN76.AsFloat := tMax76;
        dmDep.cdsDepCovrProspectMEDIAN86.AsFloat := tMax86;
        MuValue := 1.0;
        MuError := 1.0;
        if ((tAge < 0.0) and
            (tAge >= SKAge_Stage2)) then
        begin
          //WebApplication.ShowMessage('Age not defined for Deposit '+IntToStr(tDepositID));
          MuValue := DefaultValue;
          MuError := DefaultValue;
          dmDep.cdsDepCovrProspectMEANMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEVMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVARMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLESMU.AsInteger := 0;
          dmDep.cdsDepCovrProspectMEAN64MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEV64MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLES64MODEL.AsInteger := 0;
          dmDep.cdsDepCovrProspectMEAN74MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEV74MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVAR74MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLES74MODEL.AsInteger := 0;
          dmDep.cdsDepCovrProspectMEANMUSAMPLES.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectSDEVMUSMP.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectCOEFFVARMUSMP.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectNUMSAMPLESMUSMP.AsInteger := 0;
        end else
        begin
          CalcMuErr( tAge,
                   dmDep.cdsPb64Pb64.AsFloat,
                   dmDep.cdsPb74PB74.AsFloat,
                   XError,
                   YError,
                   Correl,
                   1.0,
                   SKAge_Stage2*1.0e6,
                   SK64_Stage2,
                   SK74_Stage2,
                   SKmu_Stage2,
                   MuValue,
                   MuError);
        end;
        dmDep.cdsDepCovrProspectMEANMU.AsFloat := MuValue;
        dmDep.cdsDepCovrProspectSDEVMU.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVARMU.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectNUMSAMPLESMU.AsInteger := 1;
        Pb64i := 0.0;
        Pb64iErr := 0.0;
        Pb74i := 0.0;
        Pb74iErr := 0.0;
        MuSmp := 0.0;
        MuSmpErr := 0.0;
        if ((tAge < 0.0) and
            (tAge >= SKAge_Stage2)) then
        begin
          //WebApplication.ShowMessage('Age not defined for Deposit '+IntToStr(tDepositID));
          dmDep.cdsDepCovrProspectMEDIANMU.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectMEDIAN64MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectMEDIAN74MODEL.AsFloat := DefaultValue;
          dmDep.cdsDepCovrProspectMEDIANMUSAMPLES.AsFloat := DefaultValue;
        end else
        begin
          CalcPbInitial(tAge,
                   dmDep.cdsPb64PB64.AsFloat,
                   dmDep.cdsPb74PB74.AsFloat,
                   XError, YError, Correl,
                   1.0,
                   SKAge_Stage2*1.0e6, SK64_Stage2, SK74_Stage2,
                   MuValue, MuError,
                   Pb64i, Pb64iErr, Pb74i, Pb74iErr,
                   MuSmp, MuSmpErr);
        end;
        dmDep.cdsDepCovrProspectMEAN64MODEL.AsFloat := Pb64i;
        dmDep.cdsDepCovrProspectSDEV64MODEL.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectNUMSAMPLES64MODEL.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEAN74MODEL.AsFloat := Pb74i;
        dmDep.cdsDepCovrProspectSDEV74MODEL.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVAR74MODEL.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectNUMSAMPLES74MODEL.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEANMUSAMPLES.AsFloat := MuSmp;
        dmDep.cdsDepCovrProspectSDEVMUSMP.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectCOEFFVARMUSMP.AsFloat := 0.0;
        dmDep.cdsDepCovrProspectNUMSAMPLESMUSMP.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEDIANMU.AsFloat := MuValue;
        dmDep.cdsDepCovrProspectMEDIAN64MODEL.AsFloat := Pb64i;
        dmDep.cdsDepCovrProspectMEDIAN74MODEL.AsFloat := Pb74i;
        dmDep.cdsDepCovrProspectMEDIANMUSAMPLES.AsFloat := MuSmp;
        //if (tDepositID = 7000630) then dmUser.SetDeveloperData('Deposit = '+IntToStr(tDepositID));
        dmDep.cdsDepCovrProspect.Post;
        try
          dmDep.cdsDepCovrProspect.ApplyUpdates(0);
        except
        end;
      end
      else begin
        //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
      end;
    end;
    //S
    dmDep.cdsDepositSamplesProspect.First;
    tMaxS34 := -1.0e12;
    repeat
      if ((tMaxS34 < dmDep.cdsS34S34.AsFloat) and
          (dmDep.cdsS34S34.AsFloat > -999.0) and
          (dmDep.cdsS34.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
        tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
        tMaxS34 := dmDep.cdsS34S34.AsFloat;
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    if (tMaxS34 < -1.0e5) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      if (dmDep.cdsES34ES34.AsFloat > 0.9)
        then XError := dmDep.cdsSigS34SIGS34.AsFloat*dmDep.cdsS34S34.AsFloat/100.0
        else XError := dmDep.cdsSigS34SIGS34.AsFloat;
      //dmUser.SetDeveloperData('Least S SampleNo = '+tSampleNo);
      //dmUser.SetDeveloperData('Least S Frac = '+tFrac);
      //dmUser.SetDeveloperData('Least S d34S sulphide = '+FormatFloat('###0.000',dmDep.cdsS34S34.AsFloat));
      if ((NS > 0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectNUMSAMPLESS34.AsInteger := 1;
        //dmDep.cdsDepCovrProspectMEDIANS34.AsFloat := dmDep.cdsS34S34.AsFloat;
        dmDep.cdsDepCovrProspectMEDIANS34.AsFloat := tMaxS34;
        dmDep.cdsDepCovrProspect.Post;
        try
          dmDep.cdsDepCovrProspect.ApplyUpdates(0);
        except
        end;
      end
      else begin
        //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
      end;
    end;
    //SO4
    dmDep.cdsDepositSamplesProspect.First;
    tMaxSO434 := -1.0e12;
    repeat
      if ((tMaxSO434 < dmDep.cdsSO434SO434.AsFloat) and
          (dmDep.cdsSO434SO434.AsFloat > -999.0) and
          (dmDep.cdsSO434.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
        tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
        tMaxSO434 := dmDep.cdsSO434SO434.AsFloat;
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    if (tMaxSO434 < -1.0e5) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      if (dmDep.cdsESO434ESO434.AsFloat > 0.9)
        then XError := dmDep.cdsSigSO434SIGSO434.AsFloat*dmDep.cdsSO434SO434.AsFloat/100.0
        else XError := dmDep.cdsSigSO434SIGSO434.AsFloat;
      //dmUser.SetDeveloperData('Least SO4 SampleNo = '+tSampleNo);
      //dmUser.SetDeveloperData('Least SO4 Frac = '+tFrac);
      //dmUser.SetDeveloperData('Least SO4 d34S sulphide = '+FormatFloat('###0.000',dmDep.cdsSO434SO434.AsFloat));
      if ((NS > 0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectNUMSAMPLESSO434.AsInteger := 1;
        dmDep.cdsDepCovrProspectMEDIANSO434.AsFloat := dmDep.cdsSO434SO434.AsFloat;
        dmDep.cdsDepCovrProspect.Post;
        try
          dmDep.cdsDepCovrProspect.ApplyUpdates(0);
        except
        end;
      end
      else begin
        //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
      end;
    end;
    //O
    dmDep.cdsDepositSamplesProspect.First;
    tMaxO18 := -1.0e12;
    repeat
      if ((tMaxO18 < dmDep.cdsO18O18.AsFloat) and
          (dmDep.cdsO18O18.AsFloat > -999.0) and
          (dmDep.cdsO18.RecordCount > 0) and
          (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'Y')) then
      begin
        tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
        tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
        tMaxO18 := dmDep.cdsO18O18.AsFloat;
      end;
      dmDep.cdsDepositSamplesProspect.Next;
    until dmDep.cdsDepositSamplesProspect.EOF;
    if (tMaxO18 < -1.0e5) then
    begin
      NS := 0;
    end else
    begin
      NS := 1;
    end;
    if (NS > 0) then
    begin
      dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO;FRAC',VarArrayOf([tSampleNo,tFrac]), [loPartialKey]);
      if (dmDep.cdsEO18EO18.AsFloat > 0.9)
        then XError := dmDep.cdsSigO18SIGO18.AsFloat*dmDep.cdsO18O18.AsFloat/100.0
        else XError := dmDep.cdsSigO18SIGO18.AsFloat;
      //dmUser.SetDeveloperData('Least O SampleNo = '+tSampleNo);
      //dmUser.SetDeveloperData('Least O Frac = '+tFrac);
      //dmUser.SetDeveloperData('Least O d18O = '+FormatFloat('###0.000',dmDep.cdsO18O18.AsFloat));
      if ((NS > 0)) then
      begin
        dmDep.cdsDepCovrProspect.Edit;
        dmDep.cdsDepCovrProspectNUMSAMPLESO18.AsInteger := 1;
        //dmDep.cdsDepCovrProspectMEDIANO18.AsFloat := dmDep.cdsO18O18.AsFloat;
        dmDep.cdsDepCovrProspectMEDIANO18.AsFloat := tMaxO18;
        dmDep.cdsDepCovrProspect.Post;
        try
          dmDep.cdsDepCovrProspect.ApplyUpdates(0);
        except
        end;
      end
      else begin
        //if (Sender = bbCoVar) then MessageDlg('Insufficient data available', mtInformation,[mbOK],0);
      end;
    end;
    dmDep.cdsDepCovrProspect.Filtered := false;
    dmDep.cdsDepositSamplesProspect.First;
  end;
end;

procedure TdmDep.DeleteDepositSampleFrac( tDepositID : integer;
                                       tSampleNo, tFrac : string;
                                   var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  //TD: TTransactionDesc;
begin
  WasSuccessful := true;
  dmDep.qDeleteDepositSampleFrac.ParamByName('DepositID').AsInteger := tDepositID;
  dmDep.qDeleteDepositSampleFrac.ParamByName('SampleNo').AsString := tSampleNo;
  dmDep.qDeleteDepositSampleFrac.ParamByName('Frac').AsString := tFrac;
  TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmDep.qDeleteDepositSampleFrac.ExecSQL(false);
    dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
  except
    dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
    WasSuccessful := false;
  end;
  {
  if not dmDep.sqlcDateView.InTransaction then
  begin
    TD.TransactionID := 1;
    TD.IsolationLevel := xilREADCOMMITTED;
    dmDep.sqlcDateView.StartTransaction(TD);
    try
      dmDep.qDeleteDepositSampleFrac.ExecSQL(false);
      dmDep.sqlcDateView.Commit(TD); //on success, commit the changes
    except
      dmDep.sqlcDateView.Rollback(TD); //on failure, undo the changes
      WasSuccessful := false;
    end;
  end;
  }
end;

procedure TdmDep.DeleteUserDepSampleValuesForUser( tUserID : string;
                                   var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  dmDep.qDeleteUserDepSampleValuesForUser.ParamByName('UserID').AsString := tUserID;
  TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmDep.qDeleteUserDepSampleValuesForUser.ExecSQL(false);
    dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
  except
    dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
    WasSuccessful := false;
  end;
end;

procedure TdmDep.MarkSampleFracAsUnknownDeposit( tDepositID : integer;
                                       tSampleNo, tFrac : string;
                                   var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  //TD: TTransactionDesc;
begin
  WasSuccessful := true;
  dmDep.qMarkSampleFracAsUnknownDeposit.ParamByName('DepositID').AsInteger := tDepositID;
  dmDep.qMarkSampleFracAsUnknownDeposit.ParamByName('SampleNo').AsString := tSampleNo;
  dmDep.qMarkSampleFracAsUnknownDeposit.ParamByName('Frac').AsString := tFrac;
  TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmDep.qMarkSampleFracAsUnknownDeposit.ExecSQL(false);
    dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
  except
    dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
    WasSuccessful := false;
  end;
  {
  if not dmDep.sqlcDateView.InTransaction then
  begin
    TD.TransactionID := 1;
    TD.IsolationLevel := xilREADCOMMITTED;
    dmDep.sqlcDateView.StartTransaction(TD);
    try
      dmDep.qMarkSampleFracAsUnknownDeposit.ExecSQL(false);
      dmDep.sqlcDateView.Commit(TD); //on success, commit the changes
    except
      dmDep.sqlcDateView.Rollback(TD); //on failure, undo the changes
      WasSuccessful := false;
    end;
  end;
  }
end;

procedure TdmDep.DeleteSampleFracVariable( tSampleNo, tFrac, tVariableID : string;
                                   var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  //TD: TTransactionDesc;
begin
  WasSuccessful := true;
  dmDep.qDeleteSampleFracVariable.ParamByName('SampleNo').AsString := tSampleNo;
  dmDep.qDeleteSampleFracVariable.ParamByName('Frac').AsString := tFrac;
  dmDep.qDeleteSampleFracVariable.ParamByName('VariableID').AsString := tVariableID;
  TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmDep.qDeleteSampleFracVariable.ExecSQL(false);
    dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
  except
    dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
    WasSuccessful := false;
  end;
  {
  if not dmDep.sqlcDateView.InTransaction then
  begin
    TD.TransactionID := 1;
    TD.IsolationLevel := xilREADCOMMITTED;
    dmDep.sqlcDateView.StartTransaction(TD);
    try
      dmDep.qDeleteSampleFracVariable.ExecSQL(false);
      dmDep.sqlcDateView.Commit(TD); //on success, commit the changes
    except
      dmDep.sqlcDateView.Rollback(TD); //on failure, undo the changes
      WasSuccessful := false;
    end;
  end;
  }
end;

procedure TdmDep.DeleteDepositStatistics( tDepositID : integer;
                                   var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
  //TD: TTransactionDesc;
begin
  WasSuccessful := true;
  dmDep.qDeleteDepCovr.ParamByName('DepositID').AsInteger := tDepositID;
  TD := dmDep.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmDep.qDeleteDepCovr.ExecSQL(false);
    dmDep.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
  except
    dmDep.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
    WasSuccessful := false;
  end;
  {
  if not dmDep.sqlcDateView.InTransaction then
  begin
    TD.TransactionID := 1;
    TD.IsolationLevel := xilREADCOMMITTED;
    dmDep.sqlcDateView.StartTransaction(TD);
    try
      dmDep.qDeleteDepCovr.ExecSQL(false);
      dmDep.sqlcDateView.Commit(TD); //on success, commit the changes
    except
      dmDep.sqlcDateView.Rollback(TD); //on failure, undo the changes
      WasSuccessful := false;
    end;
  end;
  }
end;

procedure TdmDep.GetIsoSystemCounts(tUserID,tDepositID : string;
                                    var NumPb : integer;
                                    var NumSr : integer;
                                    var NumNd : integer;
                                    var NumOs : integer;
                                    var NumS : integer;
                                    var NumSO4 : integer;
                                    var NumO : integer);
begin
  NumPb := 0;
  NumSr := 0;
  NumNd := 0;
  NumOs := 0;
  NumS := 0;
  NumSO4 := 0;
  NumO := 0;
  dmDep.qCountUserDepSmpIso.Close;
  dmDep.qCountUserDepSmpIso.SQL.Clear;
  dmDep.qCountUserDepSmpIso.SQL.Add('select count(userdepsamplevalues.sampleno) as NumFound');
  dmDep.qCountUserDepSmpIso.SQL.Add('from userdepsamplevalues');
  dmDep.qCountUserDepSmpIso.SQL.Add('where userdepsamplevalues.userid = :UserID');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.depositid = :DepositID');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.pb64 > -999.0');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.inc4stats = '+''''+'Y'+'''');
  dmDep.qCountUserDepSmpIso.ParamByName('UserID').AsString := tUserID;
  dmDep.qCountUserDepSmpIso.ParamByName('DepositID').AsString := tDepositID;
  dmDep.cdsCountUserDepSmpIso.Open;
  NumPb := dmDep.cdsCountUserDepSmpIsoNUMFOUND.AsInteger;
  dmDep.cdsCountUserDepSmpIso.Close;
  dmDep.qCountUserDepSmpIso.Close;
  dmDep.qCountUserDepSmpIso.SQL.Clear;
  dmDep.qCountUserDepSmpIso.SQL.Add('select count(userdepsamplevalues.sampleno) as NumFound');
  dmDep.qCountUserDepSmpIso.SQL.Add('from userdepsamplevalues');
  dmDep.qCountUserDepSmpIso.SQL.Add('where userdepsamplevalues.userid = :UserID');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.depositid = :DepositID');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.s34 > -999.0');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.inc4stats = '+''''+'Y'+'''');
  dmDep.qCountUserDepSmpIso.ParamByName('UserID').AsString := tUserID;
  dmDep.qCountUserDepSmpIso.ParamByName('DepositID').AsString := tDepositID;
  dmDep.cdsCountUserDepSmpIso.Open;
  NumS := dmDep.cdsCountUserDepSmpIsoNUMFOUND.AsInteger;
  dmDep.cdsCountUserDepSmpIso.Close;
  dmDep.qCountUserDepSmpIso.Close;
  dmDep.qCountUserDepSmpIso.SQL.Clear;
  dmDep.qCountUserDepSmpIso.SQL.Add('select count(userdepsamplevalues.sampleno) as NumFound');
  dmDep.qCountUserDepSmpIso.SQL.Add('from userdepsamplevalues');
  dmDep.qCountUserDepSmpIso.SQL.Add('where userdepsamplevalues.userid = :UserID');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.depositid = :DepositID');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.SO434 > -999.0');
  dmDep.qCountUserDepSmpIso.SQL.Add('and userdepsamplevalues.inc4stats = '+''''+'Y'+'''');
  dmDep.qCountUserDepSmpIso.ParamByName('UserID').AsString := tUserID;
  dmDep.qCountUserDepSmpIso.ParamByName('DepositID').AsString := tDepositID;
  dmDep.cdsCountUserDepSmpIso.Open;
  NumSO4 := dmDep.cdsCountUserDepSmpIsoNUMFOUND.AsInteger;
  dmDep.cdsCountUserDepSmpIso.Close;
end;

function TdmDep.PbModelAge(Slope : double): double;
var
  X1, X2, Y1, Y2,
  Difference, AgeMax, ApproxAge,
  Z1, Z2       :  double;
  ThisDone     :  Boolean;
  tmpSKAge_Stage2 : double;
begin
  tmpSKAge_Stage2 := SKAge_Stage2*1.0e6;
  if ((Slope > 0.0) and (Slope < 2.0)) then
  begin
    ThisDone :=false;
    AgeMax :=5.0E9;
    Z1 :=Exp(DecayConst238*tmpSKAge_Stage2);
    Z2 :=Exp(DecayConst235*tmpSKAge_Stage2);
    repeat
      X1 := Z1-Exp(DecayConst238*AgeMax);
      X2 := Z2-Exp(DecayConst235*AgeMax);
      Y1 := X2/X1-U238U235*Slope;
      Y2 := X1*(Z2+X2)*DecayConst235-X2*(Z1+X1)*DecayConst238;
      Y2 := Y2/(X1*X1);
      ApproxAge := AgeMax - Y1/Y2;
      Difference := Abs(AgeMax - ApproxAge);
      AgeMax := ApproxAge;
      if Difference < AgeTolerance then ThisDone := true;
    until ThisDone;
  end
  else AgeMax := 0.0;
  PbModelAge := AgeMax/1.0e6;
end;{function PbModelAge}


end.
