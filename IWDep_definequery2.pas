unit IWDep_definequery2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWRegion, IWDep_frTopBar;

type
  TISFDefineQuery2 = class(TIWAppForm)
    iwbSubmitQuery: TIWButton;
    iwcbUnits: TIWCheckBox;
    iwlUnits: TIWListbox;
    iwcbReferences: TIWCheckBox;
    iwlReferences: TIWListbox;
    iwcbFromDate: TIWCheckBox;
    iweFromDate: TIWEdit;
    iwcbToDate: TIWCheckBox;
    iwcbValidation: TIWCheckBox;
    iwlValidation: TIWListbox;
    iwrgOrderBy: TIWRadioGroup;
    IWLabel4: TIWLabel;
    iwbSubmitQuery2: TIWButton;
    IWText1: TIWText;
    iweToDate: TIWEdit;
    rectLeft: TIWRectangle;
    iwlblErrorTop: TIWLabel;
    iwlblErrorBottom: TIWLabel;
    IWButton1: TIWButton;
    IWButton4: TIWButton;
    IWButton8: TIWButton;
    iwbClearCheckboxes: TIWButton;
    iwbCancel: TIWButton;
    iwcbRestrictParentID: TIWCheckBox;
    iwcbFromSort: TIWCheckBox;
    iweFromSort: TIWEdit;
    iwcbToSort: TIWCheckBox;
    iweToSort: TIWEdit;
    iwcbDomains: TIWCheckBox;
    iwlDomains: TIWListbox;
    IWButton2: TIWButton;
    iwcbPeriods: TIWCheckBox;
    iwlPeriods: TIWListbox;
    IWButton3: TIWButton;
    iwcbAgeConstraints: TIWCheckBox;
    iwlAgeConstraints: TIWListbox;
    IWButton5: TIWButton;
    iwcbInc4Cht: TIWCheckBox;
    iwlInc4Cht: TIWListbox;
    IWButton6: TIWButton;
    iwcbWhoFor: TIWCheckBox;
    iwlWhoFor: TIWListbox;
    IWButton7: TIWButton;
    TopBar: TISFTopBarDep;
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

uses IWDep_dmStrat, ServerController, DB_List_Combo,
  IWDep_uMain;

{$R *.dfm}


procedure TISFDefineQuery2.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
  end;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  iwcbWhoFor.Checked := UserSession.IncludeUsersWhoForValues;
  iwcbFromDate.Checked := UserSession.IncludeDateFromValue;
  iwcbToDate.Checked := UserSession.IncludeDateToValue;
  iweFromDate.Text := UserSession.DateFromField;
  iweToDate.Text := UserSession.DateToField;
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    //dmDep.qDomains.SQL.Add('WHERE ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        //dmDep.qDomains.SQL.Add('OR DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    //dmDep.qDomains.SQL.Add(' ) ');
  end;
  //dmDep.qDomains.SQL.Add('ORDER BY DOMAINS.DOMAINNAME');
  {
  if UserSession.IsDeveloper then
  begin
    dmUser.cdsDevInfo.Open;
    dmUser.cdsDevInfo.Insert;
    dmUser.cdsDevInfoDATESAVED.AsDateTime := Now;
    dmUser.cdsDevInfoQUERYCHECK.AsString := dmDep.qDomains.SQL.Text;
    try
      dmUser.cdsDevInfo.Post;
      dmUser.cdsDevInfo.ApplyUpdates(0);
    except
    end;
    dmUser.cdsDevInfo.Close;
  end;
  }
  //dmDep.cdsDomains.Close;
  try
    if ((UserSession.OrderByValue >= '0') and (UserSession.OrderByValue <= '2')) then iwrgOrderBy.ItemIndex := StrToInt(UserSession.OrderByValue)
    else iwrgOrderBy.ItemIndex := 0;
  except
    WebApplication.ShowMessage('Error in OrderByValue. It is '+UserSession.OrderByValue);
  end;
  //UpdateListBoxValues(iwlInc4Cht,dmDep.cdsYesNo,'YesNo','YesNoID',UserSession.Inc4ChtValues);
end;

procedure TISFDefineQuery2.iwbSubmitQueryClick(Sender: TObject);
begin
  UserSession.DataHaveChanged := true;
  UserSession.OrderByValue := IntToStr(iwrgOrderBy.ItemIndex);
  UserSession.IncludeUsersWhoForValues := iwcbWhoFor.Checked;
  //GetListBoxValues(iwlWhoFor,dmDep.cdsUsersWhoFor,'WhoFor','WhoForID',UserSession.UsersWhoForValues);
  UserSession.IncludeDateFromValue := iwcbFromDate.Checked;
  UserSession.IncludeDateToValue := iwcbToDate.Checked;
  UserSession.DateFromField := iweFromDate.Text;
  UserSession.DateToField := iweToDate.Text;
  if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count=0)) then UserSession.IncludeContinentValues := false;
  if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count=0)) then UserSession.IncludeAreaValues := false;
  if ((UserSession.IncludeUsersWhoForValues) and (UserSession.UsersWhoForValues.Count=0)) then UserSession.IncludeUsersWhoForValues := false;
  begin
    dmStrat.SubmitQuery1;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFGrid.Create(WebApplication).Show
  end;
end;

procedure TISFDefineQuery2.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFDefineQuery2.Validate: Boolean;
begin
  Result := true;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  if (not UserSession.IncludeUsersWhoForValues
    and not UserSession.IncludeDateFromValue
    and not UserSession.IncludeDateToValue) then Result := false;
  if (Result = false) then
    begin
      iwlblErrorTop.Visible := true;
      iwlblErrorBottom.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineQuery2.iwbClearCheckboxesClick(Sender: TObject);
begin
  iwcbUnits.Checked := false;
  iwcbFromDate.Checked := false;
  iwcbToDate.Checked := false;
  iwcbReferences.Checked := false;
  iwcbWhoFor.Checked := false;
  iwcbValidation.Checked := false;
  iwcbRestrictParentID.Checked := false;
  iwcbFromSort.Checked := false;
  iwcbToSort.Checked := false;
  iwcbDomains.Checked := false;
  iwcbPeriods.Checked := false;
  iwcbAgeConstraints.Checked := false;
  iwcbInc4Cht.Checked := false;
end;

procedure TISFDefineQuery2.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'DepIso') then TISFMain.Create(WebApplication).Show;
end;

end.
