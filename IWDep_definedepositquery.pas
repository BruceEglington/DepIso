unit IWDep_definedepositquery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, 
  IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWRegion, IWDep_frTopBar;

type
  TISFDefineDepositQuery = class(TIWAppForm)
    iwbSubmitQuery: TIWButton;
    iwcbDeposits: TIWCheckBox;
    iwlDeposits: TIWListbox;
    iwcbCommodities: TIWCheckBox;
    iwlCommodities: TIWListbox;
    iwrgOrderBy: TIWRadioGroup;
    IWLabel4: TIWLabel;
    iwbSubmitQuery2: TIWButton;
    IWText1: TIWText;
    rectLeft: TIWRectangle;
    iwlblErrorTop: TIWLabel;
    iwlblErrorBottom: TIWLabel;
    IWButton4: TIWButton;
    IWButton8: TIWButton;
    iwbClearCheckboxes: TIWButton;
    iwbCancel: TIWButton;
    TopBar: TISFTopBarDep;
    iwcbRestrictParentID: TIWCheckBox;
    iwcbFromDate: TIWCheckBox;
    iweFromDate: TIWEdit;
    iwcbToDate: TIWCheckBox;
    iweToDate: TIWEdit;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbClearCheckboxesClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses ServerController, DB_List_Combo,
  usrIW_dm, IWDep_frDepositGrid, IWDep_dmStrat, IWDep_uMain;

{$R *.dfm}


procedure TISFDefineDepositQuery.IWAppFormCreate(Sender: TObject);
var
  i : integer;
  tempStr : string;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
  end;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  iwcbCommodities.Checked := UserSession.IncludeCommodityValues;
  iwcbDeposits.Checked := UserSession.IncludeDepositValues;
  iwcbRestrictParentID.Checked := not UserSession.IncludeAllParentIDs;
  iwcbFromDate.Checked := UserSession.IncludeDateFromValue;
  iwcbToDate.Checked := UserSession.IncludeDateToValue;
  iweFromDate.Text := UserSession.DateFromField;
  iweToDate.Text := UserSession.DateToField;
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count=0)) then
  begin
    UserSession.IncludeAreaValues := false;
  end;
  {Deposits}
  dmStrat.qDeposits.Close;
  dmStrat.qDeposits.SQL.Clear;
  dmStrat.qDeposits.SQL.Add('SELECT DISTINCT DEPOSITS.SDBDEPOSITID,DEPOSITS.DEPOSITNAME, ');
  tempStr := '   DEPOSITS.DEPOSITNAME || '+''''+'   ('+''''+' || DEPOSITS.SDBDEPOSITID || '+''''+') '+''''+' AS DEPOSITNAMEDEPOSITID, ';
  dmStrat.qDeposits.SQL.Add(tempStr);
  dmStrat.qDeposits.SQL.Add('DEPOSITS.DEPOSITCLANID, DEPOSITS.COUNTRYID ');
  dmStrat.qDeposits.SQL.Add('FROM DEPOSITS, COUNTRIES ');
  dmStrat.qDeposits.SQL.Add('WHERE DEPOSITS.COUNTRYID = COUNTRIES.COUNTRYID');
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qDeposits.SQL.Add('AND ( COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qDeposits.SQL.Add('OR COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qDeposits.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeAreaValues) then
  begin
    dmStrat.qDeposits.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmStrat.qDeposits.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qDeposits.SQL.Add(' ) ');
  end;
  if (UserSession.IncludeClanValues) then
  begin
    dmStrat.qDeposits.SQL.Add('AND ( DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[0]+'''');
    if (UserSession.ClanValues.Count >1) then
    begin
      for i := 2 to UserSession.ClanValues.Count do
      begin
        dmStrat.qDeposits.SQL.Add('OR DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qDeposits.SQL.Add(' ) ');
  end;
  dmStrat.qDeposits.SQL.Add('ORDER by DEPOSITS.DEPOSITNAME,DEPOSITS.SDBDEPOSITID ');
  //dmUser.SetDeveloperData(dmStrat.qDeposits.SQL.Text);
  dmStrat.cdsDeposits.Close;
  try
    if ((UserSession.OrderByValue >= '0') and (UserSession.OrderByValue <= '3')) then iwrgOrderBy.ItemIndex := StrToInt(UserSession.OrderByValue)
    else iwrgOrderBy.ItemIndex := 0;
  except
    WebApplication.ShowMessage('Error in OrderByValue. It is '+UserSession.OrderByValue);
  end;
  UpdateListBoxValues(iwlCommodities,dmStrat.cdsCommodities,'Commodity','CommodityID',UserSession.CommodityValues);
  UpdateListBoxValues(iwlDeposits,dmStrat.cdsDeposits,'DepositNameDepositID','SDBDepositID',UserSession.DepositValues);
end;

procedure TISFDefineDepositQuery.iwbSubmitQueryClick(Sender: TObject);
begin
  UserSession.DataHaveChanged := true;
  UserSession.OrderByValue := IntToStr(iwrgOrderBy.ItemIndex);
  UserSession.IncludeDepositValues := iwcbDeposits.Checked;
  UserSession.IncludeCommodityValues := iwcbCommodities.Checked;
  UserSession.IncludeAllParentIDs := not iwcbRestrictParentID.Checked;
  UserSession.IncludeDateFromValue := iwcbFromDate.Checked;
  UserSession.IncludeDateToValue := iwcbToDate.Checked;
  UserSession.DateFromField := iweFromDate.Text;
  UserSession.DateToField := iweToDate.Text;
  GetListBoxValues(iwlCommodities,dmStrat.cdsCommodities,'Commodity','CommodityID',UserSession.CommodityValues);
  GetListBoxValues(iwlDeposits,dmStrat.cdsDeposits,'DepositNameDepositID','SDBDepositID',UserSession.DepositValues);
  if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count=0)) then UserSession.IncludeAreaValues := false;
  if ((UserSession.IncludeDepositValues) and (UserSession.DepositValues.Count=0)) then UserSession.IncludeDepositValues := false;
  if ((UserSession.IncludeClanValues) and (UserSession.ClanValues.Count=0)) then UserSession.IncludeClanValues := false;
  if ((UserSession.IncludeCommodityValues) and (UserSession.CommodityValues.Count=0)) then UserSession.IncludeCommodityValues := false;
  if Validate then
  begin
    dmStrat.cdsCommodities.Close;
    dmStrat.cdsDeposits.Close;
    dmStrat.SubmitDepositQuery;
    //dmUser.SetDeveloperData(dmStrat.DepositQuery.SQL.Text);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDepositGrid.Create(WebApplication).Show
  end;
end;

procedure TISFDefineDepositQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFDefineDepositQuery.Validate: Boolean;
begin
  Result := true;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  if (not UserSession.IncludeDepositValues
    and not UserSession.IncludeClanValues
    and not UserSession.IncludeAllParentIDs
    and not UserSession.IncludeDateFromValue
    and not UserSession.IncludeDateToValue
    and not UserSession.IncludeCommodityValues) then Result := false;
  if (Result = false) then
    begin
      iwlblErrorTop.Visible := true;
      iwlblErrorBottom.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineDepositQuery.iwbClearCheckboxesClick(Sender: TObject);
begin
  iwcbCommodities.Checked := false;
  iwcbDeposits.Checked := false;
end;

procedure TISFDefineDepositQuery.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'DepIso') then TISFMain.Create(WebApplication).Show;
end;

end.
