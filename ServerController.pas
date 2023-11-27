unit ServerController;

interface

uses
  Windows,
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  IniFiles,
  IW.Browser.Browser,
  IW.Common.AppInfo,
  iwglobal,
  midaslib,
  usrIW_dm, IWApplication, IWAppForm,
  IWDep_constants, IWDep_dm, IWDep_dmgraphics, IWDep_dmopt,
  IWDep_dmStrat;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(aSession: TIWApplication);
    procedure IWServerControllerBaseGetMainForm(var vMainForm: TIWBaseForm);
  private
    procedure GetIniFile;
  public
  end;

  // This is a class which you can add variables to that are specific to the user. Add variables
  // to this class instead of creating global variables. This object can references by using:
  //   UserSession
  // So if a variable named UserName of type string is added, it can be referenced by using:
  //   UserSession.UserName
  // Such variables are similar to globals in a normal application, however these variables are
  // specific to each user.
  //
  // See the IntraWeb Manual for more details.
  TUserSession = class(TComponent)
  public
    LoggedIn : boolean; // User logged in or not
    LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only

    UserID, UserPassword, UserDisplayName : string;

    //UserLastName, UserFirstName, UserEMail : string;
    //UserAccessRights : TStringList;
    IsFirstShow : boolean;
    ThisProgram : string;
    ThisProgramName : string;
    CanView : boolean;
    CanModify : boolean;
    CanInsert : boolean;
    CanDelete : boolean;
    IsDeveloper : boolean;
    CanValidate : boolean;
    CanExport : boolean;
    CanViewPlus : boolean;
    CanModifyPlus : boolean;
    //UserSessionID : integer;
    ThisLoginTime : TDateTime;
    DoMemCheck : boolean;
    //NumUserRightsItems : integer;

    NumRecordsFound : integer;

    RecordChosen : string;
    ParameterChosen: string;
    UnitSender : string;
    Parameter2Chosen : string;

    NumRecordsPerPage : integer;
    PageNum, PageNumTotal : integer;

    IncludeContinentValues : boolean;
    ContinentValues : TStringList;
    IncludeAreaValues : boolean;
    AreaValues : TStringList;
    IncludeDateFromValue: Boolean;
    DateFromField: string;
    IncludeDateToValue: Boolean;
    DateToField: string;
    OrderByValue: string;
    IncludeUsersWhoForValues : Boolean;
    UsersWhoForValues : TStringList;
    IncludeDepositValues : boolean;
    DepositValues : TStringList;
    IncludeClanValues : boolean;
    ClanValues : TStringList;
    IncludeCommodityValues : boolean;
    CommodityValues : TStringList;
    IncludeAllParentIDs : boolean;
    ProspectChosen : string;
    Target1Chosen : string;
    Target2Chosen : string;
    ShowAllSampleLocalities : boolean;

    GraphType : string;
    FromAge, ToAge : double;
    AxisChoiceX, AxisChoiceY : string;
    DataHaveChanged : boolean;
    Xtra, Xtra1,
    Xtra2, Xtra3      :  array [0..MaxSamp] of double;
    NumberOfPoints    :  integer;
    StartAtX, EndAtX,
    StartAtY, EndAtY,
    StartAtZ, EndAtZ  : double;

    DateBand1Caption, DateBand2Caption, DateBand3Caption,
    DateBand4Caption, DateBand5Caption: string;
    DateBand1Minimum, DateBand1Maximum, DateBand2Minimum, DateBand2Maximum,
    DateBand3Minimum, DateBand3Maximum, DateBand4Minimum, DateBand4Maximum,
    DateBand5Minimum, DateBand5Maximum: string;
    Ratio1Caption, Ratio2Caption, Ratio3Caption,
    Ratio4Caption, Ratio5Caption: string;
    Ratio1Minimum, Ratio1Maximum, Ratio2Minimum, Ratio2Maximum,
    Ratio3Minimum, Ratio3Maximum, Ratio4Minimum, Ratio4Maximum,
    Ratio5Minimum, Ratio5Maximum: string;

    GroupBy: string;
    Group1Caption, Group2Caption, Group3Caption, Group4Caption,
    Group5Caption : string;

    MapFileName : string;
    MapDBFName : string;
    MapFieldName : string;
    MapValueFieldName : string;
    UseDBF : boolean;
    HORZSIZE, VERTSIZE : integer;
    ShowDebugButtons : boolean;
    ShowWebErrorMessages : boolean;
    DelayConnections : boolean;

    IncludeCoordinates : boolean;
    SWLat, SWLon, NELat, NELon : string;
    LongitudeMin, LongitudeMax,
    LatitudeMin, LatitudeMax : double;

    WhereAmI :  string;  // string used to identify where one is in program process
    LC : integer;    // counter to identify unneeded iterations through data when graphing

    dmUser : TdmUser;
    dmDep : TdmDep;
    dmOpt : TdmOpt;
    dmStrat : TdmStrat;
    dmgDV : TdmgDV;
    //dmReplicate : TdmReplicate;


    procedure NeedLogin(AForm : TIWAppFormClass);
    procedure AfterLogin;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetCookies;
    procedure GetCookies;
    procedure GetStringsValues(AStrings: TStrings; AKey: String; AValueList: TStringList);
    procedure MakeDonation(AForm: TIWAppFormClass);
    procedure AfterDonate;
  end;

