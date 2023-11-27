  unit IWDep_depositcovr;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWCompGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  DB, IWBaseHTMLControl, IWCompRectangle, IWCompCheckbox,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWDep_frTopBar, VCLTee.TeEngine, Series, ExtCtrls, VCLTee.TeeProcs,
  VCLTee.DBChart, IWCompExtCtrls,
  //VCLTee.TeeJPEG,
  IWCompTeeChart, VCLTee.Chart, IWHTML40Container, VclTee.TeeGDIPlus;

type
  TISFDepositDetails = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel11: TIWLabel;
    IWDBEdit11: TIWDBEdit;
    iwbDetailsEdit: TIWButton;
    IWDBEdit3: TIWDBEdit;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
    rectLeft: TIWRectangle;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWRegion1: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwrDepositDetails: TIWRegion;
    iwrStatisticsPb: TIWRegion;
    IWLabel19: TIWLabel;
    iwbApplyUpdates: TIWButton;
    iwrClientAll: TIWRegion;
    iwrBottomButtons: TIWRegion;
    IWLabel26: TIWLabel;
    iwDBlcbClan: TIWDBLookupComboBox;
    iwbCancelUpdates: TIWButton;
    IWLabel28: TIWLabel;
    iwDBlcbOtherDatabase: TIWDBLookupComboBox;
    IWLabel31: TIWLabel;
    iwDBlcbCountry: TIWDBLookupComboBox;
    IWLabel7: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel8: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    TopBar: TISFTopBarDep;
    IWLabel16: TIWLabel;
    IWDBEdit12: TIWDBEdit;
    IWLabel4: TIWLabel;
    IWDBEdit10: TIWDBEdit;
    IWLabel17: TIWLabel;
    IWDBEdit13: TIWDBEdit;
    IWLabel18: TIWLabel;
    IWDBEdit15: TIWDBEdit;
    IWLabel21: TIWLabel;
    IWDBEdit16: TIWDBEdit;
    IWLabel22: TIWLabel;
    IWLabel23: TIWLabel;
    IWLabel24: TIWLabel;
    IWDBEdit17: TIWDBEdit;
    IWDBEdit18: TIWDBEdit;
    IWLabel25: TIWLabel;
    IWDBEdit19: TIWDBEdit;
    IWDBEdit20: TIWDBEdit;
    IWDBEdit21: TIWDBEdit;
    IWLabel27: TIWLabel;
    IWDBEdit22: TIWDBEdit;
    IWDBEdit23: TIWDBEdit;
    IWLabel29: TIWLabel;
    IWDBEdit24: TIWDBEdit;
    IWDBEdit25: TIWDBEdit;
    IWDBEdit26: TIWDBEdit;
    IWLabel30: TIWLabel;
    IWDBEdit27: TIWDBEdit;
    IWDBEdit28: TIWDBEdit;
    IWLabel32: TIWLabel;
    IWDBEdit29: TIWDBEdit;
    IWDBEdit30: TIWDBEdit;
    IWDBEdit31: TIWDBEdit;
    IWLabel33: TIWLabel;
    IWDBEdit32: TIWDBEdit;
    IWDBEdit33: TIWDBEdit;
    IWLabel34: TIWLabel;
    IWDBEdit34: TIWDBEdit;
    IWDBEdit35: TIWDBEdit;
    IWDBEdit36: TIWDBEdit;
    IWLabel35: TIWLabel;
    IWDBEdit37: TIWDBEdit;
    IWDBEdit38: TIWDBEdit;
    IWLabel36: TIWLabel;
    IWDBEdit39: TIWDBEdit;
    IWDBEdit40: TIWDBEdit;
    IWDBEdit41: TIWDBEdit;
    IWLabel37: TIWLabel;
    IWDBEdit42: TIWDBEdit;
    IWDBEdit43: TIWDBEdit;
    IWLabel38: TIWLabel;
    IWDBEdit44: TIWDBEdit;
    IWDBEdit45: TIWDBEdit;
    IWDBEdit46: TIWDBEdit;
    IWLabel39: TIWLabel;
    IWLabel40: TIWLabel;
    IWLabel41: TIWLabel;
    IWDBEdit47: TIWDBEdit;
    IWDBEdit48: TIWDBEdit;
    IWLabel42: TIWLabel;
    IWDBEdit49: TIWDBEdit;
    IWDBEdit50: TIWDBEdit;
    IWDBEdit51: TIWDBEdit;
    IWLabel43: TIWLabel;
    IWDBEdit52: TIWDBEdit;
    IWDBEdit53: TIWDBEdit;
    IWLabel44: TIWLabel;
    IWDBEdit54: TIWDBEdit;
    IWDBEdit55: TIWDBEdit;
    IWDBEdit56: TIWDBEdit;
    IWLabel45: TIWLabel;
    IWDBEdit57: TIWDBEdit;
    IWDBEdit58: TIWDBEdit;
    c: TIWRegion;
    IWLabel9: TIWLabel;
    iwDBgSamples: TIWDBGrid;
    iwlSamples: TIWLabel;
    iwDBnSamples: TIWDBNavigator;
    iwbAddSampleLink: TIWButton;
    iwbDeleteSampleLink: TIWButton;
    IWDBGrid1: TIWDBGrid;
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
    iwbSampleChangeIncluded: TIWButton;
    iwbUserSampleChangeIncluded: TIWButton;
    iwcbDataInc: TIWCheckBox;
    iwcbDataExcl: TIWCheckBox;
    iwcbModel: TIWCheckBox;
    IWLabel13: TIWLabel;
    IWLabel14: TIWLabel;
    IWLabel15: TIWLabel;
    iweMinAge: TIWEdit;
    iweMaxAge: TIWEdit;
    iwbSetMinMaxAge: TIWButton;
    IWLabel20: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    IWDBEdit8: TIWDBEdit;
    IWDBEdit9: TIWDBEdit;
    IWLabel46: TIWLabel;
    IWLabel47: TIWLabel;
    IWLabel48: TIWLabel;
    IWLabel49: TIWLabel;
    iwbMarkSampleFracDepositAsUnknown: TIWButton;
    iwbDeleteVariableLink: TIWButton;
    IWLabel50: TIWLabel;
    iwDBlcbGeodynamicSetting: TIWDBLookupComboBox;
    iwDBlcbDatingType: TIWDBLookupComboBox;
    IWLabel51: TIWLabel;
    IWDBEdit14: TIWDBEdit;
    IWLabel52: TIWLabel;
    Series8: TLineSeries;
    iwcbMixture: TIWCheckBox;
    Series9: TLineSeries;
    iwcbGrowth: TIWCheckBox;
    IWLabel53: TIWLabel;
    IWDBEdit59: TIWDBEdit;
    IWDBEdit60: TIWDBEdit;
    IWDBEdit61: TIWDBEdit;
    IWDBEdit62: TIWDBEdit;
    IWDBEdit63: TIWDBEdit;
    IWDBEdit64: TIWDBEdit;
    IWDBEdit65: TIWDBEdit;
    IWDBEdit66: TIWDBEdit;
    IWDBEdit67: TIWDBEdit;
    IWDBEdit68: TIWDBEdit;
    iwmExplanation: TIWMemo;
    iwbUpdateLinksGraphs: TIWButton;
    iwbDownload: TIWButton;
    iwrStatisticsOther: TIWRegion;
    IWLabel54: TIWLabel;
    IWLabel55: TIWLabel;
    IWDBEdit69: TIWDBEdit;
    IWLabel56: TIWLabel;
    IWDBEdit70: TIWDBEdit;
    IWLabel57: TIWLabel;
    IWDBEdit71: TIWDBEdit;
    IWLabel58: TIWLabel;
    IWDBEdit72: TIWDBEdit;
    IWLabel59: TIWLabel;
    IWDBEdit73: TIWDBEdit;
    IWLabel60: TIWLabel;
    IWLabel61: TIWLabel;
    IWLabel62: TIWLabel;
    IWDBEdit74: TIWDBEdit;
    IWDBEdit75: TIWDBEdit;
    IWLabel63: TIWLabel;
    IWDBEdit76: TIWDBEdit;
    IWDBEdit77: TIWDBEdit;
    IWDBEdit78: TIWDBEdit;
    IWLabel64: TIWLabel;
    IWDBEdit79: TIWDBEdit;
    IWDBEdit80: TIWDBEdit;
    IWLabel65: TIWLabel;
    IWDBEdit81: TIWDBEdit;
    IWDBEdit82: TIWDBEdit;
    IWDBEdit83: TIWDBEdit;
    IWLabel72: TIWLabel;
    IWDBEdit94: TIWDBEdit;
    IWDBEdit95: TIWDBEdit;
    IWLabel73: TIWLabel;
    IWDBEdit96: TIWDBEdit;
    IWDBEdit97: TIWDBEdit;
    IWDBEdit98: TIWDBEdit;
    IWLabel74: TIWLabel;
    IWDBEdit99: TIWDBEdit;
    IWDBEdit100: TIWDBEdit;
    IWLabel75: TIWLabel;
    IWDBEdit101: TIWDBEdit;
    IWDBEdit102: TIWDBEdit;
    IWDBEdit103: TIWDBEdit;
    IWLabel76: TIWLabel;
    IWLabel77: TIWLabel;
    IWLabel78: TIWLabel;
    IWDBEdit104: TIWDBEdit;
    IWDBEdit105: TIWDBEdit;
    IWLabel79: TIWLabel;
    IWDBEdit106: TIWDBEdit;
    IWDBEdit107: TIWDBEdit;
    IWDBEdit108: TIWDBEdit;
    IWLabel84: TIWLabel;
    IWDBEdit120: TIWDBEdit;
    IWDBEdit121: TIWDBEdit;
    IWDBEdit122: TIWDBEdit;
    IWDBEdit125: TIWDBEdit;
    IWDBEdit126: TIWDBEdit;
    IWDBEdit127: TIWDBEdit;
    iwrStatistics: TIWRegion;
    IWLabel85: TIWLabel;
    iwbCalculateCovr: TIWButton;
    iwDBnStatistics: TIWDBNavigator;
    IWDBEdit177: TIWDBEdit;
    iwrGraphsS: TIWRegion;
    IWLabel68: TIWLabel;
    IWChart1: TIWChart;
    IWChart3: TIWChart;
    IWCheckBox1: TIWCheckBox;
    IWCheckBox2: TIWCheckBox;
    IWLabel69: TIWLabel;
    IWLabel70: TIWLabel;
    IWLabel71: TIWLabel;
    IWEdit1: TIWEdit;
    IWEdit2: TIWEdit;
    IWButton1: TIWButton;
    IWMemo1: TIWMemo;
    IWLabel80: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    IWDBEdit84: TIWDBEdit;
    IWLabel81: TIWLabel;
    IWDBEdit85: TIWDBEdit;
    IWDBEdit86: TIWDBEdit;
    IWDBEdit87: TIWDBEdit;
    IWDBEdit88: TIWDBEdit;
    IWLabel82: TIWLabel;
    IWDBEdit89: TIWDBEdit;
    IWDBEdit90: TIWDBEdit;
    IWLabel83: TIWLabel;
    IWDBEdit91: TIWDBEdit;
    IWDBEdit92: TIWDBEdit;
    IWDBEdit93: TIWDBEdit;
    IWDBEdit109: TIWDBEdit;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbDetailsEditClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwDBgResultsColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbCalculateCovrClick(Sender: TObject);
    procedure iwDBgSamplesColumns0TitleClick(Sender: TObject);
    procedure iwbDeleteSampleLinkClick(Sender: TObject);
    procedure iwDBgUserSamplesColumns0TitleClick(Sender: TObject);
    procedure iwbUserSampleChangeIncludedClick(Sender: TObject);
    procedure iwcbDataIncClick(Sender: TObject);
    procedure iwbSetMinMaxAgeClick(Sender: TObject);
    procedure iwbSampleChangeIncludedClick(Sender: TObject);
    procedure iwbMarkSampleFracDepositAsUnknownClick(Sender: TObject);
    procedure iwbDeleteVariableLinkClick(Sender: TObject);
    procedure iwbUpdateLinksGraphsClick(Sender: TObject);
    procedure iwDBgSamplesColumns0Click(ASender: TObject; const AValue: string);
    procedure iwDBgUserSamplesColumns0Click(ASender: TObject;
      const AValue: string);
    procedure iwbDownloadClick(Sender: TObject);
  public
    procedure UpdateQuery2;
    procedure ShowHideEditButtons;
    procedure UpdateGraphs;
  end;

