object IWChartInterpretation: TIWChartInterpretation
  Left = 0
  Top = 0
  Width = 836
  Height = 566
  OnRender = IWAppFormRender
  ConnectionMode = cmAny
  Title = 'DepIso'
  SupportedBrowsers = [brIE, brNetscape7, brOpera, brSafari, brNetscape6]
  OnCreate = IWAppFormCreate
  AllowPageAccess = True
  BrowserSecurityCheck = True
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object IWChart1: TIWChart
    Left = 8
    Top = 50
    Width = 713
    Height = 459
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    AutoSize = False
    BorderOptions.Color = clNone
    BorderOptions.Width = 0
    DoSubmitValidation = True
    ScriptEvents = <>
    TabOrder = -1
    UseSize = True
    Chart = Chart1
  end
  object iwcbShowLegend: TIWCheckBox
    Left = 598
    Top = 6
    Width = 103
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Show Legend'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 6
    OnClick = iwcbShowLegendClick
    Checked = True
    FriendlyName = 'iwcbShowLegend'
  end
  object iwcbShowBackground: TIWCheckBox
    Left = 598
    Top = 26
    Width = 125
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Show background'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 7
    OnClick = iwcbShowBackgroundClick
    Checked = True
    FriendlyName = 'iwcbShowBackground'
  end
  object iwbClose: TIWButton
    Left = 8
    Top = 6
    Width = 75
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Close'
    DoSubmitValidation = True
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbClose'
    ScriptEvents = <>
    TabOrder = 14
    OnClick = iwbCloseClick
  end
  object iwbExportGraphValues: TIWButton
    Left = 8
    Top = 28
    Width = 75
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Export'
    DoSubmitValidation = True
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbExportGraphValues'
    ScriptEvents = <>
    TabOrder = 13
    OnClick = iwbExportGraphValuesClick
  end
  object IWLabel3: TIWLabel
    Left = 104
    Top = 8
    Width = 64
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
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'IWLabel3'
    Caption = 'Y axis min.'
    RawText = False
  end
  object IWLabel4: TIWLabel
    Left = 104
    Top = 32
    Width = 64
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
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'IWLabel4'
    Caption = 'X axis min.'
    RawText = False
  end
  object iweYMinimum: TIWEdit
    Left = 170
    Top = 4
    Width = 69
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweYMinimum'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 0
    PasswordPrompt = False
  end
  object iweXMinimum: TIWEdit
    Left = 170
    Top = 28
    Width = 69
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweXMinimum'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 2
    PasswordPrompt = False
  end
  object iweXMaximum: TIWEdit
    Left = 284
    Top = 28
    Width = 69
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    DoSubmitValidation = True
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit2'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 3
    PasswordPrompt = False
  end
  object iweYMaximum: TIWEdit
    Left = 284
    Top = 4
    Width = 69
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
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
    TabOrder = 1
    PasswordPrompt = False
  end
  object IWLabel5: TIWLabel
    Left = 250
    Top = 8
    Width = 28
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
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'IWLabel3'
    Caption = 'max.'
    RawText = False
  end
  object IWLabel6: TIWLabel
    Left = 250
    Top = 32
    Width = 28
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
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'IWLabel4'
    Caption = 'max.'
    RawText = False
  end
  object iwbChangeAxisScales: TIWButton
    Left = 370
    Top = 6
    Width = 75
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Change'
    DoSubmitValidation = True
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbChangeAxisScales'
    ScriptEvents = <>
    TabOrder = 4
    OnClick = iwbChangeAxisScalesClick
  end
  object iwcbAutomaticScaling: TIWCheckBox
    Left = 370
    Top = 28
    Width = 145
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Automatic scale'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 5
    OnClick = iwcbAutomaticScalingClick
    Checked = True
    FriendlyName = 'iwcbAutomaticScaling'
  end
  object iwlNormalisationType: TIWLabel
    Left = 438
    Top = 512
    Width = 112
    Height = 14
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
    Font.Size = 8
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'iwlNormalisationType'
    Caption = 'iwlNormalisationType'
    RawText = False
  end
  object iwlMinimumDateUncertainty: TIWLabel
    Left = 438
    Top = 528
    Width = 144
    Height = 14
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
    Font.Size = 8
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'iwlMinimumDateUncertainty'
    Caption = 'iwlMinimumDateUncertainty'
    RawText = False
  end
  object iwcbSeries1: TIWCheckBox
    Left = 730
    Top = 50
    Width = 103
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Series1'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 8
    OnClick = iwcbSeries1Click
    Checked = True
    FriendlyName = 'iwcbSeries1'
  end
  object iwcbSeries2: TIWCheckBox
    Left = 730
    Top = 69
    Width = 103
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Series2'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 9
    OnClick = iwcbSeries2Click
    Checked = True
    FriendlyName = 'iwcbSeries2'
  end
  object iwcbSeries3: TIWCheckBox
    Left = 730
    Top = 89
    Width = 103
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Series3'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 10
    OnClick = iwcbSeries3Click
    Checked = True
    FriendlyName = 'iwcbSeries3'
  end
  object iwcbSeries4: TIWCheckBox
    Left = 730
    Top = 108
    Width = 103
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Series4'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 11
    OnClick = iwcbSeries4Click
    Checked = True
    FriendlyName = 'iwcbSeries4'
  end
  object iwcbSeries5: TIWCheckBox
    Left = 730
    Top = 128
    Width = 103
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Series5'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 12
    OnClick = iwcbSeries5Click
    Checked = True
    FriendlyName = 'iwcbSeries5'
  end
  object iwlPDFType: TIWLabel
    Left = 438
    Top = 544
    Width = 62
    Height = 14
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
    Font.Size = 8
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    FriendlyName = 'iwlPDFType'
    Caption = 'iwlPDFType'
    RawText = False
  end
  object Chart1: TChart
    Left = 7
    Top = 50
    Width = 714
    Height = 459
    Foot.Alignment = taLeftJustify
    Foot.Font.Color = clGray
    Foot.Font.Style = [fsBold]
    Foot.Text.Strings = (
      '(c) Dr Bruce Eglington (2004)'
      'DateView Geochronology Database'
      '')
    Gradient.EndColor = 12615680
    Gradient.MidColor = clWhite
    Gradient.StartColor = clSilver
    Gradient.Visible = True
    Legend.CheckBoxesStyle = cbsRadio
    Legend.Font.Height = -15
    Legend.Font.Style = [fsBold]
    Legend.Font.Shadow.Color = clWhite
    Legend.Font.Shadow.HorizSize = 1
    Legend.Font.Shadow.VertSize = 1
    Legend.Gradient.Visible = True
    Legend.LegendStyle = lsSeries
    Title.Font.Color = clBlack
    Title.Font.Height = -21
    Title.Gradient.Direction = gdLeftRight
    Title.Gradient.EndColor = clGray
    Title.Gradient.Visible = True
    Title.Text.Strings = (
      'TChart')
    BottomAxis.Title.Caption = 'Date'
    BottomAxis.Title.Font.Style = [fsBold]
    LeftAxis.Title.Caption = 'Date'
    LeftAxis.Title.Font.Style = [fsBold]
    View3D = False
    TabOrder = 0
    PrintMargins = (
      15
      21
      15
      21)
    object Series1: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      LinePen.Color = clRed
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        011900000000000000000000000000000000005940000000000000F83F000000
        0000C06240000000000000004000000000000069400000000000000440000000
        0000406F4000000000000008400000000000C072400000000000000C40000000
        0000406F40000000000000104000000000000069400000000000001C40000000
        0000C06240000000000000204000000000000059400000000000002240000000
        0000004940000000000000244000000000000058400000000000002640000000
        000080604000000000000028400000000000E06B400000000000002A40000000
        0000E064400000000000002C400000000000E06B400000000000002E40000000
        0000A07040000000000000304000000000000075400000000000003140000000
        0000E0744000000000000032400000000000B07B400000000000003340000000
        0000888040000000000000344000000000007082400000000000003540000000
        0000D88240000000000000364000000000005085400000000000003740000000
        0000C8884000000000000038400000000000188940}
    end
    object Series3: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'Series2'
      LinePen.Color = clBlue
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psDiamond
      Pointer.VertSize = 3
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000707F400000000000A079400000000000407840000000
        000070784000000000004075400000000000D07A400000000000A07540000000
        00001075400000000000D071400000000000006A400000000000E06840000000
        0000E069400000000000806B4000000000002061400000000000805440000000
        000000204000000000000054400000000000002A400000000000405340000000
        0000A0604000000000000053400000000000805B400000000000C05240000000
        000000F03F0000000000002640}
    end
    object Series2: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Title = 'Series3'
      LinePen.Color = clGreen
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psTriangle
      Pointer.VertSize = 3
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000C06F4000000000000075400000000000707840000000
        0000C077400000000000C075400000000000507B400000000000007E40000000
        0000707F40000000000040794000000000007079400000000000707440000000
        0000F07640000000000000714000000000003077400000000000F07840000000
        00006077400000000000B07A4000000000008075400000000000A06E40000000
        00006070400000000000F0744000000000002074400000000000B07240000000
        00006075400000000000607040}
    end
    object Series4: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      LinePen.Color = clYellow
      LinePen.Width = 3
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        0019000000000000000048884000000000008888400000000000488B40000000
        0000188D400000000000788C400000000000B889400000000000808A40000000
        0000B089400000000000C0894000000000000888400000000000C08640000000
        0000708840000000000058854000000000003084400000000000988140000000
        0000907F400000000000507C400000000000A076400000000000807240000000
        0000206F4000000000002070400000000000C063400000000000406D40000000
        00006067400000000000A06940}
    end
    object Series5: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      SeriesColor = clFuchsia
      LinePen.Color = clFuchsia
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psDownTriangle
      Pointer.VertSize = 3
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000D07F4000000000004881400000000000008240000000
        00005880400000000000E080400000000000407C400000000000F07C40000000
        0000507B400000000000D074400000000000C06F400000000000C07040000000
        0000607540000000000080754000000000006073400000000000E06A40000000
        0000206440000000000080614000000000008063400000000000406B40000000
        0000C0594000000000000056400000000000005B400000000000004740000000
        00008056400000000000003340}
    end
  end
  object Report1: TFlexCelReport
    Template = 'Files\Flexcell\DataProb.xls'
    FileName = 'report'
    AutoClose = False
    Adapter = XLSAdapter1
    DateTimeFormat = 'yyyy/mm/dd hh:mm'
    KeepEmptyPictures = False
    DataModule = Owner
    Left = 752
    Top = 456
  end
  object XLSAdapter1: TXLSAdapter
    AllowOverwritingFiles = False
    Left = 752
    Top = 428
  end
  object FlxProb: TFlxMemTable
    Columns = <
      item
        Name = 'Age'
      end
      item
        Name = 'Curve1Value'
      end
      item
        Name = 'Curve2Value'
      end
      item
        Name = 'Curve3Value'
      end
      item
        Name = 'Curve4Value'
      end
      item
        Name = 'Curve5Value'
      end>
    Left = 752
    Top = 204
  end
  object FlxTitles: TFlxMemTable
    Columns = <
      item
        Name = 'Curve1Title'
      end
      item
        Name = 'Curve2Title'
      end
      item
        Name = 'Curve3Title'
      end
      item
        Name = 'Curve4Title'
      end
      item
        Name = 'Curve5Title'
      end>
    Left = 752
    Top = 172
  end
  object FlxTempDataDI: TFlxMemTable
    Columns = <
      item
        Name = 'INTERPRETATION'
      end
      item
        Name = 'AGE'
      end
      item
        Name = 'UNITNAME'
      end
      item
        Name = 'INTERPABR'
      end
      item
        Name = 'GROUPING'
      end
      item
        Name = 'COLUMNNO'
      end
      item
        Name = 'AGEERRORAV'
      end
      item
        Name = 'AGEPLUSERROR'
      end
      item
        Name = 'AGEMINUSERROR'
      end>
    Left = 752
    Top = 236
  end
end
