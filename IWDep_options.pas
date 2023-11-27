unit IWDep_options;

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
  TISFOptions = class(TIWAppForm)
    iwbSavePreferences: TIWButton;
    rectLeft: TIWRectangle;
    iwbCancel: TIWButton;
    TopBar: TISFTopBarDep;
    IWLabel14: TIWLabel;
    iweDateBand1: TIWEdit;
    lblDateBand1Caption: TIWLabel;
    IWLabel15: TIWLabel;
    iweDateBand1Minimum: TIWEdit;
    IWLabel16: TIWLabel;
    iweDateBand1Maximum: TIWEdit;
    lblDate1Values: TIWLabel;
    IWLabel17: TIWLabel;
    iweDateBand2: TIWEdit;
    IWLabel18: TIWLabel;
    iweDateBand2Minimum: TIWEdit;
    IWLabel19: TIWLabel;
    iweDateBand2Maximum: TIWEdit;
    IWLabel20: TIWLabel;
    iweDateBand3: TIWEdit;
    lblDateBand2Caption: TIWLabel;
    lblDate2Values: TIWLabel;
    lblDateBand3Caption: TIWLabel;
    IWLabel21: TIWLabel;
    iweDateBand3Minimum: TIWEdit;
    IWLabel22: TIWLabel;
    iweDateBand3Maximum: TIWEdit;
    IWLabel4: TIWLabel;
    iweDateBand4: TIWEdit;
    IWLabel23: TIWLabel;
    iweDateBand4Minimum: TIWEdit;
    IWLabel24: TIWLabel;
    iweDateBand4Maximum: TIWEdit;
    IWLabel25: TIWLabel;
    iweDateBand5: TIWEdit;
    IWLabel26: TIWLabel;
    iweDateBand5Minimum: TIWEdit;
    IWLabel27: TIWLabel;
    iweDateBand5Maximum: TIWEdit;
    iwrgShowAllSampleLocalities: TIWRadioGroup;
    lblShowAll: TIWLabel;
    lblDate5Values: TIWLabel;
    lblDateBand5Caption: TIWLabel;
    lblDate4Values: TIWLabel;
    lblDateBand4Caption: TIWLabel;
    lblDate3Values: TIWLabel;
    IWLabel1: TIWLabel;
    iweRatio1: TIWEdit;
    lblRatio1Caption: TIWLabel;
    IWLabel3: TIWLabel;
    iweRatio1Minimum: TIWEdit;
    IWLabel5: TIWLabel;
    iweRatio1Maximum: TIWEdit;
    lblRatio1Values: TIWLabel;
    IWLabel7: TIWLabel;
    iweRatio2: TIWEdit;
    IWLabel8: TIWLabel;
    iweRatio2Minimum: TIWEdit;
    IWLabel9: TIWLabel;
    iweRatio2Maximum: TIWEdit;
    IWLabel10: TIWLabel;
    iweRatio3: TIWEdit;
    lblRatio2Caption: TIWLabel;
    lblRatio2Values: TIWLabel;
    lblRatio3Caption: TIWLabel;
    IWLabel28: TIWLabel;
    iweRatio3Minimum: TIWEdit;
    IWLabel29: TIWLabel;
    iweRatio3Maximum: TIWEdit;
    IWLabel30: TIWLabel;
    iweRatio4: TIWEdit;
    IWLabel31: TIWLabel;
    iweRatio4Minimum: TIWEdit;
    IWLabel32: TIWLabel;
    iweRatio4Maximum: TIWEdit;
    IWLabel33: TIWLabel;
    iweRatio5: TIWEdit;
    IWLabel34: TIWLabel;
    iweRatio5Minimum: TIWEdit;
    IWLabel35: TIWLabel;
    iweRatio5Maximum: TIWEdit;
    lblRatio5Values: TIWLabel;
    lblRatio5Caption: TIWLabel;
    lblRatio4Values: TIWLabel;
    lblRatio4Caption: TIWLabel;
    lblRatio3Values: TIWLabel;
    procedure iwbSavePreferencesClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
    procedure ClearErrorMessages ;
  end;

implementation

uses ServerController, IWDep_dmopt, IWDep_uMain;

{$R *.dfm}


