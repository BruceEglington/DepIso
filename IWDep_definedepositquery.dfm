object ISFDefineDepositQuery: TISFDefineDepositQuery
  Left = 0
  Top = 0
  Width = 822
  Height = 1024
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
  DesignTop = -158
  object iwbSubmitQuery: TIWButton
    Left = 96
    Top = 80
    Width = 293
    Height = 25
    Caption = 'Submit Query'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    OnClick = iwbSubmitQueryClick
  end
  object iwcbDeposits: TIWCheckBox
    Left = 96
    Top = 126
    Width = 349
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Deposits'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 1
    Checked = False
    FriendlyName = 'iwcbDeposits'
  end
  object iwlDeposits: TIWListbox
    Left = 96
    Top = 152
    Width = 349
    Height = 249
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 2
    NonEditableAsLabel = True
    FriendlyName = 'iwlDeposits'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbCommodities: TIWCheckBox
    Left = 96
    Top = 548
    Width = 609
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Commodities'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 3
    Checked = False
    FriendlyName = 'iwcbCommodities'
  end
  object iwlCommodities: TIWListbox
    Left = 96
    Top = 570
    Width = 623
    Height = 158
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    UseSize = False
    TabOrder = 4
    NonEditableAsLabel = True
    FriendlyName = 'iwlCommodities'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwrgOrderBy: TIWRadioGroup
    Left = 128
    Top = 858
    Width = 417
    Height = 85
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgOrderBy'
    ItemIndex = 0
    Items.Strings = (
      'DepositName'
      'CountryID, DepositName'
      'Deposit Clan ID, CountryID, DepositName'
      'Commodity ID')
    Layout = glVertical
    TabOrder = -1
  end
  object IWLabel4: TIWLabel
    Left = 96
    Top = 834
    Width = 101
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'Order results by'
  end
  object iwbSubmitQuery2: TIWButton
    Left = 210
    Top = 996
    Width = 125
    Height = 25
    Caption = 'Submit Query'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    TabOrder = 5
    OnClick = iwbSubmitQueryClick
  end
  object IWText1: TIWText
    Left = 525
    Top = 126
    Width = 261
    Height = 264
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      'Select parameters which define the records '
      'you require. '
      ''
      'Multiple selections may be made in most list '
      'boxes. '
      ''
      'A more restricted range in data will improve '
      'performance and provide faster response '
      'times to your queries.'
      ''
      'Note that you also need to check the '#39'Include'#39
      'box above a list if you want the items specified'
      'to be include in your query.'
      ''
      '"Submit query" buttons are placed in a number'
      'of places on the form so one does not need to '
      'scroll up or down to activate a query.')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 969
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
    Left = 525
    Top = 396
    Width = 250
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlblErrorTop'
    Caption = 'No items selected or boxes not checked'
  end
  object iwlblErrorBottom: TIWLabel
    Left = 330
    Top = 968
    Width = 250
    Height = 15
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'iwlblErrorBottom'
    Caption = 'No items selected or boxes not checked'
  end
  object IWButton4: TIWButton
    Left = 604
    Top = 752
    Width = 125
    Height = 25
    Caption = 'Submit Query'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    TabOrder = 6
    OnClick = iwbSubmitQueryClick
  end
  object IWButton8: TIWButton
    Left = 593
    Top = 424
    Width = 125
    Height = 25
    Caption = 'Submit Query'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    TabOrder = 7
    OnClick = iwbSubmitQueryClick
  end
  object iwbClearCheckboxes: TIWButton
    Left = 411
    Top = 80
    Width = 180
    Height = 25
    Caption = 'Clear checkboxes'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbClearCheckboxes'
    TabOrder = 8
    OnClick = iwbClearCheckboxesClick
  end
  object iwbCancel: TIWButton
    Left = 618
    Top = 80
    Width = 180
    Height = 25
    Caption = 'Cancel query definition'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancel'
    TabOrder = 9
    OnClick = iwbCancelClick
  end
  object iwcbRestrictParentID: TIWCheckBox
    Left = 96
    Top = 432
    Width = 484
    Height = 21
    Cursor = crAuto
    Caption = 'Restrict results to top level deposits (ParentID must be zero)'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 11
    Checked = False
    FriendlyName = 'iwcbRestrictParentID'
  end
  object iwcbFromDate: TIWCheckBox
    Left = 96
    Top = 490
    Width = 239
    Height = 21
    Cursor = crAuto
    Caption = 'Include from Minimum Age'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 12
    Checked = False
    FriendlyName = 'iwcbFromDate'
  end
  object iweFromDate: TIWEdit
    Left = 323
    Top = 490
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweFromDate'
    SubmitOnAsyncEvent = True
    TabOrder = 13
  end
  object iwcbToDate: TIWCheckBox
    Left = 421
    Top = 490
    Width = 159
    Height = 21
    Cursor = crAuto
    Caption = 'to Maximum Age'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 14
    Checked = False
    FriendlyName = 'iwcbToDate'
  end
  object iweToDate: TIWEdit
    Left = 586
    Top = 490
    Width = 59
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweToDate'
    SubmitOnAsyncEvent = True
    TabOrder = 15
  end
  inline TopBar: TISFTopBarDep
    Left = 0
    Top = 0
    Width = 822
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
    ExplicitWidth = 822
    inherited IWFrameRegion: TIWRegion
      Width = 822
      TabOrder = 10
      ExplicitWidth = 822
      inherited iwrHeader: TIWRegion
        Width = 822
        ExplicitWidth = 822
        inherited iwrWelcome: TIWRegion
          Width = 822
          ExplicitWidth = 822
          inherited iwrDisplayUserName: TIWRegion
            Width = 622
            ExplicitWidth = 622
            inherited lblWelcome: TIWLabel
              Left = 377
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
          Width = 822
          ExplicitWidth = 822
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
