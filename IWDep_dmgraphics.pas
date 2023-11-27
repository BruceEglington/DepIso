unit IWDep_dmgraphics;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox, WideStrings,
  DBXCommon, DBXDevartInterBase;

type
  TdmgDV = class(TDataModule)
    sqlcDateView: TSQLConnection;
    Querydm: TSQLQuery;
    dspQuery2: TDataSetProvider;
    cdsQuerydm: TClientDataSet;
    dsQuerydm: TDataSource;
    dsTempDataMap: TDataSource;
    dsTempDataDI: TDataSource;
    dsTempDataI: TDataSource;
    dsTempDataDT: TDataSource;
    dsTempDataDG: TDataSource;
    dsQdmGrouping: TDataSource;
    dsQdmSmp: TDataSource;
    dsQdmInit: TDataSource;
    cdsTempDataMap: TClientDataSet;
    cdsTempDataDI: TClientDataSet;
    cdsTempDataDIInterpretation: TStringField;
    cdsTempDataDIAge: TFloatField;
    cdsTempDataDISuitName: TStringField;
    cdsTempDataDIInterpAbr: TStringField;
    cdsTempDataDIGrouping: TStringField;
    cdsTempDataDIColumnNo: TSmallintField;
    cdsTempDataDIAgeErrorAv: TFloatField;
    cdsTempDataDIAgePlusError: TFloatField;
    cdsTempDataDIAgeMinusError: TFloatField;
    cdsTempDataDT: TClientDataSet;
    cdsTempDataDG: TClientDataSet;
    cdsTempDataDTGrouping: TStringField;
    cdsTempDataDTSuitName: TStringField;
    cdsTempDataDTColumnNo: TSmallintField;
    cdsTempDataDTAge: TFloatField;
    cdsTempDataDTAgePlusError: TFloatField;
    cdsTempDataDTAgeMinusError: TFloatField;
    cdsTempDataDTIsoSystem: TStringField;
    cdsTempDataDTMaterialAbr: TStringField;
    cdsTempDataDTApproachAbr: TStringField;
    cdsTempDataDTBlockingT: TFloatField;
    cdsTempDataDTBlockingTUncertainty: TFloatField;
    cdsTempDataDGGrouping: TStringField;
    cdsTempDataDGAge: TFloatField;
    cdsTempDataDGSuitName: TStringField;
    cdsTempDataDGInterpAbr: TStringField;
    cdsTempDataDGInterpretation: TStringField;
    cdsTempDataDGColumnNo: TSmallintField;
    cdsTempDataDGAgeErrorAv: TFloatField;
    cdsTempDataDGAgePlusError: TFloatField;
    cdsTempDataDGAgeMinusError: TFloatField;
    QuerydmCOUNTRYABR: TStringField;
    QuerydmUNITNAME: TStringField;
    QuerydmMATERIALABR: TStringField;
    QuerydmISOTOPESYSTEM: TStringField;
    QuerydmAPPROACHABR: TStringField;
    QuerydmTECHABR: TStringField;
    QuerydmINTERPABR: TStringField;
    QuerydmPREFLEVEL: TSmallintField;
    QuerydmIAGE: TIntegerField;
    QuerydmIAGEPERROR: TIntegerField;
    QuerydmIAGEMERROR: TIntegerField;
    QuerydmAGEUNITS: TStringField;
    QuerydmLITHOLOGY: TStringField;
    QuerydmMETHODABR: TStringField;
    QuerydmRECORDID: TIntegerField;
    QuerydmCONFIDENTIAL: TIntegerField;
    QuerydmRAGE: TFloatField;
    QuerydmRAGEPERROR: TFloatField;
    QuerydmRAGEMERROR: TFloatField;
    cdsQuerydmCOUNTRYABR: TStringField;
    cdsQuerydmUNITNAME: TStringField;
    cdsQuerydmMATERIALABR: TStringField;
    cdsQuerydmISOTOPESYSTEM: TStringField;
    cdsQuerydmAPPROACHABR: TStringField;
    cdsQuerydmTECHABR: TStringField;
    cdsQuerydmINTERPABR: TStringField;
    cdsQuerydmPREFLEVEL: TSmallintField;
    cdsQuerydmIAGE: TIntegerField;
    cdsQuerydmIAGEPERROR: TIntegerField;
    cdsQuerydmIAGEMERROR: TIntegerField;
    cdsQuerydmAGEUNITS: TStringField;
    cdsQuerydmLITHOLOGY: TStringField;
    cdsQuerydmMETHODABR: TStringField;
    cdsQuerydmRECORDID: TIntegerField;
    cdsQuerydmCONFIDENTIAL: TIntegerField;
    cdsQuerydmRAGE: TFloatField;
    cdsQuerydmRAGEPERROR: TFloatField;
    cdsQuerydmRAGEMERROR: TFloatField;
    QdmGrouping: TSQLQuery;
    QdmSmp: TSQLQuery;
    QdmInit: TSQLQuery;
    dsQuerydmDB: TDataSource;
    QdmGroupingRECORDID: TIntegerField;
    QdmGroupingGROUPING: TStringField;
    QdmSmpRECORDID: TIntegerField;
    QdmSmpISOSYSTEM: TStringField;
    QdmSmpSAMPLENO: TStringField;
    QdmSmpFRAC: TStringField;
    QdmSmpINCLUDED: TStringField;
    QdmSmpCONTINENTID: TStringField;
    QdmSmpCOUNTRYABR: TStringField;
    QdmSmpLATITUDE: TFloatField;
    QdmSmpLONGITUDE: TFloatField;
    QdmSmpELEVATION: TFloatField;
    QdmInitRECORDID: TIntegerField;
    QdmInitINITRATIO: TFloatField;
    QdmInitINITRATIOERROR: TFloatField;
    QdmInitEPSILON: TFloatField;
    QdmInitEPSILONERROR: TFloatField;
    QdmInitMU: TFloatField;
    QdmInitMUPERROR: TFloatField;
    QdmInitMUMERROR: TFloatField;
    QdmInitINITIALRATIO3D: TFloatField;
    QdmInitINITIALRATIO3DERROR: TFloatField;
    cdsQdmGrouping: TClientDataSet;
    cdsQdmSmp: TClientDataSet;
    cdsQdmInit: TClientDataSet;
    cdsQuerydmQdmGrouping: TDataSetField;
    cdsQuerydmQdmSmp: TDataSetField;
    cdsQuerydmQdmInit: TDataSetField;
    cdsQdmGroupingRECORDID: TIntegerField;
    cdsQdmGroupingGROUPING: TStringField;
    cdsQdmSmpRECORDID: TIntegerField;
    cdsQdmSmpISOSYSTEM: TStringField;
    cdsQdmSmpSAMPLENO: TStringField;
    cdsQdmSmpFRAC: TStringField;
    cdsQdmSmpINCLUDED: TStringField;
    cdsQdmSmpCONTINENTID: TStringField;
    cdsQdmSmpCOUNTRYABR: TStringField;
    cdsQdmSmpLATITUDE: TFloatField;
    cdsQdmSmpLONGITUDE: TFloatField;
    cdsQdmSmpELEVATION: TFloatField;
    cdsQdmInitRECORDID: TIntegerField;
    cdsQdmInitINITRATIO: TFloatField;
    cdsQdmInitINITRATIOERROR: TFloatField;
    cdsQdmInitEPSILON: TFloatField;
    cdsQdmInitEPSILONERROR: TFloatField;
    cdsQdmInitMU: TFloatField;
    cdsQdmInitMUPERROR: TFloatField;
    cdsQdmInitMUMERROR: TFloatField;
    cdsQdmInitINITIALRATIO3D: TFloatField;
    cdsQdmInitINITIALRATIO3DERROR: TFloatField;
    cdsTempDataI: TClientDataSet;
    cdsTempDataIInterpretation: TStringField;
    cdsTempDataIPlotNo: TSmallintField;
    cdsTempDataIColumnNo: TSmallintField;
    cdsTempDataIVariableX: TFloatField;
    cdsTempDataIVariableY: TFloatField;
    cdsTempDataIGrouping: TStringField;
    qVariables: TSQLQuery;
    dspVariables: TDataSetProvider;
    cdsVariables: TClientDataSet;
    dsVariables: TDataSource;
    cdsTable1: TClientDataSet;
    cdsTempDataProb: TClientDataSet;
    dsTempDataProb: TDataSource;
    cdsTempDataProbAge: TFloatField;
    cdsTempDataProbCurveValue: TFloatField;
    cdsTempDataProbCurveNumber: TIntegerField;
    cdsTempDataProbCurveTitle: TStringField;
    Querydm2: TSQLQuery;
    dspQuerydm2: TDataSetProvider;
    cdsQuerydm2: TClientDataSet;
    dsQuerydm2: TDataSource;
    cdsQuerydm2RAGE: TFloatField;
    cdsQuerydm2UNITNAME: TStringField;
    cdsQuerydm2INTERPABR: TStringField;
    cdsQuerydm2OPTIONID: TIntegerField;
    cdsQuerydm2RAGEPERROR: TFloatField;
    cdsQuerydm2RAGEMERROR: TFloatField;
    cdsQuerydm2OPTIONTITLE: TStringField;
    cdsQuerydm2OPTIONTITLE_1: TStringField;
    qGroupingLink: TSQLQuery;
    dspGroupingLink: TDataSetProvider;
    cdsGroupingLink: TClientDataSet;
    dsGroupingLink: TDataSource;
    cdsGroupingLinkGROUPINGNUMBER: TIntegerField;
    cdsGroupingLinkGROUPINGLINK: TStringField;
    cdsGroupingLinkUSERID: TStringField;
    QuerydmDI: TSQLQuery;
    dspQuerydmDI: TDataSetProvider;
    cdsQuerydmDI: TClientDataSet;
    dsQuerydmDI: TDataSource;
    QuerydmDG: TSQLQuery;
    dspQuerydmDG: TDataSetProvider;
    cdsQuerydmDG: TClientDataSet;
    dsQuerydmDG: TDataSource;
    cdsQuerydmDGGROUPINGLINK: TStringField;
    cdsQuerydmDGRAGE: TFloatField;
    cdsQuerydmDGUNITNAME: TStringField;
    cdsQuerydmDGINTERPABR: TStringField;
    cdsQuerydmDGGROUPINGNUMBER: TIntegerField;
    cdsQuerydmDGRAGEPERROR: TFloatField;
    cdsQuerydmDGRAGEMERROR: TFloatField;
    QuerydmI: TSQLQuery;
    dspQuerydmI: TDataSetProvider;
    cdsQuerydmI: TClientDataSet;
    dsQuerydmI: TDataSource;
    QuerydmDT: TSQLQuery;
    dspQuerydmDT: TDataSetProvider;
    cdsQuerydmDT: TClientDataSet;
    dsQuerydmDT: TDataSource;
    cdsQuerydmDTGROUPINGLINK: TStringField;
    cdsQuerydmDTUNITNAME: TStringField;
    cdsQuerydmDTGROUPINGNUMBER: TIntegerField;
    cdsQuerydmDTRAGE: TFloatField;
    cdsQuerydmDTRAGEPERROR: TFloatField;
    cdsQuerydmDTRAGEMERROR: TFloatField;
    cdsQuerydmDTISOTOPESYSTEM: TStringField;
    cdsQuerydmDTMATERIALABR: TStringField;
    cdsQuerydmDTAPPROACHABR: TStringField;
    cdsQuerydmDTINTERPABR: TStringField;
    cdsQuerydmDTBLOCKINGT: TFloatField;
    cdsQuerydmDTBLOCKINGTUNCERTAINTY: TFloatField;
    QuerydmMI: TSQLQuery;
    dspQuerydmMI: TDataSetProvider;
    cdsQuerydmMI: TClientDataSet;
    dsQuerydmMI: TDataSource;
    cdsQuerydmMIOPTIONID: TIntegerField;
    cdsQuerydmMISAMPLENO: TStringField;
    cdsQuerydmMILATITUDE: TFloatField;
    cdsQuerydmMILONGITUDE: TFloatField;
    cdsQuerydmMIINTERPABR: TStringField;
    cdsQuerydmMIOPTIONTITLE: TStringField;
    cdsQuerydmMIRAGE: TFloatField;
    cdsQuerydmIRAGE: TFloatField;
    cdsQuerydmIUNITNAME: TStringField;
    cdsQuerydmIINTERPABR: TStringField;
    cdsQuerydmIOPTIONID: TIntegerField;
    cdsQuerydmIRAGEPERROR: TFloatField;
    cdsQuerydmIRAGEMERROR: TFloatField;
    cdsQuerydmIINITRATIO: TFloatField;
    cdsQuerydmIEPSILON: TFloatField;
    cdsQuerydmIMU: TFloatField;
    cdsQuerydmIINITIALRATIO3D: TFloatField;
    cdsQuerydmDIOPTIONTITLE: TStringField;
    cdsQuerydmDIRAGE: TFloatField;
    cdsQuerydmDIUNITNAME: TStringField;
    cdsQuerydmDIINTERPABR: TStringField;
    cdsQuerydmDIOPTIONID: TIntegerField;
    cdsQuerydmDIRAGEPERROR: TFloatField;
    cdsQuerydmDIRAGEMERROR: TFloatField;
    cdsQuerydmIOPTIONTITLE: TStringField;
    cdsVariablesVARIABLEABR: TStringField;
    cdsVariablesVARIABLENAME: TStringField;
    QuerydmIG: TSQLQuery;
    dspQuerydmIG: TDataSetProvider;
    cdsQuerydmIG: TClientDataSet;
    dsQuerydmIG: TDataSource;
    cdsQuerydmIGGROUPINGLINK: TStringField;
    cdsQuerydmIGRAGE: TFloatField;
    cdsQuerydmIGUNITNAME: TStringField;
    cdsQuerydmIGINTERPABR: TStringField;
    cdsQuerydmIGGROUPINGNUMBER: TIntegerField;
    cdsQuerydmIGRAGEPERROR: TFloatField;
    cdsQuerydmIGRAGEMERROR: TFloatField;
    cdsQuerydmIGINITRATIO: TFloatField;
    cdsQuerydmIGEPSILON: TFloatField;
    cdsQuerydmIGMU: TFloatField;
    cdsQuerydmIGINITIALRATIO3D: TFloatField;
    QuerydmMIG: TSQLQuery;
    dspQuerydmMIG: TDataSetProvider;
    cdsQuerydmMIG: TClientDataSet;
    dsQuerydmMIG: TDataSource;
    cdsQuerydmMIGOPTIONID: TIntegerField;
    cdsQuerydmMIGSAMPLENO: TStringField;
    cdsQuerydmMIGLATITUDE: TFloatField;
    cdsQuerydmMIGLONGITUDE: TFloatField;
    cdsQuerydmMIGINTERPABR: TStringField;
    cdsQuerydmMIGGROUPINGLINK: TStringField;
    cdsQuerydmMIGRAGE: TFloatField;
    cdsQuerydmMIGRECORDID: TIntegerField;
    cdsQuerydmMIRECORDID: TIntegerField;
    cdsTempDataMapInterpretation: TStringField;
    cdsTempDataMapAgeBand: TStringField;
    cdsTempDataMapInterpAbr: TStringField;
    cdsTempDataMapColumnNo: TSmallintField;
    cdsTempDataMapSampleNo: TStringField;
    cdsTempDataMapAge: TFloatField;
    cdsTempDataMapAgePlus: TFloatField;
    cdsTempDataMapAgeMinus: TFloatField;
    cdsTempDataMapLatitude: TFloatField;
    cdsTempDataMapLongitude: TFloatField;
    cdsTempDataMapElevation: TFloatField;
    cdsTempDataMapColumnNoDate: TSmallintField;
    cdsTempDataMapRecordID: TIntegerField;
    QuerydmUNITID: TIntegerField;
    cdsQuerydmUNITID: TIntegerField;
    cdsQuerydm2UNITID: TIntegerField;
    cdsQuerydmDIUNITID: TIntegerField;
    QuerydmDIOPTIONTITLE: TStringField;
    QuerydmDIRAGE: TFloatField;
    QuerydmDIUNITID: TIntegerField;
    QuerydmDIUNITNAME: TStringField;
    QuerydmDIINTERPABR: TStringField;
    QuerydmDIOPTIONTITLE_1: TStringField;
    QuerydmDIOPTIONID: TIntegerField;
    QuerydmDIRAGEPERROR: TFloatField;
    QuerydmDIRAGEMERROR: TFloatField;
    cdsQuerydmDGUNITID: TIntegerField;
    qUserDeposits: TSQLQuery;
    dspUserDeposits: TDataSetProvider;
    cdsUserDeposits: TClientDataSet;
    dsUserDeposits: TDataSource;
    cdsUserDepositsUSERID: TStringField;
    cdsUserDepositsDEPOSITID: TIntegerField;
    cdsUserDepositsRAGE: TFloatField;
    cdsUserDepositsDEPLATITUDE: TFloatField;
    cdsUserDepositsDEPLONGITUDE: TFloatField;
    cdsUserDepositsRAGEUNCERTAINTY: TFloatField;
    qDeleteUserDeposits: TSQLQuery;
    cdsUserDepositsOPTIONID: TIntegerField;
    cdsUserDepositsOPTIONTITLE: TStringField;
    cdsUserDepositsDEPOSITNAME: TStringField;
    qInsertUserDeposit: TSQLQuery;
    qUserOptCaptions: TSQLQuery;
    dspUserOptCaptions: TDataSetProvider;
    cdsUserOptCaptions: TClientDataSet;
    dsUserOptCaptions: TDataSource;
    cdsUserOptCaptionsOPTIONID: TIntegerField;
    cdsUserOptCaptionsOPTIONTITLE: TStringField;
    SQLMonitor1: TSQLMonitor;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AllocateInitialAndModelRatios;
    procedure WtAverData2 ( NS                : integer;
                            var WtAver, MSWD,
                            WESDoM, WOSDoM : double;
                            var N              : integer);
    procedure AllocateDataByRatio2;
    procedure AllocateInitialAndModelRatios2;
    procedure AllocateMapDataBand2;
    procedure AllocateMapDataInitial2;
    procedure DeleteUserDeposits( tUserID : string;
                              var WasSuccessful : boolean);
    procedure AddDepositToUserDeposits(tUserID : string;
                                    tDepositID : integer;
                                  tDepositName : string;
             tLongitude, tLatitude, tAge, tAgeUncertainty : double);
  end;

