unit IWDep_definequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWRegion, IWDep_frTopBar;

type
  TISFDefineQuery = class(TIWAppForm)
    iwcbContinents: TIWCheckBox;
    iwbNextStageOfQuery: TIWButton;
    iwlContinents: TIWListbox;
    IWText1: TIWText;
    rectLeft: TIWRectangle;
    iwlblError: TIWLabel;
    iwbCancel: TIWButton;
    TopBar: TISFTopBarDep;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses IWDep_dmStrat, ServerController, IWDep_definequery1, DB_List_Combo,
  IWDep_uMain, IWDep_constants;

{$R *.dfm}


procedure TISFDefineQuery.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
  end;
  dmStrat.cdsContinents.Close;
  dmStrat.qContinents.Close;
  dmStrat.qContinents.SQL.Clear;
  dmStrat.qContinents.SQL.Add('SELECT * FROM CONTINENTS');
  dmStrat.qContinents.SQL.Add('WHERE CONTINENTS.HASDATA='+''''+'Y'+'''');
  iwlblError.Visible := false;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwcbContinents.Checked := true;
  iwcbContinents.Visible := false;
  UpdateListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
end;

procedure TISFDefineQuery.iwbNextStageOfQueryClick(Sender: TObject);
begin
  //UserSession.IncludeContinentValues := iwcbContinents.Checked;
  UserSession.IncludeContinentValues := true;
  GetListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  if Validate then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    {
    if ((UserSession.UnitSender=usDetailsEdit) or (UserSession.UnitSender=usDetails))
    then TISFDefineQuery1.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usDomains))
      then TISFDefineDomainQuery2.Create(WebApplication).Show;
    if ((UserSession.UnitSender=usLIPs))
      then TISFDefineLIPQuery.Create(WebApplication).Show;
    }
    if ((UserSession.UnitSender=usDeposits))
      then TISFDefineQuery1.Create(WebApplication).Show;
  end;
end;

procedure TISFDefineQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UpdateListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  end;
end;

function TISFDefineQuery.Validate: Boolean;
begin
  Result := true;
  iwlblError.Visible := false;
  if ((UserSession.ContinentValues.Count = 0) and UserSession.IncludeContinentValues) then
  begin
    UserSession.IncludeContinentValues := true;
    Result := false;
    iwlblError.Visible := true;
  end;
  if (Result = false) then
    begin
      Exit;
    end;
end;

procedure TISFDefineQuery.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'DepIso') then TISFMain.Create(WebApplication).Show;
end;

end.
