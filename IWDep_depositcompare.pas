unit IWDep_depositcompare;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWCompGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  DB, IWBaseHTMLControl, IWCompRectangle, IWCompCheckbox,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWDep_frTopBar, VCLTee.TeEngine, Series, ExtCtrls, VCLTee.TeeProcs,
  VCLTee.DBChart, IWCompExtCtrls,
  IWCompTeeChart, VCLTee.Chart, IWHTML40Container, VclTee.TeeGDIPlus;

type
  TISFDepositCompare = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel3: TIWLabel;
    IWLabel11: TIWLabel;
    IWDBEdit11: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    iwbReturn2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
    rectLeft: TIWRectangle;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWRegion1: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwrDepositDetails: TIWRegion;
    iwrClientAll: TIWRegion;
    iwrBottomButtons: TIWRegion;
    IWLabel31: TIWLabel;
    TopBar: TISFTopBarDep;
    iwrUserData: TIWRegion;
    IWLabel10: TIWLabel;
    iwDBgUserSamples: TIWDBGrid;
    iwlUserSamples: TIWLabel;
    iwDBnUserSamples: TIWDBNavigator;
    iwrGraphsPb: TIWRegion;
    IWLabel12: TIWLabel;
    iwcPbTh: TIWChart;
    ChartTL: TChart;
    Series1: TPointSeries;
    Series2: TLineSeries;
    Series3: TPointSeries;
    iwcPbU: TIWChart;
    iwcPbMu: TIWChart;
    ChartBL: TChart;
    PointSeries1: TPointSeries;
    PointSeries2: TPointSeries;
    LineSeries1: TLineSeries;
    ChartTR: TChart;
    PointSeries3: TPointSeries;
    PointSeries4: TPointSeries;
    LineSeries2: TLineSeries;
    iwbUserSampleChangeIncluded: TIWButton;
    iwcbProspectInc: TIWCheckBox;
    iwcbTarget1Inc: TIWCheckBox;
    iwcbModel: TIWCheckBox;
    IWLabel13: TIWLabel;
    IWLabel14: TIWLabel;
    IWLabel15: TIWLabel;
    iweMinAge: TIWEdit;
    iweMaxAge: TIWEdit;
    iwbSetMinMaxAge: TIWButton;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    IWLabel46: TIWLabel;
    IWLabel47: TIWLabel;
    IWLabel48: TIWLabel;
    IWLabel49: TIWLabel;
    IWLabel50: TIWLabel;
    IWLabel51: TIWLabel;
    iwlTarget1ID: TIWLabel;
    iwlTarget2ID: TIWLabel;
    iwlTarget1Name: TIWLabel;
    iwlTarget2Name: TIWLabel;
    Series8: TPointSeries;
    Series9: TPointSeries;
    Series10: TPointSeries;
    iwcbTarget2Inc: TIWCheckBox;
    ChartCoeffVar6474: TChart;
    PointSeries5: TPointSeries;
    PointSeries6: TPointSeries;
    PointSeries7: TPointSeries;
    LineSeries3: TLineSeries;
    ChartCoeffVar6484: TChart;
    PointSeries8: TPointSeries;
    PointSeries9: TPointSeries;
    PointSeries10: TPointSeries;
    LineSeries4: TLineSeries;
    iwcCoeffVar6484: TIWChart;
    iwcCoeffVar6474: TIWChart;
    iwcbMeasuredModelChoice: TIWCheckBox;
    iwrStatistics: TIWRegion;
    IWLabel85: TIWLabel;
    iwbCalculateCovr: TIWButton;
    IWDBNavigator1: TIWDBNavigator;
    IWDBEdit177: TIWDBEdit;
    iwrStatisticsPb: TIWRegion;
    IWLabel2: TIWLabel;
    IWLabel7: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel8: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    IWLabel9: TIWLabel;
    IWDBEdit14: TIWDBEdit;
    IWLabel26: TIWLabel;
    IWDBEdit59: TIWDBEdit;
    IWLabel28: TIWLabel;
    IWDBEdit60: TIWDBEdit;
    IWLabel52: TIWLabel;
    IWLabel53: TIWLabel;
    IWLabel54: TIWLabel;
    IWDBEdit61: TIWDBEdit;
    IWDBEdit62: TIWDBEdit;
    IWLabel55: TIWLabel;
    IWDBEdit63: TIWDBEdit;
    IWDBEdit64: TIWDBEdit;
    IWDBEdit65: TIWDBEdit;
    IWLabel56: TIWLabel;
    IWDBEdit66: TIWDBEdit;
    IWDBEdit67: TIWDBEdit;
    IWLabel57: TIWLabel;
    IWDBEdit68: TIWDBEdit;
    IWDBEdit69: TIWDBEdit;
    IWDBEdit70: TIWDBEdit;
    IWLabel58: TIWLabel;
    IWDBEdit71: TIWDBEdit;
    IWDBEdit72: TIWDBEdit;
    IWLabel59: TIWLabel;
    IWDBEdit73: TIWDBEdit;
    IWDBEdit74: TIWDBEdit;
    IWDBEdit75: TIWDBEdit;
    IWLabel60: TIWLabel;
    IWDBEdit76: TIWDBEdit;
    IWDBEdit77: TIWDBEdit;
    IWLabel61: TIWLabel;
    IWDBEdit78: TIWDBEdit;
    IWDBEdit79: TIWDBEdit;
    IWDBEdit80: TIWDBEdit;
    IWLabel62: TIWLabel;
    IWDBEdit81: TIWDBEdit;
    IWDBEdit82: TIWDBEdit;
    IWLabel63: TIWLabel;
    IWDBEdit83: TIWDBEdit;
    IWDBEdit84: TIWDBEdit;
    IWDBEdit85: TIWDBEdit;
    IWLabel64: TIWLabel;
    IWDBEdit86: TIWDBEdit;
    IWDBEdit87: TIWDBEdit;
    IWLabel65: TIWLabel;
    IWDBEdit88: TIWDBEdit;
    IWDBEdit89: TIWDBEdit;
    IWDBEdit90: TIWDBEdit;
    IWLabel68: TIWLabel;
    IWLabel69: TIWLabel;
    IWLabel70: TIWLabel;
    IWDBEdit91: TIWDBEdit;
    IWDBEdit92: TIWDBEdit;
    IWLabel71: TIWLabel;
    IWDBEdit93: TIWDBEdit;
    IWDBEdit94: TIWDBEdit;
    IWDBEdit95: TIWDBEdit;
    IWLabel72: TIWLabel;
    IWDBEdit96: TIWDBEdit;
    IWDBEdit97: TIWDBEdit;
    IWLabel73: TIWLabel;
    IWDBEdit98: TIWDBEdit;
    IWDBEdit99: TIWDBEdit;
    IWDBEdit100: TIWDBEdit;
    IWLabel74: TIWLabel;
    IWDBEdit101: TIWDBEdit;
    IWDBEdit102: TIWDBEdit;
    IWLabel75: TIWLabel;
    IWDBEdit103: TIWDBEdit;
    IWDBEdit104: TIWDBEdit;
    IWDBEdit105: TIWDBEdit;
    IWLabel76: TIWLabel;
    IWDBEdit106: TIWDBEdit;
    IWDBEdit107: TIWDBEdit;
    IWDBEdit108: TIWDBEdit;
    IWDBEdit109: TIWDBEdit;
    IWDBEdit110: TIWDBEdit;
    IWDBEdit111: TIWDBEdit;
    IWDBEdit112: TIWDBEdit;
    IWDBEdit113: TIWDBEdit;
    IWDBEdit114: TIWDBEdit;
    IWDBEdit115: TIWDBEdit;
    iwrStatisticsOther: TIWRegion;
    IWLabel77: TIWLabel;
    IWLabel78: TIWLabel;
    IWDBEdit116: TIWDBEdit;
    IWLabel79: TIWLabel;
    IWDBEdit117: TIWDBEdit;
    IWLabel80: TIWLabel;
    IWDBEdit118: TIWDBEdit;
    IWLabel81: TIWLabel;
    IWDBEdit119: TIWDBEdit;
    IWLabel82: TIWLabel;
    IWDBEdit120: TIWDBEdit;
    IWLabel83: TIWLabel;
    IWLabel84: TIWLabel;
    IWLabel86: TIWLabel;
    IWDBEdit121: TIWDBEdit;
    IWDBEdit122: TIWDBEdit;
    IWLabel87: TIWLabel;
    IWDBEdit123: TIWDBEdit;
    IWDBEdit124: TIWDBEdit;
    IWDBEdit125: TIWDBEdit;
    IWLabel88: TIWLabel;
    IWDBEdit126: TIWDBEdit;
    IWDBEdit127: TIWDBEdit;
    IWLabel89: TIWLabel;
    IWDBEdit128: TIWDBEdit;
    IWDBEdit129: TIWDBEdit;
    IWDBEdit130: TIWDBEdit;
    IWLabel90: TIWLabel;
    IWDBEdit131: TIWDBEdit;
    IWDBEdit132: TIWDBEdit;
    IWLabel91: TIWLabel;
    IWDBEdit133: TIWDBEdit;
    IWDBEdit134: TIWDBEdit;
    IWDBEdit135: TIWDBEdit;
    IWLabel92: TIWLabel;
    IWDBEdit136: TIWDBEdit;
    IWDBEdit137: TIWDBEdit;
    IWLabel93: TIWLabel;
    IWDBEdit138: TIWDBEdit;
    IWDBEdit139: TIWDBEdit;
    IWDBEdit140: TIWDBEdit;
    IWLabel94: TIWLabel;
    IWLabel95: TIWLabel;
    IWLabel96: TIWLabel;
    IWDBEdit141: TIWDBEdit;
    IWDBEdit142: TIWDBEdit;
    IWLabel97: TIWLabel;
    IWDBEdit143: TIWDBEdit;
    IWDBEdit144: TIWDBEdit;
    IWDBEdit145: TIWDBEdit;
    IWLabel98: TIWLabel;
    IWDBEdit146: TIWDBEdit;
    IWDBEdit147: TIWDBEdit;
    IWDBEdit148: TIWDBEdit;
    IWDBEdit149: TIWDBEdit;
    IWDBEdit150: TIWDBEdit;
    IWDBEdit151: TIWDBEdit;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwDBgResultsColumns0Click(ASender: TObject;
      const AValue: String);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure iwDBgSamplesColumns0TitleClick(Sender: TObject);
    procedure iwDBgUserSamplesColumns0TitleClick(Sender: TObject);
    procedure iwbSetMinMaxAgeClick(Sender: TObject);
    procedure iwcbProspectTargetsIncChange(Sender: TObject);
    procedure iwcbMeasuredModelChoiceChange(Sender: TObject);
  public
    procedure UpdateQuery2;
    procedure ShowHideEditButtons;
    procedure UpdateGraphs;
  end;

