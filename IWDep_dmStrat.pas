unit IWDep_dmStrat;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox, WideStrings, DBXDevartInterBase;

type
  TdmStrat = class(TDataModule)
    qDeposits: TSQLQuery;
    dspDeposits: TDataSetProvider;
    cdsDeposits: TClientDataSet;
    dsDeposits: TDataSource;
    qDeposit: TSQLQuery;
    dspDeposit: TDataSetProvider;
    cdsDeposit: TClientDataSet;
    dsDeposit: TDataSource;
    dsqDeposit: TDataSource;
    qDomains: TSQLQuery;
    dspDomains: TDataSetProvider;
    cdsDomains: TClientDataSet;
    dsDomains: TDataSource;
    cdsDomainsDOMAINID: TIntegerField;
    cdsDomainsCONTINENTID: TStringField;
    cdsDomainsDOMAINNAME: TStringField;
    cdsDomainsSPOTLATITUDE: TFloatField;
    cdsDomainsSPOTLONGITUDE: TFloatField;
    qNewDeposit: TSQLQuery;
    qClans: TSQLQuery;
    dspClans: TDataSetProvider;
    cdsClans: TClientDataSet;
    dsClans: TDataSource;
    qCommodities: TSQLQuery;
    dspCommodities: TDataSetProvider;
    cdsCommodities: TClientDataSet;
    dsCommodities: TDataSource;
    qOtherDatabases: TSQLQuery;
    dspOtherDatabases: TDataSetProvider;
    cdsOtherDatabases: TClientDataSet;
    dsOtherDatabases: TDataSource;
    cdsDomainsDOMAINPARENTID: TIntegerField;
    cdsDomainsDOMAINTYPEID: TStringField;
    qContinents: TSQLQuery;
    qContinentsCONTINENTID: TStringField;
    qContinentsCONTINENT: TStringField;
    qContinentsDEFAULTDOMAINID: TIntegerField;
    dsContinents: TDataSource;
    cdsContinents: TClientDataSet;
    dspContinents: TDataSetProvider;
    cdsContinentsCONTINENTID: TStringField;
    cdsContinentsCONTINENT: TStringField;
    cdsContinentsDEFAULTDOMAINID: TIntegerField;
    qDomainsAll: TSQLQuery;
    dspDomainsAll: TDataSetProvider;
    cdsDomainsAll: TClientDataSet;
    dsDomainsAll: TDataSource;
    cdsDomainsAllDOMAINID: TIntegerField;
    cdsDomainsAllCONTINENTID: TStringField;
    cdsDomainsAllDOMAINNAME: TStringField;
    cdsDomainsAllDOMAINPARENTID: TIntegerField;
    cdsDomainsAllDOMAINTYPEID: TStringField;
    cdsDomainsMINPLOTAGE: TFloatField;
    cdsDomainsMAXPLOTAGE: TFloatField;
    cdsDepositsSDBDEPOSITID: TIntegerField;
    cdsDepositsDEPOSITCLANID: TIntegerField;
    cdsDepositsCOUNTRYID: TStringField;
    cdsDepositsDEPOSITNAME: TStringField;
    cdsClansDEPOSITCLANID: TIntegerField;
    cdsClansDEPOSITCLAN: TStringField;
    cdsCommoditiesCOMMODITYID: TStringField;
    cdsCommoditiesCOMMODITY: TStringField;
    cdsOtherDatabasesDATBASEID: TIntegerField;
    cdsOtherDatabasesDATABASENAME: TStringField;
    cdsOtherDatabasesDESCRIPTION: TMemoField;
    qDepositSDBDEPOSITID: TIntegerField;
    qDepositDEPOSITCLANID: TIntegerField;
    qDepositDATABASEID: TIntegerField;
    qDepositDEPOSITNAME: TStringField;
    qDepositDEPLATITUDE: TFloatField;
    qDepositDEPLONGITUDE: TFloatField;
    qDepositAPPROXAGE: TFloatField;
    qDepositAPPROXAGEUNCERTAINTY: TFloatField;
    qDepositCOUNTRYID: TStringField;
    qDepositDEPOSITIDINT: TIntegerField;
    qDepositDEPOSITIDSTR: TStringField;
    cdsDepositSDBDEPOSITID: TIntegerField;
    cdsDepositDEPOSITCLANID: TIntegerField;
    cdsDepositDATABASEID: TIntegerField;
    cdsDepositDEPOSITNAME: TStringField;
    cdsDepositDEPLATITUDE: TFloatField;
    cdsDepositDEPLONGITUDE: TFloatField;
    cdsDepositAPPROXAGE: TFloatField;
    cdsDepositAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepositCOUNTRYID: TStringField;
    cdsDepositDEPOSITIDINT: TIntegerField;
    cdsDepositDEPOSITIDSTR: TStringField;
    DepositQuery: TSQLQuery;
    dspDepositQuery: TDataSetProvider;
    cdsDepositQuery: TClientDataSet;
    dsDepositQuery: TDataSource;
    qCountryContinents: TSQLQuery;
    dspCountryContinents: TDataSetProvider;
    cdsCountryContinents: TClientDataSet;
    dsCountryContinents: TDataSource;
    qCountryContinentsCOUNTRYID: TStringField;
    qCountryContinentsCOUNTRY: TStringField;
    qCountryContinentsCONTINENTID: TStringField;
    cdsCountryContinentsCOUNTRYID: TStringField;
    cdsCountryContinentsCOUNTRY: TStringField;
    cdsCountryContinentsCONTINENTID: TStringField;
    DepositQueryRec: TSQLQuery;
    dspDepositQueryRec: TDataSetProvider;
    cdsDepositQueryRec: TClientDataSet;
    cdsDepositQueryRecSDBDEPOSITID: TIntegerField;
    qDepositHOSTUNITID: TIntegerField;
    cdsDepositHOSTUNITID: TIntegerField;
    qUnitCountry: TSQLQuery;
    qUnitCountryUNITNAME: TStringField;
    qUnitCountryCOUNTRYID: TStringField;
    dspUnitCountry: TDataSetProvider;
    cdsUnitCountry: TClientDataSet;
    cdsUnitCountryUNITNAME: TStringField;
    cdsUnitCountryCOUNTRYID: TStringField;
    dsUnitCountry: TDataSource;
    qUnitCountryUNITID: TIntegerField;
    cdsUnitCountryUNITID: TIntegerField;
    qInsertLink: TSQLQuery;
    qDepositCONTINENTID: TStringField;
    cdsDepositCONTINENTID: TStringField;
    qDeleteDomainLink: TSQLQuery;
    qDefaultDomains: TSQLQuery;
    dspDefaultDomains: TDataSetProvider;
    cdsDefaultDomains: TClientDataSet;
    dsDefaultDomains: TDataSource;
    cdsDefaultDomainsDOMAINID: TIntegerField;
    cdsDefaultDomainsCONTINENTID: TStringField;
    cdsDefaultDomainsDOMAINNAME: TStringField;
    sqlcStrat: TSQLConnection;
    qGradeUnits: TSQLQuery;
    dspGradeUnits: TDataSetProvider;
    cdsGradeUnits: TClientDataSet;
    dsGradeUnits: TDataSource;
    cdsGradeUnitsGRADEID: TStringField;
    cdsGradeUnitsGRADEUNIT: TStringField;
    qCountries: TSQLQuery;
    dspCountries: TDataSetProvider;
    cdsCountries: TClientDataSet;
    cdsCountriesCOUNTRYID: TStringField;
    cdsCountriesCOUNTRY: TStringField;
    cdsCountriesCONTINENTID: TStringField;
    cdsCountriesCONTINENT: TStringField;
    cdsCountriesCOUNTRYHASRECORDS: TStringField;
    cdsCountriesSTARTINGVALUE: TIntegerField;
    cdsCountriesDEFAULTMAPID: TStringField;
    dsCountries: TDataSource;
    cdsDepositsDEPOSITNAMEDEPOSITID: TStringField;
    cdsDepositQuerySDBDEPOSITID: TIntegerField;
    cdsDepositQueryCOUNTRYID: TStringField;
    cdsDepositQueryDEPOSITNAME: TStringField;
    cdsDepositQueryDEPOSITCLAN: TStringField;
    cdsDepositQueryDEPLONGITUDE: TFloatField;
    cdsDepositQueryDEPLATITUDE: TFloatField;
    cdsDepositQueryAPPROXAGE: TFloatField;
    cdsDepositQueryAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepositQueryDATABASENAME: TStringField;
    cdsDepositQueryCOUNTPB: TIntegerField;
    cdsDepositQueryCOUNTSR: TIntegerField;
    cdsDepositQueryCOUNTND: TIntegerField;
    cdsDepositQueryCOUNTOS: TIntegerField;
    qDepositTypes: TSQLQuery;
    dspDepsoitTypes: TDataSetProvider;
    cdsDepositTypes: TClientDataSet;
    cdsDepositTypesDEPOSITTYPEID: TStringField;
    cdsDepositTypesDEPOSITTYPE: TStringField;
    dsDepositTypes: TDataSource;
    qDepProspect: TSQLQuery;
    dsQDepProspect: TDataSource;
    dspDepProspect: TDataSetProvider;
    cdsDepProspect: TClientDataSet;
    cdsDepProspectDEPOSITID: TIntegerField;
    cdsDepProspectDEPOSITNAME: TStringField;
    dsDepProspect: TDataSource;
    qDepositIAPPROXAGE: TFloatField;
    qDepositGEODYNAMICID: TIntegerField;
    qDepositDEPOSITPARENTID: TIntegerField;
    cdsDepositIAPPROXAGE: TFloatField;
    cdsDepositGEODYNAMICID: TIntegerField;
    cdsDepositDEPOSITPARENTID: TIntegerField;
    qDepositDATINGTYPEID: TIntegerField;
    cdsDepositDATINGTYPEID: TIntegerField;
    qDatingTypes: TSQLQuery;
    dspDatingTypes: TDataSetProvider;
    cdsDatingTypes: TClientDataSet;
    dsDatingTypes: TDataSource;
    cdsDatingTypesDATINGTYPEID: TIntegerField;
    cdsDatingTypesDATINGTYPE: TStringField;
    qGeodynamicSettings: TSQLQuery;
    dspGeodynamicSettings: TDataSetProvider;
    cdsGeodynamicSettings: TClientDataSet;
    dsGeodynamicSettings: TDataSource;
    cdsGeodynamicSettingsGEODYNAMICID: TIntegerField;
    cdsGeodynamicSettingsGEODYNAMICSETTING: TStringField;
    qDRep1: TSQLQuery;
    dsqDRep1: TDataSource;
    dspDRep1: TDataSetProvider;
    cdsDRep1: TClientDataSet;
    cdsDRep1SDBDEPOSITID: TIntegerField;
    cdsDRep1COUNTRYID: TStringField;
    cdsDRep1DEPOSITNAME: TStringField;
    cdsDRep1DEPOSITCLAN: TStringField;
    cdsDRep1DEPLONGITUDE: TFloatField;
    cdsDRep1DEPLATITUDE: TFloatField;
    cdsDRep1APPROXAGE: TFloatField;
    cdsDRep1APPROXAGEUNCERTAINTY: TFloatField;
    cdsDRep1DATABASENAME: TStringField;
    cdsDRep1qDRep2: TDataSetField;
    cdsDRep1DATINGTYPE: TStringField;
    cdsDRep1GEODYNAMICSETTING: TStringField;
    cdsDRep1DEPOSITPARENTID: TIntegerField;
    dsDRep1: TDataSource;
    qDRep2: TSQLQuery;
    dsqDRep2: TDataSource;
    cdsDRep2: TClientDataSet;
    cdsDRep2SDBDEPOSITID: TIntegerField;
    cdsDRep2COUNTRYID: TStringField;
    cdsDRep2DEPOSITNAME: TStringField;
    cdsDRep2DEPOSITCLAN: TStringField;
    cdsDRep2DEPLONGITUDE: TFloatField;
    cdsDRep2DEPLATITUDE: TFloatField;
    cdsDRep2APPROXAGE: TFloatField;
    cdsDRep2APPROXAGEUNCERTAINTY: TFloatField;
    cdsDRep2DATABASENAME: TStringField;
    cdsDRep2DATINGTYPE: TStringField;
    cdsDRep2GEODYNAMICSETTING: TStringField;
    cdsDRep2DEPOSITPARENTID: TIntegerField;
    dsDRep2: TDataSource;
    cdsDepositQueryDEPOSITPARENTID: TIntegerField;
    cdsDepositQueryDATINGTYPE: TStringField;
    cdsDepositQueryGEODYNAMICSETTING: TStringField;
    cdsDepositQueryCOUNTS: TIntegerField;
    cdsDepositQueryCOUNTSO4: TIntegerField;
    cdsDepositQueryCOUNTO: TIntegerField;
    SQLMonitor1: TSQLMonitor;
    cdsDRep1DEPOSITSTATUS: TStringField;
    cdsDRep2DEPOSITSTATUS: TStringField;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    function GetCurrent_Date: variant;
    function GetCurrentDate: variant;
  public
    procedure SubmitDepositQuery;
    procedure ConstructDepositQuery;
    procedure DepositQueryRecordCount;
  published
    property Current_Date: variant read GetCurrent_Date;
    property CurrentDate: variant read GetCurrentDate;
  end;

