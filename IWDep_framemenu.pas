unit IWDep_framemenu;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, Menus, IWCompMenu, jpeg,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompExtCtrls,
  IWHTMLContainer, ImgList, Graphics, IWHTML40Container, System.ImageList;

type
  TISFFrameMenu = class(TFrame)
    IWFrameRegion: TIWRegion;
    IWRegion1: TIWRegion;
    IWRegion2: TIWRegion;
    IWImageDepIso: TIWImage;
    IWMenu1: TIWMenu;
    MainMenu1: TMainMenu;
    Select1: TMenuItem;
    SelectDeposit1: TMenuItem;
    LookupTables1: TMenuItem;
    Options1: TMenuItem;
    New1: TMenuItem;
    MainPage1: TMenuItem;
    IWRegion3: TIWRegion;
    SelectGraph1: TMenuItem;
    ImageList1: TImageList;
    OptionsUser1: TMenuItem;
    OptionsWhoForMembers1: TMenuItem;
    OptionsWhoForGroups1: TMenuItem;
    Compare1: TMenuItem;
    OptionsUser: TMenuItem;
    procedure SelectDeposit1Click(Sender: TObject);
    procedure SelectGraph1Click(Sender: TObject);
    procedure MainPage1Click(Sender: TObject);
    procedure OptionsUser1Click(Sender: TObject);
    procedure Compare1Click(Sender: TObject);
    procedure OptionsUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IWAppForm, IWForm, IWInit,
  IWDep_uMain,
  IWDep_definequery, IWDep_options,
  IWDep_constants,
  ServerController, IWDep_defineprospecttargetsquery,
  usr_insufficientright, IWDep_optionsGrid;

procedure TISFFrameMenu.Compare1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanViewPlus then
    begin
      UserSession.UnitSender := usProspectCompare;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Hide;
      TISFDefineProspectTargetsQuery.Create(WebApplication).Show;
    end else
    begin
      UserSession.UnitSender := 'nihil';
      WebApplication.ShowMessage('You do not have permission for this operation');
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Hide;
      TISFInsufficientRights.Create(WebApplication).Show;
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.MainPage1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFMain.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.OptionsUser1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFOptions.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.OptionsUserClick(Sender: TObject);
begin
  if UserSession.LoggedIn and UserSession.IsDeveloper then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFOptionsGrid.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectDeposit1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify or UserSession.CanView then
    begin
      UserSession.UnitSender := usDeposits;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Hide;
      TISFDefineQuery.Create(WebApplication).Show;
    end else
    begin
      UserSession.UnitSender := 'nihil';
      WebApplication.ShowMessage('You do not have permission for this operation');
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Hide;
      TISFInsufficientRights.Create(WebApplication).Show;
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectGraph1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanViewPlus then
    begin
      {
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Hide;
      TISFSelectGraph.Create(WebApplication).Show;
      }
    end else
    begin
      {
      UserSession.UnitSender := 'nihil';
      WebApplication.ShowMessage('You do not have permission for this operation');
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Hide;
      TISFInsufficientRights.Create(WebApplication).Show;
      }
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

end.