implementation

{$R *.dfm}

uses
  ServerController, Graphics, IWColor,
  JPEG,
  IWDep_constants, IWDep_frDepositGrid,
  IWDep_dm, IWDep_dmStrat, usrIW_dm;

procedure TISFDepositDetails.IWAppFormDestroy(Sender: TObject);
begin
  dmStrat.cdsClans.Close;
  dmStrat.cdsCountryContinents.Close;
  dmDep.cdsDepCovrProspect.Close;
  dmDep.cdsDepositSamplesProspect.Close;
end;

procedure TISFDepositDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
  end;
end;

procedure TISFDepositDetails.ShowHideEditButtons;
begin
  iwbDetailsEdit.Visible := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsBrowse]));
  iwbDetailsEdit2.Visible := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsEdit]));
  iwDBlcbCountry.Editable := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsEdit]));
  iwDBlcbClan.Editable := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsEdit]));
  iwDBlcbOtherDatabase.Editable := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsEdit]));
  iwDBlcbDatingType.Editable := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsEdit]));
  iwDBlcbGeodynamicSetting.Editable := (UserSession.CanModify and (dmStrat.cdsDeposit.State in [dsEdit]));
  iwbAddSampleLink.Enabled := (UserSession.CanModify and (dmDep.cdsDepositSamplesProspect.State in [dsBrowse]));
  iwbDeleteSampleLink.Enabled := (UserSession.CanDelete and (dmDep.cdsDepositSamplesProspect.State in [dsBrowse]));
  iwbDeleteVariableLink.Enabled := (UserSession.CanDelete and (dmDep.cdsVarProspect.State in [dsBrowse]));
  iwbMarkSampleFracDepositAsUnknown.Enabled := (UserSession.CanDelete and (dmDep.cdsDepositSamplesProspect.State in [dsBrowse]));
  iwbCalculateCovr.Enabled := (UserSession.CanModify and (dmDep.cdsDepositSamplesProspect.State in [dsBrowse]));
  iwbDownload.Enabled := (UserSession.CanExport and (dmDep.cdsDepositSamplesProspect.State in [dsBrowse]));
