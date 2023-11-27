unit IWDep_optionsGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, 
  IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  DB,
  IWRegion, IWDep_frTopBar, IWDBGrids, IWHTML40Container, IWCompGrids;

type
  TISFOptionsGrid = class(TIWAppForm)
    TopBar: TISFTopBarDep;
    iwrLeft: TIWRegion;
    iwrClientMain: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwbReturn: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwrOptionType: TIWRegion;
    iwDBgOpts: TIWDBGrid;
    iwDBnOpts: TIWDBNavigator;
    iwlOptMEditable: TIWLabel;
    iwrOptsOptions: TIWRegion;
    iwDBnOptsOptions: TIWDBNavigator;
    iwDBgOptsOptions: TIWDBGrid;
    IWLabel1: TIWLabel;
    iwDBeOptionTitle: TIWDBEdit;
    iwrOptsInterp: TIWRegion;
    IWDBNavigator1: TIWDBNavigator;
    IWDBGrid1: TIWDBGrid;
    IWLabel2: TIWLabel;
    iwDBlcbItem: TIWDBLookupComboBox;
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
    procedure ClearErrorMessages ;
    procedure ShowHideEditButtons;
  end;

implementation

uses ServerController, IWDep_uMain, IWDep_dmopt, IWDep_dm;

{$R *.dfm}


procedure TISFOptionsGrid.ShowHideEditButtons;
begin
  iwbEdit.Visible := (UserSession.CanModify and (dmOpt.cdsOptM.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmOpt.cdsOptM.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmOpt.cdsOptM.State in [dsEdit]));
  iwDBeOptionTitle.Editable := (UserSession.CanModify and (dmOpt.cdsOptsOptions.State in [dsEdit]));
  iwlOptMEditable.Visible := (dmOpt.cdsOptM.State in [dsEdit]);
  iwDBeOptionTitle.Editable := (UserSession.CanModify and (dmOpt.cdsOptMInterp.State in [dsEdit]));
end;

procedure TISFOptionsGrid.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmOpt.cdsOptM.ApplyUpdates(0);
  except
  end;
  ShowHideEditButtons;
end;

procedure TISFOptionsGrid.iwbReturnClick(Sender: TObject);
begin
  dmOpt.cdsOptM.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.ThisProgram = 'DepIso') then TISFMain.Create(WebApplication).Show;
end;

procedure TISFOptionsGrid.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

procedure TISFOptionsGrid.IWAppFormCreate(Sender: TObject);
//var
  //i : integer;
begin
  if (UserSession.ThisProgram = 'DepIso') then TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
  UserSession.DataHaveChanged := true;
  dmDep.cdsInterpretations.Close;
  dmDep.cdsInterpretations.Open;
  dmOpt.qOptM.Close;
  dmOpt.qOptM.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptM.Close;
  dmOpt.cdsOptM.Open;
  ShowHideEditButtons;
end;

procedure TISFOptionsGrid.iwbCancelUpdatesClick(Sender: TObject);
begin
  dmOpt.cdsOptM.CancelUpdates;
  ShowHideEditButtons;
end;

procedure TISFOptionsGrid.iwbEditClick(Sender: TObject);
begin
  dmOpt.cdsOptM.Edit;
  dmOpt.cdsOptsOptions.Edit;
  ShowHideEditButtons;
end;

function TISFOptionsGrid.Validate: Boolean;
//var
  //iCode : integer;
  //temp : double;
begin
  Result := true;
  ClearErrorMessages;
end;

procedure TISFOptionsGrid.ClearErrorMessages;
begin
end;

end.
