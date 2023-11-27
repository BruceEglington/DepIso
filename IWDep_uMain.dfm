object ISFMain: TISFMain
  Left = 0
  Top = 0
  Width = 831
  Height = 608
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'DepIso'
  OnCreate = IWAppFormCreate
  OnDestroy = IWAppFormDestroy
  Background.Filename = 
    'W:\source\IntraWeb6.0\Demos\Win32\Delphi\DieFlyDie\Files\grid_ba' +
    'ckground.gif'
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  StyleSheet.Filename = 'styles.css'
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWRegion1: TIWRegion
    Left = 0
    Top = 55
    Width = 831
    Height = 553
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = False
    Align = alClient
    BorderOptions.NumericWidth = 0
    BorderOptions.Style = cbsNone
    object iwRFooter: TIWRegion
      Left = 0
      Top = 472
      Width = 831
      Height = 81
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      RenderInvisibleControls = False
      Align = alBottom
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      DesignSize = (
        831
        81)
      object IWDBLabel1: TIWDBLabel
        Left = 22
        Top = 29
        Width = 108
        Height = 15
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        DataField = 'PROGRESSDATE'
        DataSource = dmUser.dsProgress
        FriendlyName = 'IWDBLabel1'
      end
      object IWLabel1: TIWLabel
        Left = 22
        Top = 9
        Width = 113
        Height = 15
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Dr Bruce Eglington'
      end
      object IWLabel3: TIWLabel
        Left = 22
        Top = 46
        Width = 141
        Height = 14
        Anchors = [akLeft, akTop, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'bruce.eglington@usask.ca'
      end
      object iwlNumUses: TIWLabel
        Left = 489
        Top = 54
        Width = 155
        Height = 14
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        NoWrap = True
        HasTabOrder = False
        FriendlyName = 'iwlNumUses'
        Caption = 'This program has been used '
      end
      object iwbPermissions: TIWButton
        Left = 264
        Top = 15
        Width = 117
        Height = 25
        Caption = 'Permissions'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbPermissions'
        TabOrder = 2
        OnClick = iwbPermissionsClick
      end
      object iwbCheckIniFile: TIWButton
        Left = 264
        Top = 46
        Width = 117
        Height = 25
        Visible = False
        Caption = 'Check IniFile'
        Color = clBtnFace
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'iwbCheckIniFile'
        TabOrder = 6
        OnClick = iwbCheckIniFileClick
      end
    end
    inline FrameMenu: TISFFrameMenu
      Left = 0
      Top = 0
      Width = 200
      Height = 472
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      Align = alLeft
      AutoScroll = True
      TabOrder = 1
      TabStop = True
      ExplicitHeight = 472
      inherited IWFrameRegion: TIWRegion
        Height = 472
        TabOrder = 3
        ExplicitHeight = 472
        inherited IWRegion1: TIWRegion
          Height = 472
          ExplicitHeight = 472
          inherited IWMenu1: TIWMenu
            Width = 105
            Height = 342
            ExplicitWidth = 105
            ExplicitHeight = 344
          end
        end
      end
    end
    object IWRegion4: TIWRegion
      Left = 200
      Top = 0
      Width = 631
      Height = 472
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      RenderInvisibleControls = False
      TabOrder = 5
      Align = alClient
      BorderOptions.NumericWidth = 0
      BorderOptions.Style = cbsNone
      object iwRHeader: TIWRegion
        Left = 0
        Top = 0
        Width = 631
        Height = 60
        RenderInvisibleControls = False
        Align = alTop
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        object lblWelcome: TIWLabel
          Left = 10
          Top = 18
          Width = 338
          Height = 22
          ZIndex = 1
          Font.Color = clWebCORNFLOWERBLUE
          Font.FontName = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          HasTabOrder = False
          FriendlyName = 'lblWelcome'
          Caption = 'Welcome to this database system'
        end
      end
      object iwRMemo: TIWRegion
        Left = 0
        Top = 60
        Width = 631
        Height = 412
        RenderInvisibleControls = False
        TabOrder = 1
        Align = alClient
        BorderOptions.NumericWidth = 0
        BorderOptions.Style = cbsNone
        ClipRegion = False
        object IWDBMemo1: TIWDBMemo
          Left = 13
          Top = 0
          Width = 596
          Height = 412
          Align = alClient
          StyleRenderOptions.RenderBorder = False
          BGColor = clWebWHITE
          Editable = False
          Font.Color = clNone
          Font.FontName = 'Arial'
          Font.Size = 9
          Font.Style = []
          InvisibleBorder = True
          HorizScrollBar = False
          VertScrollBar = True
          Required = False
          SubmitOnAsyncEvent = True
          AutoEditable = False
          DataField = 'PROGRESSDETAILS'
          DataSource = dmUser.dsProgress
          FriendlyName = 'IWDBMemo1'
          ExplicitLeft = 33
          ExplicitWidth = 634
          ExplicitHeight = 345
        end
        object IWRegion2: TIWRegion
          Left = 0
          Top = 0
          Width = 13
          Height = 412
          RenderInvisibleControls = False
          Align = alLeft
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
        end
        object IWRegion3: TIWRegion
          Left = 609
          Top = 0
          Width = 22
          Height = 412
          RenderInvisibleControls = False
          Align = alRight
          BorderOptions.NumericWidth = 0
          BorderOptions.Style = cbsNone
        end
      end
    end
  end
  inline TopBar: TISFTopBarDep
    Left = 0
    Top = 0
    Width = 831
    Height = 55
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 55
    Constraints.MinHeight = 55
    Constraints.MinWidth = 600
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    TabStop = True
    ExplicitWidth = 831
    inherited IWFrameRegion: TIWRegion
      Width = 831
      TabOrder = 4
      ExplicitWidth = 831
      inherited iwrHeader: TIWRegion
        Width = 831
        ExplicitWidth = 831
        inherited iwrWelcome: TIWRegion
          Width = 831
          ExplicitWidth = 831
          inherited iwrDisplayUserName: TIWRegion
            Width = 631
            ExplicitWidth = 631
            inherited lblWelcome: TIWLabel
              Left = 358
              NoWrap = True
              ExplicitLeft = 358
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 831
          ExplicitWidth = 831
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