end;

procedure TISFDepositDetails.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsClans.Close;
  dmStrat.cdsOtherDatabases.Close;
  dmStrat.cdsCountryContinents.Close;
  dmStrat.cdsDatingTypes.Close;
  dmStrat.cdsGeodynamicSettings.Close;
  dmDep.cdsDepCovrProspect.Close;
  dmDep.cdsDepositSamplesProspect.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDepositGrid.Create(WebApplication).Show
end;

procedure TISFDepositDetails.iwbSampleChangeIncludedClick(Sender: TObject);
begin
  try
    dmDep.cdsDepositSamplesProspect.Edit;
    if (dmDep.cdsDepositSamplesProspectINCL4STATS.AsString = 'N')
      then dmDep.cdsDepositSamplesProspectINCL4STATS.AsString := 'Y'
      else dmDep.cdsDepositSamplesProspectINCL4STATS.AsString := 'N';
    dmDep.cdsDepositSamplesProspect.Post;
    dmDep.cdsDepositSamplesProspect.ApplyUpdates(0);
  except
  end;
end;

procedure TISFDepositDetails.iwbSetMinMaxAgeClick(Sender: TObject);
var
  //i,
  iCode : integer;
  X, Y, Z,
  Age, Million,
  StartAge, MinAge, MaxAge,
  ModelMu, ModelW,
  Start64, Start74, Start84,
  Lambda238, Lambda235,
  Lambda232 : double;
begin
  Lambda238 := DecayConst238;
  Lambda235 := DecayConst235;
  Lambda232 := DecayConst232;
  StartAge := SKAge_Stage2;
  MinAge := 0.0;
  MaxAge := SKAge_Stage2;
  Start64 := SK64_Stage2;
  Start74 := SK74_Stage2;
  Start84 := SK84_Stage2;
  ModelMu := SKmu_Stage2;
  ModelW := SKW_Stage2;
  Million := 1.0e6;
  try
    Val(iweMinAge.Text,MinAge,iCode);
    Val(iweMaxAge.Text,MaxAge,iCode);
    iweMinAge.Text := FormatFloat('###0.0',MinAge);
    iweMaxAge.Text := FormatFloat('###0.0',MaxAge);
  except
  end;
  ChartTL.Series[2].Clear;
  ChartBL.Series[2].Clear;
  ChartTR.Series[2].Clear;
  Age := MinAge;
  repeat
    //Age := 1.0*i;
    if (Age <= 0.0) then Age := Age + 0.1e-6;
    X := Start64 + ModelMu*(exp(Lambda238*Million*StartAge) - exp(Lambda238*Million*Age));
    Y := Start74 + (ModelMu/U238U235)*(exp(Lambda235*Million*StartAge) - exp(Lambda235*Million*Age));
    Z := Start84 + ModelW*(exp(Lambda232*Million*StartAge) - exp(Lambda232*Million*Age));
    ChartTL.Series[2].AddXY(X,Z);
    ChartBL.Series[2].AddXY(X,Y);
    Age := Age + 100.0;
  until (Age >= MaxAge);