// Procs
  function UserSession: TUserSession;
  function IWServerController: TIWServerController;

implementation
{$R *.dfm}

uses
  System.IOUtils,
  IWInit, usr_uLogin, usr_uregister, XMLDoc, XMLIntf, IWDep_umain,
  usr_uDBInterface, usr_uDonate, IWDep_constvalues,
  usr_constants;

function IWServerController: TIWServerController;
begin
  //Result := TIWServerController(GServerController);  //for use with cgdevtools use with Octagate
  Result := TIWServerController(GServerController);
end;

function UserSession: TUserSession;
begin
  Result := TUserSession(WebApplication.Data);
end;

procedure TIWServerController.GetIniFile;
var
  AppIni   : TIniFile;
  //tmpStr   : string;
  //iCode    : integer;
  DebugButtons,
  ShowWebErrorMessages,
  DebugDelayConnections,
  URLBase,
  DBMonitor,
  DriverName,
  LibraryName, VendorLib, GetDriverFunc,
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
  //tDecayConst238, tDecayConst235, tDecayConst232,
  //tU238U235, tAge74Dominant : double;
begin
  PublicPath := TPath.GetPublicPath;
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'depiso.ini';
  AppIni := TIniFile.Create(IniFilename);
  DBMonitor := 'Inactive';
  UserSession.ShowDebugButtons := false;
  UserSession.ShowWebErrorMessages := false;
  UserSession.DelayConnections := false;
  DriverName := 'DevartFirebird';
  LibraryName := 'dbexpida41.dll';
  VendorLib := 'fbclient.dll';
  GetDriverFunc := 'getSQLDriverFirebird';
  DBUserName := 'SYSDBA';
  DBPassword := 'masterkey';
  DBSQLDialectStr := '3';
  DBCharSet := 'ASCII';
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/depiso');
    //URLBase := AppIni.ReadString('URLBase','URLBase','/depiso');
    if (URLBase = '/') then URLBase := '';
    UserControlPath := AppIni.ReadString('Paths','UserControl path','C:\Data\Firebird\UserControl2021v30.fdb');
    StratDBPath := AppIni.ReadString('Paths','StratDB path','C:\Data\Firebird\StratDB2021v30.fdb');
    DateViewPath := AppIni.ReadString('Paths','DateView path','C:\Data\Firebird\DateView2021v30.fdb');
    LibraryName := AppIni.ReadString('Parameters','LibraryName','dbexpida41.dll');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','fbclient.dll');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','V0lcano3^');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','Inactive');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Active');
    ShowWebErrorMessages := AppIni.ReadString('Debug','WebErrorMessages','InActive');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','true');
    if (DebugButtons = 'Active') then UserSession.ShowDebugButtons := true;
    if (ShowWebErrorMessages = 'Active') then UserSession.ShowWebErrorMessages := true;
    if (DebugDelayConnections = 'true') then UserSession.DelayConnections := true;

    FromEmailAddress := AppIni.ReadString('Email','FromEmailAddress','aht820@usask.ca');
    FromName := AppIni.ReadString('Email','FromName','EggSoft developer and database administrator');
    HostName := AppIni.ReadString('Email','HostName','smtp.office365.com');
    HostPort := AppIni.ReadString('Email','HostPort','587');
    EmailUserID := AppIni.ReadString('Email','EmailUserID','aht820@usask.ca');
    EmailPassword := AppIni.ReadString('Email','EmailPassword','nuC7Sy3Af4bu');
    URLonTerminate := AppIni.ReadString('URL','URLonTerminate','https://sil.usask.ca');
    FromEmailAddress := Trim(FromEmailAddress);
    FromName := Trim(FromName);
    HostName := Trim(HostName);
    HostPort := Trim(HostPort);
    EmailUserID := Trim(EmailUserID);
    EmailPassword := Trim(EmailPassword);
    URLonTerminate := Trim(URLonTerminate);

    DecayConst238 := AppIni.ReadFloat('UThPb','DecayConst238',1.55125e-10);
    DecayConst235 := AppIni.ReadFloat('UThPb','DecayConst235',9.8485e-10);
    DecayConst232 := AppIni.ReadFloat('UThPb','DecayConst232',4.9475e-11);
    U238U235 := AppIni.ReadFloat('UThPb','U238U235',137.88);
    Age74Dominant := AppIni.ReadFloat('UThPb','Age74Dominant',542.0);

    //DecayConst238 := tDecayConst238;

    {
    DriverName=DevartInterBase
    DataBase=bromo:f:\data\firebird\usercontrol2011v25.fdb
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
  //define connection parameters for UserControl connection
  dmUser.sqlcWebUser.Connected := false;
  dmUser.sqlcWebUser.Params.Clear;
  dmUser.sqlcWebUser.DriverName := DriverName;
  dmUser.sqlcWebUser.LibraryName := LibraryName;
  dmUser.sqlcWebUser.VendorLib := VendorLib;
  dmUser.sqlcWebUser.GetDriverFunc := GetDriverFunc;
  dmUser.sqlcWebUser.Params.Append('DriverName='+DriverName);
  dmUser.sqlcWebUser.Params.Append('Database='+UserControlPath);
  dmUser.sqlcWebUser.Params.Append('User_Name='+DBUserName);
  dmUser.sqlcWebUser.Params.Append('Password='+DBPassword);
  dmUser.sqlcWebUser.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmUser.sqlcWebUser.Params.Append('Charset='+DBCharSet);
  dmUser.sqlcWebUser.Params.Append('LocaleCode=0000');
  dmUser.sqlcWebUser.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmUser.sqlcWebUser.Params.Append('WaitOnLocks=True');
  dmUser.sqlcWebUser.Params.Append('CharLength=1');
  dmUser.sqlcWebUser.Params.Append('EnableBCD=True');
  dmUser.sqlcWebUser.Params.Append('OptimizedNumerics=false');
  dmUser.sqlcWebUser.Params.Append('LongStrings=True');
  dmUser.sqlcWebUser.Params.Append('UseQuoteChar=False');
  dmUser.sqlcWebUser.Params.Append('FetchAll=False');
  dmUser.sqlcWebUser.Params.Append('UseUnicode=False');
  //define connection parameters for StratDB connection
  dmStrat.sqlcStrat.Connected := false;
  dmStrat.sqlcStrat.Params.Clear;
  dmStrat.sqlcStrat.LibraryName := LibraryName;
  dmStrat.sqlcStrat.VendorLib := VendorLib;
  dmStrat.sqlcStrat.GetDriverFunc := GetDriverFunc;
  dmStrat.sqlcStrat.Params.Append('DriverName='+DriverName);
  dmStrat.sqlcStrat.Params.Append('Database='+StratDBPath);
  dmStrat.sqlcStrat.Params.Append('User_Name='+DBUserName);
  dmStrat.sqlcStrat.Params.Append('Password='+DBPassword);
  dmStrat.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmStrat.sqlcStrat.Params.Append('Charset='+DBCharSet);
  dmStrat.sqlcStrat.Params.Append('LocaleCode=0000');
  dmStrat.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmStrat.sqlcStrat.Params.Append('WaitOnLocks=True');
  dmStrat.sqlcStrat.Params.Append('CharLength=1');
  dmStrat.sqlcStrat.Params.Append('EnableBCD=True');
  dmStrat.sqlcStrat.Params.Append('OptimizedNumerics=false');
  dmStrat.sqlcStrat.Params.Append('LongStrings=True');
  dmStrat.sqlcStrat.Params.Append('UseQuoteChar=False');
  dmStrat.sqlcStrat.Params.Append('FetchAll=False');
  dmStrat.sqlcStrat.Params.Append('UseUnicode=False');
  //define connection parameters for deposit DateView connection
  dmDep.sqlcDateView.Connected := false;
  dmDep.sqlcDateView.Params.Clear;
  dmDep.sqlcDateView.LibraryName := LibraryName;
  dmDep.sqlcDateView.VendorLib := VendorLib;
  dmDep.sqlcDateView.GetDriverFunc := GetDriverFunc;
  dmDep.sqlcDateView.Params.Append('DriverName='+DriverName);
  dmDep.sqlcDateView.Params.Append('Database='+DateViewPath);
  dmDep.sqlcDateView.Params.Append('User_Name='+DBUserName);
  dmDep.sqlcDateView.Params.Append('Password='+DBPassword);
  dmDep.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmDep.sqlcDateView.Params.Append('Charset='+DBCharSet);
  dmDep.sqlcDateView.Params.Append('LocaleCode=0000');
  dmDep.sqlcDateView.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmDep.sqlcDateView.Params.Append('WaitOnLocks=True');
  dmDep.sqlcDateView.Params.Append('CharLength=1');
  dmDep.sqlcDateView.Params.Append('EnableBCD=True');
  dmDep.sqlcDateView.Params.Append('OptimizedNumerics=false');
  dmDep.sqlcDateView.Params.Append('LongStrings=True');
  dmDep.sqlcDateView.Params.Append('UseQuoteChar=False');
  dmDep.sqlcDateView.Params.Append('FetchAll=False');
  dmDep.sqlcDateView.Params.Append('UseUnicode=False');
  //define connection parameters for graphics connection
  dmgDV.sqlcDateView.Connected := false;
  dmgDV.sqlcDateView.Params.Clear;
  dmgDV.sqlcDateView.LibraryName := LibraryName;
  dmgDV.sqlcDateView.VendorLib := VendorLib;
  dmgDV.sqlcDateView.GetDriverFunc := GetDriverFunc;
  dmgDV.sqlcDateView.Params.Append('DriverName='+DriverName);
  dmgDV.sqlcDateView.Params.Append('Database='+DateViewPath);
  dmgDV.sqlcDateView.Params.Append('User_Name='+DBUserName);
  dmgDV.sqlcDateView.Params.Append('Password='+DBPassword);
  dmgDV.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmgDV.sqlcDateView.Params.Append('Charset='+DBCharSet);
  dmgDV.sqlcDateView.Params.Append('LocaleCode=0000');
  dmgDV.sqlcDateView.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmgDV.sqlcDateView.Params.Append('WaitOnLocks=True');
  dmgDV.sqlcDateView.Params.Append('CharLength=1');
  dmgDV.sqlcDateView.Params.Append('EnableBCD=True');
  dmgDV.sqlcDateView.Params.Append('OptimizedNumerics=false');
  dmgDV.sqlcDateView.Params.Append('LongStrings=True');
  dmgDV.sqlcDateView.Params.Append('UseQuoteChar=False');
  dmgDV.sqlcDateView.Params.Append('FetchAll=False');
  dmgDV.sqlcDateView.Params.Append('UseUnicode=False');
  //define connection parameters for Options connection
  dmOpt.sqlcDep.Connected := false;
  dmOpt.sqlcDep.Params.Clear;
  dmOpt.sqlcDep.LibraryName := LibraryName;
  dmOpt.sqlcDep.VendorLib := VendorLib;
  dmOpt.sqlcDep.GetDriverFunc := GetDriverFunc;
  dmOpt.sqlcDep.Params.Append('DriverName='+DriverName);
  dmOpt.sqlcDep.Params.Append('Database='+DateViewPath);
  dmOpt.sqlcDep.Params.Append('User_Name='+DBUserName);
  dmOpt.sqlcDep.Params.Append('Password='+DBPassword);
  dmOpt.sqlcDep.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmOpt.sqlcDep.Params.Append('Charset='+DBCharSet);
  dmOpt.sqlcDep.Params.Append('LocaleCode=0000');
  dmOpt.sqlcDep.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  dmOpt.sqlcDep.Params.Append('WaitOnLocks=True');
  dmOpt.sqlcDep.Params.Append('CharLength=1');
  dmOpt.sqlcDep.Params.Append('EnableBCD=True');
  dmOpt.sqlcDep.Params.Append('OptimizedNumerics=false');
  dmOpt.sqlcDep.Params.Append('LongStrings=True');
  dmOpt.sqlcDep.Params.Append('UseQuoteChar=False');
  dmOpt.sqlcDep.Params.Append('FetchAll=False');
  dmOpt.sqlcDep.Params.Append('UseUnicode=False');
  //define connection parameters for Replication connection
  //dmReplicate.sqlcStrat.Connected := false;
  //dmReplicate.sqlcStrat.Params.Clear;
  //dmReplicate.sqlcStrat.Params.Append('DriverName='+DriverName);
  //dmReplicate.sqlcStrat.Params.Append('Database='+StratDBPath);
  //dmReplicate.sqlcStrat.Params.Append('User_Name='+DBUserName);
  //dmReplicate.sqlcStrat.Params.Append('Password='+DBPassword);
  //dmReplicate.sqlcStrat.Params.Append('SQLDialect='+DBSQLDialectStr);
  //dmReplicate.sqlcStrat.Params.Append('Charset='+DBCharSet);
  //dmReplicate.sqlcStrat.Params.Append('LocaleCode=0000');
  //dmReplicate.sqlcStrat.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
  //dmReplicate.sqlcStrat.Params.Append('WaitOnLocks=True');
  //dmReplicate.sqlcStrat.Params.Append('CharLength=1');
  //dmReplicate.sqlcStrat.Params.Append('EnableBCD=True');
  //dmReplicate.sqlcStrat.Params.Append('OptimizedNumerics=True');
  //dmReplicate.sqlcStrat.Params.Append('LongStrings=True');
  //dmReplicate.sqlcStrat.Params.Append('UseQuoteChar=False');
  //dmReplicate.sqlcStrat.Params.Append('FetchAll=False');
  //dmReplicate.sqlcStrat.Params.Append('UseUnicode=False');
  if (DBMonitor = 'Active') then
  begin
    dmUser.SQLMonitor1.Active := true;
    dmStrat.SQLMonitor1.Active := true;
    dmgDV.SQLMonitor1.Active := true;
    dmDep.SQLMonitor1.Active := true;
    dmOpt.SQLMonitor1.Active := true;
    //dmReplicate.SQLMonitor1.Active := true;
  end else
  begin
    dmUser.SQLMonitor1.Active := false;
    dmStrat.SQLMonitor1.Active := false;
    dmgDV.SQLMonitor1.Active := false;
    dmDep.SQLMonitor1.Active := false;
    dmOpt.SQLMonitor1.Active := false;
    //dmReplicate.SQLMonitor1.Active := false;
  end;
  finally
    AppIni.Free;
  end;
end;

procedure TIWServerController.IWServerControllerBaseGetMainForm(
  var vMainForm: TIWBaseForm);
begin
  vMainForm := TISFMain.Create(WebApplication);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  aSession: TIWApplication);