// Procs
  function dmgDV: TdmgDV;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  IWDep_constants, IWDep_dm, usrIW_dm, IWDep_dmStrat;


function dmgDV: TdmgDV;
begin
  Result := TUserSession(WebApplication.Data).dmgDV;
end;

procedure TdmgDV.AllocateInitialAndModelRatios;
var
  VarbNo11, VarbNo12 : integer;
  tmpStr : string;
  temp, temp1 : double;
  GraphCategoryNum : integer;
begin
  temp := 0.0;
  temp1 := 0.0;
  VarbNo11 := 1;
  VarbNo12 := 1;
  try
    dmgDV.cdsTempDataI.Filtered := false;
    dmgDV.cdsTempDataI.First;
    if UserSession.DataHaveChanged then
    begin
      UserSession.StartAtX := SpectrumEndAge;
      UserSession.EndAtX := SpectrumStartAge;
      UserSession.StartAtY := SpectrumEndAge;
      UserSession.EndAtY := -1.0*SpectrumEndAge;
      if (dmgDV.cdsTempDataI.RecordCount > 0) then
      begin
        dmgDV.cdsTempDataI.EmptyDataSet;
      end;
    end;
    with dmgDV do
    begin
      Querydm.Close;
      Querydm.SQL.Text := ''; //dmDV.Query1.SQL.Text;
      Querydm.ParamByName('USERID').AsString := UserSession.UserID;
      cdsQuerydm.Close;
      cdsQuerydm.Open;
    end;
    {graph 1}
    if Pos('DATE',UserSession.AxisChoiceX) > 0 then VarbNo11 := 111;
    if Pos('UR',UserSession.AxisChoiceX) > 0 then VarbNo11 := 112;
    if Pos('DM',UserSession.AxisChoiceX) > 0 then VarbNo11 := 113;
    if Pos('I',UserSession.AxisChoiceX) > 0 then VarbNo11 := 114;
    if Pos('EPS',UserSession.AxisChoiceX) > 0 then VarbNo11 := 115;
    if Pos('MU',UserSession.AxisChoiceX) > 0 then VarbNo11 := 116;
    case VarbNo11 of
      111 : tmpStr := 'Date (Ma)';
      112 : tmpStr := 'T (UR)';
      113 : tmpStr := 'T (DM)';
      114 : tmpStr := 'Initial Ratio';
      115 : tmpStr := 'Epsilon/Gamma (T)';
      116 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    if Pos('DATE',UserSession.AxisChoiceY) > 0 then VarbNo12 := 121;
    if Pos('UR',UserSession.AxisChoiceY) > 0 then VarbNo12 := 122;
    if Pos('DM',UserSession.AxisChoiceY) > 0 then VarbNo12 := 123;
    if Pos('I',UserSession.AxisChoiceY) > 0 then VarbNo12 := 124;
    if Pos('EPS',UserSession.AxisChoiceY) > 0 then VarbNo12 := 125;
    if Pos('MU',UserSession.AxisChoiceY) > 0 then VarbNo12 := 126;
    case VarbNo12 of
      121 : tmpStr := 'Date (Ma)';
      122 : tmpStr := 'T (UR)';
      123 : tmpStr := 'T (DM)';
      124 : tmpStr := 'Initial Ratio';
      125 : tmpStr := 'Epsilon/Gamma (T)';
      126 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    dmgDV.cdsQuerydm.First;
    repeat
      GraphCategoryNum := 0;
      //RecordIsToBeGraphed(dmgDV.cdsQuerydmINTERPABR.AsString,GraphCategoryNum);
      if (GraphCategoryNum > 0) then
      begin
        case VarbNo11 of
          111..113 : temp := dmgDV.cdsQuerydmRAge.AsFloat;
          114 : temp := dmgDV.cdsQdmInitInitRatio.AsFloat;
          115 : temp := dmgDV.cdsQdmInitEpsilon.AsFloat;
          116 : temp := dmgDV.cdsQdmInitMu.AsFloat;
        end;
        case VarbNo12 of
          121..123 : temp1 := dmgDV.cdsQuerydmRAge.AsFloat;
          124 : temp1 := dmgDV.cdsQdmInitInitRatio.AsFloat;
          125 : temp1 := dmgDV.cdsQdmInitEpsilon.AsFloat;
          126 : temp1 := dmgDV.cdsQdmInitMu.AsFloat;
        end;
        if ((temp <> 0.0) and (temp1 <> 0.0)) then
        begin
          if (UserSession.StartAtX > temp) then UserSession.StartAtX := temp;
          if (UserSession.EndAtX < temp) then UserSession.EndAtX := temp;
          if (UserSession.StartAtY > temp1) then UserSession.StartAtY := temp1;
          if (UserSession.EndAtY < temp1) then UserSession.EndAtY := temp1;
          try
            dmgDV.cdsTempDataI.Append;
            dmgDV.cdsTempDataIPlotNo.AsInteger := 1;
            dmgDV.cdsTempDataIVariableX.AsFloat := temp;
            dmgDV.cdsTempDataIVariableY.AsFloat := temp1;
            //AddRecordToBeGraphed(UserSession.GraphType,GraphCategoryNum);
            dmgDV.cdsTempDataI.Post;
          except
          end;
        end;
      end;
      dmgDV.cdsQuerydm.Next;
    until dmgDV.cdsQuerydm.EOF;
    dmgDV.cdsQuerydm.First;
  finally
    dmgDV.cdsQuerydm.Close;
  end;