end;

procedure TISFDepositDetails.iwbUpdateLinksGraphsClick(Sender: TObject);
var
  tAge : double;
begin
  tAge := dmStrat.cdsDepositAPPROXAGE.AsFloat;
  dmDep.CopyDepositDataForUser(UserSession.UserID,dmDep.cdsDepositSamplesProspectDEPOSITID.AsString,tAge);
  UpdateGraphs;
  dmDep.qDepositSamplesProspect.Close;
  dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
  dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
  dmDep.cdsDepositSamplesProspect.Close;
  dmDep.cdsDepositSamplesProspect.Open;
  dmDep.qUserDepSmp.Close;
  dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
  dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.RecordChosen;
  dmDep.cdsUserDepSmp.Close;
  dmDep.cdsUserDepSmp.Open;
end;

procedure TISFDepositDetails.iwbUserSampleChangeIncludedClick(Sender: TObject);
begin
  try
    dmDep.cdsUserDepSmp.Edit;
    if (dmDep.cdsUserDepSmpINC4STATS.AsString = 'N') then dmDep.cdsUserDepSmpINC4STATS.AsString := 'Y'
                                                     else dmDep.cdsUserDepSmpINC4STATS.AsString := 'N';
    dmDep.cdsUserDepSmp.Post;
    dmDep.cdsUserDepSmp.ApplyUpdates(0);
  except
  end;
  UpdateGraphs;
end;

procedure TISFDepositDetails.iwcbDataIncClick(Sender: TObject);
begin
  ChartTL.Series[0].Visible := iwcbDataInc.Checked;
  ChartTL.Series[1].Visible := iwcbDataExcl.Checked;
  ChartTL.Series[2].Visible := iwcbModel.Checked;
  ChartBL.Series[0].Visible := iwcbDataInc.Checked;
  ChartBL.Series[1].Visible := iwcbDataExcl.Checked;
  ChartBL.Series[2].Visible := iwcbModel.Checked;
  ChartBL.Series[3].Visible := iwcbMixture.Checked;
  ChartBL.Series[4].Visible := iwcbGrowth.Checked;
  ChartTR.Series[0].Visible := iwcbDataInc.Checked;
  ChartTR.Series[1].Visible := iwcbDataExcl.Checked;
end;

procedure TISFDepositDetails.iwbCalculateCovrClick(Sender: TObject);
var
  tDepositID : integer;
  tAge, tmpAge : double;
  NumSamplesAvailable : integer;
  WasSuccessful : boolean;
  Slope : double;
  Pb74, Pb64 : double;
  DatingTypeID_ModelPb : integer;
begin
  WasSuccessful := true;
  DatingTypeID_ModelPb := 6; // hard coded for now
  tDepositID := dmStrat.cdsDepositSDBDEPOSITID.AsInteger;
  tAge := dmStrat.cdsDepositAPPROXAGE.AsFloat;
  dmDep.qCountDepositSamplesProspect.Close;
  dmDep.qCountDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
  dmDep.cdsCountDepositSamplesProspect.Close;
  dmDep.cdsCountDepositSamplesProspect.Open;
  NumSamplesAvailable := dmDep.cdsCountDepositSamplesProspectCOUNT.AsInteger;
  dmDep.cdsCountDepositSamplesProspect.Close;
  if (NumSamplesAvailable > 0) then
  begin
    //WebApplication.ShowMessage(UserSession.UserID+'  '+dmStrat.cdsDepositSDBDEPOSITID.AsString+'  '+dmStrat.cdsDepositAPPROXAGE.AsString);
    if (tAge >= SKAge_Stage1) then
    begin
      // get least radiogenic sample values
      // calculate 207/206 for sample relative to SK starting composition
      //calculate PbModelAge
      dmDep.FindLeastRadiogenicSample(tDepositID,Pb64,Pb74);
      //dmUser.SetDeveloperData('7/4***'+FormatFloat('##0.000',Pb74));
      //dmUser.SetDeveloperData('6/4***'+FormatFloat('##0.000',Pb64));
      if (((Pb64 - SK64_Stage2) > 0.0) and (Pb64 > 0.0) and (Pb74 > 0.0) and (Pb64 < SK64_Modern)) then
      begin
        Slope :=  (Pb74 - SK74_Stage2) / (Pb64 - SK64_Stage2);
        //dmUser.SetDeveloperData('slope***'+FormatFloat('##0.000',Slope));
        tmpAge := dmDep.PbModelAge(Slope);
        //dmUser.SetDeveloperData('PbAge***'+FormatFloat('###0.000',tmpAge));
        if (tmpAge > 0.0) then
        begin
          tAge := tmpAge;
          dmStrat.qDeposit.Close;
          dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsInteger := tDepositID;
          dmStrat.cdsDeposit.Close;
          dmStrat.cdsDeposit.Open;
          dmStrat.cdsDeposit.Edit;
          dmStrat.cdsDepositAPPROXAGE.AsFloat := tAge;
          dmStrat.cdsDepositAPPROXAGEUNCERTAINTY.AsFloat := 333.33;
          dmStrat.cdsDepositDATINGTYPEID.AsInteger := DatingTypeID_ModelPb;
          dmStrat.cdsDeposit.Post;
          try
            dmStrat.cdsDeposit.ApplyUpdates(0);
          except
          end;
        end;
      end else
      begin
        //change age to 4990 to show a recalculation has been attempted but the data preclude a model age being derived
        tAge := 4990.0;
        dmStrat.qDeposit.Close;
        dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsInteger := tDepositID;
        dmStrat.cdsDeposit.Close;
        dmStrat.cdsDeposit.Open;
        dmStrat.cdsDeposit.Edit;
        dmStrat.cdsDepositAPPROXAGE.AsFloat := tAge;
        dmStrat.cdsDepositAPPROXAGEUNCERTAINTY.AsFloat := 333.33;
        dmStrat.cdsDepositDATINGTYPEID.AsInteger := 0;
        dmStrat.cdsDeposit.Post;
        try
          dmStrat.cdsDeposit.ApplyUpdates(0);
        except
        end;
      end;
    end;
    dmDep.CalculateCoVarAvg(tDepositID,tAge);
    dmDep.CalculateCoVarLeastRadiogenic(tDepositID,tAge);
    dmDep.CalculateCoVarMostRadiogenic(tDepositID,tAge);
    dmDep.CopyDepositDataForUser(UserSession.UserID,IntToStr(tDepositID),tAge);
    dmDep.qDepositSamplesProspect.Close;
    dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
    dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
    dmDep.cdsDepositSamplesProspect.Close;
    dmDep.cdsDepositSamplesProspect.Open;
    dmDep.qUserDepSmp.Close;
    dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
    dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.RecordChosen;
    dmDep.cdsUserDepSmp.Close;
    dmDep.cdsUserDepSmp.Open;
    UpdateGraphs;
  end else
  begin
    dmDep.DeleteDepositStatistics(tDepositID,WasSuccessful);
  end;