implementation

{$R *.dfm}

uses
  ServerController, Graphics, IWColor,
  IWDep_constants, IWDep_frDepositGrid,
  IWDep_dm, IWDep_dmStrat, usrIW_dm;

procedure TISFDepositCompare.IWAppFormDestroy(Sender: TObject);
begin
  dmStrat.cdsClans.Close;
  dmStrat.cdsCountryContinents.Close;
  dmDep.cdsDepCovrProspect.Close;
  dmDep.cdsDepositSamplesProspect.Close;
end;

procedure TISFDepositCompare.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
  end;
end;

procedure TISFDepositCompare.ShowHideEditButtons;
begin
  {}
end;

procedure TISFDepositCompare.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsDeposit.Close;
  dmDep.cdsUserDepSmp.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDepositGrid.Create(WebApplication).Show
end;

procedure TISFDepositCompare.iwbSetMinMaxAgeClick(Sender: TObject);
var
  iCode : integer;
  X, Y, Z,
  Age, Million,
  StartAge, MinAge, MaxAge,
  ModelMu, ModelW,
  Start64, Start74, Start84,
  Lambda238, Lambda235,
  Lambda232 : double;
begin
  Lambda238 := 1.55125e-10;
  Lambda235 := 9.8485e-10;
  Lambda232 := 4.9475e-11;
  StartAge := 3700.0;
  MinAge := 0.0;
  MaxAge := 3700.0;
  Start64 := 11.152;
  Start74 := 12.998;
  Start84 := 31.230;
  ModelMu := 9.74;
  ModelW := 37.19;
  Million := 1.0e6;
  try
    Val(iweMinAge.Text,MinAge,iCode);
    Val(iweMaxAge.Text,MaxAge,iCode);
    iweMinAge.Text := FormatFloat('###0.0',MinAge);
    iweMaxAge.Text := FormatFloat('###0.0',MaxAge);
  except
  end;
  ChartTL.Series[3].Clear;
  ChartBL.Series[3].Clear;
  ChartTR.Series[3].Clear;
  Age := MinAge;
  repeat
    //Age := 1.0*i;
    if (Age <= 0.0) then Age := Age + 0.1e-6;
    X := Start64 + ModelMu*(exp(Lambda238*Million*StartAge) - exp(Lambda238*Million*Age));
    Y := Start74 + (ModelMu/137.88)*(exp(Lambda235*Million*StartAge) - exp(Lambda235*Million*Age));
    Z := Start84 + ModelW*(exp(Lambda232*Million*StartAge) - exp(Lambda232*Million*Age));
    ChartTL.Series[3].AddXY(X,Z);
    ChartBL.Series[3].AddXY(X,Y);
    Age := Age + 100.0;
  until (Age >= MaxAge);
