object ISFDefineQuery2: TISFDefineQuery2
  Left = 0
  Top = 0
  Width = 786
  Height = 2600
  OnRender = IWAppFormRender
  ConnectionMode = cmAny
  Title = 'Define query'
  SupportedBrowsers = [brIE, brNetscape7, brOpera, brSafari, brNetscape6]
  OnCreate = IWAppFormCreate
  AllowPageAccess = True
  BrowserSecurityCheck = True
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object iwbSubmitQuery: TIWButton
    Left = 96
    Top = 80
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    ScriptEvents = <>
    TabOrder = 0
    OnClick = iwbSubmitQueryClick
  end
  object iwcbUnits: TIWCheckBox
    Left = 96
    Top = 126
    Width = 301
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Stratigraphic Units'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 1
    Checked = False
    FriendlyName = 'iwcbUnits'
  end
  object iwlUnits: TIWListbox
    Left = 98
    Top = 152
    Width = 349
    Height = 249
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = True
    DoSubmitValidation = True
    Editable = True
    TabOrder = 2
    FriendlyName = 'iwlUnits'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object iwcbReferences: TIWCheckBox
    Left = 100
    Top = 536
    Width = 301
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from References'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 3
    Checked = False
    FriendlyName = 'iwcbReferences'
  end
  object iwlReferences: TIWListbox
    Left = 102
    Top = 558
    Width = 623
    Height = 158
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 4
    FriendlyName = 'iwlReferences'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object iwcbFromDate: TIWCheckBox
    Left = 98
    Top = 432
    Width = 185
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include from Minimum Age'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 5
    Checked = False
    FriendlyName = 'iwcbFromDate'
  end
  object iweFromDate: TIWEdit
    Left = 292
    Top = 430
    Width = 59
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taRightJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 6
    PasswordPrompt = False
  end
  object iwcbToDate: TIWCheckBox
    Left = 390
    Top = 430
    Width = 127
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'to Maximum Age'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 7
    Checked = False
    FriendlyName = 'iwcbToDate'
  end
  object iwcbValidation: TIWCheckBox
    Left = 100
    Top = 778
    Width = 301
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Validation Status'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 8
    Checked = False
    FriendlyName = 'iwcbValidation'
  end
  object iwlValidation: TIWListbox
    Left = 102
    Top = 800
    Width = 215
    Height = 121
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 9
    FriendlyName = 'iwlValidation'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object iwrgOrderBy: TIWRadioGroup
    Left = 132
    Top = 2394
    Width = 417
    Height = 85
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwrgOrderBy'
    ItemIndex = 0
    Items.Strings = (
      'Area, UnitName, SortOrder'
      'Unit ID'
      'SortOrder, Area, UnitName'
      'Parent ID')
    Layout = glVertical
    ScriptEvents = <>
    TabOrder = 10
  end
  object IWLabel4: TIWLabel
    Left = 104
    Top = 2370
    Width = 101
    Height = 15
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'IWLabel4'
    Caption = 'Order results by'
    RawText = False
  end
  object iwbSubmitQuery2: TIWButton
    Left = 214
    Top = 2532
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 11
    OnClick = iwbSubmitQueryClick
  end
  object IWText1: TIWText
    Left = 534
    Top = 80
    Width = 261
    Height = 268
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
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
  object iweToDate: TIWEdit
    Left = 530
    Top = 430
    Width = 59
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taRightJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 12
    PasswordPrompt = False
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 2545
    Cursor = crAuto
    Align = alLeft
    IW50Hint = False
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
    ExplicitTop = -683
    ExplicitHeight = 1450
  end
  object iwlblErrorTop: TIWLabel
    Left = 536
    Top = 354
    Width = 250
    Height = 15
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'iwlblErrorTop'
    Caption = 'No items selected or boxes not checked'
    RawText = False
  end
  object iwlblErrorBottom: TIWLabel
    Left = 434
    Top = 2504
    Width = 250
    Height = 15
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clWebRED
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'iwlblErrorBottom'
    Caption = 'No items selected or boxes not checked'
    RawText = False
  end
  object IWButton1: TIWButton
    Left = 606
    Top = 1006
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 13
    OnClick = iwbSubmitQueryClick
  end
  object IWButton4: TIWButton
    Left = 606
    Top = 740
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 14
    OnClick = iwbSubmitQueryClick
  end
  object IWButton8: TIWButton
    Left = 602
    Top = 378
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 15
    OnClick = iwbSubmitQueryClick
  end
  object iwbClearCheckboxes: TIWButton
    Left = 234
    Top = 80
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Clear checkboxes'
    DoSubmitValidation = True
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbClearCheckboxes'
    ScriptEvents = <>
    TabOrder = 16
    OnClick = iwbClearCheckboxesClick
  end
  object iwbCancel: TIWButton
    Left = 372
    Top = 80
    Width = 141
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Cancel query definition'
    DoSubmitValidation = True
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbCancel'
    ScriptEvents = <>
    TabOrder = 17
    OnClick = iwbCancelClick
  end
  object iwcbRestrictParentID: TIWCheckBox
    Left = 100
    Top = 958
    Width = 365
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Restrict results to top level units (ParentID must be zero)'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 18
    Checked = False
    FriendlyName = 'iwcbRestrictParentID'
  end
  object iwcbFromSort: TIWCheckBox
    Left = 98
    Top = 480
    Width = 223
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include from Sort Order (minimum)'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 19
    Checked = False
    FriendlyName = 'iwcbFromSort'
  end
  object iweFromSort: TIWEdit
    Left = 328
    Top = 478
    Width = 81
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taRightJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweFromSort'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 20
    PasswordPrompt = False
  end
  object iwcbToSort: TIWCheckBox
    Left = 450
    Top = 478
    Width = 171
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'to Sort Order (maximum)'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 21
    Checked = False
    FriendlyName = 'iwcbToSort'
  end
  object iweToSort: TIWEdit
    Left = 626
    Top = 478
    Width = 81
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taRightJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit1'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 22
    PasswordPrompt = False
  end
  object iwcbDomains: TIWCheckBox
    Left = 100
    Top = 1080
    Width = 301
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Domains'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 23
    Checked = False
    FriendlyName = 'iwcbDomains'
  end
  object iwlDomains: TIWListbox
    Left = 102
    Top = 1102
    Width = 623
    Height = 158
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 24
    FriendlyName = 'iwlDomains'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object IWButton2: TIWButton
    Left = 608
    Top = 1996
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 25
    OnClick = iwbSubmitQueryClick
  end
  object iwcbPeriods: TIWCheckBox
    Left = 102
    Top = 1788
    Width = 347
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Chronostratigraphic Periods'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 26
    Checked = False
    FriendlyName = 'iwcbPeriods'
  end
  object iwlPeriods: TIWListbox
    Left = 104
    Top = 1810
    Width = 623
    Height = 158
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 27
    FriendlyName = 'iwlPeriods'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object IWButton3: TIWButton
    Left = 606
    Top = 1306
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 28
    OnClick = iwbSubmitQueryClick
  end
  object iwcbAgeConstraints: TIWCheckBox
    Left = 102
    Top = 1584
    Width = 347
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Age Constraints'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 29
    Checked = False
    FriendlyName = 'iwcbAgeConstraints'
  end
  object iwlAgeConstraints: TIWListbox
    Left = 104
    Top = 1606
    Width = 623
    Height = 83
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 30
    FriendlyName = 'iwlPeriods'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object IWButton5: TIWButton
    Left = 606
    Top = 1720
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 31
    OnClick = iwbSubmitQueryClick
  end
  object iwcbInc4Cht: TIWCheckBox
    Left = 100
    Top = 1380
    Width = 347
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Include for Chart'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 32
    Checked = False
    FriendlyName = 'iwcbInc4Cht'
  end
  object iwlInc4Cht: TIWListbox
    Left = 102
    Top = 1402
    Width = 623
    Height = 83
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 33
    FriendlyName = 'iwlPeriods'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object IWButton6: TIWButton
    Left = 604
    Top = 1516
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 34
    OnClick = iwbSubmitQueryClick
  end
  object iwcbWhoFor: TIWCheckBox
    Left = 104
    Top = 2064
    Width = 347
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Who For'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 35
    Checked = False
    FriendlyName = 'iwcbWhoFor'
  end
  object iwlWhoFor: TIWListbox
    Left = 106
    Top = 2086
    Width = 271
    Height = 158
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 36
    FriendlyName = 'iwlWhoFor'
    ItemIndex = -1
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    MultiSelect = True
    Sorted = True
  end
  object IWButton7: TIWButton
    Left = 610
    Top = 2272
    Width = 125
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Submit Query'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery2'
    ScriptEvents = <>
    TabOrder = 37
    OnClick = iwbSubmitQueryClick
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
      TabOrder = 38
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
              Left = 313
              ExplicitLeft = 313
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 786
          ExplicitWidth = 786
        end
      end
    end
  end
end