end;

procedure TISFDepositDetails.iwbCancelUpdatesClick(Sender: TObject);
begin
  dmStrat.cdsDeposit.CancelUpdates;
  ShowHideEditButtons;
end;

procedure TISFDepositDetails.iwbDeleteSampleLinkClick(Sender: TObject);
Var
  tAge : double;
  WasSuccessful : boolean;
  tDepositID : integer;
  tSampleNo, tFrac : string;
  NumSamplesAvailable : integer;
begin
  NumSamplesAvailable := 0;
  WasSuccessful := true;
  if (UserSession.CanDelete) then
  begin
    tDepositID := dmDep.cdsDepositSamplesProspectDEPOSITID.AsInteger;
    tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
    tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
    dmDep.DeleteDepositSampleFrac(tDepositID,tSampleNo,tFrac,WasSuccessful);
    if WasSuccessful then
    begin
      tAge := dmStrat.cdsDepositAPPROXAGE.AsFloat;
      dmDep.CopyDepositDataForUser(UserSession.UserID,dmDep.cdsDepositSamplesProspectDEPOSITID.AsString,tAge);
      UpdateGraphs;
      dmDep.qDepositSamplesProspect.Close;
      dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
      dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
      dmDep.cdsDepositSamplesProspect.Close;
      dmDep.cdsDepositSamplesProspect.Open;
      dmDep.qUserDepSmp.Close;
      dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
      dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.RecordChosen;
      dmDep.cdsUserDepSmp.Close;
      dmDep.cdsUserDepSmp.Open;
      dmDep.qCountDepositSamplesProspect.Close;
      dmDep.qCountDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
      dmDep.cdsCountDepositSamplesProspect.Close;
      dmDep.cdsCountDepositSamplesProspect.Open;
      NumSamplesAvailable := dmDep.cdsCountDepositSamplesProspectCOUNT.AsInteger;
      dmDep.cdsCountDepositSamplesProspect.Close;
      if (NumSamplesAvailable > 0) then
      begin
        iwbCalculateCovrClick(Sender);
      end else
      begin
        dmDep.DeleteDepositStatistics(tDepositID,WasSuccessful);
      end;
    end else
    begin
      WebApplication.ShowMessage('Not able to link Sample+Frac to Unknown deposit');
    end;
  end;
end;

procedure TISFDepositDetails.iwbDetailsEditClick(Sender: TObject);
begin
  dmStrat.cdsDeposit.Edit;
  ShowHideEditButtons;
end;

procedure TISFDepositDetails.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  //l,i : integer;
begin
  dmDep.cdsUserDepSmp.First;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStrat.qRep1.SQL.Text);
  end;
  //dmDep.FlexCelReportDepCount.Template := DefaultFlexCellFolder+'FlxDepCount.xlsx';
  //dmDep.FlexCelReportUserDepSmp.Template := DefaultFlexCellFolder+'FlxDepIsoUserDepSmp.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDepIsoUserDepSmp.xlsx';
  frFileNameStr := 'Deposits_'+dmStrat.cdsDepositDEPOSITNAME.AsString+'.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUserDepSmp',dmDep.cdsUserDepSmp);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFDepositDetails.iwbMarkSampleFracDepositAsUnknownClick(
  Sender: TObject);
Var
  tAge : double;
  WasSuccessful : boolean;
  tDepositID : integer;
  tSampleNo, tFrac : string;
  NumSamplesAvailable : integer;
