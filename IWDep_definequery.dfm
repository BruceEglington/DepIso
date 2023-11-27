object ISFDefineQuery: TISFDefineQuery
  Left = 0
  Top = 0
  Width = 713
  Height = 595
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
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
  object iwcbContinents: TIWCheckBox
    Left = 96
    Top = 168
    Width = 313
    Height = 21
    Cursor = crAuto
    Visible = False
    Caption = 'Include selection from Regions'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    Checked = True
    FriendlyName = 'iwcbContinents'
  end
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
    TabOrder = 1
    OnClick = iwbNextStageOfQueryClick
  end
  object iwlContinents: TIWListbox
    Left = 96
    Top = 190
    Width = 313
    Height = 291
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 2
    NonEditableAsLabel = True
    FriendlyName = 'iwlContinents'
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
    Left = 435
    Top = 168
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
      'Select the Regions from which you wish '
      'to obtain data. Note that the values '
      'selected here will influence subsequent lists '
      'used to further refine search conditions and '
      'will also influence the final query.'
      ''
      'Multiple Regions may be selected. '
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
    Height = 540
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
    ExplicitHeight = 294
  end
  object iwlblError: TIWLabel
    Left = 96
    Top = 132
    Width = 112
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlblError'
    Caption = 'No items selected'
  end
  object iwbCancel: TIWButton
    Left = 416
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
  inline TopBar: TISFTopBarDep
    Left = 0
    Top = 0
    Width = 713
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
      Width = 713
      TabOrder = 4
      ExplicitWidth = 713
      inherited iwrHeader: TIWRegion
        Width = 713
        ExplicitWidth = 713
        inherited iwrWelcome: TIWRegion
          Width = 713
          ExplicitWidth = 713
          inherited iwrDisplayUserName: TIWRegion
            Width = 513
            ExplicitWidth = 513
            inherited lblWelcome: TIWLabel
              Left = 240
              ExplicitLeft = 240
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 713
          ExplicitWidth = 713
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