begin
  ASession.Data := TUserSession.Create(nil);  //note this is a TUserSession
                                              //NOT to be confused with TIWUserSession
  GetIniFile;
end;

constructor TUserSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  //UserSessionID := integer(@Self);
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  dmOpt := TdmOpt.Create(Self);
  dmDep := TdmDep.Create(Self);
  dmStrat := TdmStrat.Create(Self);
  dmgDV := TdmgDV.Create(Self);
  //dmReplicate := TdmReplicate.Create(Self);
  dmUser.sqlcWebUser.Connected := false;
  dmOpt.sqlcDep.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmDep.sqlcDateView.Connected := false;
  dmgDV.sqlcDateView.Connected := false;
  //dmReplicate.sqlcStrat.Connected := false;
  //UserAccessRights := TStringList.Create;

  //tmpStrList := TStringList.Create;
  ContinentValues := TStringList.Create;
  AreaValues := TStringList.Create;
  UsersWhoForValues := TStringList.Create;
  DepositValues := TStringList.Create;
  ClanValues := TStringList.Create;
  CommodityValues := TStringList.Create;
end;

destructor TUserSession.Destroy;
begin
  //FreeAndNil(UserAccessRights);
  //FreeAndNil(tmpStrList);
  FreeAndNil(ContinentValues);
  FreeAndNil(AreaValues);
  FreeAndNil(UsersWhoForValues);
  FreeAndNil(DepositValues);
  FreeAndNil(ClanValues);
  FreeAndNil(CommodityValues);
  //dmReplicate.sqlcStrat.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmgDV.sqlcDateView.Connected := false;
  dmDep.sqlcDateView.Connected := false;
  dmOpt.sqlcDep.Connected := false;
  dmUser.sqlcWebUser.Connected := false;
  inherited Destroy;