procedure TISFOptions.iwbSavePreferencesClick(Sender: TObject);
begin
  if Validate then
  begin
    ClearErrorMessages;
    UserSession.DateBand1Caption := iweDateBand1.Text;
    UserSession.DateBand2Caption := iweDateBand2.Text;
    UserSession.DateBand3Caption := iweDateBand3.Text;
    UserSession.DateBand4Caption := iweDateBand4.Text;
    UserSession.DateBand5Caption := iweDateBand5.Text;
    UserSession.DateBand1Minimum := iweDateBand1Minimum.Text;
    UserSession.DateBand2Minimum := iweDateBand2Minimum.Text;
    UserSession.DateBand3Minimum := iweDateBand3Minimum.Text;
    UserSession.DateBand4Minimum := iweDateBand4Minimum.Text;
    UserSession.DateBand5Minimum := iweDateBand5Minimum.Text;
    UserSession.DateBand1Maximum := iweDateBand1Maximum.Text;
    UserSession.DateBand2Maximum := iweDateBand2Maximum.Text;
    UserSession.DateBand3Maximum := iweDateBand3Maximum.Text;
    UserSession.DateBand4Maximum := iweDateBand4Maximum.Text;
    UserSession.DateBand5Maximum := iweDateBand5Maximum.Text;
    case iwrgShowAllSampleLocalities.ItemIndex of
      0 : UserSession.ShowAllSampleLocalities := true;
      1 : UserSession.ShowAllSampleLocalities := false;
    end;
    //force to show all so as to save time in map graph query
    UserSession.ShowAllSampleLocalities := true;
    UserSession.Ratio1Caption := iweRatio1.Text;
    UserSession.Ratio2Caption := iweRatio2.Text;
    UserSession.Ratio3Caption := iweRatio3.Text;
    UserSession.Ratio4Caption := iweRatio4.Text;
    UserSession.Ratio5Caption := iweRatio5.Text;
    UserSession.Ratio1Minimum := iweRatio1Minimum.Text;
    UserSession.Ratio2Minimum := iweRatio2Minimum.Text;
    UserSession.Ratio3Minimum := iweRatio3Minimum.Text;
    UserSession.Ratio4Minimum := iweRatio4Minimum.Text;
    UserSession.Ratio5Minimum := iweRatio5Minimum.Text;
    UserSession.Ratio1Maximum := iweRatio1Maximum.Text;
    UserSession.Ratio2Maximum := iweRatio2Maximum.Text;
    UserSession.Ratio3Maximum := iweRatio3Maximum.Text;
    UserSession.Ratio4Maximum := iweRatio4Maximum.Text;
    UserSession.Ratio5Maximum := iweRatio5Maximum.Text;
    if (UpperCase(UserSession.UserID) <> 'GUEST') then dmOpt.SetUserOptions3;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    {
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    }
    if (UserSession.ThisProgram = 'DepIso') then TISFMain.Create(WebApplication).Show;
  end;
end;

procedure TISFOptions.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

procedure TISFOptions.IWAppFormCreate(Sender: TObject);
//var
  //i : integer;
