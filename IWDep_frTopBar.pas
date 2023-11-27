unit IWDep_frTopBar;

interface

uses
  Windows, Messages, SysUtils, {$IFNDEF VER130}Variants, {$ENDIF}Classes, Graphics, Controls, Forms,
  Dialogs, IWBaseControl, IWControl, IWCompExtCtrls, IWHTMLControls,
  IWCompLabel, IWHTMLTag, IWCompEdit, IWCompRectangle,
  IWContainer, IWRegion, IWVCLBaseControl, IWBaseHTMLControl,
  IWVCLBaseContainer, IWHTMLContainer, IWHTML40Container;

type
  TISFTopBarDep = class(TFrame)
    IWFrameRegion: TIWRegion;
    iwrHeader: TIWRegion;
    iwrWelcome: TIWRegion;
    iwrLeftBlock: TIWRegion;
    iwrDisplayUserName: TIWRegion;
    lblWelcome: TIWLabel;
    iwrSignInOut: TIWRegion;
    iwlSignOut: TIWLink;
    lnkSignIn: TIWLink;
    lblProgTitle: TIWLabel;
    procedure SignIn(Sender: TObject);
    procedure iwlSignOutClick(Sender: TObject);
    procedure iwlDonateClick(Sender: TObject);
  private
  public
  end;

implementation
{$R *.dfm}

uses
  IWInit, IWAppForm,
  ServerController,
  IWApplication, usr_constants, usr_uDBInterface;

procedure TISFTopBarDep.SignIn(Sender: TObject);
begin
  UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
end;



procedure TISFTopBarDep.iwlSignOutClick(Sender: TObject);
begin
  {need to add code here to save user choices before closing session}
  try
    UserSession.SetCookies;
  finally
    WebApplication.TerminateAndRedirect(GetURLonTerminate(UserSession.ThisProgram));
  end;
end;

procedure TISFTopBarDep.iwlDonateClick(Sender: TObject);
begin
 UserSession.MakeDonation(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
end;

end.

