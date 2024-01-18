unit IWDep_dmD;

interface

uses
  {$IFDEF Linux}QForms, {$ELSE}Forms, {$ENDIF}
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox, UCustomFlexCelReport, UFlexCelReport, UFlxMemTable,
  UExcelAdapter, XLSAdapter, WideStrings;

type
  TdmDepD = class(TDataModule)
    SQLMonitor1: TSQLMonitor;
    qDeposits: TSQLQuery;
    dspDeposits: TDataSetProvider;
    cdsDeposits: TClientDataSet;
    dsDeposits: TDataSource;
    XLSAdapter1: TXLSAdapter;
    FlexCelReport1: TFlexCelReport;
    FlexCelReportDetails1: TFlexCelReport;
    qDeposit: TSQLQuery;
    dspDeposit: TDataSetProvider;
    cdsDeposit: TClientDataSet;
    dsDeposit: TDataSource;
    dsqDeposit: TDataSource;
    qDepositDomains: TSQLQuery;
    cdsDepositDomain: TClientDataSet;
    dsDepositDomain: TDataSource;
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
    FlexCelReportDeposits: TFlexCelReport;
    qDRep1: TSQLQuery;
    dsqDRep1: TDataSource;
    dspDRep1: TDataSetProvider;
    cdsDRep1: TClientDataSet;
    dsDRep1: TDataSource;
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
    qDepositCommodities: TSQLQuery;
    cdsDepositCommodities: TClientDataSet;
    dsDepositCommodities: TDataSource;
    qDepositCommoditiesSBDEPOSITID: TIntegerField;
    qDepositCommoditiesCOMMODITYORDER: TIntegerField;
    qDepositCommoditiesCOMMODITYID: TStringField;
    qDepositCommoditiesCOMMODITY: TStringField;
    qDepositDomainsSBDEPOSITID: TIntegerField;
    qDepositDomainsDOMAINID: TIntegerField;
    qDepositDomainsDOMAINNAME: TStringField;
    qDepositDomainsCONTINENTID: TStringField;
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
    cdsDepositqDepositCommodities: TDataSetField;
    cdsDepositqDepositDomains: TDataSetField;
    cdsDepositCommoditiesSBDEPOSITID: TIntegerField;
    cdsDepositCommoditiesCOMMODITYORDER: TIntegerField;
    cdsDepositCommoditiesCOMMODITYID: TStringField;
    cdsDepositCommoditiesCOMMODITY: TStringField;
    cdsDepositDomainSBDEPOSITID: TIntegerField;
    cdsDepositDomainDOMAINID: TIntegerField;
    cdsDepositDomainDOMAINNAME: TStringField;
    cdsDepositDomainCONTINENTID: TStringField;
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
    cdsDepositQuerySDBDEPOSITID: TIntegerField;
    cdsDepositQueryCOUNTRYID: TStringField;
    cdsDepositQueryDEPOSITNAME: TStringField;
    cdsDepositQueryDEPOSITCLAN: TStringField;
    cdsDepositQueryDEPLONGITUDE: TFloatField;
    cdsDepositQueryDEPLATITUDE: TFloatField;
    cdsDepositQueryAPPROXAGE: TFloatField;
    cdsDepositQueryAPPROXAGEUNCERTAINTY: TFloatField;
    cdsDepositQueryDATABASENAME: TStringField;
    cdsDRep1SDBDEPOSITID: TIntegerField;
    cdsDRep1COUNTRYID: TStringField;
    cdsDRep1DEPOSITNAME: TStringField;
    cdsDRep1DEPOSITCLAN: TStringField;
    cdsDRep1DEPLONGITUDE: TFloatField;
    cdsDRep1DEPLATITUDE: TFloatField;
    cdsDRep1APPROXAGE: TFloatField;
    cdsDRep1APPROXAGEUNCERTAINTY: TFloatField;
    cdsDRep1DATABASENAME: TStringField;
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
    qHostUnitAge: TSQLQuery;
    dsHostUnitAge: TDataSource;
    cdsHostUnitAge: TClientDataSet;
    cdsDepositqHostUnitAge: TDataSetField;
    qHostUnitAgeMINAGE: TFloatField;
    qHostUnitAgeMAXAGE: TFloatField;
    cdsHostUnitAgeMINAGE: TFloatField;
    cdsHostUnitAgeMAXAGE: TFloatField;
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
    sqlcDep: TSQLConnection;
    qDepositFor: TSQLQuery;
    cdsDepositFor: TClientDataSet;
    dsDepositFor: TDataSource;
    cdsDepositqDepositFor: TDataSetField;
    cdsDepositForSDBDEPOSITID: TIntegerField;
    cdsDepositForWHOFORID: TStringField;
    cdsDepositForINC4CHTYN: TStringField;
    cdsDepositForWHOFOR: TStringField;
    qDepositForSDBDEPOSITID: TIntegerField;
    qDepositForWHOFORID: TStringField;
    qDepositForINC4CHTYN: TStringField;
    qDepositForWHOFOR: TStringField;
    qDepositCommoditiesCOMMODITYGRADE: TFloatField;
    qDepositCommoditiesGRADEUNITID: TStringField;
    qDepositCommoditiesGRADEUNIT: TStringField;
    cdsDepositCommoditiesCOMMODITYGRADE: TFloatField;
    cdsDepositCommoditiesGRADEUNITID: TStringField;
    cdsDepositCommoditiesGRADEUNIT: TStringField;
    qGradeUnits: TSQLQuery;
    dspGradeUnits: TDataSetProvider;
    cdsGradeUnits: TClientDataSet;
    dsGradeUnits: TDataSource;
    cdsGradeUnitsGRADEID: TStringField;
    cdsGradeUnitsGRADEUNIT: TStringField;
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
  function dmDepD: TdmDepD;

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

