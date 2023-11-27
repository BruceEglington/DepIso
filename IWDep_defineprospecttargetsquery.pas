unit IWDep_defineprospecttargetsquery;

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
  TISFDefineProspectTargetsQuery = class(TIWAppForm)
    iwbSubmitQuery: TIWButton;
    rectLeft: TIWRectangle;
    iwlblErrorTop: TIWLabel;
    iwbCancel: TIWButton;
    TopBar: TISFTopBarDep;
    IWLabel1: TIWLabel;
    iwcbProspect: TIWComboBox;
    IWLabel2: TIWLabel;
    iwcbTarget2: TIWComboBox;
    IWLabel3: TIWLabel;
    iwcbTarget1: TIWComboBox;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses ServerController, DB_List_Combo,
  usrIW_dm, IWDep_frDepositGrid, IWDep_dmStrat, IWDep_depositcompare;

{$R *.dfm}


procedure TISFDefineProspectTargetsQuery.IWAppFormCreate(Sender: TObject);
//var
  //i : integer;
  //tempStr : string;
begin
  iwlblErrorTop.Visible := false;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
  end;
  iwlblErrorTop.Visible := false;
  {User limited list of Deposits}
  //dmStrat.DepositQuery.Close;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStrat.qDeposits.SQL.Text);
  end;

  UpdateComboBoxValue(iwcbProspect,dmStrat.cdsDepositQuery,'DepositName','SDBDepositID',UserSession.ProspectChosen);
  UpdateComboBoxValue(iwcbTarget1,dmStrat.cdsDepositQuery,'DepositName','SDBDepositID',UserSession.Target1Chosen);
  UpdateComboBoxValue(iwcbTarget2,dmStrat.cdsDepositQuery,'DepositName','SDBDepositID',UserSession.Target2Chosen);
end;

procedure TISFDefineProspectTargetsQuery.iwbSubmitQueryClick(Sender: TObject);
begin
  UserSession.DataHaveChanged := true;
  GetComboBoxValue(iwcbProspect,dmStrat.cdsDepositQuery,'DepositName','SDBDepositID',UserSession.ProspectChosen);
  GetComboBoxValue(iwcbTarget1,dmStrat.cdsDepositQuery,'DepositName','SDBDepositID',UserSession.Target1Chosen);
  GetComboBoxValue(iwcbTarget2,dmStrat.cdsDepositQuery,'DepositName','SDBDepositID',UserSession.Target2Chosen);
  if Validate then
  begin

    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(UserSession.ProspectChosen+'***'+UserSession.Target1Chosen+'***'+UserSession.Target2Chosen);
    end;

    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDepositCompare.Create(WebApplication).Show;
  end;
end;

procedure TISFDefineProspectTargetsQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFDefineProspectTargetsQuery.Validate: Boolean;
var
  iCheck, iCode : integer;
begin
  Result := true;
  iwlblErrorTop.Visible := false;
  Val(UserSession.ProspectChosen,iCheck,iCode);
  if ((iCheck = 0) or (iCode <> 0)) then Result := false;
  Val(UserSession.Target1Chosen,iCheck,iCode);
  if ((iCheck = 0) or (iCode <> 0)) then Result := false;
  Val(UserSession.Target2Chosen,iCheck,iCode);
  if ((iCheck = 0) or (iCode <> 0)) then Result := false;
  if (Result = false) then
    begin
      iwlblErrorTop.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineProspectTargetsQuery.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'DepIso') then TISFDepositGrid.Create(WebApplication).Show;
end;

end.