end;


procedure TISFDepositCompare.iwcbMeasuredModelChoiceChange(Sender: TObject);
begin
  //UpDateGraphs;
end;

procedure TISFDepositCompare.iwcbProspectTargetsIncChange(Sender: TObject);
begin
  ChartTL.Series[0].Visible := iwcbProspectInc.Checked;
  ChartTL.Series[1].Visible := iwcbTarget1Inc.Checked;
  ChartTL.Series[2].Visible := iwcbTarget2Inc.Checked;
  ChartTL.Series[3].Visible := iwcbModel.Checked;
  ChartBL.Series[0].Visible := iwcbProspectInc.Checked;
  ChartBL.Series[1].Visible := iwcbTarget1Inc.Checked;
  ChartBL.Series[2].Visible := iwcbTarget2Inc.Checked;
  ChartBL.Series[3].Visible := iwcbModel.Checked;
  ChartTR.Series[0].Visible := iwcbProspectInc.Checked;
  ChartTR.Series[1].Visible := iwcbTarget1Inc.Checked;
  ChartTR.Series[2].Visible := iwcbTarget2Inc.Checked;
  ChartCoeffVar6474.Series[0].Visible := iwcbProspectInc.Checked;
  ChartCoeffVar6474.Series[1].Visible := iwcbTarget1Inc.Checked;
  ChartCoeffVar6474.Series[2].Visible := iwcbTarget2Inc.Checked;
  ChartCoeffVar6484.Series[0].Visible := iwcbProspectInc.Checked;
  ChartCoeffVar6484.Series[1].Visible := iwcbTarget1Inc.Checked;
  ChartCoeffVar6484.Series[2].Visible := iwcbTarget2Inc.Checked;