function dmDepD: TdmDepD;
begin
  Result := TUserSession(WebApplication.Data).dmDepD;
end;


procedure TdmDepD.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

function TdmDepD.GetCurrent_Date: variant;
begin
  Result:=now;
end;

function TdmDepD.GetCurrentDate: variant;
begin
  Result:= double(Now); //Dates should be passed as numbers, and the corresponding cell in excel have Date format.
end;

procedure TdmDepD.SubmitDepositQuery;
begin
  ConstructDepositQuery;
  //UserSession.SQLMemoField.Text := dmDepD.DepositQuery.SQL.Text;
  dmUser.SetFormData2(dmDepD.DepositQuery.SQL.Text);
end;

procedure TdmDepD.ConstructDepositQuery;
var
  i : integer;
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
  dmDepD.DepositQuery.Close;
  dmDepD.DepositQuery.SQL.Clear;
  dmDepD.DepositQuery.SQL.Add('SELECT DEPOSITS.SDBDEPOSITID, DEPOSITS.DEPOSITCLANID,');
  dmDepD.DepositQuery.SQL.Add('  DEPOSITS.DEPOSITNAME,');
  dmDepD.DepositQuery.SQL.Add('  DEPOSITCLANS.DEPOSITCLAN, DEPOSITS.COUNTRYID,');
  dmDepD.DepositQuery.SQL.Add('  DEPOSITS.APPROXAGE, DEPOSITS.APPROXAGEUNCERTAINTY,');
  dmDepD.DepositQuery.SQL.Add('  DEPOSITS.DEPLATITUDE, DEPOSITS.DEPLONGITUDE,');
  dmDepD.DepositQuery.SQL.Add('  OTHERDATABASES.DATABASENAME');
  dmDepD.DepositQuery.SQL.Add('FROM DEPOSITS, DEPOSITCLANS, OTHERDATABASES');
  if (UserSession.IncludeCommodityValues) then
  begin
    dmDepD.DepositQuery.SQL.Add(' ,DEPOSITCOMMODITIES');
  end;
  dmDepD.DepositQuery.SQL.Add('WHERE DEPOSITS.DEPOSITCLANID=DEPOSITCLANS.DEPOSITCLANID ');
  dmDepD.DepositQuery.SQL.Add('AND DEPOSITS.DATABASEID=OTHERDATABASES.DATBASEID ');
  {Clans}
  if (UserSession.IncludeClanValues) then
  begin
    dmDepD.DepositQuery.SQL.Add('AND ( DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[0]+'''');
    if (UserSession.ClanValues.Count >1) then
    begin
      for i := 2 to UserSession.ClanValues.Count do
      begin
        dmDepD.DepositQuery.SQL.Add('OR DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[i-1]+'''');
      end;
    end;
    dmDepD.DepositQuery.SQL.Add(' ) ');
  end;
  {Countries}
  if (UserSession.IncludeAreaValues) then
  begin
    dmDepD.DepositQuery.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDepD.DepositQuery.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDepD.DepositQuery.SQL.Add(' ) ');
  end;
  {Deposits}
  if (UserSession.IncludeDepositValues) then
  begin
    dmDepD.DepositQuery.SQL.Add('AND ( DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[0]+'''');
    if (UserSession.DepositValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositValues.Count do
      begin
        dmDepD.DepositQuery.SQL.Add('OR DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[i-1]+'''');
      end;
    end;
    dmDepD.DepositQuery.SQL.Add(' ) ');
  end;
  {Commodities}
  if (UserSession.IncludeCommodityValues) then
  begin
    dmDepD.DepositQuery.SQL.Add('AND DEPOSITS.SDBDEPOSITID = DEPOSITCOMMODITIES.SBDEPOSITID ');
    dmDepD.DepositQuery.SQL.Add('AND ( DEPOSITCOMMODITIES.COMMODITYID = '+''''+UserSession.CommodityValues.Strings[0]+'''');
    if (UserSession.CommodityValues.Count >1) then
    begin
      for i := 2 to UserSession.CommodityValues.Count do
      begin
        dmDepD.DepositQuery.SQL.Add('OR DEPOSITCOMMODITIES.COMMODITYID = '+''''+UserSession.CommodityValues.Strings[i-1]+'''');
      end;
    end;
    dmDepD.DepositQuery.SQL.Add(' ) ');
  end;
  if (UserSession.OrderByValue = '0') then
  begin
    dmDepD.DepositQuery.SQL.Add('ORDER by DEPOSITS.DEPOSITNAME');
  end;
  if (UserSession.OrderByValue = '1') then
  begin
    dmDepD.DepositQuery.SQL.Add('ORDER by DEPOSITS.COUNTRYID,DEPOSITS.DEPOSITNAME');
  end;
  if (UserSession.OrderByValue = '2') then
  begin
    dmDepD.DepositQuery.SQL.Add('ORDER by DEPOSITS.DEPOSITCLANID');
  end;
  if (UserSession.OrderByValue = '3') then
  begin
    if (UserSession.IncludeCommodityValues) then
    begin
      dmDepD.DepositQuery.SQL.Add('ORDER by DEPOSITCOMMODITIES.COMMODITYID');
    end;
  end;
  {
  if UserSession.IsDeveloper then
  begin
    dmUser.cdsDevInfo.Open;
    dmUser.cdsDevInfo.Insert;
    dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
    dmUser.cdsDevInfoQUERYCHECK.AsString := dmDepD.DepositQuery.SQL.Text;
    try
      dmUser.cdsDevInfo.Post;
      dmUser.cdsDevInfo.ApplyUpdates(0);
    except
    end;
    dmUser.cdsDevInfo.Close;
  end;
  }
  dmDepD.cdsDepositQuery.Close;
end;

procedure TdmDepD.DepositQueryRecordCount;
var
  nRec : integer;
  i : integer;
begin
    UserSession.NumRecordsFound := 0;
    with dmDepD do
    begin
      DepositQueryRec.Close;
      cdsDepositQueryRec.Close;
      DepositQueryRec.SQL.Text := dmDepD.DepositQuery.SQL.Text;
      cdsDepositQueryRec.Open;
    end;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmDepD.cdsDepositQueryRec.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmDepD.cdsDepositQueryRec.Delete;
        end;
      end;
    end;
  try
    UserSession.NumRecordsFound := dmDepD.cdsDepositQueryRec.RecordCount;
  finally
    dmDepD.cdsDepositQueryRec.Close;
  end;
end;


end.