// Procs
  function dmStrat: TdmStrat;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  Variants, IWDep_constants, usrIW_dm;

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

function dmStrat: TdmStrat;
begin
  Result := TUserSession(WebApplication.Data).dmStrat;
end;


procedure TdmStrat.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

function TdmStrat.GetCurrent_Date: variant;
begin
  Result:=dmUser.GetUTCDateTime;
end;

function TdmStrat.GetCurrentDate: variant;
begin
  Result:= double(dmUser.GetUTCDateTime); //Dates should be passed as numbers, and the corresponding cell in excel have Date format.
end;

procedure TdmStrat.SubmitDepositQuery;
begin
  ConstructDepositQuery;
  dmUser.SetFormData2(dmStrat.DepositQuery.SQL.Text);
end;

procedure TdmStrat.ConstructDepositQuery;
var
  i : integer;
  tempStr : string;
  iCode : integer;
  FromDate, ToDate : double;
begin
  if (UserSession.IncludeClanValues and (UserSession.ClanValues.Count=0)) then
  begin
    UserSession.IncludeClanValues := false;
  end;
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count=0)) then
  begin
    UserSession.IncludeAreaValues := false;
  end;
  if (UserSession.IncludeDepositValues and (UserSession.DepositValues.Count=0)) then
  begin
    UserSession.IncludeDepositValues := false;
  end;
  if (UserSession.IncludeCommodityValues and (UserSession.CommodityValues.Count=0)) then
  begin
    UserSession.IncludeCommodityValues := false;
  end;
  dmStrat.DepositQuery.Close;
  dmStrat.DepositQuery.SQL.Clear;
  dmStrat.DepositQuery.SQL.Add('SELECT DISTINCT DEPOSITS.SDBDEPOSITID, DEPOSITS.DEPOSITCLANID,');
  dmStrat.DepositQuery.SQL.Add('  DEPOSITS.DEPOSITNAME,');
  dmStrat.DepositQuery.SQL.Add('  DEPOSITCLANS.DEPOSITCLAN, DEPOSITS.COUNTRYID,');
  dmStrat.DepositQuery.SQL.Add('  DEPOSITS.APPROXAGE, DEPOSITS.APPROXAGEUNCERTAINTY,');
  dmStrat.DepositQuery.SQL.Add('  DEPOSITS.DEPLATITUDE, DEPOSITS.DEPLONGITUDE,');
  dmStrat.DepositQuery.SQL.Add('  DATINGTYPES.DATINGTYPE, GEODYNAMICSETTINGS.GEODYNAMICSETTING,');
  dmStrat.DepositQuery.SQL.Add('  OTHERDATABASES.DATABASENAME, DEPOSITS.DEPOSITPARENTID,');
  dmStrat.DepositQuery.SQL.Add('  DEPOSITSTATI.DEPOSITSTATUS,');
  dmStrat.DepositQuery.SQL.Add('  DEPISOTOPECOUNT.COUNTPB,DEPISOTOPECOUNT.COUNTSR,DEPISOTOPECOUNT.COUNTND,DEPISOTOPECOUNT.COUNTOS,');
  dmStrat.DepositQuery.SQL.Add('  DEPISOTOPECOUNT.COUNTS,DEPISOTOPECOUNT.COUNTSO4,DEPISOTOPECOUNT.COUNTO');
  dmStrat.DepositQuery.SQL.Add('FROM DEPOSITS,DEPOSITCLANS,OTHERDATABASES,DEPISOTOPECOUNT,COUNTRIES,DATINGTYPES,');
  dmStrat.DepositQuery.SQL.Add('  GEODYNAMICSETTINGS,DEPOSITFOR,USERSWHOFOR,DEPOSITSTATI');
  if (UserSession.IncludeCommodityValues) then
  begin
    dmStrat.DepositQuery.SQL.Add(' ,DEPOSITCOMMODITIES');
  end;
  dmStrat.DepositQuery.SQL.Add('WHERE USERSWHOFOR.USERID = :UserID ');
  dmStrat.DepositQuery.SQL.Add('AND USERSWHOFOR.WHOFORID=DEPOSITFOR.WHOFORID ');
  dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.SDBDEPOSITID=DEPOSITFOR.SDBDEPOSITID ');
  dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID ');
  dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID ');
  dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.COUNTRYID=COUNTRIES.COUNTRYID ');
  dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.DATINGTYPEID=DATINGTYPES.DATINGTYPEID ');
  dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.GEODYNAMICID=GEODYNAMICSETTINGS.GEODYNAMICID ');
  dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.DEPOSITSTATUSID=DEPOSITSTATI.DEPOSITSTATUSID ');
  dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.SDBDEPOSITID=DEPISOTOPECOUNT.SDBDEPOSITID ');
  dmStrat.DepositQuery.SQL.Add('AND (DEPISOTOPECOUNT.COUNTPB > 0 ');
  dmStrat.DepositQuery.SQL.Add('  OR DEPISOTOPECOUNT.COUNTSR > 0 ');
  dmStrat.DepositQuery.SQL.Add('  OR DEPISOTOPECOUNT.COUNTND > 0 ');
  dmStrat.DepositQuery.SQL.Add('  OR DEPISOTOPECOUNT.COUNTOS > 0 ');
  dmStrat.DepositQuery.SQL.Add('  OR DEPISOTOPECOUNT.COUNTS > 0 ');
  dmStrat.DepositQuery.SQL.Add('  OR DEPISOTOPECOUNT.COUNTSO4 > 0 ');
  dmStrat.DepositQuery.SQL.Add('  OR DEPISOTOPECOUNT.COUNTO > 0)');
  if (not UserSession.IncludeAllParentIDs) then
  begin
    dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.DEPOSITPARENTID = 0');
  end;
  if UserSession.IncludeDateFromValue then
  begin
    Val(UserSession.DateFromField,FromDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end else
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',0.0);
    end;
  end;
  if UserSession.IncludeDateToValue then
  begin
    Val(UserSession.DateToField,ToDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end else
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',4500.0);
    end;
  end;
  if UserSession.IncludeDateFromValue then
  begin
    tempStr := 'AND ';
    dmStrat.DepositQuery.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE >= '+UserSession.DateFromField;
    dmStrat.DepositQuery.SQL.Add(tempStr);
  end;
  if UserSession.IncludeDateToValue then
  begin
    tempStr := 'AND ';
    dmStrat.DepositQuery.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE <= '+ UserSession.DateToField;
    dmStrat.DepositQuery.SQL.Add(tempStr);
  end;
  {Continents}
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.DepositQuery.SQL.Add('AND ( COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.DepositQuery.SQL.Add('OR COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.DepositQuery.SQL.Add(' ) ');
  end;
  {Clans}
  if (UserSession.IncludeClanValues) then
  begin
    dmStrat.DepositQuery.SQL.Add('AND ( DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[0]+'''');
    if (UserSession.ClanValues.Count >1) then
    begin
      for i := 2 to UserSession.ClanValues.Count do
      begin
        dmStrat.DepositQuery.SQL.Add('OR DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.DepositQuery.SQL.Add(' ) ');
  end;
  {Countries}
  if (UserSession.IncludeAreaValues) then
  begin
    dmStrat.DepositQuery.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmStrat.DepositQuery.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.DepositQuery.SQL.Add(' ) ');
  end;
  {Deposits}
  if (UserSession.IncludeDepositValues) then
  begin
    dmStrat.DepositQuery.SQL.Add('AND ( DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[0]+'''');
    if (UserSession.DepositValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositValues.Count do
      begin
        dmStrat.DepositQuery.SQL.Add('OR DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.DepositQuery.SQL.Add(' ) ');
  end;
  {Commodities}
  if (UserSession.IncludeCommodityValues) then
  begin
    dmStrat.DepositQuery.SQL.Add('AND DEPOSITS.SDBDEPOSITID = DEPOSITCOMMODITIES.SBDEPOSITID ');
    dmStrat.DepositQuery.SQL.Add('AND ( DEPOSITCOMMODITIES.COMMODITYID = '+''''+UserSession.CommodityValues.Strings[0]+'''');
    if (UserSession.CommodityValues.Count >1) then
    begin
      for i := 2 to UserSession.CommodityValues.Count do
      begin
        dmStrat.DepositQuery.SQL.Add('OR DEPOSITCOMMODITIES.COMMODITYID = '+''''+UserSession.CommodityValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.DepositQuery.SQL.Add(' ) ');
  end;
  if (UserSession.OrderByValue = '0') then
  begin
    dmStrat.DepositQuery.SQL.Add('ORDER by DEPOSITS.DEPOSITNAME');
  end;
  if (UserSession.OrderByValue = '1') then
  begin
    dmStrat.DepositQuery.SQL.Add('ORDER by DEPOSITS.COUNTRYID,DEPOSITS.DEPOSITNAME');
  end;
  if (UserSession.OrderByValue = '2') then
  begin
    dmStrat.DepositQuery.SQL.Add('ORDER by DEPOSITS.DEPOSITCLANID,DEPOSITS.COUNTRYID,DEPOSITS.DEPOSITNAME');
  end;
  if (UserSession.OrderByValue = '3') then
  begin
    if (UserSession.IncludeCommodityValues) then
    begin
      dmStrat.DepositQuery.SQL.Add('ORDER by DEPOSITCOMMODITIES.COMMODITYID');
    end;
  end;
  //dmUser.SetDeveloperData(dmStrat.DepositQuery.SQL.Text);
  dmStrat.cdsDepositQuery.Close;
end;

procedure TdmStrat.DepositQueryRecordCount;
var
  nRec : integer;
  i : integer;
begin
    UserSession.NumRecordsFound := 0;
    with dmStrat do
    begin
      DepositQueryRec.Close;
      cdsDepositQueryRec.Close;
      DepositQueryRec.SQL.Text := dmStrat.DepositQuery.SQL.Text;
      DepositQueryRec.ParamByName('UserID').AsString := UserSession.UserID;
      cdsDepositQueryRec.Open;
    end;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStrat.cdsDepositQueryRec.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStrat.cdsDepositQueryRec.Delete;
        end;
      end;
    end;
  try
    UserSession.NumRecordsFound := dmStrat.cdsDepositQueryRec.RecordCount;
  finally
    dmStrat.cdsDepositQueryRec.Close;
  end;
end;


end.