end;

procedure TISFDepositCompare.IWAppFormCreate(Sender: TObject);
var
  //i, iRec : integer;
  NumPb,NumSr,NumNd,NumOs,NumS,NumSO4,NumO : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwrStatistics.Visible := false;
  iwrStatisticsPb.Visible := false;
  iwrStatisticsOther.Visible := false;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
    iwlTarget1ID.Caption := UserSession.Target1Chosen;
    iwlTarget2ID.Caption := UserSession.Target2Chosen;

    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData('before Prospect');
    end;

    dmStrat.qDeposit.Close;
    dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.ProspectChosen;
    dmStrat.cdsDeposit.Close;
    dmStrat.cdsDeposit.Open;
    dmDep.CopyDepositDataForUser(UserSession.UserID,UserSession.ProspectChosen,dmStrat.cdsDepositAPPROXAGE.AsFloat);

    //dmUser.SetDeveloperData('before GetIsoSystemCounts');
    dmDep.GetIsoSystemCounts(UserSession.UserID,UserSession.ProspectChosen,NumPb,NumSr,NumNd,NumOs,NumS,NumSO4,NumO);
    //dmUser.SetDeveloperData('Num analyses is '+IntToStr(NumPb)+'  '+IntToStr(NumS)+'  '+IntToStr(NumSO4));
    if (NumPb > 0) then iwrGraphsPb.Visible := true
                   else iwrGraphsPb.Visible := false;
    //iwrGraphsS.Visible := false;
    //if ((NumS > 0) or (NumSO4 > 0)) then iwrGraphsS.Visible := true
    //               else iwrGraphsS.Visible := false;
    //dmUser.SetDeveloperData('before Target1');

    dmStrat.qDeposit.Close;
    dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.Target1Chosen;
    dmStrat.cdsDeposit.Close;
    dmStrat.cdsDeposit.Open;
    iwlTarget1Name.Caption := dmStrat.cdsDepositDEPOSITNAME.AsString;
    dmDep.CopyDepositDataForUser(UserSession.UserID,UserSession.Target1Chosen,dmStrat.cdsDepositAPPROXAGE.AsFloat);

    dmStrat.qDeposit.Close;
    dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.Target2Chosen;
    dmStrat.cdsDeposit.Close;
    dmStrat.cdsDeposit.Open;
    iwlTarget2Name.Caption := dmStrat.cdsDepositDEPOSITNAME.AsString;
    dmDep.CopyDepositDataForUser(UserSession.UserID,UserSession.Target2Chosen,dmStrat.cdsDepositAPPROXAGE.AsFloat);

    dmStrat.qDeposit.Close;
    dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.ProspectChosen;
    dmStrat.cdsDeposit.Close;
    dmStrat.cdsDeposit.Open;
    {
    dmDep.qDepCovrProspect.Close;
    dmDep.qDepCovrProspect.ParamByName('DEPOSITID').AsString := UserSession.ProspectChosen;
    dmDep.cdsDepCovrProspect.Close;
    dmDep.cdsDepCovrProspect.Open;
    dmDep.qDepositSamplesProspect.Close;
    dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsString := UserSession.ProspectChosen;
    dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
    dmDep.cdsDepositSamplesProspect.Close;
    dmDep.cdsDepositSamplesProspect.Open;
    dmDep.qUserDepSmp.Close;
    dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
    dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.ProspectChosen;
    dmDep.cdsUserDepSmp.Close;
    dmDep.cdsUserDepSmp.Open;
    }
  end;
  iwcbProspectInc.Editable := UserSession.CanModify;
  iwcbTarget1Inc.Editable := UserSession.CanModify;
  iwcbTarget2Inc.Editable := UserSession.CanModify;
  iwcbModel.Editable := UserSession.CanModify;
  iwcbMeasuredModelChoice.Visible := UserSession.IsDeveloper;
  iwcbMeasuredModelChoice.Editable := UserSession.CanModify;
  ShowHideEditButtons;
  UpdateGraphs;
