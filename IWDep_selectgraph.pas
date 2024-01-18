unit IWDep_selectgraph;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  Controls, Forms, IWCompButton,
  IWCompCheckbox, IWCompLabel, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompExtCtrls, IWCompListbox, IWCompRectangle,
  IWCompEdit, IWCompMemo, IWDep_frTopBar, IWHTMLControls, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWRegion;

type
  TISFSelectGraph = class(TIWAppForm)
    iwrgPlotType: TIWRadioGroup;
    IWLabel1: TIWLabel;
    iwbSubmitGraphSelection: TIWButton;
    rectLeft: TIWRectangle;
    iwbReturn: TIWButton;
    TopBar: TISFTopBarDep;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitGraphSelectionClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
  public
  end;

implementation

uses ServerController, 
  IWDep_constants, IWDep_chartmapSHP, IWDep_frDepositGrid;

{$R *.dfm}


procedure TISFSelectGraph.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFSelectGraph.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFSelectGraph.iwbSubmitGraphSelectionClick(Sender: TObject);
var
  AllOkay : boolean;
  iCode : integer;
  i : integer;
begin
  AllOkay := true;
  {
  dmDV.cdsQuerydm.Close;
  dmDV.cdsTempDataMap.Close;
  dmDV.cdsTempDataDI.Close;
  dmDV.cdsTempDataDT.Close;
  dmDV.cdsTempDataDG.Close;
  dmDV.cdsTempDataI.Close;
  }
  case iwrgPlotType.ItemIndex of
    0 : begin
      UserSession.GraphType := gtMapAgeBand;
    end;
    1 : begin
      UserSession.GraphType := gtMapRatio64;
    end;
    2 : begin
      UserSession.GraphType := gtMapRatio74;
    end;
    3 : begin
      UserSession.GraphType := gtMapRatio84;
    end;
    4 : begin
      UserSession.GraphType := gtMapMuSource;
    end;
    5 : begin
      UserSession.GraphType := gtMapRatio64Model;
    end;
    6 : begin
      UserSession.GraphType := gtMapRatio74Model;
    end;
    7 : begin
      if not UserSession.IsDeveloper then WebApplication.ShowMessage('This option is not activated for general use');
    end;
  end;
  if ((iwrgPlotType.ItemIndex in [0..6])) then
  begin
    if AllOkay then
    begin
      if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count = 1)
        and (UserSession.ContinentValues.Strings[0] <> 'UND')
        and (UserSession.ContinentValues.Strings[0] <> 'ATO')
        and (UserSession.ContinentValues.Strings[0] <> 'INO')
        and (UserSession.ContinentValues.Strings[0] <> 'PAO')) then
      begin
        UserSession.MapFileName := WebApplication.ApplicationPath+DefaultMapFolder+Trim(UserSession.ContinentValues.Strings[0])+'.shp';
        UserSession.MapDBFName := WebApplication.ApplicationPath+DefaultMapFolder+Trim(UserSession.ContinentValues.Strings[0])+'.dbf';
      end else
      begin
        UserSession.MapFileName := WebApplication.ApplicationPath+DefaultMapFolder+DefaultMapFileName;
        UserSession.MapDBFName := WebApplication.ApplicationPath+DefaultMapFolder+DefaultMapDBFName;
      end;
      UserSession.LongitudeMin := -180.0;
      UserSession.LongitudeMax := 180.0;
      UserSession.LatitudeMin := -90.0;
      UserSession.LatitudeMax := 90.0;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Release;
      TIWChartMapSHP.Create(WebApplication).Show;
    end;
  end;
  if ((UserSession.IsDeveloper) and (iwrgPlotType.ItemIndex in [7])) then  // test new query with UserOpts
  begin
    if AllOkay then
    begin
    {
      UserSession.AxisChoiceX := 'DATE';
      UserSession.AxisChoiceY := 'I';
      if not iwcbPlotTypeGrouped.Checked then
      begin
        dmgDV.cdsTempDataMap.Open;
        dmgDV.AllocateMapDataInterp2;
      end;
      if iwcbPlotTypeGrouped.Checked then
      begin
        UserSession.NumRecordsFound := 9;
        dmgDV.cdsTempDataMap.Open;
        dmgDV.AllocateMapDataInterp2Grouped;
      end;
      }
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      //TIWAppForm(WebApplication.ActiveForm).Release;
      //TISFTestAllocate.Create(WebApplication).Show;
    end;
    WebApplication.ShowMessage('Not yet implemented');
  end;
end;

procedure TISFSelectGraph.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDepositGrid.Create(WebApplication).Show;
end;

end.
