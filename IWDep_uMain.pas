{
  ISFMain main user window

  This is the first page the user sees when accessing this application.
}

unit IWDep_uMain;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompButton, Forms,
  IniFiles,
  IWCompRectangle, IWCompLabel, IWDBStdCtrls,
  IWCompText, IWCompExtCtrls,
  IWCompMemo, IWCompCheckbox, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion, IWDep_frTopBar,
  IWHTMLControls, jpeg, Menus, IWDep_framemenu, IWHTML40Container;

type
  TISFMain = class(TIWAppForm)
    lblWelcome: TIWLabel;
    IWLabel1: TIWLabel;
    IWLabel3: TIWLabel;
    IWDBLabel1: TIWDBLabel;
    IWDBMemo1: TIWDBMemo;
    iwlNumUses: TIWLabel;
    IWRegion1: TIWRegion;
    iwRHeader: TIWRegion;
    iwRFooter: TIWRegion;
    iwRMemo: TIWRegion;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    FrameMenu: TISFFrameMenu;
    iwbPermissions: TIWButton;
    IWRegion4: TIWRegion;
    TopBar: TISFTopBarDep;
    iwbCheckIniFile: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure iwbPermissionsClick(Sender: TObject);
    procedure iwbCheckIniFileClick(Sender: TObject);
  public
  protected
    procedure LoadWelcomeMessage;
  end;

type
  TISFMainStratClass = class of TISFMain;

implementation
{$R *.dfm}

uses
  System.IOUtils,
  ServerController, IWColor, Graphics,
  IWBaseForm, IWDep_dm, IWDep_constants, usrIW_dm;

procedure TISFMain.IWAppFormCreate(Sender: TObject);
//var
  //progstr : string;