end;

procedure TISFDepositCompare.iwDBgResultsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := Trim(AValue);
  //UpdateQuery2;
  ShowHideEditButtons;
  UserSession.ParameterChosen := Trim(AValue);
end;

procedure TISFDepositCompare.iwDBgSamplesColumns0TitleClick(Sender: TObject);
begin
  dmDep.cdsDepositSamplesProspect.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
end;

procedure TISFDepositCompare.iwDBgUserSamplesColumns0TitleClick(
  Sender: TObject);
begin
  dmDep.cdsUserDepSmp.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlUserSamples.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDepositCompare.UpdateQuery2;
//var
  //i, iRec : integer;
  //tmpUnitID : integer;
begin
  dmStrat.qDeposit.Close;
  dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.ProspectChosen;
  dmStrat.cdsDeposit.Close;
  dmStrat.cdsDeposit.Open;
  //iRec := 0;
end;

procedure TISFDepositCompare.UpdateGraphs;
const
  DefaultValue : double = -999.0;
var
  i : integer;
  X, Y, Z,
  Age, Million,
  StartAge,
  MaxAge, ModelMu, ModelW,
  Start64, Start74, Start84,
  Lambda238, Lambda235,
  Lambda232 : double;
  MinX, MaxX : double;
begin
  Lambda238 := 1.55125e-10;
  Lambda235 := 9.8485e-10;
  Lambda232 := 4.9475e-11;
  StartAge := 3700.0;
  MaxAge := 3700.0;
  Start64 := 11.152;
  Start74 := 12.998;
  Start84 := 31.230;
  ModelMu := 9.74;
  ModelW := 37.19;
  Million := 1.0e6;
  MaxAge := dmStrat.cdsDepositAPPROXAGE.AsFloat + 200.0;
  ChartTL.Series[0].Clear;
  ChartTL.Series[1].Clear;
  ChartTL.Series[2].Clear;
  ChartTL.Series[3].Clear;
  ChartBL.Series[0].Clear;
  ChartBL.Series[1].Clear;
  ChartBL.Series[2].Clear;
  ChartBL.Series[3].Clear;
  ChartTR.Series[0].Clear;
  ChartTR.Series[1].Clear;
  ChartTR.Series[2].Clear;
  ChartTR.Series[3].Clear;
  ChartTR.Series[4].Clear;
  ChartTR.Series[5].Clear;
  ChartTR.Series[6].Clear;
  ChartTR.Series[7].Clear;
  ChartCoeffVar6474.Series[0].Clear;
  ChartCoeffVar6474.Series[1].Clear;
  ChartCoeffVar6474.Series[2].Clear;
  ChartCoeffVar6474.Series[3].Clear;
  ChartCoeffVar6484.Series[0].Clear;
  ChartCoeffVar6484.Series[1].Clear;
  ChartCoeffVar6484.Series[2].Clear;
  ChartCoeffVar6484.Series[3].Clear;
  ChartCoeffVar6474.Series[0].XValues.Order := loNone;
  ChartCoeffVar6474.Series[0].YValues.Order := loNone;
  ChartCoeffVar6474.Series[1].XValues.Order := loNone;
  ChartCoeffVar6474.Series[1].YValues.Order := loNone;
  ChartCoeffVar6474.Series[2].XValues.Order := loNone;
  ChartCoeffVar6474.Series[2].YValues.Order := loNone;
  ChartCoeffVar6474.Series[3].XValues.Order := loNone;
  ChartCoeffVar6474.Series[3].YValues.Order := loNone;
  ChartCoeffVar6484.Series[0].XValues.Order := loNone;
  ChartCoeffVar6484.Series[0].YValues.Order := loNone;
  ChartCoeffVar6484.Series[1].XValues.Order := loNone;
  ChartCoeffVar6484.Series[1].YValues.Order := loNone;
  ChartCoeffVar6484.Series[2].XValues.Order := loNone;
  ChartCoeffVar6484.Series[2].YValues.Order := loNone;
  ChartCoeffVar6484.Series[3].XValues.Order := loNone;
  ChartCoeffVar6484.Series[3].YValues.Order := loNone;
  dmDep.qUserDepSmp.Close;
  dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
  dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.ProspectChosen;
  dmDep.cdsUserDepSmp.Close;
  dmDep.cdsUserDepSmp.Open;
  dmDep.cdsUserDepSmp.First;
  MinX := 1.0e20;
  MaxX := -1.0e20;
  repeat
    if ((dmDep.cdsUserDepSmpINC4STATS.AsString = 'Y')) then
    begin
      if ((dmDep.cdsUserDepSmpPB64.AsFloat > 10.0) and (dmDep.cdsUserDepSmpPB84.AsFloat > 10.0)) then
      begin
        ChartTL.Series[0].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB84.AsFloat);
      end;
      if ((dmDep.cdsUserDepSmpPB64.AsFloat > 10.0) and (dmDep.cdsUserDepSmpPB74.AsFloat > 10.0)) then
      begin
        ChartBL.Series[0].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB74.AsFloat);
      end;
      if ((dmDep.cdsUserDepSmpMUSMP.AsFloat > DefaultValue) and (dmDep.cdsUserDepSmpMU.AsFloat > 0.0)) then
      begin
        ChartTR.Series[0].AddXY(dmDep.cdsUserDepSmpMUSMP.AsFloat,dmDep.cdsUserDepSmpMU.AsFloat);
        if (MinX > dmDep.cdsUserDepSmpMUSMP.AsFloat) then MinX := dmDep.cdsUserDepSmpMUSMP.AsFloat;
        if (MaxX < dmDep.cdsUserDepSmpMUSMP.AsFloat) then MaxX := dmDep.cdsUserDepSmpMUSMP.AsFloat;
      end;
    end;
    dmDep.cdsUserDepSmp.Next;
  until dmDep.cdsUserDepSmp.Eof;
  dmDep.qUserDepSmp.Close;
  dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
  dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.Target1Chosen;
  dmDep.cdsUserDepSmp.Close;
  dmDep.cdsUserDepSmp.Open;
  repeat
    if ((dmDep.cdsUserDepSmpINC4STATS.AsString = 'Y')) then
    begin
      if ((dmDep.cdsUserDepSmpPB64.AsFloat > 10.0) and (dmDep.cdsUserDepSmpPB84.AsFloat > 10.0)) then
      begin
        ChartTL.Series[1].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB84.AsFloat);
      end;
      if ((dmDep.cdsUserDepSmpPB64.AsFloat > 10.0) and (dmDep.cdsUserDepSmpPB74.AsFloat > 10.0)) then
      begin
        ChartBL.Series[1].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB74.AsFloat);
      end;
      if ((dmDep.cdsUserDepSmpMUSMP.AsFloat > DefaultValue) and (dmDep.cdsUserDepSmpMU.AsFloat > 0.0)) then
      begin
        ChartTR.Series[1].AddXY(dmDep.cdsUserDepSmpMUSMP.AsFloat,dmDep.cdsUserDepSmpMU.AsFloat);
        if (MinX > dmDep.cdsUserDepSmpMUSMP.AsFloat) then MinX := dmDep.cdsUserDepSmpMUSMP.AsFloat;
        if (MaxX < dmDep.cdsUserDepSmpMUSMP.AsFloat) then MaxX := dmDep.cdsUserDepSmpMUSMP.AsFloat;
      end;
    end;
    dmDep.cdsUserDepSmp.Next;
  until dmDep.cdsUserDepSmp.Eof;
  dmDep.qUserDepSmp.Close;
  dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
  dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.Target2Chosen;
  dmDep.cdsUserDepSmp.Close;
  dmDep.cdsUserDepSmp.Open;
  repeat
    if ((dmDep.cdsUserDepSmpINC4STATS.AsString = 'Y')) then
    begin
      if ((dmDep.cdsUserDepSmpPB64.AsFloat > 10.0) and (dmDep.cdsUserDepSmpPB84.AsFloat > 10.0)) then
      begin
        ChartTL.Series[2].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB84.AsFloat);
      end;
      if ((dmDep.cdsUserDepSmpPB64.AsFloat > 10.0) and (dmDep.cdsUserDepSmpPB74.AsFloat > 10.0)) then
      begin
        ChartBL.Series[2].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB74.AsFloat);
      end;
      if ((dmDep.cdsUserDepSmpMUSMP.AsFloat > DefaultValue) and (dmDep.cdsUserDepSmpMU.AsFloat > 0.0)) then
      begin
        ChartTR.Series[2].AddXY(dmDep.cdsUserDepSmpMUSMP.AsFloat,dmDep.cdsUserDepSmpMU.AsFloat);
        if (MinX > dmDep.cdsUserDepSmpMUSMP.AsFloat) then MinX := dmDep.cdsUserDepSmpMUSMP.AsFloat;
        if (MaxX < dmDep.cdsUserDepSmpMUSMP.AsFloat) then MaxX := dmDep.cdsUserDepSmpMUSMP.AsFloat;
      end;
    end;
    dmDep.cdsUserDepSmp.Next;
  until dmDep.cdsUserDepSmp.Eof;
  dmDep.cdsUserDepSmp.First;
  i := 0;
  repeat
    Age := 1.0*i;
    if (i = 0) then Age := Age + 0.1e-6;
    X := Start64 + ModelMu*(exp(Lambda238*Million*StartAge) - exp(Lambda238*Million*Age));
    Y := Start74 + (ModelMu/137.88)*(exp(Lambda235*Million*StartAge) - exp(Lambda235*Million*Age));
    Z := Start84 + ModelW*(exp(Lambda232*Million*StartAge) - exp(Lambda232*Million*Age));
    ChartTL.Series[3].AddXY(X,Z);
    ChartBL.Series[3].AddXY(X,Y);
    i := i + 100;
  until (Age >= MaxAge);
  for i := 4 to 7 do
  begin
    X := MinX-MinX/100.0;
    case i of
      4 : Y := 10.1;
      5 : Y := 9.74;
      6 : Y := 9.25;
      7 : Y := 8.7;
    end;
    ChartTR.Series[i].AddXY(X,Y);
    X := MinX+(MaxX-MinX)/4.0;
    ChartTR.Series[i].AddXY(X,Y);
    X := MinX+(MaxX-MinX)/2.0;
    ChartTR.Series[i].AddXY(X,Y);
    X := MaxX+MaxX/100.0;
    ChartTR.Series[i].AddXY(X,Y);
  end;
  X := 0.09;
  Y := 0.0;
  ChartCoeffVar6474.Series[3].AddXY(X,Y);
  X := 0.09;
  Y := 0.09;
  ChartCoeffVar6474.Series[3].AddXY(X,Y);
  X := 0.0;
  Y := 0.09;
  ChartCoeffVar6474.Series[3].AddXY(X,Y);
  X := 0.09;
  Y := 0.0;
  ChartCoeffVar6484.Series[3].AddXY(X,Y);
  X := 0.09;
  Y := 0.15;
  ChartCoeffVar6484.Series[3].AddXY(X,Y);
  X := 0.0;
  Y := 0.15;
  ChartCoeffVar6484.Series[3].AddXY(X,Y);
  dmDep.qDepCovrProspect.Close;
  dmDep.qDepCovrProspect.ParamByName('DepositID').AsString := UserSession.ProspectChosen;
  dmDep.cdsDepCovrProspect.Close;
  dmDep.cdsDepCovrProspect.Open;
  dmDep.cdsDepCovrProspect.Filter := 'AVERLEAST = '+''''+'A'+'''';
  dmDep.cdsDepCovrProspect.Filtered := true;
  dmDep.qDepCovrTarget1.Close;
  dmDep.qDepCovrTarget1.ParamByName('DepositID').AsString := UserSession.Target1Chosen;
  dmDep.cdsDepCovrTarget1.Close;
  dmDep.cdsDepCovrTarget1.Open;
  dmDep.cdsDepCovrTarget1.Filter := 'AVERLEAST = '+''''+'A'+'''';
  dmDep.cdsDepCovrTarget1.Filtered := true;
  dmDep.qDepCovrTarget2.Close;
  dmDep.qDepCovrTarget2.ParamByName('DepositID').AsString := UserSession.Target2Chosen;
  dmDep.cdsDepCovrTarget2.Close;
  dmDep.cdsDepCovrTarget2.Open;
  dmDep.cdsDepCovrTarget2.Filter := 'AVERLEAST = '+''''+'A'+'''';
  dmDep.cdsDepCovrTarget2.Filtered := true;
  if (iwcbMeasuredModelChoice.Checked) then
  begin
    X := dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat;
    Y := dmDep.cdsDepCovrProspectCOEFFVAR74.AsFloat;
  end else
  begin
    X := dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat;
    Y := dmDep.cdsDepCovrProspectCOEFFVAR74MODEL.AsFloat;
  end;
  ChartCoeffVar6474.Series[0].AddXY(X,Y);
  if (iwcbMeasuredModelChoice.Checked) then
  begin
    X := dmDep.cdsDepCovrTarget1COEFFVAR64.AsFloat;
    Y := dmDep.cdsDepCovrTarget1COEFFVAR74.AsFloat;
  end else
  begin
    X := dmDep.cdsDepCovrTarget1COEFFVAR64MODEL.AsFloat;
    Y := dmDep.cdsDepCovrTarget1COEFFVAR74MODEL.AsFloat;
  end;
  ChartCoeffVar6474.Series[1].AddXY(X,Y);
  if (iwcbMeasuredModelChoice.Checked) then
  begin
    X := dmDep.cdsDepCovrTarget2COEFFVAR64.AsFloat;
    Y := dmDep.cdsDepCovrTarget2COEFFVAR74.AsFloat;
  end else
  begin
    X := dmDep.cdsDepCovrTarget2COEFFVAR64MODEL.AsFloat;
    Y := dmDep.cdsDepCovrTarget2COEFFVAR74MODEL.AsFloat;
  end;
  ChartCoeffVar6474.Series[2].AddXY(X,Y);
  if (iwcbMeasuredModelChoice.Checked) then
  begin
    X := dmDep.cdsDepCovrProspectCOEFFVAR64.AsFloat;
    Y := dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat;
  end else
  begin
    X := dmDep.cdsDepCovrProspectCOEFFVAR64MODEL.AsFloat;
    Y := dmDep.cdsDepCovrProspectCOEFFVAR84.AsFloat;
  end;
  ChartCoeffVar6484.Series[0].AddXY(X,Y);
  if (iwcbMeasuredModelChoice.Checked) then
  begin
    X := dmDep.cdsDepCovrTarget1COEFFVAR64.AsFloat;
    Y := dmDep.cdsDepCovrTarget1COEFFVAR84.AsFloat;
  end else
  begin
    X := dmDep.cdsDepCovrTarget1COEFFVAR64MODEL.AsFloat;
    Y := dmDep.cdsDepCovrTarget1COEFFVAR84.AsFloat;
  end;
  ChartCoeffVar6484.Series[1].AddXY(X,Y);
  if (iwcbMeasuredModelChoice.Checked) then
  begin
    X := dmDep.cdsDepCovrTarget2COEFFVAR64.AsFloat;
    Y := dmDep.cdsDepCovrTarget2COEFFVAR84.AsFloat;
  end else
  begin
    X := dmDep.cdsDepCovrTarget2COEFFVAR64MODEL.AsFloat;
    Y := dmDep.cdsDepCovrTarget2COEFFVAR84.AsFloat;
  end;
  ChartCoeffVar6484.Series[2].AddXY(X,Y);
  dmDep.cdsDepCovrProspect.Close;
  dmDep.cdsDepCovrTarget1.Close;
  dmDep.cdsDepCovrTarget2.Close;
  dmDep.qUserDepSmp.Close;
  dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
  dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.ProspectChosen;
  dmDep.cdsUserDepSmp.Close;
  dmDep.cdsUserDepSmp.Open;
  dmDep.cdsUserDepSmp.First;
end;

end.
