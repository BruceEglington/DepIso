object ISFSelectGraph: TISFSelectGraph
  Left = 0
  Top = 0
  Width = 1105
  Height = 647
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Select graph'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object iwrgPlotType: TIWRadioGroup
    Left = 112
    Top = 100
    Width = 345
    Height = 197
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    SubmitOnAsyncEvent = True
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgPlotType'
    ItemIndex = 0
    Items.Strings = (
      'Map by age band'
      'Map of present day 206Pb/204Pb'
      'Map of present day 207Pb/204Pb'
      'Map of present day 208Pb/204Pb'
      'Map of model source 238U/204Pb'
      'Map of model initial 206Pb/204Pb'
      'Map of model initial 207Pb/204Pb'
      'Test')
    Layout = glVertical
    ScriptEvents = <>
    TabOrder = 0
  end
  object IWLabel1: TIWLabel
    Left = 92
    Top = 76
    Width = 152
    Height = 15
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Choose the plot required'
    RawText = False
  end
  object iwbSubmitGraphSelection: TIWButton
    Left = 238
    Top = 384
    Width = 75
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitGraphSelection'
    ScriptEvents = <>
    TabOrder = 1
    OnClick = iwbSubmitGraphSelectionClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 592
    Cursor = crAuto
    Align = alLeft
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1
    RenderSize = True
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Color = clNone
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object iwbReturn: TIWButton
    Left = 406
    Top = 384
    Width = 135
    Height = 25
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Return to Data Grid'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbReturn'
    ScriptEvents = <>
    TabOrder = 2
    OnClick = iwbReturnClick
  end
  inline TopBar: TISFTopBarDep
    Left = 0
    Top = 0
    Width = 1105
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
    ExplicitWidth = 1105
    inherited IWFrameRegion: TIWRegion
      Width = 1105
      TabOrder = 3
      ExplicitWidth = 1105
      inherited iwrHeader: TIWRegion
        Width = 1105
        ExplicitWidth = 1105
        inherited iwrWelcome: TIWRegion
          Width = 1105
          ExplicitWidth = 1105
          inherited iwrDisplayUserName: TIWRegion
            Width = 905
            ExplicitWidth = 905
            inherited lblWelcome: TIWLabel
              Left = 632
              ExplicitLeft = 632
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 1105
          ExplicitWidth = 1105
        end
      end
    end
  end
end
