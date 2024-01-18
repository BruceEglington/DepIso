unit ServerController_old;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  midaslib,
  usrIW_dm, IWApplication, IWAppForm, IniFiles,
  IWDep_dm, IWDep_dmOpt,
  IWDep_dmStrat, IWDep_dmGraphics,
  IWDep_constants, uSetupOctaGateURLBase;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication;
      var VMainForm: TIWBaseForm);
    procedure IWServerControllerBaseBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure IWServerControllerBaseCreate(Sender: TObject);
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
    ThisProgram : string;
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

implementation
{$R *.dfm}

uses
  IWInit, usr_uLogin, usr_uregister, XMLDoc, XMLIntf, IWDep_umain,
  usr_uDBInterface, usr_uDonate, IWDep_constvalues;

function UserSession: TUserSession;
begin
  Result := TUserSession(WebApplication.Data);
end;

procedure TIWServerController.IWServerControllerBaseBeforeDispatch(
  Sender: TObject; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
begin
  //SetupOctaGateURLBase(self, Request);
  //if pos(#$26#$26, Request.Content) > 0 then Request.ContentFields.Text := '';
end;

procedure TIWServerController.IWServerControllerBaseCreate(Sender: TObject);
begin
  GetIniFile;
end;

procedure TIWServerController.GetIniFile;
var
  AppIni   : TIniFile;
  tmpStr   : string;
begin
  AppIni := TIniFile.Create('depiso.ini');
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/depiso');
    if (URLBase = '/') then URLBase := '';
  finally
    AppIni.Free;
  end;
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  ASession: TIWApplication; var VMainForm: TIWBaseForm);
begin
  ASession.Data := TUserSession.Create(nil);
end;

constructor TUserSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  //UserSessionID := integer(@Self);
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  dmUser.sqlcWebUser.Connected := true;
  dmDep := TdmDep.Create(Self);
  dmDep.sqlcDateView.Connected := false;
  dmOpt := TdmOpt.Create(Self);
  dmOpt.sqlcDep.Connected := false;
  dmStrat := TdmStrat.Create(Self);
  dmStrat.sqlcStrat.Connected := false;
  dmgDV := TdmgDV.Create(Self);
  dmgDV.sqlcDateView.Connected := false;
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
  dmUser.sqlcWebUser.Connected := false;
  dmDep.sqlcDateView.Connected := false;
  dmOpt.sqlcDep.Connected := false;
  dmStrat.sqlcStrat.Connected := false;
  dmgDV.sqlcDateView.Connected := false;
  inherited Destroy;
end;

procedure TUserSession.AfterLogin;
begin
  UserSession.DoMemCheck := false;
  //if UserSession.DoMemCheck then MemChk;
  UserSession.WhereAmI := 'AfterLogin';
  UserSession.ThisProgram := 'DepIso';
  IncrementNumUses(UserSession.ThisProgram);
  UserSession.NumRecordsPerPage := 50;
  //UserSession.NumUserRightsItems := 0;
  LoggedIn := TRUE;
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
      dmDep.cdsUsersUSERNAMEID.AsString := UserSession.UserID;
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
      dmDep.cdsUsersWhoForUSERNAMEID.AsString := UserSession.UserID;
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

  UserSession.DataHaveChanged := true;
  dmOpt.GetUserOptions;

  dmOpt.GetUserOptions;

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
  tmpString : string;
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
    dmUser.qCookieInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      dmUser.cdsCookieInfo.Edit;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := Now;
      dmUser.cdsCookieInfoCOOKIEINFO.AsString := AStringList.Text;
      dmUser.cdsCookieInfo.Post;
    end else
    begin
      dmUser.cdsCookieInfo.Append;
      dmUser.cdsCookieInfoUSERNAMEID.AsString := UserSession.UserID;
      dmUser.cdsCookieInfoSOFTWAREID.AsString := UserSession.ThisProgram;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := Now;
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
  tmpString : string;
  i, tmpi, iCode : integer;
  tmpStringValues : TStringList;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
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
  if LoggedIn then begin
  end;
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

