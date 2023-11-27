unit IWDep_dmopt;

interface

uses
  Forms,
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider,
  DBXCommon,
  IWCompListbox, WideStrings, DBXDevartInterBase, SqlExpr;

type
  TdmOpt = class(TDataModule)
    dsOpt: TDataSource;
    qOpt: TSQLQuery;
    cdsOpt: TClientDataSet;
    dsQOpt: TDataSource;
    dspOpt: TDataSetProvider;
    qOptAll: TSQLQuery;
    dsqOptAll: TDataSource;
    dspOptAll: TDataSetProvider;
    cdsOptAll: TClientDataSet;
    dsOptAll: TDataSource;
    sqlcDep: TSQLConnection;
    qUserFor: TSQLQuery;
    dspUserFor: TDataSetProvider;
    cdsUserFor: TClientDataSet;
    dsUserFor: TDataSource;
    qChangeUserFor: TSQLQuery;
    qForList: TSQLQuery;
    dspForList: TDataSetProvider;
    cdsForList: TClientDataSet;
    dsForList: TDataSource;
    cdsForListWHOFORID: TStringField;
    cdsForListWHOFOR: TStringField;
    cdsForListOWNER: TStringField;
    qUserForWHOFORID: TStringField;
    cdsUserForWHOFORID: TStringField;
    qOptM: TSQLQuery;
    dsqOptM: TDataSource;
    dspOptM: TDataSetProvider;
    cdsOptM: TClientDataSet;
    dsOptM: TDataSource;
    qOptMInterp: TSQLQuery;
    cdsOptMInterp: TClientDataSet;
    cdsOptMInterpUSERID: TStringField;
    cdsOptMInterpOPTIONID: TIntegerField;
    cdsOptMInterpINTERPABR: TStringField;
    dsOptMInterp: TDataSource;
    qOptMDates: TSQLQuery;
    cdsOptMDates: TClientDataSet;
    cdsOptMDatesUSERID: TStringField;
    cdsOptMDatesOPTIONID: TIntegerField;
    cdsOptMDatesDATEMIN: TFloatField;
    cdsOptMDatesDATEMAX: TFloatField;
    dsOptMDates: TDataSource;
    qOptMGraph: TSQLQuery;
    cdsOptMGraph: TClientDataSet;
    cdsOptMGraphUSERID: TStringField;
    cdsOptMGraphMINAGEERROR: TFloatField;
    cdsOptMGraphSHOWALLLOCALITIES: TStringField;
    cdsOptMGraphGROUPCATEGORY: TStringField;
    cdsOptMGraphPDFTYPE: TStringField;
    dsOptMGraph: TDataSource;
    qOptMInitial: TSQLQuery;
    cdsOptMInitial: TClientDataSet;
    cdsOptMInitialUSERID: TStringField;
    cdsOptMInitialOPTIONTYPEID: TStringField;
    cdsOptMInitialOPTIONID: TIntegerField;
    cdsOptMInitialVALUEMIN: TFloatField;
    cdsOptMInitialVALUEMAX: TFloatField;
    dsOptMInitial: TDataSource;
    qOptInterp: TSQLQuery;
    dspOptInterp: TDataSetProvider;
    cdsOptInterp: TClientDataSet;
    cdsOptInterpUSERID: TStringField;
    cdsOptInterpOPTIONID: TIntegerField;
    cdsOptInterpINTERPABR: TStringField;
    dsOptInterp: TDataSource;
    qOptDates: TSQLQuery;
    dspOptDates: TDataSetProvider;
    cdsOptDates: TClientDataSet;
    cdsOptDatesUSERID: TStringField;
    cdsOptDatesOPTIONID: TIntegerField;
    cdsOptDatesDATEMIN: TFloatField;
    cdsOptDatesDATEMAX: TFloatField;
    dsOptDates: TDataSource;
    qOptGraph: TSQLQuery;
    dspOptGraph: TDataSetProvider;
    cdsOptGraph: TClientDataSet;
    cdsOptGraphUSERID: TStringField;
    cdsOptGraphMINAGEERROR: TFloatField;
    cdsOptGraphSHOWALLLOCALITIES: TStringField;
    cdsOptGraphGROUPCATEGORY: TStringField;
    cdsOptGraphPDFTYPE: TStringField;
    dsOptGraph: TDataSource;
    qOptUSERID: TStringField;
    qOptOPTIONTYPEID: TStringField;
    qOptOPTIONID: TIntegerField;
    qOptOPTIONTITLE: TStringField;
    cdsOptUSERID: TStringField;
    cdsOptOPTIONTYPEID: TStringField;
    cdsOptOPTIONID: TIntegerField;
    cdsOptOPTIONTITLE: TStringField;
    qOptAllUSERID: TStringField;
    qOptAllOPTIONTYPEID: TStringField;
    qOptAllOPTIONID: TIntegerField;
    qOptAllOPTIONTITLE: TStringField;
    cdsOptAllUSERID: TStringField;
    cdsOptAllOPTIONTYPEID: TStringField;
    cdsOptAllOPTIONID: TIntegerField;
    cdsOptAllOPTIONTITLE: TStringField;
    qUserForUSERID: TStringField;
    cdsUserForUSERID: TStringField;
    qOptRatios: TSQLQuery;
    dspOptRatios: TDataSetProvider;
    cdsOptRatios: TClientDataSet;
    dsOptRatios: TDataSource;
    cdsOptRatiosUSERID: TStringField;
    cdsOptRatiosOPTIONTYPEID: TStringField;
    cdsOptRatiosOPTIONID: TIntegerField;
    cdsOptRatiosVALUEMIN: TFloatField;
    cdsOptRatiosVALUEMAX: TFloatField;
    qOptRanges: TSQLQuery;
    qOptMUSERID: TStringField;
    qOptMOPTIONTYPEID: TStringField;
    qOptMOPTIONTYPE: TStringField;
    cdsOptMUSERID: TStringField;
    cdsOptMOPTIONTYPEID: TStringField;
    cdsOptMOPTIONTYPE: TStringField;
    qOptsOptions: TSQLQuery;
    cdsOptsOptions: TClientDataSet;
    dsOptsOptions: TDataSource;
    cdsOptMqOptsOptions: TDataSetField;
    cdsOptsOptionsOPTIONID: TIntegerField;
    cdsOptsOptionsOPTIONTITLE: TStringField;
    qOptMInterpUSERID: TStringField;
    qOptMInterpOPTIONID: TIntegerField;
    qOptMInterpINTERPABR: TStringField;
    qOptMInterpINTERPRETATION: TStringField;
    cdsOptMqOptMInterp: TDataSetField;
    cdsOptMInterpINTERPRETATION: TStringField;
    dspUserVar: TDataSetProvider;
    cdsUserVar: TClientDataSet;
    dsUserVar: TDataSource;
    qUserVar: TSQLQuery;
    cdsUserVarUSERID: TStringField;
    cdsUserVarAPPLICATIONID: TIntegerField;
    cdsUserVarVARORDER: TIntegerField;
    cdsUserVarVARIABLEID: TStringField;
    qInsertUserVar: TSQLQuery;
    SQLMonitor1: TSQLMonitor;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetUserOptions;
    procedure SetUserOptions3;
    procedure InsertNewUserVar( tUserID : string;
                                tApplicationID : integer;
                                tVarOrder : integer;
                                tVariableID : string;
                                var WasSuccessful : boolean);
  end;