begin
  NumSamplesAvailable := 0;
  WasSuccessful := true;
  if (UserSession.CanDelete) then
  begin
    tDepositID := dmDep.cdsDepositSamplesProspectDEPOSITID.AsInteger;
    tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
    tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
    dmDep.MarkSampleFracAsUnknownDeposit(tDepositID,tSampleNo,tFrac,WasSuccessful);
    if WasSuccessful then
    begin
      tAge := dmStrat.cdsDepositAPPROXAGE.AsFloat;
      dmDep.CopyDepositDataForUser(UserSession.UserID,dmDep.cdsDepositSamplesProspectDEPOSITID.AsString,tAge);
      UpdateGraphs;
      dmDep.qDepositSamplesProspect.Close;
      dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
      dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
      dmDep.cdsDepositSamplesProspect.Close;
      dmDep.cdsDepositSamplesProspect.Open;
      dmDep.qUserDepSmp.Close;
      dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
      dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.RecordChosen;
      dmDep.cdsUserDepSmp.Close;
      dmDep.cdsUserDepSmp.Open;
      dmDep.qCountDepositSamplesProspect.Close;
      dmDep.qCountDepositSamplesProspect.ParamByName('DEPOSITID').AsInteger := tDepositID;
      dmDep.cdsCountDepositSamplesProspect.Close;
      dmDep.cdsCountDepositSamplesProspect.Open;
      NumSamplesAvailable := dmDep.cdsCountDepositSamplesProspectCOUNT.AsInteger;
      dmDep.cdsCountDepositSamplesProspect.Close;
      if (NumSamplesAvailable > 0) then
      begin
        iwbCalculateCovrClick(Sender);
      end else
      begin
        dmDep.DeleteDepositStatistics(tDepositID,WasSuccessful);
      end;
    end else
    begin
      WebApplication.ShowMessage('Not able to link Sample+Frac to Unknown deposit');
    end;
  end;
end;

procedure TISFDepositDetails.IWAppFormCreate(Sender: TObject);
var
  i, iRec : integer;
  NumPb,NumSr,NumNd,NumOs,NumS,NumSO4,NumO : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
    dmStrat.cdsClans.Close;
    dmStrat.cdsOtherDatabases.Close;
    dmStrat.cdsCountryContinents.Close;
    dmStrat.cdsDatingTypes.Close;
    dmStrat.cdsGeodynamicSettings.Close;
    //dmUser.SetDeveloperData('FormCreate 1 ');
    dmStrat.qDeposit.Close;
    dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
    dmStrat.cdsDeposit.Close;
    dmStrat.cdsDeposit.Open;
    //dmUser.SetDeveloperData('FormCreate 2 ');
    dmStrat.cdsClans.Open;
    dmStrat.cdsOtherDatabases.Open;
    dmStrat.cdsCountryContinents.Open;
    dmStrat.cdsDatingTypes.Open;
    dmStrat.cdsGeodynamicSettings.Open;
    //dmUser.SetDeveloperData('FormCreate 3 ');
    dmDep.qDepCovrProspect.Close;
    dmDep.qDepCovrProspect.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
    dmDep.cdsDepCovrProspect.Close;
    dmDep.cdsDepCovrProspect.Open;
    //dmUser.SetDeveloperData('FormCreate 4 ');
    dmDep.qDepositSamplesProspect.Close;
    dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
    dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
    dmDep.cdsDepositSamplesProspect.Close;
    dmDep.cdsDepositSamplesProspect.Open;
    //dmUser.SetDeveloperData('FormCreate 5 ');
    dmDep.qUserDepSmp.Close;
    dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
    dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.RecordChosen;
    dmDep.cdsUserDepSmp.Close;
    dmDep.cdsUserDepSmp.Open;
    dmDep.GetIsoSystemCounts(UserSession.UserID,UserSession.RecordChosen,NumPb,NumSr,NumNd,NumOs,NumS,NumSO4,NumO);
    //dmUser.SetDeveloperData('Num analyses is '+IntToStr(NumPb)+'  '+IntToStr(NumS)+'  '+IntToStr(NumSO4));
    if (NumPb > 0) then iwrGraphsPb.Visible := true
                   else iwrGraphsPb.Visible := false;
    iwrGraphsS.Visible := false;
    //if ((NumS > 0) or (NumSO4 > 0)) then iwrGraphsS.Visible := true
    //               else iwrGraphsS.Visible := false;
  end;
  iwcbDataInc.Editable := UserSession.CanViewPlus;
  iwcbDataExcl.Editable := UserSession.CanViewPlus;
  iwcbModel.Editable := UserSession.CanViewPlus;
  iwcbMixture.Editable := UserSession.CanViewPlus;
  iwcbGrowth.Editable := UserSession.CanViewPlus;
  //dmUser.SetDeveloperData('FormCreate 6 ');
  ShowHideEditButtons;
  //dmUser.SetDeveloperData('FormCreate 7 ');
  UpdateGraphs;
  //dmUser.SetDeveloperData('FormCreate 8 ');
end;

procedure TISFDepositDetails.iwDBgResultsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := Trim(AValue);
  //UpdateQuery2;
  ShowHideEditButtons;
  UserSession.ParameterChosen := Trim(AValue);
end;

procedure TISFDepositDetails.iwDBgSamplesColumns0Click(ASender: TObject;
  const AValue: string);
begin
  dmDep.cdsDepositSamplesProspect.Locate('SAMPLENO',AValue,[]);
end;

procedure TISFDepositDetails.iwDBgSamplesColumns0TitleClick(Sender: TObject);
begin
  dmDep.cdsDepositSamplesProspect.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSamples.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDepositDetails.iwDBgUserSamplesColumns0Click(ASender: TObject;
  const AValue: string);
begin
  dmDep.cdsUserDepSmp.Locate('SAMPLENO',AValue,[]);
end;

procedure TISFDepositDetails.iwDBgUserSamplesColumns0TitleClick(
  Sender: TObject);