end;

procedure TdmgDV.WtAverData2 ( NS                : integer;
                               var WtAver, MSWD,
                               WESDoM, WOSDoM : double;
                               var N              : integer);
var
  i            : integer;
  W            : double;
  tx, tx1      : double;
  Sum          : array[1..5] of double;
begin
  N:=0;
  Sum[1]:=0.0; Sum[2]:=0.0; Sum[3]:=0.0; Sum[4]:=0.0; Sum[5]:=0.0;
  if (NS > 1) then
  begin
    dmgDV.cdsTempDataDI.First;
    for i:=1 to NS do
    begin
      tx := dmgDV.cdsTempDataDIAge.AsFloat;
      tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
      N:=N+1;
      if (tx1 <> 0.0) then W:=1.0/(tx1*tx1)
                      else W:=1.0;
      Sum[1]:=Sum[1]+W;
      Sum[2]:=Sum[2]+W*tx;
      Sum[3]:=Sum[3]+W*tx*tx;
      dmgDV.cdsTempDataDI.Next;
    end;
    dmgDV.cdsTempDataDI.First;
    if (N > 1) then
    begin
      WtAver:=Sum[2]/Sum[1];
      MSWD:=(Sum[3]-Sum[2]*Sum[2]/Sum[1])/(1.0*(N-1));
      if (Sum[1] > 0) then WESDoM:=1.0/Sqrt(Sum[1])
                      else WESDoM:=-99.9;
      Sum[1]:=0.0; Sum[2]:=0.0; Sum[3]:=0.0; Sum[4]:=0.0; Sum[5]:=0.0;
      for i:=1 to NS do
      begin
        tx := dmgDV.cdsTempDataDIAge.AsFloat;
        tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
        W:=1.0/(tx1*tx1 + WESDoM*WESDoM);
        Sum[1]:=Sum[1]+W;
        Sum[2]:=Sum[2]+W*tx;
        Sum[3]:=Sum[3]+W*tx*tx;
        Sum[4]:=Sum[4]+W;
        Sum[5]:=Sum[5]+W*(tx-WtAver)*(tx-WtAver);
        dmgDV.cdsTempDataDI.Next;
      end;
      MSWD:=(Sum[3]-Sum[2]*Sum[2]/Sum[1])/(1.0*(N-1));
      if (Sum[4] > 0) then WOSDoM:=Sqrt((Sum[5]/Sum[4])/(1.0*(N-1)))
                      else WOSDoM:=-99.9;
    end
    else begin
      WESDoM:=0.0;
      WOSDoM:=0.0;
      WtAver:=0.0;
      MSWD:=0.0;
      if (N = 1) then
      begin
        dmgDV.cdsTempDataDI.First;
        tx := dmgDV.cdsTempDataDIAge.AsFloat;
        tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
        WtAver := tx;
        WOSDoM := 0.0;
        WESDom := tx1;
        MSWD := 0.0;
      end;
    end;
    {include Troutman option for MSWD > F}
  end else
  begin
    if (NS = 1) then
    begin
      dmgDV.cdsTempDataDI.First;
      tx := dmgDV.cdsTempDataDIAge.AsFloat;
      tx1 := dmgDV.cdsTempDataDIAgeErrorAv.AsFloat;
      WtAver := tx;
      WOSDoM := 0.0;
      WESDom := tx1;
      MSWD := 0.0;
      N := 1;
    end;
  end;
  dmgDV.cdsTempDataDI.First;
