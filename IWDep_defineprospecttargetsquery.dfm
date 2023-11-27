object ISFDefineProspectTargetsQuery: TISFDefineProspectTargetsQuery
  Left = 0
  Top = 0
  Width = 786
  Height = 500
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define Prospect and Targets'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwbSubmitQuery: TIWButton
    Left = 96
    Top = 80
    Width = 180
    Height = 25
    Caption = 'Submit Query'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    OnClick = iwbSubmitQueryClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 445
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
    ExplicitTop = -683
    ExplicitHeight = 1450
  end
  object iwlblErrorTop: TIWLabel
    Left = 292
    Top = 148
    Width = 220
    Height = 19
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 12
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlblErrorTop'
    Caption = 'All three must be specified'
  end
  object iwbCancel: TIWButton
    Left = 365
    Top = 80
    Width = 180
    Height = 25
    Caption = 'Cancel query definition'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancel'
    TabOrder = 1
    OnClick = iwbCancelClick
  end
  object IWLabel1: TIWLabel
    Left = 96
    Top = 187
    Width = 57
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Prospect'
  end
  object iwcbProspect: TIWComboBox
    Left = 179
    Top = 187
    Width = 433
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 3
    ItemIndex = -1
    FriendlyName = 'iwcbProspect'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel2: TIWLabel
    Left = 96
    Top = 257
    Width = 51
    Height = 15
    Font.Color = clWebGREEN
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Target 2'
  end
  object iwcbTarget2: TIWComboBox
    Left = 179
    Top = 251
    Width = 433
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 4
    ItemIndex = -1
    FriendlyName = 'iwcbTarget2'
    NoSelectionText = '-- No Selection --'
  end
  object IWLabel3: TIWLabel
    Left = 96
    Top = 222
    Width = 51
    Height = 15
    Font.Color = clWebBLUE
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Target 1'
  end
  object iwcbTarget1: TIWComboBox
    Left = 179
    Top = 219
    Width = 433
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NonEditableAsLabel = True
    TabOrder = 5
    ItemIndex = -1
    FriendlyName = 'iwcbPreferenceLevel'
    NoSelectionText = '-- No Selection --'
  end
  inline TopBar: TISFTopBarDep
    Left = 0
    Top = 0
    Width = 786
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
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 786
    inherited IWFrameRegion: TIWRegion
      Width = 786
      TabOrder = 2
      ExplicitWidth = 786
      inherited iwrHeader: TIWRegion
        Width = 786
        ExplicitWidth = 786
        inherited iwrWelcome: TIWRegion
          Width = 786
          ExplicitWidth = 786
          inherited iwrDisplayUserName: TIWRegion
            Width = 586
            ExplicitWidth = 586
            inherited lblWelcome: TIWLabel
              Left = 341
              Top = 0
              Width = 64
              Alignment = taRightJustify
              ExplicitLeft = 400
              ExplicitTop = 0
              ExplicitWidth = 64
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 786
          ExplicitWidth = 786
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
