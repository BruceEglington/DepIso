unit IWDep_dmDV;

interface

uses
  {$IFDEF Linux}QForms, {$ELSE}Forms, {$ENDIF}
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox, WideStrings, UCustomFlexCelReport, UFlexCelReport,
  UExcelAdapter, XLSAdapter;

type
  TdmDV = class(TDataModule)
    QueryDV: TSQLQuery;
    dspQueryDV: TDataSetProvider;
    cdsQueryDV: TClientDataSet;
    dsQueryDV: TDataSource;
    SQLMonitor1: TSQLMonitor;
    cdsQueryDVCOUNTRYABR: TStringField;
    cdsQueryDVUNITNAME: TStringField;
    cdsQueryDVMATERIALABR: TStringField;
    cdsQueryDVISOTOPESYSTEM: TStringField;
    cdsQueryDVAPPROACHABR: TStringField;
    cdsQueryDVINTERPABR: TStringField;
    cdsQueryDVIAGE: TIntegerField;
    cdsQueryDVIAGEPERROR: TIntegerField;
    cdsQueryDVIAGEMERROR: TIntegerField;
    cdsQueryDVAGEUNITS: TStringField;
    cdsQueryDVLITHOLOGY: TStringField;
    cdsQueryDVRECORDID: TIntegerField;
    cdsQueryDVCOUNTRY: TStringField;
    cdsQueryDVMATERIALDESCRIPTION: TStringField;
    cdsQueryDVINTERPRETATION: TStringField;
    cdsQueryDVAPPROACHDESCRIPTION: TStringField;
    cdsQueryDVISOSYSTEMNAME: TStringField;
    cdsQueryDVRAGE: TFloatField;
    cdsQueryDVRAGEPERROR: TFloatField;
    cdsQueryDVRAGEMERROR: TFloatField;
    cdsQueryDVWHOFORID: TStringField;
    cdsQueryDVTECHABR: TStringField;
    cdsQueryDVTECHNIQUE: TStringField;
    qDVUser: TSQLQuery;
    dspDVUser: TDataSetProvider;
    cdsDVUser: TClientDataSet;
    dsDVUser: TDataSource;
    cdsDVUserUSERNAMEID: TStringField;
    cdsDVUserNUMCONTRIBUTED: TIntegerField;
    XLSAdapter1: TXLSAdapter;
    sqlcDateView: TSQLConnection;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
  public
    procedure DefineDVQuery(tmpLIPID : integer);
  end;

// Procs
  function dmDV: TdmDV;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  Variants;

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

function dmDV: TdmDV;
begin
  Result := TUserSession(WebApplication.Data).dmDV;
end;


procedure TdmDV.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

procedure TdmDV.DefineDVQuery(tmpLIPID : integer);
begin
  try
    dmDV.QueryDV.SQL.Clear;
    dmDV.QueryDV.SQL.Add('SELECT DISTINCT SUITE.GISID, ISORGR30.COUNTRYABR, ISORGR30.UNITNAME,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.TECHABR,TECHNIQUE.TECHNIQUE,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.INTERPABR,ISORGR30.IAGE,ISORGR30.IAGEPERROR,ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.LITHOLOGY,ISORGR30.RECORDID,COUNTRY.COUNTRY,MATERIAL.MATERIALDESCRIPTION,');
    dmDV.QueryDV.SQL.Add('  INTERPRETATION.INTERPRETATION,APPROACH.APPROACHDESCRIPTION,ISOSYSTEM.ISOSYSTEMNAME,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOFOR.WHOFORID');
    dmDV.QueryDV.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,ISOSYSTEM,ISOFOR,TECHNIQUE, ');
    dmDV.QueryDV.SQL.Add('  SUITE,SUITECOUNTRY,ISOLIP,USERSWHOFOR');
    dmDV.QueryDV.SQL.Add('WHERE  ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.TECHABR = TECHNIQUE.TECHABR');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM');
    dmDV.QueryDV.SQL.Add('AND ISORGR30.PREFLEVEL >= 1');
    dmDV.QueryDV.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
    dmDV.QueryDV.SQL.Add('AND ISOLIP.RECORDID=ISORGR30.RECORDID');
    dmDV.QueryDV.SQL.Add('AND USERSWHOFOR.USERNAMEID=:UserID');
    dmDV.QueryDV.SQL.Add('AND USERSWHOFOR.WHOFORID=ISOFOR.WHOFORID');
    dmDV.QueryDV.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
    dmDV.QueryDV.SQL.Add('AND SUITE.UNITNAME=SUITECOUNTRY.UNITNAME');
    dmDV.QueryDV.SQL.Add('AND SUITECOUNTRY.UNITNAME=ISORGR30.UNITNAME');
    dmDV.QueryDV.SQL.Add('AND SUITECOUNTRY.COUNTRYABR=ISORGR30.COUNTRYABR');
    dmDV.QueryDV.SQL.Add('AND ISOLIP.LIPID= :LIPID');
    dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPIGNEOUS=1');
    dmDV.QueryDV.SQL.Add('ORDER BY ISORGR30.IAGE,ISORGR30.UNITNAME,ISORGR30.MATERIALABR,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,');
    dmDV.QueryDV.SQL.Add('  ISORGR30.PREFLEVEL');
  except
  end;
end;

end.


