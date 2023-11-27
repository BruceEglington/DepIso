unit IWDep_definequery1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWRegion, IWDep_frTopBar;

type
  TISFDefineQuery1 = class(TIWAppForm)
    iwbNextStageOfQuery: TIWButton;
    iwcbAreas: TIWCheckBox;
    iwlAreas: TIWListbox;
    IWText1: TIWText;
    rectLeft: TIWRectangle;
    iwlblError: TIWLabel;
    iwbCancel: TIWButton;
    TopBar: TISFTopBarDep;
    iwcbDepositClans: TIWCheckBox;
    iwlDepositClans: TIWListbox;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses IWDep_dmStrat, ServerController, DB_List_Combo,
  IWDep_uMain, IWDep_constants, IWDep_definedepositquery,
  IWDep_defineprospecttargetsquery;

{$R *.dfm}


procedure TISFDefineQuery1.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
  end;
  iwlblError.Visible := false;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwcbAreas.Checked := UserSession.IncludeAreaValues;
  iwcbDepositClans.Checked := UserSession.IncludeClanValues;
  dmStrat.qCountries.Close;
  dmStrat.qCountries.SQL.Clear;
  dmStrat.qCountries.SQL.Add('SELECT COUNTRIES.COUNTRYID, COUNTRIES.COUNTRY, ');
  dmStrat.qCountries.SQL.Add('  COUNTRIES.CONTINENTID,');
  dmStrat.qCountries.SQL.Add('  CONTINENTS.CONTINENT, COUNTRIES.COUNTRYHASRECORDS,');
  dmStrat.qCountries.SQL.Add('  COUNTRIES.STARTINGVALUE,COUNTRIES.DEFAULTMAPID');
  dmStrat.qCountries.SQL.Add('from COUNTRIES, CONTINENTS');
  dmStrat.qCountries.SQL.Add('where COUNTRIES.CONTINENTID=CONTINENTS.CONTINENTID');
  dmStrat.qCountries.SQL.Add('and COUNTRIES.COUNTRYHASRECORDS = '+''''+'Y'+'''');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qCountries.SQL.Add('AND ( COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qCountries.SQL.Add('OR COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qCountries.SQL.Add(' ) ');
  end;
  dmStrat.qCountries.SQL.Add('order by COUNTRIES.COUNTRY');
  dmStrat.cdsCountries.Close;
  //dmStrat.cdsCountries.Open;
  UpdateListBoxValues(iwlAreas,dmStrat.cdsCountries,'Country','CountryID',UserSession.AreaValues);
  UpdateListBoxValues(iwlDepositClans,dmStrat.cdsClans,'DepositClan','DepositClanID',UserSession.ClanValues);
end;

procedure TISFDefineQuery1.iwbNextStageOfQueryClick(Sender: TObject);
begin
  UserSession.IncludeAreaValues := iwcbAreas.Checked;
  UserSession.IncludeClanValues := iwcbDepositClans.Checked;
  GetListBoxValues(iwlAreas,dmStrat.cdsCountries,'Country','CountryID',UserSession.AreaValues);
  GetListBoxValues(iwlDepositClans,dmStrat.cdsClans,'DepositClan','DepositClanID',UserSession.ClanValues);
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count=0)) then
  begin
    UserSession.IncludeAreaValues := false;
  end;
  if (UserSession.IncludeClanValues and (UserSession.ClanValues.Count=0)) then
  begin
    UserSession.IncludeClanValues := false;
  end;
  if Validate then
  begin
    //dmStrat.SubmitDepositQuery;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if ((UserSession.UnitSender=usDeposits))
      then TISFDefineDepositQuery.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usProspectCompare))
      then TISFDefineProspectTargetsQuery.Create(WebApplication).Show;
  end;
end;

function TISFDefineQuery1.Validate: Boolean;
begin
  Result := true;
  iwlblError.Visible := false;
  if ((UserSession.UnitSender=usDeposits) or (UserSession.UnitSender=usProspectCompare)) then
  begin
    if (not UserSession.IncludeAreaValues
    and not UserSession.IncludeClanValues) then Result := false;
    {
    if ((UserSession.AreaValues.Count = 0) and UserSession.IncludeAreaValues) then
    begin
      UserSession.IncludeAreaValues := false;
      Result := false;
    end;
    }
  end;
  if (Result = false) then
    begin
      iwlblError.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineQuery1.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'DepIso') then TISFMain.Create(WebApplication).Show;
end;

end.