begin
  UserSession.IsFirstShow := true;
  //progstr := WebApplication.RunParams.Values[ 'progname' ];
  UserSession.ThisProgram := 'DepIso';
  TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
  TopBar.lblWelcome.Text := 'Hello';
  FrameMenu.IWImageDepIso.Visible := true;
  FrameMenu.Compare1.Enabled := false;
  FrameMenu.OptionsUser.Visible := UserSession.IsDeveloper;
  {
  if (progstr = 'DepIso') then
  begin
    UserSession.ThisProgram := 'DepIso';
    TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
    FrameMenu.IWImageDepIso.Visible := false;
  end;
  }
  iwlNumUses.Visible := false;
  //TopBar.iwlDonate.Visible := UserSession.LoggedIn;
  if (UserSession.LoggedIn) then
  begin
    {
    dmUser.qThisProgram.Close;
    dmUser.qThisProgram.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsThisProgram.Close;
    dmUser.cdsThisProgram.Open;
    UserSession.ThisProgramName := dmUser.cdsThisProgramSOFTWARENAME.AsString;
    LoadWelcomeMessage;
    {
    dmUser.qProgress.Close;
    dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
    dmUser.cdsProgress.Close;
    dmUser.cdsProgress.Open;
    }
  end;
  {
  if ((UserSession.IsDeveloper) and (UserSession.LoggedIn)) then
  begin
    dmUser.qNumTimesUsed.Close;
    dmUser.qNumTimesUsed.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsNumTimesUsed.Close;
    dmUser.cdsNumTimesUsed.Open;
    iwlNumUses.Caption := 'This program has been used '+dmUser.cdsNumTimesUsedNUMTIMESUSED.AsString+' times';
    iwlNumUses.Visible := true;
    dmUser.cdsNumTimesUsed.Close;
  end else
  begin
    iwlNumUses.Caption := '';
  end;
  }
  FrameMenu.MainPage1.Visible := false;
  FrameMenu.New1.Visible := false;
  FrameMenu.LookupTables1.Visible := false;
  FrameMenu.Options1.Visible := true;
  //dmUser.SetDeveloperData('DepIso Main Form Create');
  if UserSession.CanInsert then
  begin
    //FrameMenu.New1.Visible := true;
    //FrameMenu.New1.Enabled := true;
  end
  else begin
    FrameMenu.New1.Visible := false;
    FrameMenu.New1.Enabled := false;
  end;
  //FrameMenu.SelectGraph1.Visible := UserSession.IsDeveloper;
  if ((UserSession.ShowDebugButtons) and (UserSession.LoggedIn)) then
  begin
    iwbPermissions.Visible := true;
    iwbCheckIniFile.Visible := true;
  end else
  begin
    iwbPermissions.Visible := false;
    iwbCheckIniFile.Visible := false;
  end;
end;

procedure TISFMain.LoadWelcomeMessage;
begin
  if  (UserSession.IsFirstShow) then
  begin
    dmUser.qProgress.Close;
    dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
    dmUser.cdsProgress.Close;
    dmUser.cdsProgress.Open;
    //UserSession.ProgressDate := dmUser.cdsProgressPROGRESSDATE.AsString;
    dmUser.cdsProgress.Close;
    dmUser.qThisProgram.Close;
    dmUser.qThisProgram.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsThisProgram.Close;
    dmUser.cdsThisProgram.Open;
    UserSession.ThisProgramName := dmUser.cdsThisProgramSOFTWARENAME.AsString;
    dmUser.cdsThisProgram.Close;
  end;
  //if UserSession.LoggedIn then
  //begin
    TopBar.lblWelcome.Text := 'User is ' + UserSession.UserDisplayName;
    TopBar.lblProgTitle.Text := UserSession.ThisProgramName;
    //TopBar.lblProgTitle.Text := dmUser.cdsThisProgramSOFTWARENAME.AsString;
    //iwlProgressDate.Caption := UserSession.ProgressDate;
  //end;
  UserSession.IsFirstShow := false;
end;

procedure TISFMain.IWAppFormRender(Sender: TObject);
begin
  FrameMenu.IWMenu1.Visible := UserSession.LoggedIn;
  //FrameMenu.SelectChart1.Visible := UserSession.LoggedIn;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if (UserSession.LoggedIn) then
  begin
    dmUser.qProgress.Close;
    dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
    dmUser.cdsProgress.Close;
    dmUser.cdsProgress.Open;
  end;
end;

procedure TISFMain.iwbCheckIniFileClick(Sender: TObject);
var
  AppIni   : TIniFile;
  //tmpStr   : string;
  //iCode    : integer;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DriverName,
  IniFileName,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  StratDBPath,
  DateViewPath,
  DBUserName, DBPassword,
  //DBSpecific,
  DBSQLDialectStr,DBCharSet,
  //DataPath   : string;
  PublicPath : string;
begin
  PublicPath := TPath.GetPublicPath;
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'depiso.ini';
  WebApplication.ShowMessage(IniFilename);
  AppIni := TIniFile.Create(IniFilename);
  try
    //URLBase := AppIni.ReadString('URLBase','URLBase','/stratdb');
    URLBase := AppIni.ReadString('URLBase','URLBase','/');
    if (URLBase = '/') then URLBase := '';
    WebApplication.ShowMessage('URLBase is ***'+URLBase+'***');
    UserControlPath := AppIni.ReadString('Paths','UserControl path','C:/Data/Firebird/UserControl2015v25.fdb');
    WebApplication.ShowMessage(UserControlPath);
    StratDBPath := AppIni.ReadString('Paths','StratDB path','C:/Data/Firebird/StratDB2012v25.fdb');
    WebApplication.ShowMessage(StratDBPath);
    DateViewPath := AppIni.ReadString('Paths','DateView path','C:/Data/Firebird/DateView2015v25.fdb');
    WebApplication.ShowMessage(DateViewPath);
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartInterBase');
    WebApplication.ShowMessage(DriverName);
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','masterkey');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Inactive');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','Inactive');
    {
    if (DebugButtons = 'Active') then UserSession.ShowDebugButtons := true;
    if (DebugDelayConnections = 'true') then UserSession.DelayConnections := true;
    DriverName=DevartInterBase
    DataBase=bromo:f:/data/firebird/usercontrol2011v25.fdb
    RoleName=
    User_Name=SYSDBA
    Password=masterkey
    SQLDialect=3
    BlobSize=-1
    ErrorResourceFile=
    LocaleCode=0000
    DevartInterBase TransIsolation=ReadCommitted
    WaitOnLocks=True
    Charset=ASCII
    CharLength=1
    EnableBCD=True
    OptimizedNumerics=True
    LongStrings=True
    UseQuoteChar=False
    FetchAll=False
    UseUnicode=False
    }
  if (UserSession.LoggedIn) then
  begin
    dmUser.qProgress.Close;
    dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
    dmUser.cdsProgress.Close;
    dmUser.cdsProgress.Open;
  end;
  finally
    AppIni.Free;
  end;
end;

procedure TISFMain.iwbPermissionsClick(Sender: TObject);
begin
  if not UserSession.IsDeveloper then WebApplication.ShowMessage('IsDeveloper is FALSE')
                                 else WebApplication.ShowMessage('IsDeveloper is TRUE');
  if not UserSession.CanModify then WebApplication.ShowMessage('CanModify is FALSE')
                                 else WebApplication.ShowMessage('CanModify is TRUE');
  if not UserSession.CanInsert then WebApplication.ShowMessage('CanInsert is FALSE')
                                 else WebApplication.ShowMessage('CanInsert is TRUE');
  if not UserSession.CanDelete then WebApplication.ShowMessage('CanDelete is FALSE')
                                 else WebApplication.ShowMessage('CanDelete is TRUE');
  if not UserSession.CanValidate then WebApplication.ShowMessage('CanValidate is FALSE')
                                 else WebApplication.ShowMessage('CanValidate is TRUE');
  if not UserSession.CanExport then WebApplication.ShowMessage('CanExportGraphValues is FALSE')
                                 else WebApplication.ShowMessage('CanExportGraphValues is TRUE');
  if not UserSession.CanViewPlus then WebApplication.ShowMessage('CanViewPlus is FALSE')
                                 else WebApplication.ShowMessage('CanViewPlus is TRUE');
  if not UserSession.CanModifyPlus then WebApplication.ShowMessage('CanModifyPlus is FALSE')
                                 else WebApplication.ShowMessage('CanModifyPlus is TRUE');
end;

procedure TISFMain.IWAppFormDestroy(Sender: TObject);
begin
  dmUser.cdsProgress.Close;
end;

initialization
  TISFMain.SetAsMainForm;
end.
