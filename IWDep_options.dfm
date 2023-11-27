object ISFOptions: TISFOptions
  Left = 0
  Top = 0
  Width = 777
  Height = 1200
  RenderInvisibleControls = False
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Options'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwbSavePreferences: TIWButton
    Left = 96
    Top = 78
    Width = 180
    Height = 25
    Caption = 'Save Preferences'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iwbSavePreferences'
    OnClick = iwbSavePreferencesClick
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 55
    Width = 83
    Height = 1145
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
    ExplicitHeight = 262
  end
  object iwbCancel: TIWButton
    Left = 294
    Top = 78
    Width = 180
    Height = 25
    Caption = 'Cancel'
    Color = clWebLIGHTSALMON
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iwbCancel'
    TabOrder = 1
    OnClick = iwbCancelClick
  end
  object IWLabel14: TIWLabel
    Left = 96
    Top = 156
    Width = 143
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel14'
    Caption = 'Date Band 1 caption'
  end
  object iweDateBand1: TIWEdit
    Left = 254
    Top = 152
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand1'
    SubmitOnAsyncEvent = True
    TabOrder = 3
  end
  object lblDateBand1Caption: TIWLabel
    Left = 496
    Top = 152
    Width = 220
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDateBand1Caption'
    Caption = 'Date Band 1 caption needs a value'
  end
  object IWLabel15: TIWLabel
    Left = 94
    Top = 186
    Width = 114
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel15'
    Caption = 'Minimum date ='
  end
  object iweDateBand1Minimum: TIWEdit
    Left = 206
    Top = 182
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand1Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 4
  end
  object IWLabel16: TIWLabel
    Left = 292
    Top = 186
    Width = 118
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel16'
    Caption = 'Maximum date ='
  end
  object iweDateBand1Maximum: TIWEdit
    Left = 410
    Top = 182
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand1Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 5
  end
  object lblDate1Values: TIWLabel
    Left = 496
    Top = 186
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDate1Values'
    Caption = 'Need to specify numeric values'
  end
  object IWLabel17: TIWLabel
    Left = 96
    Top = 244
    Width = 143
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel17'
    Caption = 'Date Band 2 caption'
  end
  object iweDateBand2: TIWEdit
    Left = 254
    Top = 240
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand2'
    SubmitOnAsyncEvent = True
    TabOrder = 6
  end
  object IWLabel18: TIWLabel
    Left = 94
    Top = 274
    Width = 114
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel18'
    Caption = 'Minimum date ='
  end
  object iweDateBand2Minimum: TIWEdit
    Left = 206
    Top = 270
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand2Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 7
  end
  object IWLabel19: TIWLabel
    Left = 292
    Top = 274
    Width = 118
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel19'
    Caption = 'Maximum date ='
  end
  object iweDateBand2Maximum: TIWEdit
    Left = 410
    Top = 270
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand2Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 8
  end
  object IWLabel20: TIWLabel
    Left = 96
    Top = 332
    Width = 143
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel20'
    Caption = 'Date Band 3 caption'
  end
  object iweDateBand3: TIWEdit
    Left = 254
    Top = 328
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand3'
    SubmitOnAsyncEvent = True
    TabOrder = 9
  end
  object lblDateBand2Caption: TIWLabel
    Left = 496
    Top = 244
    Width = 220
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDateBand2Caption'
    Caption = 'Date Band 2 caption needs a value'
  end
  object lblDate2Values: TIWLabel
    Left = 496
    Top = 274
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDate2Values'
    Caption = 'Need to specify numeric values'
  end
  object lblDateBand3Caption: TIWLabel
    Left = 496
    Top = 332
    Width = 220
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDateBand3Caption'
    Caption = 'Date Band 3 caption needs a value'
  end
  object IWLabel21: TIWLabel
    Left = 94
    Top = 362
    Width = 114
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel21'
    Caption = 'Minimum date ='
  end
  object iweDateBand3Minimum: TIWEdit
    Left = 206
    Top = 358
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand3Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 10
  end
  object IWLabel22: TIWLabel
    Left = 292
    Top = 362
    Width = 118
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel22'
    Caption = 'Maximum date ='
  end
  object iweDateBand3Maximum: TIWEdit
    Left = 410
    Top = 358
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand3Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 11
  end
  object IWLabel4: TIWLabel
    Left = 96
    Top = 422
    Width = 143
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'Date Band 4 caption'
  end
  object iweDateBand4: TIWEdit
    Left = 254
    Top = 418
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand4'
    SubmitOnAsyncEvent = True
    TabOrder = 12
  end
  object IWLabel23: TIWLabel
    Left = 94
    Top = 452
    Width = 114
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel23'
    Caption = 'Minimum date ='
  end
  object iweDateBand4Minimum: TIWEdit
    Left = 206
    Top = 448
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand4Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 13
  end
  object IWLabel24: TIWLabel
    Left = 292
    Top = 452
    Width = 118
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel24'
    Caption = 'Maximum date ='
  end
  object iweDateBand4Maximum: TIWEdit
    Left = 410
    Top = 448
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand4Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 14
  end
  object IWLabel25: TIWLabel
    Left = 96
    Top = 514
    Width = 143
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel25'
    Caption = 'Date Band 5 caption'
  end
  object iweDateBand5: TIWEdit
    Left = 254
    Top = 510
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand5'
    SubmitOnAsyncEvent = True
    TabOrder = 15
  end
  object IWLabel26: TIWLabel
    Left = 94
    Top = 544
    Width = 114
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel26'
    Caption = 'Minimum date ='
  end
  object iweDateBand5Minimum: TIWEdit
    Left = 206
    Top = 540
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand5Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 16
  end
  object IWLabel27: TIWLabel
    Left = 292
    Top = 544
    Width = 118
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel27'
    Caption = 'Maximum date ='
  end
  object iweDateBand5Maximum: TIWEdit
    Left = 410
    Top = 540
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweDateBand5Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 17
  end
  object iwrgShowAllSampleLocalities: TIWRadioGroup
    Left = 96
    Top = 592
    Width = 377
    Height = 43
    SubmitOnAsyncEvent = True
    RawText = False
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    FriendlyName = 'iwrgShowAllSampleLocalities'
    ItemIndex = 1
    Items.Strings = (
      'Show all sample localities on maps'
      'Show only first included locality on maps')
    Layout = glVertical
    TabOrder = 18
  end
  object lblShowAll: TIWLabel
    Left = 498
    Top = 600
    Width = 191
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblInterpretation1Caption'
    Caption = 'One of these must be selected'
  end
  object lblDate5Values: TIWLabel
    Left = 496
    Top = 544
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDate5Values'
    Caption = 'Need to specify numeric values'
  end
  object lblDateBand5Caption: TIWLabel
    Left = 496
    Top = 514
    Width = 220
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDateBand5Caption'
    Caption = 'Date Band 5 caption needs a value'
  end
  object lblDate4Values: TIWLabel
    Left = 496
    Top = 452
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDate4Values'
    Caption = 'Need to specify numeric values'
  end
  object lblDateBand4Caption: TIWLabel
    Left = 496
    Top = 420
    Width = 220
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDateBand4Caption'
    Caption = 'Date Band 4 caption needs a value'
  end
  object lblDate3Values: TIWLabel
    Left = 496
    Top = 362
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblDate3Values'
    Caption = 'Need to specify numeric values'
  end
  object IWLabel1: TIWLabel
    Left = 98
    Top = 676
    Width = 106
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel14'
    Caption = 'Ratio 1 caption'
  end
  object iweRatio1: TIWEdit
    Left = 256
    Top = 672
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio1'
    SubmitOnAsyncEvent = True
    TabOrder = 19
  end
  object lblRatio1Caption: TIWLabel
    Left = 498
    Top = 672
    Width = 185
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio1Caption'
    Caption = 'Ratio 1 caption needs a value'
  end
  object IWLabel3: TIWLabel
    Left = 96
    Top = 706
    Width = 82
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel15'
    Caption = 'Minimum  ='
  end
  object iweRatio1Minimum: TIWEdit
    Left = 208
    Top = 702
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio1Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 20
  end
  object IWLabel5: TIWLabel
    Left = 294
    Top = 706
    Width = 86
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel16'
    Caption = 'Maximum  ='
  end
  object iweRatio1Maximum: TIWEdit
    Left = 412
    Top = 702
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio1Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 21
  end
  object lblRatio1Values: TIWLabel
    Left = 498
    Top = 706
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio1Values'
    Caption = 'Need to specify numeric values'
  end
  object IWLabel7: TIWLabel
    Left = 98
    Top = 764
    Width = 106
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel17'
    Caption = 'Ratio 2 caption'
  end
  object iweRatio2: TIWEdit
    Left = 256
    Top = 760
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio2'
    SubmitOnAsyncEvent = True
    TabOrder = 22
  end
  object IWLabel8: TIWLabel
    Left = 96
    Top = 794
    Width = 82
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel18'
    Caption = 'Minimum  ='
  end
  object iweRatio2Minimum: TIWEdit
    Left = 208
    Top = 790
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio2Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 23
  end
  object IWLabel9: TIWLabel
    Left = 294
    Top = 794
    Width = 86
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel19'
    Caption = 'Maximum  ='
  end
  object iweRatio2Maximum: TIWEdit
    Left = 412
    Top = 790
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio2Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 24
  end
  object IWLabel10: TIWLabel
    Left = 98
    Top = 852
    Width = 106
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel20'
    Caption = 'Ratio 3 caption'
  end
  object iweRatio3: TIWEdit
    Left = 256
    Top = 848
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio3'
    SubmitOnAsyncEvent = True
    TabOrder = 25
  end
  object lblRatio2Caption: TIWLabel
    Left = 498
    Top = 764
    Width = 185
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio2Caption'
    Caption = 'Ratio 2 caption needs a value'
  end
  object lblRatio2Values: TIWLabel
    Left = 498
    Top = 794
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio2Values'
    Caption = 'Need to specify numeric values'
  end
  object lblRatio3Caption: TIWLabel
    Left = 498
    Top = 852
    Width = 185
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio3Caption'
    Caption = 'Ratio 3 caption needs a value'
  end
  object IWLabel28: TIWLabel
    Left = 96
    Top = 882
    Width = 78
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel21'
    Caption = 'Minimum ='
  end
  object iweRatio3Minimum: TIWEdit
    Left = 208
    Top = 878
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio3Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 26
  end
  object IWLabel29: TIWLabel
    Left = 294
    Top = 882
    Width = 86
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel22'
    Caption = 'Maximum  ='
  end
  object iweRatio3Maximum: TIWEdit
    Left = 412
    Top = 878
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio3Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 27
  end
  object IWLabel30: TIWLabel
    Left = 98
    Top = 942
    Width = 106
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'Ratio 4 caption'
  end
  object iweRatio4: TIWEdit
    Left = 256
    Top = 938
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio4'
    SubmitOnAsyncEvent = True
    TabOrder = 28
  end
  object IWLabel31: TIWLabel
    Left = 96
    Top = 972
    Width = 82
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel23'
    Caption = 'Minimum  ='
  end
  object iweRatio4Minimum: TIWEdit
    Left = 208
    Top = 968
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio4Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 29
  end
  object IWLabel32: TIWLabel
    Left = 294
    Top = 972
    Width = 86
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel24'
    Caption = 'Maximum  ='
  end
  object iweRatio4Maximum: TIWEdit
    Left = 412
    Top = 968
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio4Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 30
  end
  object IWLabel33: TIWLabel
    Left = 98
    Top = 1034
    Width = 106
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel25'
    Caption = 'Ratio 5 caption'
  end
  object iweRatio5: TIWEdit
    Left = 256
    Top = 1030
    Width = 189
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio5'
    SubmitOnAsyncEvent = True
    TabOrder = 31
  end
  object IWLabel34: TIWLabel
    Left = 96
    Top = 1064
    Width = 82
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel26'
    Caption = 'Minimum  ='
  end
  object iweRatio5Minimum: TIWEdit
    Left = 208
    Top = 1060
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio5Minimum'
    SubmitOnAsyncEvent = True
    TabOrder = 32
  end
  object IWLabel35: TIWLabel
    Left = 294
    Top = 1064
    Width = 86
    Height = 13
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = [fsBold]
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'IWLabel27'
    Caption = 'Maximum  ='
  end
  object iweRatio5Maximum: TIWEdit
    Left = 412
    Top = 1060
    Width = 61
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Alignment = taRightJustify
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    FriendlyName = 'iweRatio5Maximum'
    SubmitOnAsyncEvent = True
    TabOrder = 33
  end
  object lblRatio5Values: TIWLabel
    Left = 498
    Top = 1064
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio5Values'
    Caption = 'Need to specify numeric values'
  end
  object lblRatio5Caption: TIWLabel
    Left = 498
    Top = 1034
    Width = 185
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio5Caption'
    Caption = 'Ratio 5 caption needs a value'
  end
  object lblRatio4Values: TIWLabel
    Left = 498
    Top = 972
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio4Values'
    Caption = 'Need to specify numeric values'
  end
  object lblRatio4Caption: TIWLabel
    Left = 498
    Top = 940
    Width = 185
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio4Caption'
    Caption = 'Ratio 4 caption needs a value'
  end
  object lblRatio3Values: TIWLabel
    Left = 498
    Top = 882
    Width = 196
    Height = 13
    Font.Color = clWebRED
    Font.FontName = 'Verdana'
    Font.Size = 8
    Font.Style = []
    NoWrap = True
    HasTabOrder = False
    FriendlyName = 'lblRatio3Values'
    Caption = 'Need to specify numeric values'
  end
  inline TopBar: TISFTopBarDep
    Left = 0
    Top = 0
    Width = 777
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
    ExplicitWidth = 777
    inherited IWFrameRegion: TIWRegion
      Width = 777
      TabOrder = 2
      ExplicitWidth = 777
      inherited iwrHeader: TIWRegion
        Width = 777
        ExplicitWidth = 777
        inherited iwrWelcome: TIWRegion
          Width = 777
          ExplicitWidth = 777
          inherited iwrDisplayUserName: TIWRegion
            Width = 577
            ExplicitWidth = 577
            inherited lblWelcome: TIWLabel
              Left = 304
              ExplicitLeft = 304
            end
          end
        end
        inherited iwrSignInOut: TIWRegion
          Width = 777
          ExplicitWidth = 777
          inherited iwlSignOut: TIWLink
            TabOrder = -1
          end
        end
      end
    end
  end
end
