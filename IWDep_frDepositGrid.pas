unit IWDep_frDepositGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  jpeg, IWCompExtCtrls,
  IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion, IWCompRectangle, IWCompMemo,
  IWDep_framemenu, IWDep_frTopBar, IWHTML40Container, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TISFDepositGrid = class(TIWAppForm)
    rectRight: TIWRectangle;
    IWRectangle1: TIWRectangle;
    IWRegionFrameMenu: TIWRegion;
    FrameMenu: TISFFrameMenu;
    TopBar: TISFTopBarDep;
    IWRegion1: TIWRegion;
    iwrTop: TIWRegion;
    iwbDownload: TIWButton;
    iwlFirstPage: TIWLink;
    iwlLastPage: TIWLink;
    iwlNextPage: TIWLink;
    iwlPrevPage: TIWLink;
    iwlPageNumTotal: TIWLabel;
    iwlSortedBy: TIWLabel;
    iwlPageNum: TIWLabel;
    lblRecordCount: TIWLabel;
    iwlOf: TIWLabel;
    iwbCalculateStatistics: TIWButton;
    iwrBottom: TIWRegion;
    iwbDownloadAverStatistics: TIWButton;
    iwbDownloadCount: TIWButton;
    iwbDownloadLeastStatistics: TIWButton;
    iwbDownloadMostStatistics: TIWButton;
    iwbDownloadUserData: TIWButton;
    IWRegionResults: TIWRegion;
    iwDBgResults: TIWDBGrid;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0Click(ASender: TObject;
      const AValue: String);
    procedure IWDBGrid1ColumnsTitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwlFirstPageClick(Sender: TObject);
    procedure iwlLastPageClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbCalculateStatisticsClick(Sender: TObject);
    procedure iwbDownloadCountClick(Sender: TObject);
    procedure iwbDownloadAverStatisticsClick(Sender: TObject);
    procedure iwbDownloadUserDataClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWDep_dmStrat,
  IWDep_uMain, IWDep_constants, usrIW_dm, IWDep_depositcovr, IWDep_dm;

procedure TISFDepositGrid.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
end;

procedure TISFDepositGrid.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: String);
begin
  if ((UserSession.CanModify) or (UserSession.CanModifyPlus)
    or (UserSession.CanDelete)
    or (UserSession.CanViewPlus) or (UserSession.CanInsert)) then
  begin
    UserSession.RecordChosen := AValue;
    dmStrat.qDeposit.Close;
    dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
    dmStrat.cdsDeposit.Close;
    dmStrat.cdsDeposit.Open;
    dmDep.CopyDepositDataForUser(UserSession.UserID,UserSession.RecordChosen,dmStrat.cdsDepositAPPROXAGE.AsFloat);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.CanModify or UserSession.CanModifyPlus or UserSession.CanViewPlus) then
    begin
      TISFDepositDetails.Create(WebApplication).Show;
    end else
    begin
      TISFDepositDetails.Create(WebApplication).Show;
    end;
  end else
  begin
    WebApplication.ShowMessage('You do not have permission for this feature');
  end;
end;

