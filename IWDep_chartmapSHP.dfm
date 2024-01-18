object IWChartMapSHP: TIWChartMapSHP
  Left = 0
  Top = 0
  Width = 940
  Height = 580
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'DepIso'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = False
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object iwcbShowLegend: TIWCheckBox
    Left = 568
    Top = 4
    Width = 145
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Show Legend'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
    Style = stNormal
    TabOrder = 6
    OnClick = iwcbShowLegendClick
    Checked = True
    FriendlyName = 'iwcbShowLegend'
  end
  object iwcbShowBackground: TIWCheckBox
    Left = 568
    Top = 24
    Width = 145
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Show background'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Close'
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Export'
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
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
    SubmitOnAsyncEvent = True
    TabOrder = 0
    PasswordPrompt = False
  end
  object iweXMinimum: TIWEdit
    Left = 170
    Top = 28
    Width = 69
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
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
    SubmitOnAsyncEvent = True
    TabOrder = 2
    PasswordPrompt = False
  end
  object IWLabel5: TIWLabel
    Left = 250
    Top = 8
    Width = 28
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
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel5'
    Caption = 'max.'
    RawText = False
  end
  object IWLabel6: TIWLabel
    Left = 250
    Top = 32
    Width = 28
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
    Font.Style = []
    NoWrap = False
    ConvertSpaces = False
    HasTabOrder = False
    FriendlyName = 'IWLabel6'
    Caption = 'max.'
    RawText = False
  end
  object iweYMaximum: TIWEdit
    Left = 284
    Top = 4
    Width = 69
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweYMaximum'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 1
    PasswordPrompt = False
  end
  object iweXMaximum: TIWEdit
    Left = 284
    Top = 28
    Width = 69
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Alignment = taLeftJustify
    BGColor = clNone
    FocusColor = clNone
    Editable = True
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweXMaximum'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    SubmitOnAsyncEvent = True
    TabOrder = 3
    PasswordPrompt = False
  end
  object iwbChangeAxisScales: TIWButton
    Left = 370
    Top = 6
    Width = 75
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Change'
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Automatic scale'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
    Style = stNormal
    TabOrder = 5
    OnClick = iwcbAutomaticScalingClick
    Checked = True
    FriendlyName = 'iwcbAutomaticScaling'
  end
  object iwcbSeries1: TIWCheckBox
    Left = 730
    Top = 50
    Width = 103
    Height = 21
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Series1'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Series2'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Series3'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Series4'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
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
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Series5'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    ScriptEvents = <>
    Style = stNormal
    TabOrder = 12
    OnClick = iwcbSeries5Click
    Checked = True
    FriendlyName = 'iwcbSeries5'
  end
  object IWChart1: TIWChart
    Left = 9
    Top = 50
    Width = 89
    Height = 112
    Cursor = crAuto
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    StyleRenderOptions.RenderSize = False
    BorderOptions.Color = clNone
    BorderOptions.Width = 0
    ScriptEvents = <>
    TabOrder = -1
    UseSize = False
    Chart = Chart1
  end
  object Chart1: TChart
    Left = 9
    Top = 50
    Width = 710
    Height = 459
    Foot.Alignment = taLeftJustify
    Foot.Font.Color = clGray
    Foot.Font.Style = [fsBold]
    Foot.Text.Strings = (
      '(c) Dr Bruce Eglington (2009)'
      'Deposit Isotope Database')
    Gradient.EndColor = 12615680
    Gradient.MidColor = clWhite
    Gradient.StartColor = clSilver
    Gradient.Visible = True
    Legend.Brush.Gradient.Visible = True
    Legend.CheckBoxesStyle = cbsRadio
    Legend.Font.Height = -15
    Legend.Font.Style = [fsBold]
    Legend.Font.Shadow.Color = clWhite
    Legend.Font.Shadow.HorizSize = 1
    Legend.Font.Shadow.VertSize = 1
    Legend.LegendStyle = lsSeries
    Title.Brush.Gradient.Direction = gdLeftRight
    Title.Brush.Gradient.EndColor = clGray
    Title.Brush.Gradient.Visible = True
    Title.Font.Color = clBlack
    Title.Font.Height = -21
    Title.Text.Strings = (
      'TChart')
    View3D = False
    TabOrder = 0
    PrintMargins = (
      15
      27
      15
      27)
    object Series6: TMapSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      ShowInLegend = False
      EndColor = clSilver
      MidColor = clWhite
      Shapes = <
        item
          Color = 369660
          Text = 'A'
          Transparency = 10
          Z = 0.888000000000000000
        end
        item
          Color = 15254947
          Text = 'B'
          Transparency = 10
          Z = 0.173000000000000000
        end
        item
          Color = 6749153
          Text = 'C'
          Transparency = 10
          Z = 0.558000000000000100
        end
        item
          Color = 16616325
          Text = 'D'
          Transparency = 10
          Z = 0.039000000000000000
        end
        item
          Color = 12970170
          Text = 'E'
          Transparency = 10
          Z = 0.308000000000000000
        end
        item
          Color = 3729647
          Text = 'F'
          Transparency = 10
          Z = 0.651000000000000000
        end
        item
          Color = 35837
          Text = 'G'
          Transparency = 10
          Z = 0.952000000000000000
        end
        item
          Color = 3729647
          Text = 'H'
          Transparency = 10
          Z = 0.674000000000000000
        end
        item
          Color = 16616325
          Text = 'I'
          Transparency = 10
          Z = 0.016000000000000000
        end
        item
          Color = 634875
          Text = 'J'
          Transparency = 10
          Z = 0.853000000000000000
        end
        item
          Color = 14211247
          Text = 'K'
          Transparency = 10
          Z = 0.246000000000000000
        end
        item
          Color = 11531461
          Text = 'L'
          Transparency = 10
          Z = 0.354000000000000000
        end>
      StartColor = clGray
      Transparency = 10
      UseColorRange = False
      UsePalette = True
      XValues.Name = 'X'
      XValues.Order = loNone
      YValues.Name = 'Y'
      YValues.Order = loNone
      ZValues.Name = 'Value'
      ZValues.Order = loNone
    end
    object Series1: TLineSeries
      ColorEachLine = False
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      SeriesColor = clRed
      Dark3D = False
      LinePen.Color = clRed
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.Brush.Color = clRed
      Pointer.Brush.Gradient.EndColor = clRed
      Pointer.Gradient.EndColor = clRed
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clRed
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Left = 824
      Top = 152
      Data = {
        0019000000000000000080564000000000000024400000000000002440000000
        0000002440000000000000244000000000000024400000000000002440000000
        0000002440000000000000244000000000000024400000000000002440000000
        0000002440000000000000244000000000000024400000000000002440000000
        0000002440000000000000244000000000000024400000000000002440000000
        0000002440000000000000244000000000000024400000000000002440000000
        00000024400000000000002440}
    end
    object Series3: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Symbol.Brush.Color = clBlue
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'Series2'
      LinePen.Color = clBlue
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.Brush.Color = clBlue
      Pointer.Brush.Gradient.EndColor = clBlue
      Pointer.Gradient.EndColor = clBlue
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clBlue
      Pointer.Style = psDiamond
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Left = 824
      Top = 80
      Data = {
        001900000000000000008056C000000000000018400000000000001840000000
        0000001840000000000000184000000000000018400000000000001840000000
        0000001840000000000000184000000000000018400000000000001840000000
        0000001840000000000000184000000000000018400000000000001840000000
        0000001840000000000000184000000000000018400000000000001840000000
        0000001840000000000000184000000000000018400000000000001840000000
        00000018400000000000001840}
    end
    object Series2: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Symbol.Brush.Color = clGreen
      Marks.Visible = False
      Title = 'Series3'
      Dark3D = False
      LinePen.Color = clGreen
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.Brush.Color = clGreen
      Pointer.Brush.Gradient.EndColor = clGreen
      Pointer.Gradient.EndColor = clGreen
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clGreen
      Pointer.Style = psTriangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Left = 856
      Top = 120
      Data = {
        0019000000000000000000204000000000000020400000000000002040000000
        0000002040000000000000204000000000000020400000000000002040000000
        0000002040000000000000204000000000000020400000000000002040000000
        0000002040000000000000204000000000000020400000000000002040000000
        0000002040000000000000204000000000000020400000000000002040000000
        0000002040000000000000204000000000000020400000000000002040000000
        00000020400000000000002040}
    end
    object Series4: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Symbol.Brush.Color = clYellow
      Marks.Visible = False
      Dark3D = False
      LinePen.Color = clYellow
      LinePen.Width = 3
      LinePen.Visible = False
      Pointer.Brush.Color = clYellow
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clYellow
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Left = 816
      Top = 48
      Data = {
        0019000000000000000000F03F000000000000F03F000000000000F03F000000
        000000F03F000000000000F03F000000000000F03F000000000000F03F000000
        000000F03F000000000000F03F000000000000F03F000000000000F03F000000
        000000F03F000000000000F03F000000000000F03F000000000000F03F000000
        000000F03F000000000000F03F000000000000F03F000000000000F03F000000
        000000F03F000000000000F03F000000000000F03F000000000000F03F000000
        000000F03F000000000000F03F}
    end
    object Series5: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Symbol.Brush.Color = 8388863
      Marks.Visible = False
      SeriesColor = clFuchsia
      Dark3D = False
      LinePen.Color = clFuchsia
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.Brush.Color = 8388863
      Pointer.Brush.Gradient.EndColor = clFuchsia
      Pointer.Gradient.EndColor = clFuchsia
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = 8388863
      Pointer.Style = psDownTriangle
      Pointer.VertSize = 3
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Left = 808
      Top = 8
      Data = {
        0019000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000}
    end
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
  object FlxTempDataMap: TFlxMemTable
    Columns = <
      item
        Name = 'INTERPRETATION'
      end
      item
        Name = 'AGEBAND'
      end
      item
        Name = 'INTERPABR'
      end
      item
        Name = 'COLUMNNO'
      end
      item
        Name = 'SAMPLENO'
      end
      item
        Name = 'AGE'
      end
      item
        Name = 'AGEPLUS'
      end
      item
        Name = 'AGEMINUS'
      end
      item
        Name = 'LATITUDE'
      end
      item
        Name = 'LONGITUDE'
      end
      item
        Name = 'ELEVATION'
      end
      item
        Name = 'COLUMNNODATE'
      end
      item
        Name = 'RECORDID'
      end>
    Left = 752
    Top = 204
  end
  object Report1: TFlexCelReport
    Template = 'c:\exe\Files\Flexcell\FlxTempDataMap.xls'
    FileName = 'report'
    AutoClose = False
    Adapter = XLSXAdapter1
    DateTimeFormat = 'yyyy/mm/dd hh:mm'
    KeepEmptyPictures = False
    DataModule = Owner
    Left = 752
    Top = 268
  end
  object XLSXAdapter1: TXLSXAdapter
    SaveFormat = [snxXLS]
    AllowOverwritingFiles = False
    Left = 760
    Top = 320
  end
end
