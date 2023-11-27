object IWServerController: TIWServerController
  AppName = 'DepIso'
  Compression.Enabled = False
  Compression.Level = 6
  Description = 'Deposit Isotope Database'
  DisplayName = 'Deposit Isotope Database'
  Port = 8092
  SSLOptions.SSLVersion = SSLv3
  Version = '15.2.53'
  ExceptionLogger.Enabled = True
  SessionOptions.SessionTimeout = 20
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  Height = 310
  Width = 342
end