end;


procedure TdmgDV.AllocateDataByRatio2;
var
  tplus, tminus : double;
  //GraphCategoryNum : integer;
  i, nRec : integer;
begin
  UserSession.LC := 0;
  {Allocate data}
  dmgDV.cdsTempDataDI.Filtered := false;
  dmgDV.cdsTempDataDI.First;
  if (UserSession.DataHaveChanged) then
  begin
    UserSession.StartAtX := SpectrumEndAge;
    UserSession.EndAtX := SpectrumStartAge;
    if (dmgDV.cdsTempDataDI.RecordCount > 0) then
    begin
      dmgDV.cdsTempDataDI.EmptyDataSet;
    end;
  end;
  with dmgDV do
  begin
    QuerydmDI.Close;
    QuerydmDI.SQL.Text := ''; //dmDV.Query1.SQL.Text;
    QuerydmDI.SQL.Strings[0] := 'select DISTINCT USEROPTS.OPTIONTITLE,ISORGR30.RAGE,ISORGR30.UNITID,SUITE.UNITNAME,';
    QuerydmDI.SQL.Strings[1] := '   ISORGR30.INTERPABR,USEROPTS.OPTIONTITLE,USEROPTS.OPTIONID,';
    QuerydmDI.SQL.Strings[2] := '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR';
    QuerydmDI.SQL.Strings[3] := '   ';
    QuerydmDI.SQL.Strings[4] := '   ';
    QuerydmDI.SQL.Strings[5] := '   ';
    QuerydmDI.SQL.Strings[6] := '   ';
    QuerydmDI.SQL.Strings[7] := '   ';
    QuerydmDI.SQL.Strings[9] := '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,IsoFor,SourceA,SourceListB,UserOpts,UserOptInterp';
    //QuerydmDI.SQL.Strings[dmDV.Query1.SQL.Count-1] := 'AND USEROPTS.USERID = USERSWHOFOR.USERID';
    QuerydmDI.SQL.Add('AND USEROPTS.USERID = USEROPTINTERP.USERID');
    QuerydmDI.SQL.Add('AND USEROPTS.OPTIONID = USEROPTINTERP.OPTIONID');
    QuerydmDI.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'I'+'''');
    QuerydmDI.SQL.Add('AND USEROPTINTERP.INTERPABR=ISORGR30.INTERPABR');
    QuerydmDI.SQL.Add('ORDER BY USEROPTS.OPTIONTITLE, ISORGR30.RAGE, SUITE.UNITNAME');
    QuerydmDI.ParamByName('USERID').AsString := UserSession.UserID;
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmgDV.QuerydmDI.SQL.Text);
    end;
    cdsQuerydmDI.Close;
    cdsQuerydmDI.Open;
    if (UserSession.UserID = 'guest') then
    begin
      //dmDV.Query1RecordCount;
      nRec := UserSession.NumberOfPoints;
      if (nRec > MaxGuestRecords) then
      begin
        cdsQuerydmDI.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          cdsQuerydmDI.Delete;
        end;
      end;
    end;
  end;
  try
    if UserSession.DataHaveChanged then
    begin
      dmgDV.cdsQuerydmDI.First;
      repeat
        if (UserSession.StartAtX > dmgDV.cdsQuerydmDIRAge.AsFloat-dmgDV.cdsQuerydmDIRAgeMError.AsFloat) then UserSession.StartAtX := dmgDV.cdsQuerydmDIRAge.AsFloat-dmgDV.cdsQuerydmDIRAgeMError.AsFloat;
        if (UserSession.EndAtX < dmgDV.cdsQuerydmDIRAge.AsFloat+dmgDV.cdsQuerydmDIRAgePError.AsFloat) then UserSession.EndAtX := dmgDV.cdsQuerydmDIRAge.AsFloat+dmgDV.cdsQuerydmDIRAgePError.AsFloat;
        try
          dmgDV.cdsTempDataDI.Append;
          dmgDV.cdsTempDataDIInterpretation.AsString := dmgDV.cdsQuerydmDIOPTIONTITLE.AsString;
          dmgDV.cdsTempDataDISuitName.AsString := dmgDV.cdsQuerydmDIUnitName.AsString;
          dmgDV.cdsTempDataDIInterpAbr.AsString := dmgDV.cdsQuerydmDIInterpAbr.AsString;
          dmgDV.cdsTempDataDIGrouping.AsString := dmgDV.cdsQuerydmDIOPTIONTITLE.AsString;
          dmgDV.cdsTempDataDIColumnNo.AsInteger := dmgDV.cdsQuerydmDIOPTIONID.AsInteger;
          dmgDV.cdsTempDataDIAge.AsFloat := dmgDV.cdsQuerydmDIRAge.AsFloat;
          dmgDV.cdsTempDataDIAgePlusError.AsFloat := dmgDV.cdsQuerydmDIRAgePError.AsFloat;
          dmgDV.cdsTempDataDIAgeMinusError.AsFloat := dmgDV.cdsQuerydmDIRAgeMError.AsFloat;
          tPlus := 50.05;
          tMinus := 50.05;
          if (dmgDV.cdsQuerydmDIRAgePError.AsString <> '') then tPlus := dmgDV.cdsQuerydmDIRAgePError.AsFloat;
          if (dmgDV.cdsQuerydmDIRAgeMError.AsString <> '') then tMinus := dmgDV.cdsQuerydmDIRAgeMError.AsFloat;
          dmgDV.cdsTempDataDIAgeErrorAv.AsFloat := (Abs(tPlus) + Abs(tMinus))/(2.0*1.96);
          dmgDV.cdsTempDataDI.Post;
        except
        end;
        dmgDV.cdsQuerydmDI.Next;
      until dmgDV.cdsQuerydmDI.EOF;
    end;
    {
    UserSession.NumberOfPoints := dmgDV.cdsQuerydmDI.RecordCount;
    }
    //dmUser.SetDeveloperData('AllocateDataByRatio2 completed');
  finally
    dmgDV.cdsQuerydmDI.Close;
  end;
end;

procedure TdmgDV.AllocateInitialAndModelRatios2;
var
  VarbNo11, VarbNo12 : integer;
  tmpStr : string;
  temp, temp1 : double;
  nRec, i : integer;
begin
  temp := 0.0;
  temp1 := 0.0;
  VarbNo11 := 1;
  VarbNo12 := 1;
  try
    dmgDV.cdsTempDataI.Filtered := false;
    dmgDV.cdsTempDataI.First;
    if UserSession.DataHaveChanged then
    begin
      UserSession.StartAtX := SpectrumEndAge;
      UserSession.EndAtX := SpectrumStartAge;
      UserSession.StartAtY := SpectrumEndAge;
      UserSession.EndAtY := -1.0*SpectrumEndAge;
      if (dmgDV.cdsTempDataI.RecordCount > 0) then
      begin
        dmgDV.cdsTempDataI.EmptyDataSet;
      end;
    end;
    with dmgDV do
    begin
      QuerydmI.Close;
      QuerydmI.SQL.Text := ''; //dmDV.Query1.SQL.Text;
      QuerydmI.SQL.Strings[0] := 'select DISTINCT USEROPTS.OPTIONTITLE,ISORGR30.RAGE,ISORGR30.UNITID,SUITE.UNITNAME,';
      QuerydmI.SQL.Strings[1] := '   ISORGR30.INTERPABR,USEROPTS.OPTIONID,';
      QuerydmI.SQL.Strings[2] := '   ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOINIT.INITRATIO, ISOINIT.EPSILON, ISOINIT.MU, ISOINIT.INITIALRATIO3D';
      QuerydmI.SQL.Strings[3] := '   ';
      QuerydmI.SQL.Strings[4] := '   ';
      QuerydmI.SQL.Strings[5] := '   ';
      QuerydmI.SQL.Strings[6] := '   ';
      QuerydmI.SQL.Strings[7] := '   ';
      tmpStr := '      Technique, IsoSystem,Suite,Lithol,UsersWhoFor,IsoFor,SourceA,SourceListB,UserOpts,UserOptInterp';
      {
      if (UserSession.IncludeEpsilonFromValue or UserSession.IncludeEpsilonToValue) then
      begin
      end else
      begin
        tmpStr := tmpStr + ',IsoInit';
      end;
      }
      QuerydmI.SQL.Strings[9] := tmpStr;
      //QuerydmI.SQL.Strings[dmDV.Query1.SQL.Count-1] := 'AND USEROPTS.USERID = USERSWHOFOR.USERID';
      QuerydmI.SQL.Add('AND ISORGR30.RECORDID = ISOINIT.RECORDID');
      QuerydmI.SQL.Add('AND USEROPTS.USERID = USEROPTINTERP.USERID');
      QuerydmI.SQL.Add('AND ISORGR30.RECORDID = ISOINIT.RECORDID');
      QuerydmI.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'I'+'''');
      QuerydmI.SQL.Add('AND USEROPTS.OPTIONID = USEROPTINTERP.OPTIONID');
      QuerydmI.SQL.Add('AND USEROPTS.USERID = USEROPTINTERP.USERID');
      QuerydmI.SQL.Add('AND USEROPTINTERP.INTERPABR = ISORGR30.INTERPABR');
      QuerydmI.SQL.Add('ORDER BY USEROPTS.OPTIONTITLE, ISORGR30.RAGE, SUITE.UNITNAME');
      QuerydmI.ParamByName('USERID').AsString := UserSession.UserID;
      if UserSession.IsDeveloper then
      begin
        //UserSession.tmpStrList.Text := dmgDV.QuerydmI.SQL.Text;
        //dmUser.SetDeveloperData(dmgDV.QuerydmI.SQL.Text);
        //UserSession.tmpStrList.Text := '';
      end;
      cdsQuerydmI.Close;
      cdsQuerydmI.Open;
      if (UserSession.UserID = 'guest') then
      begin
        //dmDV.Query1RecordCount;
        nRec := UserSession.NumberOfPoints;
        if (nRec > MaxGuestRecords) then
        begin
          cdsQuerydmI.Last;
          for i := nRec downto MaxGuestRecords+1 do
          begin
            cdsQuerydmI.Delete;
          end;
        end;
      end;
    end;
    {graph 1}
    if Pos('DATE',UserSession.AxisChoiceX) > 0 then VarbNo11 := 111;
    if Pos('UR',UserSession.AxisChoiceX) > 0 then VarbNo11 := 112;
    if Pos('DM',UserSession.AxisChoiceX) > 0 then VarbNo11 := 113;
    if Pos('I',UserSession.AxisChoiceX) > 0 then VarbNo11 := 114;
    if Pos('EPS',UserSession.AxisChoiceX) > 0 then VarbNo11 := 115;
    if Pos('MU',UserSession.AxisChoiceX) > 0 then VarbNo11 := 116;
    case VarbNo11 of
      111 : tmpStr := 'Date (Ma)';
      112 : tmpStr := 'T (UR)';
      113 : tmpStr := 'T (DM)';
      114 : tmpStr := 'Initial Ratio';
      115 : tmpStr := 'Epsilon/Gamma (T)';
      116 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    if Pos('DATE',UserSession.AxisChoiceY) > 0 then VarbNo12 := 121;
    if Pos('UR',UserSession.AxisChoiceY) > 0 then VarbNo12 := 122;
    if Pos('DM',UserSession.AxisChoiceY) > 0 then VarbNo12 := 123;
    if Pos('I',UserSession.AxisChoiceY) > 0 then VarbNo12 := 124;
    if Pos('EPS',UserSession.AxisChoiceY) > 0 then VarbNo12 := 125;
    if Pos('MU',UserSession.AxisChoiceY) > 0 then VarbNo12 := 126;
    case VarbNo12 of
      121 : tmpStr := 'Date (Ma)';
      122 : tmpStr := 'T (UR)';
      123 : tmpStr := 'T (DM)';
      124 : tmpStr := 'Initial Ratio';
      125 : tmpStr := 'Epsilon/Gamma (T)';
      126 : tmpStr := 'Model 238U/204Pb (i)';
    end;
    dmgDV.cdsQuerydmI.First;
    try
      repeat
        try
          dmgDV.cdsTempDataI.Append;
          dmgDV.cdsTempDataIInterpretation.AsString := dmgDV.cdsQuerydmIOPTIONTITLE.AsString;
          dmgDV.cdsTempDataIPlotNo.AsInteger := 1;
          dmgDV.cdsTempDataIColumnNo.AsInteger := dmgDV.cdsQuerydmIOPTIONID.AsInteger;
          dmgDV.cdsTempDataIGrouping.AsString := dmgDV.cdsQuerydmIINTERPABR.AsString;
          case VarbNo11 of
            111 : temp := dmgDV.cdsQuerydmIRAGE.AsFloat;
            112 : temp := dmgDV.cdsQuerydmIRAGE.AsFloat;
            113 : temp := dmgDV.cdsQuerydmIRAGE.AsFloat;
            114 : temp := dmgDV.cdsQuerydmIINITRATIO.AsFloat;
            115 : temp := dmgDV.cdsQuerydmIEPSILON.AsFloat;
            116 : temp := dmgDV.cdsQuerydmIMU.AsFloat;
          end;
          case VarbNo12 of
            121 : temp1 := dmgDV.cdsQuerydmIRAGE.AsFloat;
            122 : temp1 := dmgDV.cdsQuerydmIRAGE.AsFloat;
            123 : temp1 := dmgDV.cdsQuerydmIRAGE.AsFloat;
            124 : temp1 := dmgDV.cdsQuerydmIINITRATIO.AsFloat;
            125 : temp1 := dmgDV.cdsQuerydmIEPSILON.AsFloat;
            126 : temp1 := dmgDV.cdsQuerydmIMU.AsFloat;
          end;
          dmgDV.cdsTempDataIVariableX.AsFloat := temp;
          dmgDV.cdsTempDataIVariableY.AsFloat := temp1;
          dmgDV.cdsTempDataI.Post;
        except
        end;
        if (UserSession.StartAtX > dmgDV.cdsTempDataIVariableX.AsFloat) then UserSession.StartAtX := dmgDV.cdsTempDataIVariableX.AsFloat;
        if (UserSession.EndAtX < dmgDV.cdsTempDataIVariableX.AsFloat) then UserSession.EndAtX := dmgDV.cdsTempDataIVariableX.AsFloat;
        if (UserSession.StartAtY > dmgDV.cdsTempDataIVariableY.AsFloat) then UserSession.StartAtY := dmgDV.cdsTempDataIVariableY.AsFloat;
        if (UserSession.EndAtY < dmgDV.cdsTempDataIVariableY.AsFloat) then UserSession.EndAtY := dmgDV.cdsTempDataIVariableY.AsFloat;
        dmgDV.cdsQuerydmI.Next;
      until dmgDV.cdsQuerydmI.EOF;
    except
    end;
  finally
    dmgDV.cdsQuerydmI.Close;
  end;