end;

procedure TUserSession.AfterLogin;
var
  i : integer;
  tmpStr : string;
  WasSuccessful : boolean;
begin
  UserSession.DoMemCheck := false;
  //if UserSession.DoMemCheck then MemChk;
  UserSession.WhereAmI := 'AfterLogin';
  UserSession.ThisProgram := 'DepIso';
  IncrementNumUses(UserSession.ThisProgram);
  UserSession.NumRecordsPerPage := 50;
  //UserSession.NumUserRightsItems := 0;
  LoggedIn := TRUE;
  //dmUser.SetDeveloperData('AfterLogin -line 256');
  UserSession.CanModify := false;
  UserSession.CanInsert := false;
  UserSession.CanDelete := false;
  UserSession.IsDeveloper := false;
  UserSession.CanValidate := false;
  UserSession.CanExport := false;
  UserSession.CanViewPlus := false;
  UserSession.CanModifyPlus := false;
  CheckRights(UserSession.ThisProgram,UserSession.UserID,UserSession.UserPassword,
              ValueForCanView,
              ValueForCanModify,ValueForCanInsert,ValueForCanDelete,
              ValueForCanValidate,ValueForCanExport,ValueForCanViewPlus,
              ValueForCanModifyPlus,ValueForIsDeveloper);
  //dmUser.SetDeveloperData('AfterLogin -line 320');
  dmDep.qUsers.Close;
  dmDep.qUsers.ParamByName('USERID').AsString := UserSession.UserID;
  dmDep.cdsUsers.Close;
  dmDep.cdsUsers.Open;
  if (dmDep.cdsUsers.RecordCount < 1) then
  begin
    try
      dmDep.cdsUsers.Close;
      dmDep.cdsUsers.Open;
      dmDep.cdsUsers.Append;
      dmDep.cdsUsersUSERID.AsString := UserSession.UserID;
      dmDep.cdsUsersLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmDep.cdsUsers.Post;
      dmDep.cdsUsers.ApplyUpdates(0);
    except
      on E: Exception do
      begin
      end;
    end;
    dmDep.cdsUsers.Close;
  end;
  dmDep.qUsers.Close;
  dmDep.qUsers.ParamByName('USERID').AsString := UserSession.UserID;
  dmDep.cdsUsers.Close;
  dmDep.cdsUsers.Open;
  if (dmDep.cdsUsers.RecordCount < 1) then
  begin
    try
      dmDep.cdsUsers.Close;
      dmDep.cdsUsers.Open;
      dmDep.cdsUsers.Append;
      dmDep.cdsUsersUSERID.AsString := UserSession.UserID;
      dmDep.cdsUsersLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmDep.cdsUsers.Post;
      dmDep.cdsUsers.ApplyUpdates(0);
    except
      on E: Exception do
      begin
      end;
    end;
    dmDep.cdsUsers.Close;
  end;
  //dmUser.SetDeveloperData('AfterLogin -line 342');
  dmDep.qUsers.Close;
  dmDep.qUsers.ParamByName('USERID').AsString := UserSession.UserID;
  dmDep.cdsUsers.Close;
  dmDep.cdsUsers.Open;
  if (dmDep.cdsUsers.RecordCount > 0) then
  begin
    try
      dmDep.cdsUsers.Edit;
      //dmDep.cdsUsersUSERID.AsString := UserSession.UserID;
      dmDep.cdsUsersLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmDep.cdsUsers.Post;
      dmDep.cdsUsers.ApplyUpdates(0);
    except
      on E: Exception do
      begin
      end;
    end;
    dmDep.cdsUsers.Close;
  end;

  dmDep.qUsersWhoFor.Close;
  dmDep.qUsersWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
  dmDep.cdsUsersWhoFor.Close;
  dmDep.cdsUsersWhoFor.Open;
  if (dmDep.cdsUsersWhoFor.RecordCount < 1) then
  begin
    try
      dmDep.cdsUsersWhoFor.Close;
      dmDep.cdsUsersWhoFor.Open;
      dmDep.cdsUsersWhoFor.Append;
      dmDep.cdsUsersWhoForUSERID.AsString := UserSession.UserID;
      dmDep.cdsUsersWhoForWHOFORID.AsString := ValueForPublished;
      dmDep.cdsUsersWhoFor.Post;
      dmDep.cdsUsersWhoFor.ApplyUpdates(0);
    except
      on E: Exception do
      begin
        WebApplication.ShowMessage('Not able to add UserWhoFor');
      end;
    end;
    dmDep.cdsUsersWhoFor.Close;
  end;
  //dmUser.SetDeveloperData('AfterLogin -line 385');

  dmOpt.qUserVar.Close;
  dmOpt.qUserVar.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsUserVar.Close;
  dmOpt.cdsUserVar.Open;
  if ((dmOpt.cdsUserVar.RecordCount < 1) and (UserSession.CanView)) then
  begin
    try
      WasSuccessful := true;
      for i := 1 to 38 do
      begin
        case i of
          1 : tmpStr := '206Pb204Pb';
          2 : tmpStr := 's206Pb204Pb';
          3 : tmpStr := 'e206Pb204Pb';
          4 : tmpStr := '207Pb204Pb';
          5 : tmpStr := 's207Pb204Pb';
          6 : tmpStr := 'e207Pb204Pb';
          7 : tmpStr := '208Pb204Pb';
          8 : tmpStr := 's208Pb204Pb';
          9 : tmpStr := 'e208Pb204Pb';
          10 : tmpStr := 'r207Pb206Pb';
          11 : tmpStr := 'r208Pb206Pb';
          12 : tmpStr := '207Pb206Pb';
          13 : tmpStr := 's207Pb206Pb';
          14 : tmpStr := 'e207Pb206Pb';
          15 : tmpStr := '208Pb206Pb';
          16 : tmpStr := 's208Pb206Pb';
          17 : tmpStr := 'e208Pb206Pb';
          18 : tmpStr := 'Pb_ppm';
          19 : tmpStr := 'U_ppm';
          20 : tmpStr := 'Th_ppm';
          21 : tmpStr := '87Sr86Sr';
          22 : tmpStr := 's87Sr86Sr';
          23 : tmpStr := 'e87Sr86Sr';
          24 : tmpStr := '143Nd144Nd';
          25 : tmpStr := 's143Nd144Nd';
          26 : tmpStr := 'e143Nd144Nd';
          27 : tmpStr := '187Os188Os';
          28 : tmpStr := 's187Os188Os';
          29 : tmpStr := 'e187Os188Os';
          30 : tmpStr := '34Ssulphide';
          31 : tmpStr := 's34Ssulphide';
          32 : tmpStr := 'e34Ssulphide';
          33 : tmpStr := '34Ssulphate';
          34 : tmpStr := 's34Ssulphate';
          35 : tmpStr := 'e34Ssulphate';
          36 : tmpStr := 'Delta18O';
          37 : tmpStr := 'sDelta18O';
          38 : tmpStr := 'eDelta18O';
        end;
        dmOpt.InsertNewUserVar(UserSession.UserID,2,i,tmpStr,WasSuccessful);
      end;
    except
      on E: Exception do
      begin
      end;
    end;
    dmOpt.cdsUserVar.Close;
  end;

  UserSession.DataHaveChanged := true;
  dmOpt.GetUserOptions;

  //dmOpt.GetUserOptions;

  UserSession.MapFileName := WebApplication.ApplicationPath+DefaultMapfolder+DefaultMapFileName;
  UserSession.MapDBFName := WebApplication.ApplicationPath+DefaultMapfolder+DefaultMapDBFName;
  UserSession.MapFieldName := 'WB_CNTRY';
  UserSession.MapValueFieldName := 'CONTINENT';
  UserSession.UseDBF := false;
  UserSession.HORZSIZE := 1024; // horizontal screen size in pixels
  UserSession.VERTSIZE := 768;  // vertical screen size in pixels

  UserSession.Parameter2Chosen := 'PbPb';
  UserSession.OrderByValue := '0';

  UserSession.UsersWhoForValues.Clear;
  UserSession.UsersWhoForValues.Add('PUBL');

  UserSession.DateBand1Caption := '0-700 Ma';
  UserSession.DateBand1Minimum := '0';
  UserSession.DateBand1Maximum := '700';
  UserSession.DateBand2Caption := '700-1300 Ma';
  UserSession.DateBand2Minimum := '700';
  UserSession.DateBand2Maximum := '1300';
  UserSession.DateBand3Caption := '1300-2100 Ma';
  UserSession.DateBand3Minimum := '1300';
  UserSession.DateBand3Maximum := '2100';
  UserSession.DateBand4Caption := '2100-2500 Ma';
  UserSession.DateBand4Minimum := '2100';
  UserSession.DateBand4Maximum := '2500';
  UserSession.DateBand5Caption := '2500-4500 Ma';
  UserSession.DateBand5Minimum := '2500';
  UserSession.DateBand5Maximum := '4500';

  UserSession.Ratio1Caption := '18.0-19.0';
  UserSession.Ratio1Minimum := '18.0';
  UserSession.Ratio1Maximum := '19.0';
  UserSession.Ratio2Caption := '19.0-20.0';
  UserSession.Ratio2Minimum := '19.0';
  UserSession.Ratio2Maximum := '20.0';
  UserSession.Ratio3Caption := '20.0-21.0';
  UserSession.Ratio3Minimum := '20.0';
  UserSession.Ratio3Maximum := '21.00';
  UserSession.Ratio4Caption := '21.0-22.0';
  UserSession.Ratio4Minimum := '21.0';
  UserSession.Ratio4Maximum := '22.0';
  UserSession.Ratio5Caption := '22.0-23.0';
  UserSession.Ratio5Minimum := '22.0';
  UserSession.Ratio5Maximum := '23.0';

  UserSession.ShowAllSampleLocalities := false;

  UserSession.IncludeCoordinates := false;
  UserSession.NELat := '  90.0';
  UserSession.NELon := ' 180.0';
  UserSession.SWLat := ' -90.0';
  UserSession.SWLon := '-180.0';

  UserSession.GetCookies;
  //dmUser.SetDeveloperData('AfterLogin - finished');


  TIWAppForm(WebApplication.ActiveForm).Release;
  if ( LastVisitedForm.ClassNameIs(TISFLogin.ClassName) or
       LastVisitedForm.ClassNameIs(TISFRegister.ClassName) )  then
  begin
    TISFMain.Create(WebApplication).Show
  end else
  begin
    LastVisitedForm.Create(WebApplication).Show;
  end;