// Procs
  function dmOpt: TdmOpt;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController, IWDep_constants, usrIW_dm;


function dmOpt: TdmOpt;
begin
  Result := TUserSession(WebApplication.Data).dmOpt;
end;

procedure TdmOpt.GetUserOptions;
var
  i : integer;
  IsNewUser : boolean;
begin
  IsNewUser := false;
  //dmUser.SetDeveloperData('GetUserOptions -line 171');
  dmOpt.qOpt.Close;
  dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'D';
  //dmUser.SetDeveloperData('GetUserOptions -line 176');
  dmOpt.cdsOpt.Close;
  dmOpt.cdsOpt.Open;
  //dmUser.SetDeveloperData('GetUserOptions -line 179');
  if (dmOpt.cdsOpt.RecordCount > 0) then
  begin
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOpt.Filtered := false;
      dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOpt.Filtered := true;
      case i of
        1 : begin
          UserSession.DateBand1Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        2 : begin
          UserSession.DateBand2Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        3 : begin
          UserSession.DateBand3Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        4 : begin
          UserSession.DateBand4Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
        5 : begin
          UserSession.DateBand5Caption := dmOpt.cdsOptOPTIONTITLE.AsString;
        end;
      end;
    end;
  end else
  begin
    {no record exists for this user. Create default values for UserSession}
    IsNewUser := true;
    UserSession.DateBand1Caption := '0-700 Ma';
    UserSession.DateBand2Caption := '700-1300 Ma';
    UserSession.DateBand3Caption := '1300-2100 Ma';
    UserSession.DateBand4Caption := '2100-2500 Ma';
    UserSession.DateBand5Caption := '2500-4500 Ma';
    UserSession.DateBand1Minimum := '0.0';
    UserSession.DateBand1Maximum := '700.0';
    UserSession.DateBand2Minimum := '700.0';
    UserSession.DateBand2Maximum := '1300.0';
    UserSession.DateBand3Minimum := '1300.0';
    UserSession.DateBand3Maximum := '2100.0';
    UserSession.DateBand4Minimum := '2100.0';
    UserSession.DateBand4Maximum := '2500.0';
    UserSession.DateBand5Minimum := '2500.0';
    UserSession.DateBand5Maximum := '4500.0';
  end;
  dmOpt.cdsOpt.Close;
  //dmUser.SetDeveloperData('GetUserOptions -line 224');
  dmOpt.qOptDates.Close;
  dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptDates.Close;
  dmOpt.cdsOptDates.Open;
  if (dmOpt.cdsOptDates.RecordCount > 0) then
  begin
    {record exists for this user. Read values from database and update UserSession}
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOptDates.Filtered := false;
      dmOpt.cdsOptDates.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOptDates.Filtered := true;
      case i of
        1 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand1Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand1Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
        2 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand2Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand2Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
        3 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand3Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand3Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
        4 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand4Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand4Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
        5 : begin
          dmOpt.cdsOptDates.First;
          UserSession.DateBand5Minimum := dmOpt.cdsOptDatesDATEMIN.AsString;
          UserSession.DateBand5Maximum := dmOpt.cdsOptDatesDATEMAX.AsString;
        end;
      end;
    end;
  end else
  begin
    {no record exists for this user. Create default values for UserSession}
    IsNewUser := true;
    UserSession.DateBand1Minimum := '0';
    UserSession.DateBand1Maximum := '700';
    UserSession.DateBand2Minimum := '700';
    UserSession.DateBand2Maximum := '1300';
    UserSession.DateBand3Minimum := '1300';
    UserSession.DateBand3Maximum := '2100';
    UserSession.DateBand4Minimum := '2100';
    UserSession.DateBand4Maximum := '2500';
    UserSession.DateBand5Minimum := '2500';
    UserSession.DateBand5Maximum := '4500';
    UserSession.DateBand1Caption := '0-700 Ma';
    UserSession.DateBand2Caption := '700-1300 Ma';
    UserSession.DateBand3Caption := '1300-2100 Ma';
    UserSession.DateBand4Caption := '2100-2500 Ma';
    UserSession.DateBand5Caption := '2500-4500 Ma';
  end;
  dmOpt.cdsOptDates.Close;
  //dmUser.SetDeveloperData('GetUserOptions -line 286');

  dmOpt.qOptRatios.Close;
  dmOpt.qOptRatios.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOptRatios.ParamByName('OPTIONTYPEID').AsString := 'R';
  dmOpt.cdsOptRatios.Close;
  dmOpt.cdsOptRatios.Open;
  if (dmOpt.cdsOptRatios.RecordCount > 0) then
  begin
    {record exists for this user. Read values from database and update UserSession}
    for i := 1 to MaxSeries do
    begin
      dmOpt.cdsOptRatios.Filtered := false;
      dmOpt.cdsOptRatios.Filter := 'OptionID = '+IntToStr(i);
      dmOpt.cdsOptRatios.Filtered := true;
      case i of
        1 : begin
          dmOpt.cdsOptRatios.First;
          UserSession.DateBand1Minimum := dmOpt.cdsOptRatiosVALUEMIN.AsString;
          UserSession.DateBand1Maximum := dmOpt.cdsOptRatiosVALUEMAX.AsString;
        end;
        2 : begin
          dmOpt.cdsOptRatios.First;
          UserSession.DateBand2Minimum := dmOpt.cdsOptRatiosVALUEMIN.AsString;
          UserSession.DateBand2Maximum := dmOpt.cdsOptRatiosVALUEMAX.AsString;
        end;
        3 : begin
          dmOpt.cdsOptRatios.First;
          UserSession.DateBand3Minimum := dmOpt.cdsOptRatiosVALUEMIN.AsString;
          UserSession.DateBand3Maximum := dmOpt.cdsOptRatiosVALUEMAX.AsString;
        end;
        4 : begin
          dmOpt.cdsOptRatios.First;
          UserSession.DateBand4Minimum := dmOpt.cdsOptRatiosVALUEMIN.AsString;
          UserSession.DateBand4Maximum := dmOpt.cdsOptRatiosVALUEMAX.AsString;
        end;
        5 : begin
          dmOpt.cdsOptRatios.First;
          UserSession.DateBand5Minimum := dmOpt.cdsOptRatiosVALUEMIN.AsString;
          UserSession.DateBand5Maximum := dmOpt.cdsOptRatiosVALUEMAX.AsString;
        end;
      end;
    end;
  end else
  begin
    {no record exists for this user. Create default values for UserSession}
    IsNewUser := true;
    UserSession.Ratio1Minimum := '15.0';
    UserSession.Ratio1Maximum := '16.0';
    UserSession.Ratio2Minimum := '16.0';
    UserSession.Ratio2Maximum := '17.0';
    UserSession.Ratio3Minimum := '17.0';
    UserSession.Ratio3Maximum := '18.0';
    UserSession.Ratio4Minimum := '18.0';
    UserSession.Ratio4Maximum := '19.0';
    UserSession.Ratio5Minimum := '19.0';
    UserSession.Ratio5Maximum := '20.0';
    UserSession.Ratio1Caption := '15.0-16.0';
    UserSession.Ratio2Caption := '16.0-17.0';
    UserSession.Ratio3Caption := '17.0-18.0';
    UserSession.Ratio4Caption := '18.0-19.0';
    UserSession.Ratio5Caption := '19.0-20.0';
  end;
  dmOpt.cdsOptRatios.Close;
  //dmUser.SetDeveloperData('GetUserOptions -line 350');