begin
  if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
  UserSession.DataHaveChanged := true;
  ClearErrorMessages;
  iweDateBand1.Text := UserSession.DateBand1Caption;
  iweDateBand2.Text := UserSession.DateBand2Caption;
  iweDateBand3.Text := UserSession.DateBand3Caption;
  iweDateBand4.Text := UserSession.DateBand4Caption;
  iweDateBand5.Text := UserSession.DateBand5Caption;
  iweDateBand1Minimum.Text := UserSession.DateBand1Minimum;
  iweDateBand2Minimum.Text := UserSession.DateBand2Minimum;
  iweDateBand3Minimum.Text := UserSession.DateBand3Minimum;
  iweDateBand4Minimum.Text := UserSession.DateBand4Minimum;
  iweDateBand5Minimum.Text := UserSession.DateBand5Minimum;
  iweDateBand1Maximum.Text := UserSession.DateBand1Maximum;
  iweDateBand2Maximum.Text := UserSession.DateBand2Maximum;
  iweDateBand3Maximum.Text := UserSession.DateBand3Maximum;
  iweDateBand4Maximum.Text := UserSession.DateBand4Maximum;
  iweDateBand5Maximum.Text := UserSession.DateBand5Maximum;
  if UserSession.ShowAllSampleLocalities then
  begin
    iwrgShowAllSampleLocalities.ItemIndex := 0;
  end else
  begin
    iwrgShowAllSampleLocalities.ItemIndex := 1;
  end;
  iweRatio1.Text := UserSession.Ratio1Caption;
  iweRatio2.Text := UserSession.Ratio2Caption;
  iweRatio3.Text := UserSession.Ratio3Caption;
  iweRatio4.Text := UserSession.Ratio4Caption;
  iweRatio5.Text := UserSession.Ratio5Caption;
  iweRatio1Minimum.Text := UserSession.Ratio1Minimum;
  iweRatio2Minimum.Text := UserSession.Ratio2Minimum;
  iweRatio3Minimum.Text := UserSession.Ratio3Minimum;
  iweRatio4Minimum.Text := UserSession.Ratio4Minimum;
  iweRatio5Minimum.Text := UserSession.Ratio5Minimum;
  iweRatio1Maximum.Text := UserSession.Ratio1Maximum;
  iweRatio2Maximum.Text := UserSession.Ratio2Maximum;
  iweRatio3Maximum.Text := UserSession.Ratio3Maximum;
  iweRatio4Maximum.Text := UserSession.Ratio4Maximum;
  iweRatio5Maximum.Text := UserSession.Ratio5Maximum;
end;

procedure TISFOptions.iwbCancelClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.ThisProgram = 'DepIso') then TISFMain.Create(WebApplication).Show;
end;

function TISFOptions.Validate: Boolean;
var
  iCode : integer;
  temp : double;
begin
  Result := true;
  ClearErrorMessages;
  if (Trim(iweDateBand1.Text) = '') then
    begin
      lblDateBand1Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand2.Text) = '') then
    begin
      lblDateBand2Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand3.Text) = '') then
    begin
      lblDateBand3Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand4.Text) = '') then
    begin
      lblDateBand4Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweDateBand5.Text) = '') then
    begin
      lblDateBand5Caption.Visible := true;
      Result := false;
    end;
  Val(iweDateBand1Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate1Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand2Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate2Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand3Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate3Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand4Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate4Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand5Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate5Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand1Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate1Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand2Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate2Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand3Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate3Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand4Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate4Values.Visible := true;
      Result := false;
    end;
  Val(iweDateBand5Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblDate5Values.Visible := true;
      Result := false;
    end;
  if (Trim(iweRatio1.Text) = '') then
    begin
      lblRatio1Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweRatio2.Text) = '') then
    begin
      lblRatio2Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweRatio3.Text) = '') then
    begin
      lblRatio3Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweRatio4.Text) = '') then
    begin
      lblRatio4Caption.Visible := true;
      Result := false;
    end;
  if (Trim(iweRatio5.Text) = '') then
    begin
      lblRatio5Caption.Visible := true;
      Result := false;
    end;
  Val(iweRatio1Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio1Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio2Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio2Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio3Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio3Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio4Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio4Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio5Minimum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio5Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio1Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio1Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio2Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio2Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio3Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio3Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio4Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio4Values.Visible := true;
      Result := false;
    end;
  Val(iweRatio5Maximum.Text,temp,iCode);
  if (iCode <> 0) then
    begin
      lblRatio5Values.Visible := true;
      Result := false;
    end;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFOptions.ClearErrorMessages;
begin
  lblDateBand1Caption.Visible := false;
  lblDateBand2Caption.Visible := false;
  lblDateBand3Caption.Visible := false;
  lblDateBand4Caption.Visible := false;
  lblDateBand5Caption.Visible := false;
  lblDate1Values.Visible := false;
  lblDate2Values.Visible := false;
  lblDate3Values.Visible := false;
  lblDate4Values.Visible := false;
  lblDate5Values.Visible := false;
  lblShowAll.Visible := false;
  lblRatio1Caption.Visible := false;
  lblRatio2Caption.Visible := false;
  lblRatio3Caption.Visible := false;
  lblRatio4Caption.Visible := false;
  lblRatio5Caption.Visible := false;
  lblRatio1Values.Visible := false;
  lblRatio2Values.Visible := false;
  lblRatio3Values.Visible := false;
  lblRatio4Values.Visible := false;
  lblRatio5Values.Visible := false;
end;

end.