procedure TISFDepositGrid.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmStrat.cdsDepositQuery.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDepositGrid.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsDepositQuery.MoveBy(-1*iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
  if (UserSession.PageNum < 1) then UserSession.PageNum := 1;
end;

procedure TISFDepositGrid.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsDepositQuery.MoveBy(iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
  if (UserSession.PageNum > UserSession.PageNumTotal) then UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFDepositGrid.IWAppFormCreate(Sender: TObject);
var
  i, nRec : integer;
begin
  FrameMenu.Options1.Visible := false;
  FrameMenu.OptionsUser.Visible := UserSession.CanModify;
  FrameMenu.OptionsUser1.Visible := false;
  iwbCalculateStatistics.Visible := false;
  iwbDownloadCount.Visible := false;
  iwbDownload.Visible := false;
  iwbDownloadAverStatistics.Visible := false;
  iwbDownloadLeastStatistics.Visible := false;
  iwbDownloadMostStatistics.Visible := false;
  iwbDownloadUserData.Visible := false;
  iwlPrevPage.Visible := false;
  iwlNextPage.Visible := false;
  iwlFirstPage.Visible := false;
  iwlLastPage.Visible := false;
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := 1;
  FrameMenu.SelectDeposit1.Enabled := true;
  FrameMenu.Compare1.Enabled := false;
  FrameMenu.LookupTables1.Visible := false;
  FrameMenu.Options1.Enabled := false;
  FrameMenu.New1.Visible := false;
  TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
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
  if UserSession.LoggedIn then
  begin
    iwbCalculateStatistics.Visible := UserSession.CanModifyPlus;
    iwbDownloadCount.Visible := UserSession.CanView;
    iwbDownload.Visible := UserSession.CanExport;
    iwbDownloadAverStatistics.Visible := UserSession.CanExport and UserSession.CanViewPlus;
    iwbDownloadLeastStatistics.Visible := UserSession.CanExport and UserSession.CanViewPlus;
    iwbDownloadMostStatistics.Visible := UserSession.CanExport and UserSession.CanViewPlus;
    iwbDownloadUserData.Visible := UserSession.CanExport and UserSession.CanModifyPlus;
    if (UserSession.ThisProgram = 'DepIso') then
    begin
      TopBar.lblProgTitle.Text := 'Deposit Isotope Database';
      FrameMenu.IWImageDepIso.Visible := true;
    end;
    dmStrat.DepositQuery.Close;
    dmStrat.cdsDepositQuery.Close;
    dmStrat.DepositQuery.ParamByName('UserID').AsString := UserSession.UserID;
    dmStrat.cdsDepositQuery.Open;
    dmStrat.DepositQueryRecordCount;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStrat.cdsDepositQuery.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStrat.cdsDepositQuery.Delete;
        end;
      end;
    end;
    iwlPrevPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlNextPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlFirstPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlLastPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    UserSession.PageNum := 1;
    UserSession.PageNumTotal := UserSession.NumRecordsFound div iwDBgResults.RowLimit;
    if ((UserSession.NumRecordsFound mod iwDBgResults.RowLimit) <> 0) then UserSession.PageNumTotal := UserSession.PageNumTotal +1;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
    iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
    lblRecordCount.Text := IntToStr(UserSession.NumRecordsFound)+' records match the query specified';
    if (UserSession.UserID = 'guest') then lblRecordCount.Text := lblRecordCount.Text + ' (guest is limited to 10 records)';
    if (UserSession.CanViewPlus) then FrameMenu.Compare1.Enabled := true;
    if (UserSession.CanViewPlus) then FrameMenu.SelectGraph1.Enabled := true;
    //if (UserSession.CanView) then FrameMenu.Options1.Enabled := true;
    //if (UserSession.CanView) then FrameMenu.OptionsUser1.Enabled := true;
  end;
end;

procedure TISFDepositGrid.iwlFirstPageClick(Sender: TObject);
begin
  dmStrat.cdsDepositQuery.First;
  UserSession.PageNum := 1;
end;

procedure TISFDepositGrid.iwlLastPageClick(Sender: TObject);
begin
  dmStrat.cdsDepositQuery.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFDepositGrid.iwbCalculateStatisticsClick(Sender: TObject);
var
  tDepositID : integer;
  tAge, tmpAge : double;
  Slope : double;
  Pb74, Pb64 : double;
  DatingTypeID_ModelPb : integer;
begin
  DatingTypeID_ModelPb := 6; // hard coded for now
  dmStrat.cdsDepositQuery.First;
  repeat
    tDepositID := dmStrat.cdsDepositQuerySDBDEPOSITID.AsInteger;
    tAge := dmStrat.cdsDepositQueryAPPROXAGE.AsFloat;
    if (tAge >= SKAge_Stage1) then
    begin
      // get least radiogenic sample values
      // calculate 207/206 for sample relative to SK starting composition
      //calculate PbModelAge
      dmDep.FindLeastRadiogenicSample(tDepositID,Pb64,Pb74);
      if (((Pb64 - SK64_Stage2) > 0.0) and (Pb64 > 0.0) and (Pb74 > 0.0) and (Pb64 < SK64_Modern)) then
      begin
        Slope :=  (Pb74 - SK74_Stage2) / (Pb64 - SK64_Stage2);
        tmpAge := dmDep.PbModelAge(Slope);
        if (tmpAge > 0.0) then
        begin
          tAge := tmpAge;
          dmStrat.qDeposit.Close;
          dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsInteger := tDepositID;
          dmStrat.cdsDeposit.Close;
          dmStrat.cdsDeposit.Open;
          dmStrat.cdsDeposit.Edit;
          dmStrat.cdsDepositAPPROXAGE.AsFloat := tAge;
          dmStrat.cdsDepositAPPROXAGEUNCERTAINTY.AsFloat := 333.33;
          dmStrat.cdsDepositDATINGTYPEID.AsInteger := DatingTypeID_ModelPb;
          dmStrat.cdsDeposit.Post;
          try
            dmStrat.cdsDeposit.ApplyUpdates(0);
          except
          end;
        end;
      end else
      begin
        //change age to 4990 to show a recalculation has been attempted but the data preclude a model age being derived
        tAge := 4990.0;
        dmStrat.qDeposit.Close;
        dmStrat.qDeposit.ParamByName('SDBDEPOSITID').AsInteger := tDepositID;
        dmStrat.cdsDeposit.Close;
        dmStrat.cdsDeposit.Open;
        dmStrat.cdsDeposit.Edit;
        dmStrat.cdsDepositAPPROXAGE.AsFloat := tAge;
        dmStrat.cdsDepositAPPROXAGEUNCERTAINTY.AsFloat := 333.33;
        dmStrat.cdsDepositDATINGTYPEID.AsInteger := 0;
        dmStrat.cdsDeposit.Post;
        try
          dmStrat.cdsDeposit.ApplyUpdates(0);
        except
        end;
      end;
    end;
    try
      dmDep.CalculateCoVarAvg(tDepositID,tAge);
    except
      if UserSession.ShowWebErrorMessages then
      begin
        WebApplication.ShowMessage('Problem calculating average statistics for deposit '+IntToStr(tDepositID));
      end;
      dmUser.SetDeveloperData('Problem calculating average statistics for deposit '+IntToStr(tDepositID));
    end;
    try
      dmDep.CalculateCoVarLeastRadiogenic(tDepositID,tAge);
    except
      if UserSession.ShowWebErrorMessages then
      begin
        WebApplication.ShowMessage('Problem calculating least radiogenic statistics for deposit '+IntToStr(tDepositID));
      end;
      dmUser.SetDeveloperData('Problem calculating least radiogenic statistics for deposit '+IntToStr(tDepositID));
    end;
    try
      dmDep.CalculateCoVarMostRadiogenic(tDepositID,tAge);
    except
      if UserSession.ShowWebErrorMessages then
      begin
        WebApplication.ShowMessage('Problem calculating most radiogenic statistics for deposit '+IntToStr(tDepositID));
      end;
      dmUser.SetDeveloperData('Problem calculating most radiogenic statistics for deposit '+IntToStr(tDepositID));
    end;
    dmStrat.cdsDepositQuery.Next;
  until dmStrat.cdsDepositQuery.Eof;
end;

procedure TISFDepositGrid.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  //l,i : integer;
begin
  dmStrat.qDRep1.Close;
  dmStrat.qDRep1.SQL.Clear;
  dmStrat.qDRep1.SQL.Text := dmStrat.DepositQuery.SQL.Text;
  dmStrat.cdsDRep1.Close;
  dmStrat.qDRep1.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.qDRep2.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsDRep1.Open;
  dmStrat.cdsDRep1.First;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStrat.qRep1.SQL.Text);
  end;
  //dmUser.SetDeveloperData('after filling FDMemTable1 in ClanTypes');
  //dmStrat.FlexCelReport1.Template := DefaultFlexCellFolder+'FlxDepIsoDeposits.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDepIsoDeposits.xlsx';
  frFileNameStr := 'Deposits_selected.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDRep1',dmStrat.cdsDRep1);
    fr.AddTable('cdsDRep2',dmStrat.cdsDRep2);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFDepositGrid.iwbDownloadCountClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  i : integer;
  tempStr : string;
  iCode : integer;
  FromDate, ToDate : double;