end;

procedure TdmOpt.SetUserOptions3;
var
  i  : integer;
  IsNewUser : boolean;
begin
  dmOpt.qOpt.Close;
  dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'D';
  dmOpt.cdsOpt.Close;
  dmOpt.qOptDates.Close;
  dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.cdsOptDates.Close;
  dmOpt.qOptRatios.Close;
  dmOpt.qOptRatios.ParamByName('USERID').AsString := UserSession.UserID;
  dmOpt.qOptRatios.ParamByName('OPTIONTYPEID').AsString := 'R';
  dmOpt.cdsOptRatios.Close;
  try
    IsNewUser := false;
    dmOpt.cdsOpt.Open;
    if (dmOpt.cdsOpt.RecordCount = 0) then IsNewUser := true;
    dmOpt.cdsOptDates.Open;
    if (dmOpt.cdsOptDates.RecordCount = 0) then IsNewUser := true;
    dmOpt.cdsOptRatios.Open;
    if (dmOpt.cdsOptRatios.RecordCount = 0) then IsNewUser := true;
  except
    IsNewUser := true;
  end;
  //WebApplication.ShowMessage('SetOptions3 new user '+IntToStr(dmOpt.cdsOptInterp.RecordCount));
  if (IsNewUser) then
  begin
    {no record exists for this user. Create records}
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'D';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    try
      try
        for i := 1 to MaxSeries do
        begin
          dmOpt.cdsOpt.Append;
          dmOpt.cdsOptUSERID.AsString := UserSession.UserID;
          dmOpt.cdsOptOPTIONTYPEID.AsString := 'D';
          dmOpt.cdsOptOPTIONID.AsInteger := i;
          case i of
            1 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand1Caption;
            end;
            2 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand2Caption;
            end;
            3 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand3Caption;
            end;
            4 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand4Caption;
            end;
            5 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand5Caption;
            end;
          end;
          dmOpt.cdsOpt.Post;
        end;
      except
        WebApplication.ShowMessage('Not able to create all new records for Opt_D');
      end;
      dmOpt.cdsOpt.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for Opt_D');
    end;
    dmOpt.cdsOpt.Close;

    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'R';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    try
      try
        for i := 1 to MaxSeries do
        begin
          dmOpt.cdsOpt.Append;
          dmOpt.cdsOptUSERID.AsString := UserSession.UserID;
          dmOpt.cdsOptOPTIONTYPEID.AsString := 'R';
          dmOpt.cdsOptOPTIONID.AsInteger := i;
          case i of
            1 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio1Caption;
            end;
            2 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio2Caption;
            end;
            3 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio3Caption;
            end;
            4 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio4Caption;
            end;
            5 : begin
              dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio5Caption;
            end;
          end;
          dmOpt.cdsOpt.Post;
        end;
      except
        WebApplication.ShowMessage('Not able to create all new records for Opt_R');
      end;
      dmOpt.cdsOpt.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for Opt_D');
    end;
    dmOpt.cdsOpt.Close;

    dmOpt.qOptDates.Close;
    dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptDates.Close;
    dmOpt.cdsOptDates.Open;
    try
      for i := 1 to MaxSeries do
      begin
        dmOpt.cdsOptDates.Append;
        dmOpt.cdsOptDatesUSERID.AsString := UserSession.UserID;
        dmOpt.cdsOptDatesOPTIONID.AsInteger := i;
        case i of
          1 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand1Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand1Maximum;
          end;
          2 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand2Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand2Maximum;
          end;
          3 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand3Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand3Maximum;
          end;
          4 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand4Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand4Maximum;
          end;
          5 : begin
            dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand5Minimum;
            dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand5Maximum;
          end;
        end;
        dmOpt.cdsOptDates.Post;
      end;
      dmOpt.cdsOptDates.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for OptDates');
    end;
    dmOpt.cdsOptDates.Close;

    dmOpt.qOptRatios.Close;
    dmOpt.qOptRatios.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOptRatios.ParamByName('OPTIONTYPEID').AsString := 'R';
    dmOpt.cdsOptRatios.Close;
    dmOpt.cdsOptRatios.Open;
    try
      for i := 1 to MaxSeries do
      begin
        dmOpt.cdsOptRatios.Append;
        dmOpt.cdsOptRatiosUSERID.AsString := UserSession.UserID;
        dmOpt.cdsOptRatiosOPTIONID.AsInteger := i;
        case i of
          1 : begin
            dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.DateBand1Minimum;
            dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.DateBand1Maximum;
          end;
          2 : begin
            dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.DateBand2Minimum;
            dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.DateBand2Maximum;
          end;
          3 : begin
            dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.DateBand3Minimum;
            dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.DateBand3Maximum;
          end;
          4 : begin
            dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.DateBand4Minimum;
            dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.DateBand4Maximum;
          end;
          5 : begin
            dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.DateBand5Minimum;
            dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.DateBand5Maximum;
          end;
        end;
        dmOpt.cdsOptRatios.Post;
      end;
      dmOpt.cdsOptRatios.ApplyUpdates(-1);
    except
      WebApplication.ShowMessage('Not able to create new records for OptRatios');
    end;
    dmOpt.cdsOptRatios.Close;
  end else
  begin
    {record exists for this user. Modify records}
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'D';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    for i := 1 to MaxSeries do
    begin
      try
        dmOpt.cdsOpt.Filtered := false;
        dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
        dmOpt.cdsOpt.Filtered := true;
        dmOpt.cdsOpt.Edit;
        case i of
          1 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand1Caption;
          end;
          2 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand2Caption;
          end;
          3 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand3Caption;
          end;
          4 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand4Caption;
          end;
          5 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.DateBand5Caption;
          end;
        end;
        dmOpt.cdsOpt.Post;
      except
        WebApplication.ShowMessage('Not able to modify records for Opt_D '+IntToStr(i));
      end;
    end;
    dmOpt.cdsOpt.ApplyUpdates(-1);
    dmOpt.cdsOpt.Close;
    dmOpt.qOpt.Close;
    dmOpt.qOpt.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOpt.ParamByName('OPTIONTYPEID').AsString := 'R';
    dmOpt.cdsOpt.Close;
    dmOpt.cdsOpt.Open;
    for i := 1 to MaxSeries do
    begin
      try
        dmOpt.cdsOpt.Filtered := false;
        dmOpt.cdsOpt.Filter := 'OptionID = '+IntToStr(i);
        dmOpt.cdsOpt.Filtered := true;
        dmOpt.cdsOpt.Edit;
        case i of
          1 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio1Caption;
          end;
          2 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio2Caption;
          end;
          3 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio3Caption;
          end;
          4 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio4Caption;
          end;
          5 : begin
            dmOpt.cdsOptOPTIONTITLE.AsString := UserSession.Ratio5Caption;
          end;
        end;
        dmOpt.cdsOpt.Post;
      except
        WebApplication.ShowMessage('Not able to modify records for Opt_R '+IntToStr(i));
      end;
    end;
    dmOpt.cdsOpt.ApplyUpdates(-1);
    dmOpt.cdsOpt.Close;

    dmOpt.qOptDates.Close;
    dmOpt.qOptDates.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.cdsOptDates.Close;
    dmOpt.cdsOptDates.Open;
    if (dmOpt.cdsOptDates.RecordCount > 0) then
    begin
      {record exists for this user. Update values from UserSession}
      for i := 1 to MaxSeries do
      begin
        try
          dmOpt.cdsOptDates.Filtered := false;
          dmOpt.cdsOptDates.Filter := 'OptionID = '+IntToStr(i);
          dmOpt.cdsOptDates.Filtered := true;
          case i of
            1 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand1Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand1Maximum;
            end;
            2 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand2Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand2Maximum;
            end;
            3 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand3Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand3Maximum;
            end;
            4 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand4Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand4Maximum;
            end;
            5 : begin
              dmOpt.cdsOptDates.Edit;
              dmOpt.cdsOptDatesDATEMIN.AsString := UserSession.DateBand5Minimum;
              dmOpt.cdsOptDatesDATEMAX.AsString := UserSession.DateBand5Maximum;
            end;
          end;
          dmOpt.cdsOptDates.Post;
        except
          WebApplication.ShowMessage('Not able to modify records for OptDates '+IntToStr(i));
        end;
      end;
      dmOpt.cdsOptDates.Filtered := false;
      dmOpt.cdsOptDates.ApplyUpdates(-1);
    end;
    dmOpt.cdsOptDates.Close;

    dmOpt.cdsOpt.Filtered := false;

    dmOpt.qOptRatios.Close;
    dmOpt.qOptRatios.ParamByName('USERID').AsString := UserSession.UserID;
    dmOpt.qOptRatios.ParamByName('OPTIONTYPEID').AsString := 'R';
    dmOpt.cdsOptRatios.Close;
    dmOpt.cdsOptRatios.Open;
    if (dmOpt.cdsOptRatios.RecordCount > 0) then
    begin
      {record exists for this user. Update values from UserSession}
      for i := 1 to MaxSeries do
      begin
        try
          dmOpt.cdsOptRatios.Filtered := false;
          dmOpt.cdsOptRatios.Filter := 'OptionID = '+IntToStr(i);
          dmOpt.cdsOptRatios.Filtered := true;
          case i of
            1 : begin
              dmOpt.cdsOptRatios.Edit;
              dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.Ratio1Minimum;
              dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.Ratio1Maximum;
            end;
            2 : begin
              dmOpt.cdsOptRatios.Edit;
              dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.Ratio2Minimum;
              dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.Ratio2Maximum;
            end;
            3 : begin
              dmOpt.cdsOptRatios.Edit;
              dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.Ratio3Minimum;
              dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.Ratio3Maximum;
            end;
            4 : begin
              dmOpt.cdsOptRatios.Edit;
              dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.Ratio4Minimum;
              dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.Ratio4Maximum;
            end;
            5 : begin
              dmOpt.cdsOptRatios.Edit;
              dmOpt.cdsOptRatiosVALUEMIN.AsString := UserSession.Ratio5Minimum;
              dmOpt.cdsOptRatiosVALUEMAX.AsString := UserSession.Ratio5Maximum;
            end;
          end;
          dmOpt.cdsOptRatios.Post;
        except
          WebApplication.ShowMessage('Not able to modify records for OptRatios '+IntToStr(i));
        end;
      end;
      dmOpt.cdsOptRatios.Filtered := false;
      dmOpt.cdsOptRatios.ApplyUpdates(-1);
    end;
    dmOpt.cdsOptRatios.Close;
  end;
end;

procedure TdmOpt.InsertNewUserVar( tUserID : string;
                                   tApplicationID : integer;
                                   tVarOrder : integer;
                                   tVariableID : string;
                                   var WasSuccessful : boolean);
var
  TD: TDBXTransaction;
begin
  WasSuccessful := true;
  TD := dmOpt.sqlcDep.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmOpt.qInsertUserVar.Params.ParamByName('tUserID').AsString := tUserID;
    dmOpt.qInsertUserVar.Params.ParamByName('tApplicationID').AsInteger := tApplicationID;
    dmOpt.qInsertUserVar.Params.ParamByName('tVarOrder').AsInteger := tVarOrder;
    dmOpt.qInsertUserVar.Params.ParamByName('tVariableID').AsString := tVariableID;
    dmOpt.qInsertUserVar.ExecSQL(false);
    dmOpt.sqlcDep.CommitFreeAndNil(TD); //on success, commit the changes
  except
    dmOpt.sqlcDep.RollbackFreeAndNil(TD); //on failure, undo the changes
    WasSuccessful := false;
  end;
end;



end.