begin
  dmDep.cdsUserDepSmp.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlUserSamples.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDepositDetails.UpdateQuery2;
//var
  //i, iRec : integer;
  //tmpUnitID : integer;
begin
  dmStrat.qDeposit.Close;
  dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
  dmStrat.cdsDeposit.Close;
  dmStrat.cdsDeposit.Open;
  //iRec := 0;
end;

procedure TISFDepositDetails.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsDeposit.ApplyUpdates(0);
  except
  end;
  try
    //dmReplicate.ReplicateChanges('ttNoTrace');
  except
  end;
  ShowHideEditButtons;
end;

procedure TISFDepositDetails.UpdateGraphs;
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
  MinY, MaxY : double;
  mustart,muend,muworking : double;
  MinXInc, MinYInc : double;
  DepositAge : double;
  Min64, Min74 : double;
  iCountSamplesAvailable : integer;
begin
  //dmUser.SetDeveloperData('starting UpdateGraphs');
  Lambda238 := DecayConst238;
  Lambda235 := DecayConst235;
  Lambda232 := DecayConst232;
  StartAge := SKAge_Stage2;
  MaxAge := SKAge_Stage2;
  Start64 := SK64_Stage2;
  Start74 := SK74_Stage2;
  Start84 := SK84_Stage2;
  ModelMu := SKmu_Stage2;
  ModelW := SKW_Stage2;
  Million := 1.0e6;
  DepositAge := dmStrat.cdsDepositAPPROXAGE.AsFloat;
  MaxAge := dmStrat.cdsDepositAPPROXAGE.AsFloat + 200.0;
  ChartTL.Series[0].Clear;
  ChartTL.Series[1].Clear;
  ChartTL.Series[2].Clear;
  ChartBL.Series[0].Clear;
  ChartBL.Series[1].Clear;
  ChartBL.Series[2].Clear;
  ChartBL.Series[3].Clear;
  ChartBL.Series[4].Clear;
  ChartTR.Series[0].Clear;
  ChartTR.Series[1].Clear;
  ChartTR.Series[2].Clear;
  ChartTR.Series[3].Clear;
  ChartTR.Series[4].Clear;
  ChartTR.Series[5].Clear;
  ChartTR.Series[6].Clear;
  dmDep.qUserDepSmp.Close;
  dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
  dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.RecordChosen;
  dmDep.cdsUserDepSmp.Close;
  dmDep.cdsUserDepSmp.Open;
  dmDep.cdsUserDepSmp.First;
  iCountSamplesAvailable := dmDep.cdsUserDepSmp.RecordCount;
  MinX := 1.0e9;
  MaxX := -1.0e9;
  MinY := 1.0e9;
  MaxY := -1.0e9;
  MinXInc := MinX;
  MinYInc := MinY;
  if (iCountSamplesAvailable > 0) then
  begin
    //dmUser.SetDeveloperData('iCountSamplesAvailable = '+IntToStr(iCountSamplesAvailable));
    repeat
      if (dmDep.cdsUserDepSmpINC4STATS.AsString = 'Y') then
      begin
        if ((dmDep.cdsUserDepSmpPB64.AsFloat > 10.0)) then
        begin
          if ((dmDep.cdsUserDepSmpPB84.AsFloat > 10.0)) then ChartTL.Series[0].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB84.AsFloat);
          if ((dmDep.cdsUserDepSmpPB74.AsFloat > 10.0)) then ChartBL.Series[0].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB74.AsFloat);
          if ((dmDep.cdsUserDepSmpPB74.AsFloat > 10.0)) then ChartTR.Series[0].AddXY(dmDep.cdsUserDepSmpMUSMP.AsFloat,dmDep.cdsUserDepSmpMU.AsFloat);
        end;
        if (dmDep.cdsUserDepSmpMUSMP.AsFloat > DefaultValue) then
        begin
          if (MinXInc > dmDep.cdsUserDepSmpMUSMP.AsFloat) then MinXInc := dmDep.cdsUserDepSmpMUSMP.AsFloat;
          if (MinYInc > dmDep.cdsUserDepSmpMU.AsFloat) then MinYInc := dmDep.cdsUserDepSmpMU.AsFloat;
        end;
      end;
      if (dmDep.cdsUserDepSmpINC4STATS.AsString = 'N') then
      begin
        if ((dmDep.cdsUserDepSmpPB64.AsFloat > 10.0)) then
        begin
          if ((dmDep.cdsUserDepSmpPB84.AsFloat > 10.0)) then ChartTL.Series[1].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB84.AsFloat);
          if ((dmDep.cdsUserDepSmpPB74.AsFloat > 10.0)) then ChartBL.Series[1].AddXY(dmDep.cdsUserDepSmpPB64.AsFloat,dmDep.cdsUserDepSmpPB74.AsFloat);
          if ((dmDep.cdsUserDepSmpPB74.AsFloat > 10.0)) then ChartTR.Series[1].AddXY(dmDep.cdsUserDepSmpMUSMP.AsFloat,dmDep.cdsUserDepSmpMu.AsFloat);
        end;
      end;
      if (dmDep.cdsUserDepSmpMUSMP.AsFloat > DefaultValue) then
      begin
        if (MinX > dmDep.cdsUserDepSmpMUSMP.AsFloat) then MinX := dmDep.cdsUserDepSmpMUSMP.AsFloat;
        if (MaxX < dmDep.cdsUserDepSmpMUSMP.AsFloat) then MaxX := dmDep.cdsUserDepSmpMUSMP.AsFloat;
        if (MinY > dmDep.cdsUserDepSmpMU.AsFloat) then MinY := dmDep.cdsUserDepSmpMU.AsFloat;
        if (MaxY < dmDep.cdsUserDepSmpMU.AsFloat) then MaxY := dmDep.cdsUserDepSmpMU.AsFloat;
      end;
      dmDep.cdsUserDepSmp.Next;
    until dmDep.cdsUserDepSmp.Eof;
    // model evolution curves
    i := 0;
    repeat
      Age := 1.0*i;
      if (i = 0) then Age := Age + 0.1e-6;
      X := Start64 + ModelMu*(exp(Lambda238*Million*StartAge) - exp(Lambda238*Million*Age));
      Y := Start74 + (ModelMu/U238U235)*(exp(Lambda235*Million*StartAge) - exp(Lambda235*Million*Age));
      Z := Start84 + ModelW*(exp(Lambda232*Million*StartAge) - exp(Lambda232*Million*Age));
      ChartTL.Series[2].AddXY(X,Z);
      ChartBL.Series[2].AddXY(X,Y);
      i := i + 100;
    until (Age >= MaxAge);
    // model mu source plot
    for i := 3 to 6 do
    begin
      X := MinX-MinX/100.0;
      case i of
        3 : Y := 10.1;
        4 : Y := SKmu_Stage2;
        5 : Y := 9.25;
        6 : Y := 8.7;
      end;
      ChartTR.Series[i].AddXY(X,Y);
      X := MinX+(MaxX-MinX)/4.0;
      ChartTR.Series[i].AddXY(X,Y);
      X := MinX+(MaxX-MinX)/2.0;
      ChartTR.Series[i].AddXY(X,Y);
      X := MaxX+MaxX/100.0;
      ChartTR.Series[i].AddXY(X,Y);
    end;
    if ((MinYInc < 1.0e8) and (DepositAge < SKAge_Stage2)) then
    begin
      //Model mixture curve
      mustart := MinYInc;
      if (mustart > 0.9e9) then mustart := MinY;
      muend := MaxY;
      //dmUser.SetDeveloperData('Model mixture curve. mustart = '+FormatFloat('###0.000',mustart));
      //dmUser.SetDeveloperData('Model mixture curve. muend = '+FormatFloat('###0.000',muend));
      if (muend = mustart) then muend := mustart + 0.001;
      muworking := mustart;
      DepositAge := dmStrat.cdsDepositAPPROXAGE.AsFloat;
      repeat
        //if (i = 0) then Age := Age + 0.1e-6;
        X := Start64 + muworking*(exp(Lambda238*Million*StartAge) - exp(Lambda238*Million*DepositAge));
        Y := Start74 + (muworking/U238U235)*(exp(Lambda235*Million*StartAge) - exp(Lambda235*Million*DepositAge));
        ChartBL.Series[3].AddXY(X,Y);
        muworking := muworking + (muend - mustart)/20.0;
      until (muworking > muend);
      //S&K mu=9.74 growth from deposit age to present
      DepositAge := dmStrat.cdsDepositAPPROXAGE.AsFloat;
      muworking := mustart;
      Min64 := Start64 + muworking*(exp(Lambda238*Million*StartAge) - exp(Lambda238*Million*DepositAge));
      Min74 := Start74 + (muworking/U238U235)*(exp(Lambda235*Million*StartAge) - exp(Lambda235*Million*DepositAge));
      repeat
        X := Min64 + muworking*(exp(Lambda238*Million*DepositAge) - 1.0);
        Y := Min74 + (muworking/U238U235)*(exp(Lambda235*Million*DepositAge) - 1.0);
        //WebApplication.ShowMessage('mu = '+FormatFloat('###0.000',muworking)+' X = '+FormatFloat('###0.000',X)+' Y = '+FormatFloat('###0.000',Y));
        ChartBL.Series[4].AddXY(X,Y);
        muworking := muworking - ModelMu/20.0;
      until (muworking < 0.0);
    end;
  end;
  dmDep.cdsUserDepSmp.First;