begin
  dmDep.qDepCount.Close;
  dmDep.qDepCount.SQL.Clear;
  dmDep.qDepCount.SQL.Add('select distinct deposits.sdbdepositid, deposits.depositname, deposits.depositparentid,');
  dmDep.qDepCount.SQL.Add('deposits.depositclanid, depositclans.depositclan,');
  dmDep.qDepCount.SQL.Add('deposits.deplongitude, deposits.deplatitude,');
  dmDep.qDepCount.SQL.Add('deposits.approxage, deposits.approxageuncertainty, deposits.datingtypeid,');
  dmDep.qDepCount.SQL.Add('deposits.databaseid, deposits.countryid, deposits.geodynamicid,');
  dmDep.qDepCount.SQL.Add('deposits.hostunitid, deposits.approxstratage, deposits.approxstratageuncertainty,');
  dmDep.qDepCount.SQL.Add('deposits.depositstatusid,');
  dmDep.qDepCount.SQL.Add('depisotopecount.countpb, depisotopecount.countsr, depisotopecount.countnd,');
  dmDep.qDepCount.SQL.Add('depisotopecount.countos, depisotopecount.counthf,');
  dmDep.qDepCount.SQL.Add('depisotopecount.counts, depisotopecount.countso4, depisotopecount.counto');
  dmDep.qDepCount.SQL.Add('from deposits,depisotopecount,userswhofor,depositfor,depositclans');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDep.qDepCount.SQL.Add(',country');
  end;
  dmDep.qDepCount.SQL.Add('where userswhofor.USERID = :UserID');
  dmDep.qDepCount.SQL.Add('and userswhofor.whoforid = depositfor.whoforid');
  dmDep.qDepCount.SQL.Add('and depositfor.sdbdepositid = depisotopecount.depositid');
  dmDep.qDepCount.SQL.Add('and depositfor.sdbdepositid = deposits.sdbdepositid');
  dmDep.qDepCount.SQL.Add('and depositclans.depositclanid = deposits.depositclanid');
  if (not UserSession.IncludeAllParentIDs) then
  begin
    dmDep.qDepCount.SQL.Add('AND DEPOSITS.DEPOSITPARENTID = 0');
  end;
  if UserSession.IncludeDateFromValue then
  begin
    Val(UserSession.DateFromField,FromDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end else
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',0.0);
    end;
  end;
  if UserSession.IncludeDateToValue then
  begin
    Val(UserSession.DateToField,ToDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end else
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',4500.0);
    end;
  end;
  if UserSession.IncludeDateFromValue then
  begin
    tempStr := 'AND ';
    dmDep.qDepCount.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE >= '+UserSession.DateFromField;
    dmDep.qDepCount.SQL.Add(tempStr);
  end;
  if UserSession.IncludeDateToValue then
  begin
    tempStr := 'AND ';
    dmDep.qDepCount.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE <= '+ UserSession.DateToField;
    dmDep.qDepCount.SQL.Add(tempStr);
  end;
  {Continents}
  if (UserSession.IncludeContinentValues) then
  begin
    dmDep.qDepCount.SQL.Add('AND DEPOSITS.COUNTRYID = COUNTRY.COUNTRYABR');
    dmDep.qDepCount.SQL.Add('AND ( COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDep.qDepCount.SQL.Add('OR COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qDepCount.SQL.Add(' ) ');
  end;
  {Clans}
  if (UserSession.IncludeClanValues) then
  begin
    dmDep.qDepCount.SQL.Add('AND ( DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[0]+'''');
    if (UserSession.ClanValues.Count >1) then
    begin
      for i := 2 to UserSession.ClanValues.Count do
      begin
        dmDep.qDepCount.SQL.Add('OR DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qDepCount.SQL.Add(' ) ');
  end;
  {Countries}
  if (UserSession.IncludeAreaValues) then
  begin
    dmDep.qDepCount.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDep.qDepCount.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qDepCount.SQL.Add(' ) ');
  end;
  {Deposits}
  if (UserSession.IncludeDepositValues) then
  begin
    dmDep.qDepCount.SQL.Add('AND ( DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[0]+'''');
    if (UserSession.DepositValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositValues.Count do
      begin
        dmDep.qDepCount.SQL.Add('OR DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qDepCount.SQL.Add(' ) ');
  end;
  dmDep.qDepCount.SQL.Add('order by deposits.countryid,deposits.depositname');
  dmDep.qDepCount.SQL.Add(' ');
  //dmUser.SetDeveloperData(dmDep.qDepCount.SQL.Text);
  dmDep.qDepCount.ParamByName('UserID').AsString := UserSession.UserID;
  dmDep.cdsDepCount.Open;
  dmDep.cdsDepCount.First;
  //dmDep.FlexCelReportDepCount.Template := DefaultFlexCellFolder+'FlxDepCount.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDepCount.xlsx';
  frFileNameStr := 'Deposits_selected_isotope.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDepCount',dmDep.cdsDepCount);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFDepositGrid.iwbDownloadUserDataClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  i : integer;
  tempStr : string;
  iCode : integer;
  FromDate, ToDate : double;
  WasSuccessful : boolean;
begin
  dmDep.DeleteUserDepSampleValuesForUser(UserSession.UserID,WasSuccessful);
  dmStrat.cdsDepositQuery.First;
  repeat
    //dmUser.SetDeveloperData(UserSession.UserID+' '+dmStrat.cdsDepositQuerySDBDEPOSITID.AsString+' '+dmStrat.cdsDepositQueryAPPROXAGE.AsString);
    dmDep.CopyDepositDataForUser(UserSession.UserID,dmStrat.cdsDepositQuerySDBDEPOSITID.AsString,dmStrat.cdsDepositQueryAPPROXAGE.AsFloat);
    dmStrat.cdsDepositQuery.Next
  until dmStrat.cdsDepositQuery.Eof;
  dmStrat.cdsDepositQuery.First;
  dmDep.qUserDepData.Close;
  dmDep.qUserDepData.SQL.Clear;
  dmDep.qUserDepData.SQL.Add('select userdepsamplevalues.depositid, userdepsamplevalues.sampleno,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.frac, userdepsamplevalues.materialabr, userdepsamplevalues.inc4stats,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.pb64, userdepsamplevalues.spb64, userdepsamplevalues.epb64,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.pb74, userdepsamplevalues.spb74, userdepsamplevalues.epb74,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.pb84, userdepsamplevalues.spb84, userdepsamplevalues.epb84,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.pb76, userdepsamplevalues.spb76, userdepsamplevalues.epb76,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.pb86, userdepsamplevalues.spb86, userdepsamplevalues.epb86,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.rho76, ');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.rho86, ');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.mu, userdepsamplevalues.smu,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.musmp, ');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.kappasrc, userdepsamplevalues.skappasrc, ');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.kappasmp, userdepsamplevalues.skappasmp, ');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.sr87i, userdepsamplevalues.ssr87i, userdepsamplevalues.esr87i,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.nd143i, userdepsamplevalues.snd143i, userdepsamplevalues.end143i,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.os187i, userdepsamplevalues.sos187i, userdepsamplevalues.eos187i,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.hf176i, userdepsamplevalues.shf176i, userdepsamplevalues.ehf176i,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.s34, userdepsamplevalues.ss34,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.so434, userdepsamplevalues.sso434,');
  dmDep.qUserDepData.SQL.Add('  userdepsamplevalues.o18, userdepsamplevalues.so18,');
  dmDep.qUserDepData.SQL.Add('  deposits.depositclanid, depositclans.depositclan, ');
  dmDep.qUserDepData.SQL.Add('  deposits.depositname, deposits.countryid, deposits.deplatitude, deposits.deplongitude, deposits.depositparentid,');
  dmDep.qUserDepData.SQL.Add('  deposits.approxage, deposits.approxageuncertainty');
  dmDep.qUserDepData.SQL.Add('  deposits.depositstatusid');
  dmDep.qUserDepData.SQL.Add('from userdepsamplevalues,deposits,depositclans');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDep.qUserDepData.SQL.Add(',country');
  end;
  dmDep.qUserDepData.SQL.Add('where userdepsamplevalues.userid = :UserID');
  dmDep.qUserDepData.SQL.Add('and userdepsamplevalues.depositid = deposits.sdbdepositid');
  dmDep.qUserDepData.SQL.Add('and deposits.depositclanid = depositclans.depositclanid');
  if (not UserSession.IncludeAllParentIDs) then
  begin
    dmDep.qUserDepData.SQL.Add('AND DEPOSITS.DEPOSITPARENTID = 0');
  end;
  if UserSession.IncludeDateFromValue then
  begin
    Val(UserSession.DateFromField,FromDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end else
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',0.0);
    end;
  end;
  if UserSession.IncludeDateToValue then
  begin
    Val(UserSession.DateToField,ToDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end else
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',4500.0);
    end;
  end;
  if UserSession.IncludeDateFromValue then
  begin
    tempStr := 'AND ';
    dmDep.qUserDepData.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE >= '+UserSession.DateFromField;
    dmDep.qUserDepData.SQL.Add(tempStr);
  end;
  if UserSession.IncludeDateToValue then
  begin
    tempStr := 'AND ';
    dmDep.qUserDepData.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE <= '+ UserSession.DateToField;
    dmDep.qUserDepData.SQL.Add(tempStr);
  end;
  {Continents}
  if (UserSession.IncludeContinentValues) then
  begin
    dmDep.qUserDepData.SQL.Add('AND DEPOSITS.COUNTRYID = COUNTRY.COUNTRYABR');
    dmDep.qUserDepData.SQL.Add('AND ( COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDep.qUserDepData.SQL.Add('OR COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qUserDepData.SQL.Add(' ) ');
  end;
  {Clans}
  if (UserSession.IncludeClanValues) then
  begin
    dmDep.qUserDepData.SQL.Add('AND ( DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[0]+'''');
    if (UserSession.ClanValues.Count >1) then
    begin
      for i := 2 to UserSession.ClanValues.Count do
      begin
        dmDep.qUserDepData.SQL.Add('OR DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qUserDepData.SQL.Add(' ) ');
  end;
  {Countries}
  if (UserSession.IncludeAreaValues) then
  begin
    dmDep.qUserDepData.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDep.qUserDepData.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qUserDepData.SQL.Add(' ) ');
  end;
  {Deposits}
  if (UserSession.IncludeDepositValues) then
  begin
    dmDep.qUserDepData.SQL.Add('AND ( DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[0]+'''');
    if (UserSession.DepositValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositValues.Count do
      begin
        dmDep.qUserDepData.SQL.Add('OR DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qUserDepData.SQL.Add(' ) ');
  end;
  dmDep.qUserDepData.SQL.Add('order by deposits.countryid,deposits.depositclanid,deposits.depositname,userdepsamplevalues.sampleno,userdepsamplevalues.frac,userdepsamplevalues.pb64,userdepsamplevalues.pb74,userdepsamplevalues.pb84');
  dmDep.qUserDepData.ParamByName('UserID').AsString := UserSession.UserID;
  dmDep.cdsUserDepData.Open;
  dmDep.cdsUserDepData.First;
  if UserSession.IsDeveloper then
  begin
    dmUser.SetDeveloperData(dmDep.qUserDepData.SQL.Text);
  end;
  //dmDep.FlexCelReportUserDepData.Template := DefaultFlexCellFolder+'FlxDepUserData.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDepUserData.xlsx';
  frFileNameStr := 'Deposits_isotope_data.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUserDepData',dmDep.cdsuserDepData);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFDepositGrid.iwbDownloadAverStatisticsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  i : integer;
  FilenameString : string;
  tempStr : string;
  iCode : integer;
  FromDate, ToDate : double;
begin
  FilenameString := 'Deposits_selected_statistics.xlsx';
  dmDep.qDepStatistics.Close;
  dmDep.qDepStatistics.SQL.Clear;
  dmDep.qDepStatistics.SQL.Add('select distinct deposits.sdbdepositid, deposits.depositname, deposits.depositparentid,');
  dmDep.qDepStatistics.SQL.Add('deposits.depositclanid, depositclans.depositclan,');
  dmDep.qDepStatistics.SQL.Add('deposits.deplongitude, deposits.deplatitude,');
  dmDep.qDepStatistics.SQL.Add('deposits.approxage, deposits.approxageuncertainty, deposits.datingtypeid,');
  dmDep.qDepStatistics.SQL.Add('deposits.databaseid, deposits.countryid, deposits.geodynamicid,');
  dmDep.qDepStatistics.SQL.Add('deposits.hostunitid, deposits.approxstratage, deposits.approxstratageuncertainty,');
  dmDep.qDepStatistics.SQL.Add('deposits.depositstatusid,');
  dmDep.qDepStatistics.SQL.Add('depisotopecount.countpb, depisotopecount.countsr, depisotopecount.countnd,');
  dmDep.qDepStatistics.SQL.Add('depisotopecount.countos, depisotopecount.counthf,');
  dmDep.qDepStatistics.SQL.Add('depisotopecount.counts, depisotopecount.countso4, depisotopecount.counto,');
  dmDep.qDepStatistics.SQL.Add('depcovr.averleast,depcovr.materialabr,depcovr.median64,depcovr.median74,depcovr.median84,');
  dmDep.qDepStatistics.SQL.Add('depcovr.median76,depcovr.median86,');
  dmDep.qDepStatistics.SQL.Add('depcovr.median64model,depcovr.median74model,depcovr.median84model,depcovr.medianmu,');
  dmDep.qDepStatistics.SQL.Add('depcovr.medianmusamples,depcovr.medianthumodel,depcovr.medianthusamples,');
  dmDep.qDepStatistics.SQL.Add('depcovr.medianSr87initial,depcovr.medianNd143initial,');
  dmDep.qDepStatistics.SQL.Add('depcovr.medianOs187initial,medianHf176Initial,');
  dmDep.qDepStatistics.SQL.Add('depcovr.medianS34,depcovr.medianSO434,depcovr.medianO18,');
  dmDep.qDepStatistics.SQL.Add('depcovr.numsamples64, depcovr.modelid,');
  dmDep.qDepStatistics.SQL.Add('depcovr.numsamplesSr87Initial, depcovr.numsamplesNd143Initial,');
  dmDep.qDepStatistics.SQL.Add('depcovr.numsamplesOs187Initial, numsamplesHf176Initial,');
  dmDep.qDepStatistics.SQL.Add('depcovr.numsamplesS34,depcovr.numsamplesSO434,depcovr.numsamplesO18,');
  dmDep.qDepStatistics.SQL.Add('depcovr.sdev64,depcovr.sdev74,depcovr.sdev84,depcovr.sdev76,depcovr.sdev86,');
  dmDep.qDepStatistics.SQL.Add('depcovr.sdevmu,depcovr.sdev64model,depcovr.sdev74model,depcovr.sdevmusmp,');
  dmDep.qDepStatistics.SQL.Add('depcovr.coeffvar64,depcovr.coeffvar74,depcovr.coeffvar84,');
  dmDep.qDepStatistics.SQL.Add('depcovr.coeffvar76,depcovr.coeffvar86,');
  dmDep.qDepStatistics.SQL.Add('depcovr.coeffvarmu,depcovr.coeffvar64model,depcovr.coeffvar74model,');
  dmDep.qDepStatistics.SQL.Add('averleast.averageleast,');
  dmDep.qDepStatistics.SQL.Add('depcovr.iqr64,depcovr.iqr74,depcovr.iqr84,depcovr.iqr76,depcovr.iqr86,');
  dmDep.qDepStatistics.SQL.Add('depcovr.iqrmu,depcovr.iqr64model,depcovr.iqr74model,depcovr.iqrmusmp,');
  dmDep.qDepStatistics.SQL.Add('depcovr.iqrSr87Initial,depcovr.iqrNd143Initial,');
  dmDep.qDepStatistics.SQL.Add('depcovr.iqrOs187Initial, depcovr.iqrHf176Initial,');
  dmDep.qDepStatistics.SQL.Add('depcovr.iqrS34,depcovr.iqrSO434,depcovr.iqrO18');
  dmDep.qDepStatistics.SQL.Add('from deposits,depisotopecount,depcovr,userswhofor,depositfor,averleast,depositclans');
  if (UserSession.IncludeContinentValues) then
  begin
    dmDep.qDepStatistics.SQL.Add(',country');
  end;
  dmDep.qDepStatistics.SQL.Add('where userswhofor.USERID = :UserID');
  dmDep.qDepStatistics.SQL.Add('and userswhofor.whoforid = depositfor.whoforid');
  dmDep.qDepStatistics.SQL.Add('and depositfor.sdbdepositid = depisotopecount.depositid');
  dmDep.qDepStatistics.SQL.Add('and depositfor.sdbdepositid = depcovr.depositid');
  dmDep.qDepStatistics.SQL.Add('and depositfor.sdbdepositid = deposits.sdbdepositid');
  dmDep.qDepStatistics.SQL.Add('and depositclans.depositclanid = deposits.depositclanid');
  dmDep.qDepStatistics.SQL.Add('and depcovr.averleast = :AverLeast');
  dmDep.qDepStatistics.SQL.Add('and depcovr.averleast = averleast.averleast');
  if (not UserSession.IncludeAllParentIDs) then
  begin
    dmDep.qDepStatistics.SQL.Add('AND DEPOSITS.DEPOSITPARENTID = 0');
  end;
  if UserSession.IncludeDateFromValue then
  begin
    Val(UserSession.DateFromField,FromDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end else
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',0.0);
    end;
  end;
  if UserSession.IncludeDateToValue then
  begin
    Val(UserSession.DateToField,ToDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end else
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',4500.0);
    end;
  end;
  if UserSession.IncludeDateFromValue then
  begin
    tempStr := 'AND ';
    dmDep.qDepStatistics.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE >= '+UserSession.DateFromField;
    dmDep.qDepStatistics.SQL.Add(tempStr);
  end;
  if UserSession.IncludeDateToValue then
  begin
    tempStr := 'AND ';
    dmDep.qDepStatistics.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE <= '+ UserSession.DateToField;
    dmDep.qDepStatistics.SQL.Add(tempStr);
  end;
  {Continents}
  if (UserSession.IncludeContinentValues) then
  begin
    dmDep.qDepStatistics.SQL.Add('AND DEPOSITS.COUNTRYID = COUNTRY.COUNTRYABR');
    dmDep.qDepStatistics.SQL.Add('AND ( COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmDep.qDepStatistics.SQL.Add('OR COUNTRY.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qDepStatistics.SQL.Add(' ) ');
  end;
  {Clans}
  if (UserSession.IncludeClanValues) then
  begin
    dmDep.qDepStatistics.SQL.Add('AND ( DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[0]+'''');
    if (UserSession.ClanValues.Count >1) then
    begin
      for i := 2 to UserSession.ClanValues.Count do
      begin
        dmDep.qDepStatistics.SQL.Add('OR DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qDepStatistics.SQL.Add(' ) ');
  end;
  {Countries}
  if (UserSession.IncludeAreaValues) then
  begin
    dmDep.qDepStatistics.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmDep.qDepStatistics.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qDepStatistics.SQL.Add(' ) ');
  end;
  {Deposits}
  if (UserSession.IncludeDepositValues) then
  begin
    dmDep.qDepStatistics.SQL.Add('AND ( DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[0]+'''');
    if (UserSession.DepositValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositValues.Count do
      begin
        dmDep.qDepStatistics.SQL.Add('OR DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[i-1]+'''');
      end;
    end;
    dmDep.qDepStatistics.SQL.Add(' ) ');
  end;
  dmDep.qDepStatistics.SQL.Add('order by deposits.countryid,deposits.depositname');
  dmDep.qDepStatistics.SQL.Add(' ');
  dmDep.cdsDepStatistics.Close;
  //dmUser.SetDeveloperData(dmDep.qDepStatistics.SQL.Text);
  dmDep.qDepStatistics.ParamByName('UserID').AsString := UserSession.UserID;
  if (Sender = iwbDownloadAverStatistics) then
  begin
    dmDep.qDepStatistics.ParamByName('AverLeast').AsString := 'A';
    FilenameString := 'Deposits_selected_statistics_average.xlsx';
  end;
  if (Sender = iwbDownloadLeastStatistics) then
  begin
    dmDep.qDepStatistics.ParamByName('AverLeast').AsString := 'L';
    FilenameString := 'Deposits_selected_statistics_leastradiogenic.xlsx';
  end;
  if (Sender = iwbDownloadMostStatistics) then
  begin
    dmDep.qDepStatistics.ParamByName('AverLeast').AsString := 'M';
    FilenameString := 'Deposits_selected_statistics_mostradiogenic.xlsx';
  end;
  dmDep.cdsDepStatistics.Open;
  dmDep.cdsDepStatistics.First;
  //dmDep.FlexCelReportDepStatistics.Template := DefaultFlexCellFolder+'FlxDepStatistics.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDepStatistics.xlsx';
  frFileNameStr := FileNameString;
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDepStatistics',dmDep.cdsDepStatistics);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

end.
