program DepIso;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  IWStart,
  Forms,
  usrIW_dm in '..\WebUserIW\usrIW_dm.pas' {dmUser: TDataModule},
  usr_uChangeDetails in '..\WebUserIW\usr_uChangeDetails.pas' {ISFChangeUserDetails: TIWAppForm},
  IWDep_frTopBar in 'IWDep_frTopBar.pas' {ISFTopBarDep: TFrame},
  usr_uDBInterface in '..\WebUserIW\usr_uDBInterface.pas',
  IWDep_dmStrat in 'IWDep_dmStrat.pas' {dmStrat: TDataModule},
  IWDep_optionsGrid in 'IWDep_optionsGrid.pas' {ISFOptionsGrid: TIWAppForm},
  IWDep_dmopt in 'IWDep_dmopt.pas' {dmOpt: TDataModule},
  IWDep_constvalues in 'IWDep_constvalues.pas',
  usr_constants in '..\WebUserIW\usr_constants.pas',
  usr_uRenew in '..\WebUserIW\usr_uRenew.pas' {ISFRenew: TIWAppForm},
  usr_uRegister in '..\WebUserIW\usr_uRegister.pas' {ISFRegister: TIWAppForm},
  usr_insufficientright in '..\WebUserIW\usr_insufficientright.pas' {ISFInsufficientRights: TIWAppForm},
  IWDep_definequery1 in 'IWDep_definequery1.pas' {ISFDefineQuery1: TIWAppForm},
  usr_uLogin in '..\WebUserIW\usr_uLogin.pas' {ISFLogin: TIWAppForm},
  IWDep_constants in 'IWDep_constants.pas',
  IWDep_uMain in 'IWDep_uMain.pas' {ISFMain: TIWAppForm},
  usr_uDonate in '..\WebUserIW\usr_uDonate.pas' {ISFDonate: TIWAppForm},
  usr_uForgotten in '..\WebUserIW\usr_uForgotten.pas' {ISFForgotten: TIWAppForm},
  IWDep_definequery in 'IWDep_definequery.pas' {ISFDefineQuery: TIWAppForm},
  IWDep_dm in 'IWDep_dm.pas' {dmDep: TDataModule},
  IWDep_frDepositGrid in 'IWDep_frDepositGrid.pas' {ISFDepositGrid: TIWAppForm},
  IWDep_defineprospecttargetsquery in 'IWDep_defineprospecttargetsquery.pas' {ISFDefineProspectTargetsQuery: TIWAppForm},
  IWDep_framemenu in 'IWDep_framemenu.pas' {ISFFrameMenu: TFrame},
  IWDep_depositcompare in 'IWDep_depositcompare.pas' {ISFDepositCompare: TIWAppForm},
  IWDep_definedepositquery in 'IWDep_definedepositquery.pas' {ISFDefineDepositQuery: TIWAppForm},
  IWDep_depositcovr in 'IWDep_depositcovr.pas' {ISFDepositDetails: TIWAppForm},
  IWDep_dmgraphics in 'IWDep_dmgraphics.pas' {dmgDV: TDataModule},
  IWDep_options in 'IWDep_options.pas' {ISFOptions: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  IWRtlFix in '..\IntraWeb\IWRtlFix.pas',
  Allsorts in '..\Eglington Delphi common code items\Allsorts.pas',
  DB_List_Combo in '..\Eglington Delphi common code items\DB_List_Combo.pas',
  ErrCodes in '..\Eglington Delphi common code items\ErrCodes.pas',
  Mathproc in '..\Eglington Delphi common code items\Mathproc.pas',
  NumRecipes in '..\Eglington Delphi common code items\NumRecipes.pas',
  NumRecipes_varb in '..\Eglington Delphi common code items\NumRecipes_varb.pas';

{$R *.res}

begin
  TIWStart.Execute(True);
end.