end;

procedure TISFDepositDetails.iwbDeleteVariableLinkClick(Sender: TObject);
Var
  tAge : double;
  WasSuccessful : boolean;
  tVariableID : string;
  tSampleNo, tFrac : string;
begin
  WasSuccessful := true;
  if (UserSession.CanDelete) then
  begin
    tVariableID := dmDep.cdsVarProspectVARIABLEID.AsString;
    tSampleNo := dmDep.cdsDepositSamplesProspectSAMPLENO.AsString;
    tFrac := dmDep.cdsDepositSamplesProspectFRAC.AsString;
    dmDep.DeleteSampleFracVariable(tSampleNo,tFrac,tVariableID,WasSuccessful);
    if WasSuccessful then
    begin
      tAge := dmStrat.cdsDepositAPPROXAGE.AsFloat;
      dmDep.CopyDepositDataForUser(UserSession.UserID,dmDep.cdsDepositSamplesProspectDEPOSITID.AsString,tAge);
      UpdateGraphs;
      dmDep.qDepositSamplesProspect.Close;
      dmDep.qDepositSamplesProspect.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
      dmDep.qVarProspect.ParamByName('USERID').AsString := UserSession.UserID;
      dmDep.cdsDepositSamplesProspect.Close;
      dmDep.cdsDepositSamplesProspect.Open;
      dmDep.qUserDepSmp.Close;
      dmDep.qUserDepSmp.ParamByName('UserID').AsString := UserSession.UserID;
      dmDep.qUserDepSmp.ParamByName('DepositID').AsString := UserSession.RecordChosen;
      dmDep.cdsUserDepSmp.Close;
      dmDep.cdsUserDepSmp.Open;
    end else
    begin
      WebApplication.ShowMessage('Not able to link Sample+Frac to Unknown deposit');
    end;
  end;
end;

end.