end;

procedure TUserSession.NeedLogin(AForm: TIWAppFormClass);
begin
  if LoggedIn then begin
  end;
  LoggedIn := false;
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLogin.Create(WebApplication).Show;
end;

procedure TUserSession.SetCookies;
var
  //tmpString : string;
  i : integer;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    AStringList.Clear;
    if UserSession.IncludeContinentValues then
    begin
      AStringList.Add('IncludeContinentValues='+IntToStr(UserSession.ContinentValues.Count));
      for i := 1 to UserSession.ContinentValues.Count do
      begin
        AStringList.Add('ContinentValues='+UserSession.ContinentValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeAreaValues then
    begin
      AStringList.Add('IncludeAreaValues='+IntToStr(UserSession.AreaValues.Count));
      for i := 1 to UserSession.AreaValues.Count do
      begin
        AStringList.Add('AreaValues='+UserSession.AreaValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeDateFromValue then
    begin
      AStringList.Add('IncludeDateFromValue='+IntToStr(1));
      AStringList.Add('DateFromField='+UserSession.DateFromField);
    end;
    if UserSession.IncludeDateToValue then
    begin
      AStringList.Add('IncludeDateToValue='+IntToStr(1));
      AStringList.Add('DateToField='+UserSession.DateToField);
    end;
    if UserSession.IncludeAllParentIDs then
    begin
      AStringList.Add('IncludeAllParentIDs='+IntToStr(1));
    end else
    begin
      AStringList.Add('IncludeAllParentIDs='+IntToStr(0));
    end;
    AStringList.Add('OrderByValue='+UserSession.OrderByValue);
    if UserSession.IncludeUsersWhoForValues then
    begin
      AStringList.Add('IncludeUsersWhoForValues='+IntToStr(UserSession.UsersWhoForValues.Count));
      for i := 1 to UserSession.UsersWhoForValues.Count do
      begin
        AStringList.Add('UsersWhoForValues='+UserSession.UsersWhoForValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeDepositValues then
    begin
      AStringList.Add('IncludeDepositValues='+IntToStr(UserSession.DepositValues.Count));
      for i := 1 to UserSession.DepositValues.Count do
      begin
        AStringList.Add('DepositValues='+UserSession.DepositValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeClanValues then
    begin
      AStringList.Add('IncludeClanValues='+IntToStr(UserSession.ClanValues.Count));
      for i := 1 to UserSession.ClanValues.Count do
      begin
        AStringList.Add('ClanValues='+UserSession.ClanValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeCommodityValues then
    begin
      AStringList.Add('IncludeCommodityValues='+IntToStr(UserSession.CommodityValues.Count));
      for i := 1 to UserSession.CommodityValues.Count do
      begin
        AStringList.Add('CommodityValues='+UserSession.CommodityValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeCoordinates then
    begin
      AStringList.Add('IncludeCoordinates='+IntToStr(1));
      AStringList.Add('NELat='+UserSession.NELat);
      AStringList.Add('NELon='+UserSession.NELon);
      AStringList.Add('SWLat='+UserSession.SWLat);
      AStringList.Add('SWLon='+UserSession.SWLon);
    end;
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      dmUser.cdsCookieInfo.Edit;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsCookieInfoCOOKIEINFO.AsString := AStringList.Text;
      dmUser.cdsCookieInfo.Post;
    end else
    begin
      dmUser.cdsCookieInfo.Append;
      dmUser.cdsCookieInfoUSERID.AsString := UserSession.UserID;
      dmUser.cdsCookieInfoSOFTWAREID.AsString := UserSession.ThisProgram;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := dmUser.GetUTCDateTime;
      dmUser.cdsCookieInfoCOOKIEINFO.AsString := AStringList.Text;
      dmUser.cdsCookieInfo.Post;
    end;
    dmUser.cdsCookieInfo.ApplyUpdates(0);
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetCookies;
var
  //tmpString : string;
  //i,
  tmpi, iCode : integer;
  //tmpStringValues : TStringList;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      AStringList.Text := dmUser.cdsCookieInfoCOOKIEINFO.AsString;
    end;
    Val(AStringList.Values['IncludeContinentValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeContinentValues := true;
      UserSession.GetStringsValues(AStringList,'ContinentValues',UserSession.ContinentValues);
    end;
    Val(AStringList.Values['IncludeAreaValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeAreaValues := true;
      UserSession.GetStringsValues(AStringList,'AreaValues',UserSession.AreaValues);
    end;
    Val(AStringList.Values['IncludeDateFromValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDateFromValue := true;
      UserSession.DateFromField := AStringList.Values['DateFromField'];
    end;
    Val(AStringList.Values['IncludeDateToValue'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDateToValue := true;
      UserSession.DateToField := AStringList.Values['DateToField'];
    end;
    Val(AStringList.Values['IncludeAllParentIDs'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeAllParentIDs := true;
    end else
    begin
      UserSession.IncludeAllParentIDs := false;
    end;
    UserSession.OrderByValue := AStringList.Values['OrderByValue'];
    Val(AStringList.Values['IncludeUsersWhoForValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeUsersWhoForValues := true;
      UserSession.GetStringsValues(AStringList,'UsersWhoForValues',UserSession.UsersWhoForValues);
    end;
    Val(AStringList.Values['IncludeDepositValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeDepositValues := true;
      UserSession.GetStringsValues(AStringList,'DepositValues',UserSession.DepositValues);
    end;
    Val(AStringList.Values['IncludeClanValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeClanValues := true;
      UserSession.GetStringsValues(AStringList,'ClanValues',UserSession.ClanValues);
    end;
    Val(AStringList.Values['IncludeCommodityValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeCommodityValues := true;
      UserSession.GetStringsValues(AStringList,'CommodityValues',UserSession.CommodityValues);
    end;
    Val(AStringList.Values['IncludeCoordinates'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeCoordinates := true;
      UserSession.NELat := AStringList.Values['NELat'];
      UserSession.NELon := AStringList.Values['NELon'];
      UserSession.SWLat := AStringList.Values['SWLat'];
      UserSession.SWLon := AStringList.Values['SWLon'];
    end;
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetStringsValues(AStrings: TStrings;
                           AKey: String; AValueList: TStringList);
//from routine published by Bob Swart
var
  FieldValue: String;
  i, match: Integer;
begin
  AKey := AKey + '=';
  for i:=0 to Pred(AStrings.Count) do
  begin
    FieldValue := AStrings.Strings[i];
    if Pos(AKey, FieldValue) = 1 then { exact match }
    begin
      match := Pos('=', FieldValue);
      if match > 0 then
        AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match))
    end;
  end;
end;

procedure TUserSession.MakeDonation(AForm: TIWAppFormClass);
begin
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDonate.Create(WebApplication).Show;
end;

procedure TUserSession.AfterDonate;
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  if ( LastVisitedForm.ClassNameIs(TISFDonate.ClassName))  then
    TISFMain.Create(WebApplication).Show
  else
    LastVisitedForm.Create(WebApplication).Show;
end;



initialization
  TIWServerController.SetServerControllerClass;

end.

