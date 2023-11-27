object ISFDefineQuery1: TISFDefineQuery1
  Left = 0
  Top = 0
  Width = 750
  Height = 630
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define query'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwbNextStageOfQuery: TIWButton
    Left = 96
    Top = 80
    Width = 293
    Height = 25
    Caption = 'Proceed to next stage of query definition'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbNextStageOfQuery'
    OnClick = iwbNextStageOfQueryClick
  end
  object iwcbAreas: TIWCheckBox
    Left = 96
    Top = 176
    Width = 313
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Areas'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 1
    Checked = True
    FriendlyName = 'iwcbAreas'
  end
  object iwlAreas: TIWListbox
    Left = 96
    Top = 202
    Width = 313
    Height = 147
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 2
    FriendlyName = 'iwlAreas'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object IWText1: TIWText
    Left = 425
    Top = 174
    Width = 275
    Height = 175
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      'Select the Areas from which you wish to '
      'obtain data. Note that the values selected '
      'here will influence subsequent lists used to '
      'further refine search conditions and will also '
      'influence the final query.'
      ''
      'Multiple Areas may be selected. '
      ''
      'A more restricted range in data will improve '
      'performance and provide faster response times '
      'to your queries.')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 575
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
    ExplicitHeight = 285
  end
  object iwlblError: TIWLabel
    Left = 96
    Top = 132
    Width = 235
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlblError'
    Caption = 'No items selected or box not checked'
  end
  object iwbCancel: TIWButton
    Left = 425
    Top = 80
    Width = 293
    Height = 25
    Caption = 'Cancel query definition'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancel'
    TabOrder = 3
    OnClick = iwbCancelClick
  end
  object iwcbDepositClans: TIWCheckBox
    Left = 96
    Top = 392
    Width = 623
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Deposit Clans'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 5
    Checked = False
    FriendlyName = 'iwcbDepositClans'
  end
  object iwlDepositClans: TIWListbox
    Left = 96
    Top = 419
    Width = 623
    Height = 158
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    UseSize = False
    TabOrder = 6
    FriendlyName = 'iwlDepositClans'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  inline TopBar: TISFTopBarDep
    Left = 0
    Top = 0
    Width = 750
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
    ExplicitWidth = 713
    inherited IWFrameRegion: TIWRegion
      Width = 750
      TabOrder = 4
      ExplicitWidth = 713
      inherited iwrHeader: TIWRegion
        Width = 750
        ExplicitWidth = 713
        inherited iwrWelcome: TIWRegion
          Width = 750
          ExplicitWidth = 713
          inherited iwrDisplayUserName: TIWRegion
            Width = 550
            ExplicitWidth = 513
            inherited lblWelcome: TIWLabel
              Left = 277
              ExplicitLeft = 240
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 750
          ExplicitWidth = 713
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