end;

procedure TdmgDV.AllocateMapDataBand2;
var
  //GraphCategoryNum : integer;
  //SampleLocalityAlreadyShown : boolean;
  //i, nRec : integer;
  WasSuccessful : boolean;
begin
  try
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    with dmgDV do
    begin
      WasSuccessful := true;
      dmgDV.DeleteUserDeposits(UserSession.UserID,WasSuccessful);
      dmStrat.DepositQuery.Close;
      dmStrat.cdsDepositQuery.Close;
      dmStrat.cdsDepositQuery.Open;
      dmStrat.cdsDepositQuery.First;
      repeat
        dmgDV.AddDepositToUserDeposits(UserSession.UserID,
          dmStrat.cdsDepositQuerySDBDEPOSITID.AsInteger,
          dmStrat.cdsDepositQueryDEPOSITNAME.AsString,
          dmStrat.cdsDepositQueryDEPLONGITUDE.AsFloat,
          dmStrat.cdsDepositQueryDEPLATITUDE.ASFloat,
          dmStrat.cdsDepositQueryAPPROXAGE.AsFloat,
          dmStrat.cdsDepositQueryAPPROXAGEUNCERTAINTY.AsFloat);
          dmStrat.cdsDepositQuery.Next;
      until dmStrat.cdsDepositQuery.Eof;
      dmgDV.qUserDeposits.Close;
      dmgDV.qUserDeposits.SQL.Clear;
      dmgDV.qUserDeposits.SQL.Add('SELECT DISTINCT USEROPTS.OPTIONID, USEROPTS.OPTIONTITLE,');
      dmgDV.qUserDeposits.SQL.Add('  USERDEPOSITS.USERID, USERDEPOSITS.DEPOSITID,');
      dmgDV.qUserDeposits.SQL.Add('  USERDEPOSITS.RAGE, USERDEPOSITS.RAGEUNCERTAINTY,');
      dmgDV.qUserDeposits.SQL.Add('  USERDEPOSITS.DEPLONGITUDE, USERDEPOSITS.DEPLATITUDE,');
      dmgDV.qUserDeposits.SQL.Add('  USERDEPOSITS.DEPOSITNAME');
      dmgDV.qUserDeposits.SQL.Add('FROM USEROPTS, USERDEPOSITS, USEROPTDATES');
      dmgDV.qUserDeposits.SQL.Add('WHERE USERDEPOSITS.USERID = :UserID');
      dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.USERID = USERDEPOSITS.USERID');
      dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'D'+'''');
      dmgDV.qUserDeposits.SQL.Add('AND USERDEPOSITS.RAGE >= USEROPTDATES.DATEMIN');
      dmgDV.qUserDeposits.SQL.Add('AND USERDEPOSITS.RAGE < USEROPTDATES.DATEMAX');
      dmgDV.qUserDeposits.SQL.Add('AND USERDEPOSITS.DEPLATITUDE<90.0');
      dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.USERID = USEROPTDATES.USERID');
      dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONID = USEROPTDATES.OPTIONID');
      dmgDV.qUserDeposits.ParamByName('USERID').AsString := UserSession.UserID;
      dmgDV.cdsUserDeposits.Open;
    end;
    if (dmgDV.cdsUserDeposits.RecordCount >= 1) then
    begin
      UserSession.LatitudeMin := 90.0;
      UserSession.LatitudeMax := -90.0;
      UserSession.LongitudeMin := 180.0;
      UserSession.LongitudeMax := -180.0;
      dmgDV.cdsTempDataMap.EmptyDataSet;
      dmgDV.cdsUserDeposits.First;
      try
        dmgDV.cdsTempDataMap.DisableControls;
        repeat
          try
            dmgDV.cdsTempDataMap.Append;
            dmgDV.cdsTempDataMapSampleNo.AsString := dmgDV.cdsUserDepositsDEPOSITID.AsString;
            dmgDV.cdsTempDataMapLatitude.AsFloat := dmgDV.cdsUserDepositsDEPLATITUDE.AsFloat;
            dmgDV.cdsTempDataMapLongitude.AsFloat := dmgDV.cdsUserDepositsDEPLONGITUDE.AsFloat;
            dmgDV.cdsTempDataMapElevation.AsFloat := 0.0;
            dmgDV.cdsTempDataMapAge.AsFloat := dmgDV.cdsUserDepositsRAge.AsFloat;
            dmgDV.cdsTempDataMapAgePlus.AsFloat := dmgDV.cdsUserDepositsRAGEUNCERTAINTY.AsFloat;
            dmgDV.cdsTempDataMapAgeMinus.AsFloat := dmgDV.cdsUserDepositsRAGEUNCERTAINTY.AsFloat;
            dmgDV.cdsTempDataMapColumnNo.AsInteger := 0;
            dmgDV.cdsTempDataMapColumnNoDate.AsInteger := dmgDV.cdsUserDepositsOptionID.AsInteger;
            dmgDV.cdsTempDataMapInterpretation.AsString := dmgDV.cdsUserDepositsDEPOSITNAME.AsString;
            dmgDV.cdsTempDataMapInterpAbr.AsString := 'nihil';
            dmgDV.cdsTempDataMapAgeBand.AsString := dmgDV.cdsUserDepositsOPTIONTITLE.AsString;
            dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsUserDepositsDEPOSITID.AsInteger;
            dmgDV.cdsTempDataMap.Post;
          except
          end;
          if (UserSession.LongitudeMin > dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMin := dmgDV.cdsTempDataMapLongitude.AsFloat;
          if (UserSession.LongitudeMax < dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMax := dmgDV.cdsTempDataMapLongitude.AsFloat;
          if (UserSession.LatitudeMin > dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMin := dmgDV.cdsTempDataMapLatitude.AsFloat;
          if (UserSession.LatitudeMax < dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMax := dmgDV.cdsTempDataMapLatitude.AsFloat;
          dmgDV.cdsUserDeposits.Next;
        until dmgDV.cdsUserDeposits.EOF;
        dmgDV.cdsTempDataMap.EnableControls;
      except
      end;
    end;
  finally
    dmgDV.cdsUserDeposits.Close;
  end;
end;

procedure TdmgDV.AllocateMapDataInitial2;
var
  //GraphCategoryNum : integer;
  //SampleLocalityAlreadyShown : boolean;
  //i, nRec : integer;
  WasSuccessful : boolean;
begin
  dmgDV.cdsTempDataMap.Filtered := false;
  dmgDV.cdsTempDataMap.First;
  WasSuccessful := true;
  dmgDV.DeleteUserDeposits(UserSession.UserID,WasSuccessful);
  dmStrat.DepositQuery.Close;
  dmStrat.cdsDepositQuery.Close;
  dmStrat.cdsDepositQuery.Open;
  dmStrat.cdsDepositQuery.First;
  repeat
    dmgDV.AddDepositToUserDeposits(UserSession.UserID,
      dmStrat.cdsDepositQuerySDBDEPOSITID.AsInteger,
      dmStrat.cdsDepositQueryDEPOSITNAME.AsString,
      dmStrat.cdsDepositQueryDEPLONGITUDE.AsFloat,
      dmStrat.cdsDepositQueryDEPLATITUDE.ASFloat,
      dmStrat.cdsDepositQueryAPPROXAGE.AsFloat,
      dmStrat.cdsDepositQueryAPPROXAGEUNCERTAINTY.AsFloat);
      dmStrat.cdsDepositQuery.Next;
  until dmStrat.cdsDepositQuery.Eof;
  dmgDV.qUserDeposits.Close;
  dmgDV.qUserDeposits.SQL.Clear;
  dmgDV.qUserDeposits.SQL.Add('SELECT DISTINCT USEROPTS.OPTIONID, USEROPTS.OPTIONTITLE,');
  dmgDV.qUserDeposits.SQL.Add('  USERDEPOSITS.USERID, USERDEPOSITS.DEPOSITID,');
  dmgDV.qUserDeposits.SQL.Add('  USERDEPOSITS.RAGE, USERDEPOSITS.RAGEUNCERTAINTY,');
  dmgDV.qUserDeposits.SQL.Add('  USERDEPOSITS.DEPLONGITUDE, USERDEPOSITS.DEPLATITUDE,');
  dmgDV.qUserDeposits.SQL.Add('  USERDEPOSITS.DEPOSITNAME');
  dmgDV.qUserDeposits.SQL.Add('FROM USEROPTS, USERDEPOSITS, USEROPTINITIAL, DEPCOVR');
  dmgDV.qUserDeposits.SQL.Add('WHERE USERDEPOSITS.USERID = :UserID');
  dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.USERID = USERDEPOSITS.USERID');
  dmgDV.qUserDeposits.SQL.Add('AND USEROPTINITIAL.USERID = USERDEPOSITS.USERID');
  dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONTYPEID = USEROPTINITIAL.OPTIONTYPEID');
  dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONID = USEROPTINITIAL.OPTIONID');
  dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.DEPOSITID = USERDEPOSITS.DEPOSITID');
  dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.AVERLEAST = '+''''+'L'+'''');
  if (UserSession.GraphType = gtMapRatio64) then
  begin
    dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'6'+'''');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN64 >= USEROPTINITIAL.VALUEMIN');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN64 < USEROPTINITIAL.VALUEMAX');
  end;
  if (UserSession.GraphType = gtMapRatio74) then
  begin
    dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'7'+'''');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN74 >= USEROPTINITIAL.VALUEMIN');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN74 < USEROPTINITIAL.VALUEMAX');
  end;
  if (UserSession.GraphType = gtMapRatio84) then
  begin
    dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'8'+'''');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN84 >= USEROPTINITIAL.VALUEMIN');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN84 < USEROPTINITIAL.VALUEMAX');
  end;
  if (UserSession.GraphType = gtMapMuSource) then
  begin
    dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'M'+'''');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIANMU >= USEROPTINITIAL.VALUEMIN');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIANMU < USEROPTINITIAL.VALUEMAX');
  end;
  if (UserSession.GraphType = gtMapRatio64Model) then
  begin
    dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'6'+'''');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN64MODEL >= USEROPTINITIAL.VALUEMIN');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN64MODEL < USEROPTINITIAL.VALUEMAX');
  end;
  if (UserSession.GraphType = gtMapRatio74Model) then
  begin
    dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.OPTIONTYPEID = '+''''+'7'+'''');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN74MODEL >= USEROPTINITIAL.VALUEMIN');
    dmgDV.qUserDeposits.SQL.Add('AND DEPCOVR.MEDIAN74MODEL < USEROPTINITIAL.VALUEMAX');
  end;
  dmgDV.qUserDeposits.SQL.Add('AND USERDEPOSITS.DEPLATITUDE<90.0');
  dmgDV.qUserDeposits.SQL.Add('AND USEROPTS.USERID = USEROPTINITIAL.USERID');
  dmgDV.qUserDeposits.ParamByName('USERID').AsString := UserSession.UserID;
  dmgDV.cdsUserDeposits.Close;
  dmgDV.cdsUserDeposits.Open;
  if (dmgDV.cdsUserDeposits.RecordCount >= 1) then
  begin
    UserSession.LatitudeMin := 90.0;
    UserSession.LatitudeMax := -90.0;
    UserSession.LongitudeMin := 180.0;
    UserSession.LongitudeMax := -180.0;
    dmgDV.cdsTempDataMap.EmptyDataSet;
    dmgDV.cdsUserDeposits.First;
    try
      dmgDV.cdsTempDataMap.DisableControls;
      repeat
        try
          dmgDV.cdsTempDataMap.Append;
          dmgDV.cdsTempDataMapSampleNo.AsString := dmgDV.cdsUserDepositsDEPOSITID.AsString;
          dmgDV.cdsTempDataMapLatitude.AsFloat := dmgDV.cdsUserDepositsDEPLATITUDE.AsFloat;
          dmgDV.cdsTempDataMapLongitude.AsFloat := dmgDV.cdsUserDepositsDEPLONGITUDE.AsFloat;
          dmgDV.cdsTempDataMapElevation.AsFloat := 0.0;
          dmgDV.cdsTempDataMapAge.AsFloat := dmgDV.cdsUserDepositsRAge.AsFloat;
          dmgDV.cdsTempDataMapAgePlus.AsFloat := dmgDV.cdsUserDepositsRAGEUNCERTAINTY.AsFloat;
          dmgDV.cdsTempDataMapAgeMinus.AsFloat := dmgDV.cdsUserDepositsRAGEUNCERTAINTY.AsFloat;
          dmgDV.cdsTempDataMapColumnNo.AsInteger := 0;
          dmgDV.cdsTempDataMapColumnNoDate.AsInteger := dmgDV.cdsUserDepositsOptionID.AsInteger;
          dmgDV.cdsTempDataMapInterpretation.AsString := dmgDV.cdsUserDepositsDEPOSITNAME.AsString;
          dmgDV.cdsTempDataMapInterpAbr.AsString := 'nihil';
          dmgDV.cdsTempDataMapAgeBand.AsString := dmgDV.cdsUserDepositsOPTIONTITLE.AsString;
          dmgDV.cdsTempDataMapRecordID.AsInteger := dmgDV.cdsUserDepositsDEPOSITID.AsInteger;
          dmgDV.cdsTempDataMap.Post;
        except
        end;
        if (UserSession.LongitudeMin > dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMin := dmgDV.cdsTempDataMapLongitude.AsFloat;
        if (UserSession.LongitudeMax < dmgDV.cdsTempDataMapLongitude.AsFloat) then UserSession.LongitudeMax := dmgDV.cdsTempDataMapLongitude.AsFloat;
        if (UserSession.LatitudeMin > dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMin := dmgDV.cdsTempDataMapLatitude.AsFloat;
        if (UserSession.LatitudeMax < dmgDV.cdsTempDataMapLatitude.AsFloat) then UserSession.LatitudeMax := dmgDV.cdsTempDataMapLatitude.AsFloat;
        dmgDV.cdsUserDeposits.Next;
      until dmgDV.cdsUserDeposits.EOF;
    finally
      dmgDV.cdsTempDataMap.EnableControls;
      dmgDV.cdsUserDeposits.Close;
    end;
  end;
end;

procedure TdmgDV.DeleteUserDeposits( tUserID : string;
                                   var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  dmgDV.qDeleteUserDeposits.ParamByName('UserID').AsString := tUserID;
  if not dmgDV.sqlcDateView.InTransaction then
  begin
    TD := dmgDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      dmgDV.qDeleteUserDeposits.ExecSQL(false);
      dmgDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
    except
      dmDep.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
      WasSuccessful := false;
    end;
  end;
end;

procedure TdmgDV.AddDepositToUserDeposits(tUserID : string;
          tDepositID : integer;
          tDepositName : string;
          tLongitude, tLatitude, tAge, tAgeUncertainty : double);
var
  //i : integer;
  TD: TDBXTransaction;
begin
  try
    dmgDV.qInsertUserDeposit.Close;
    dmgDV.qInsertUserDeposit.ParamByName('UserID').AsString := tUserID;
    dmgDV.qInsertUserDeposit.ParamByName('DepositID').AsInteger := tDepositID;
    dmgDV.qInsertUserDeposit.ParamByName('RAge').AsFloat := tAge;
    dmgDV.qInsertUserDeposit.ParamByName('RAgeUncertainty').AsFloat := tAgeUncertainty;
    dmgDV.qInsertUserDeposit.ParamByName('DepLatitude').AsFloat := tLatitude;
    dmgDV.qInsertUserDeposit.ParamByName('DepLongitude').AsFloat := tLongitude;
    dmgDV.qInsertUserDeposit.ParamByName('DepositName').AsString := tDepositName;
    if not dmgDV.sqlcDateView.InTransaction then
    begin
      TD := dmgDV.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
      try
        dmgDV.qInsertUserDeposit.ExecSQL(false);
        dmgDV.sqlcDateView.CommitFreeAndNil(TD); {on success, commit the changes};
      except
        dmgDV.sqlcDateView.RollbackFreeAndNil(TD); {on failure, undo the changes};
      end;
    end;
  except
  end;
end;

end.
