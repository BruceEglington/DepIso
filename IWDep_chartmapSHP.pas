unit IWDep_chartmapSHP;

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids,
  Buttons,
  {$IFDEF CLR}
  Variants, System.ComponentModel,
  {$ENDIF}
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, TeEngine, Series,
  TeeProcs, Chart, IWCompExtCtrls, IWCompTeeChart,
  IWHTMLControls, IWCompEdit, IWCompListbox, IWCompLabel, IWVCLBaseControl,
  IWBaseControl, IWControl, IWCompCheckbox, IWHTMLTag,
  IWCompButton, IWBaseHTMLControl, TeeURL, TeeSeriesTextEd, ErrorBar,
  TeeComma, TeCanvas,
  TeeInspector, TeeLisB, TeeLegendScrollBar, TeeTools,
  TeeGLEditor,
  TeeJPEG, TeePNG, TeeSVGCanvas, TeePDFCanvas,
  TeePSCanvas, TeeVMLCanvas, TeeLighting, TeeEdiGrad, TeeOpenGL, TeeSurfa,
  {$IFNDEF TEENOTHEMES}
  TeeThemeEditor, TeeThemes,
  {$ENDIF}
  TeeMapSeries, IWColor, DB, DBClient, TeeSHP, TeeMapSeriesEdit,
  TeeWorldSeries,
  UCustomFlexCelReport, UFlexCelReport, UExcelAdapter,
  UFlxMemTable, IWCompGrids, IWDBGrids, XLSXAdapter;

type
  TIWChartMapSHP = class(TIWAppForm)
    Chart1: TChart;
    iwcbShowLegend: TIWCheckBox;
    iwcbShowBackground: TIWCheckBox;
    Series1: TLineSeries;
    Series3: TLineSeries;
    Series2: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    iwbClose: TIWButton;
    iwbExportGraphValues: TIWButton;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iweYMinimum: TIWEdit;
    iweXMinimum: TIWEdit;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    iweYMaximum: TIWEdit;
    iweXMaximum: TIWEdit;
    iwbChangeAxisScales: TIWButton;
    iwcbAutomaticScaling: TIWCheckBox;
    iwcbSeries1: TIWCheckBox;
    iwcbSeries2: TIWCheckBox;
    iwcbSeries3: TIWCheckBox;
    iwcbSeries4: TIWCheckBox;
    iwcbSeries5: TIWCheckBox;
    FlxTitles: TFlxMemTable;
    FlxTempDataMap: TFlxMemTable;
    Report1: TFlexCelReport;
    IWChart1: TIWChart;
    Series6: TMapSeries;
    XLSXAdapter1: TXLSXAdapter;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwcbShowLegendClick(Sender: TObject);
    procedure iwcbShowBackgroundClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbChangeAxisScalesClick(Sender: TObject);
    procedure iwcbAutomaticScalingClick(Sender: TObject);
    procedure LoadMapDetails;
    procedure iwcbSeries1Click(Sender: TObject);
    procedure iwcbSeries2Click(Sender: TObject);
    procedure iwcbSeries3Click(Sender: TObject);
    procedure iwcbSeries4Click(Sender: TObject);
    procedure iwcbSeries5Click(Sender: TObject);
    procedure iwbExportGraphValuesClick(Sender: TObject);
  private
    procedure CreateChart;
    procedure GraphMapByRatio(GraphType : string);
    procedure GraphMapByDateBand(GraphType : string);
  public
  end;

implementation

uses IWForm, ServerController, IWDep_constants,
  IWDep_dmgraphics, IWDep_selectgraph, usrIW_dm;

{$R *.dfm}


procedure TIWChartMapSHP.IWAppFormCreate(Sender: TObject);
begin
  Chart1.BufferedDisplay := false;
  Chart1.Foot.Clear;
  Chart1.Foot.Text.Add(Copyright1);
  Chart1.Foot.Text.Add(Copyright2);
  //iwbExportGraphValues.Visible := UserSession.CanViewPlus;
  iwcbSeries1.Visible := UserSession.CanViewPlus;
  iwcbSeries2.Visible := UserSession.CanViewPlus;
  iwcbSeries3.Visible := UserSession.CanViewPlus;
  iwcbSeries4.Visible := UserSession.CanViewPlus;
  iwcbSeries5.Visible := UserSession.CanViewPlus;
  CreateChart;
  LoadMapDetails;
  if (UserSession.GraphType = gtMapAgeBand) then
  begin
    dmgDV.AllocateMapDataBand2;
    GraphMapByDateBand(UserSession.GraphType);
  end;
  if ((UserSession.GraphType = gtMapRatio64) or
      (UserSession.GraphType = gtMapRatio74) or
      (UserSession.GraphType = gtMapRatio84) or
      (UserSession.GraphType = gtMapMuSource) or
      (UserSession.GraphType = gtMapRatio64Model) or
      (UserSession.GraphType = gtMapRatio74Model)) then
  begin
    dmgDV.AllocateMapDataInitial2;
    GraphMapByRatio(UserSession.GraphType);
  end;
end;

procedure TIWChartMapSHP.CreateChart;
var tmp : TChartSeriesClass;
    tmpSeries : TChartSeries;
begin
  Chart1.Title.Text.Clear;
  Chart1.View3D:=false;
end;

procedure TIWChartMapSHP.iwcbShowLegendClick(Sender: TObject);
begin
  Chart1.Legend.Visible:=iwcbShowLegend.Checked;
end;

procedure TIWChartMapSHP.iwcbShowBackgroundClick(Sender: TObject);
begin
  Chart1.Gradient.Visible:=iwcbShowBackground.Checked;
  if iwcbShowBackground.Checked then
     Chart1.BevelOuter:=bvRaised
  else
     Chart1.BevelOuter:=bvNone;
  Chart1.Color:=clWhite;
end;

procedure TIWChartMapSHP.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSelectGraph.Create(WebApplication).Show;
end;

procedure TIWChartMapSHP.iwbChangeAxisScalesClick(Sender: TObject);
begin
  Chart1.LeftAxis.Automatic := true;
  Chart1.BottomAxis.Automatic := true;
  try
    Chart1.LeftAxis.Minimum := StrToFloat(iweYMinimum.Text);
    Chart1.LeftAxis.Maximum := StrToFloat(iweYMaximum.Text);
    Chart1.BottomAxis.Minimum := StrToFloat(iweXMinimum.Text);
    Chart1.BottomAxis.Maximum := StrToFloat(iweXMaximum.Text);
    iwcbAutomaticScaling.Checked := false;
    Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
    Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
    UserSession.LongitudeMin := StrToFloat(iweXMinimum.Text);
    UserSession.LongitudeMax := StrToFloat(iweXMaximum.Text);
    UserSession.LatitudeMin := StrToFloat(iweYMinimum.Text);
    UserSession.LatitudeMax := StrToFloat(iweYMaximum.Text);
  except
  end;
end;

procedure TIWChartMapSHP.GraphMapByRatio(GraphType : string);
var
  i : integer;
begin
  if (UserSession.LongitudeMin < -180.0) then UserSession.LongitudeMin := -180.0;
  if (UserSession.LongitudeMax <= UserSession.LongitudeMin) then UserSession.LongitudeMax := UserSession.LongitudeMin + 1.0;
  if (UserSession.LatitudeMax <= UserSession.LatitudeMin) then UserSession.LatitudeMax := UserSession.LatitudeMin + 1.0;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  Chart1.Title.Text.Text := UserSession.GraphType;
  dmgDV.qUserOptCaptions.Close;
  dmgDV.qUserOptCaptions.ParamByName('USERID').AsString := UserSession.UserID;
  if (UserSession.GraphType = gtMapRatio64) then
  begin
    dmgDV.qUserOptCaptions.ParamByName('OPTIONTYPEID').AsString := '6';
  end;
  if (UserSession.GraphType = gtMapRatio74) then
  begin
    dmgDV.qUserOptCaptions.ParamByName('OPTIONTYPEID').AsString := '7';
  end;
  if (UserSession.GraphType = gtMapRatio84) then
  begin
    dmgDV.qUserOptCaptions.ParamByName('OPTIONTYPEID').AsString := '8';
  end;
  if (UserSession.GraphType = gtMapMuSource) then
  begin
    dmgDV.qUserOptCaptions.ParamByName('OPTIONTYPEID').AsString := 'M';
  end;
  if (UserSession.GraphType = gtMapRatio64Model) then
  begin
    dmgDV.qUserOptCaptions.ParamByName('OPTIONTYPEID').AsString := '6';
  end;
  if (UserSession.GraphType = gtMapRatio74Model) then
  begin
    dmgDV.qUserOptCaptions.ParamByName('OPTIONTYPEID').AsString := '6';
  end;
  dmgDV.cdsUserOptCaptions.Close;
  dmgDV.cdsUserOptCaptions.Open;
  for i := 1 to MaxSeries do
  begin
    //note change in series value i below to handle map polygons first
    Chart1.Series[i].Clear;
    case i of
      1 : begin
        UserSession.Ratio1Caption := dmgDV.cdsUserOptCaptionsOPTIONTITLE.AsString;
        Chart1.Series[i].Title := UserSession.Ratio1Caption;
        iwcbSeries1.Caption := UserSession.Ratio1Caption;
        Series1.LinePen.Hide;
        Series1.Pointer.Visible := true;
      end;
      2 : begin
        UserSession.Ratio2Caption := dmgDV.cdsUserOptCaptionsOPTIONTITLE.AsString;
        Chart1.Series[i].Title := UserSession.Ratio2Caption;
        iwcbSeries2.Caption := UserSession.Ratio2Caption;
        Series2.LinePen.Hide;
        Series2.Pointer.Visible := true;
      end;
      3 : begin
        UserSession.Ratio3Caption := dmgDV.cdsUserOptCaptionsOPTIONTITLE.AsString;
        Chart1.Series[i].Title := UserSession.Ratio3Caption;
        iwcbSeries3.Caption := UserSession.Ratio3Caption;
        Series3.LinePen.Hide;
        Series3.Pointer.Visible := true;
      end;
      4 : begin
        UserSession.Ratio4Caption := dmgDV.cdsUserOptCaptionsOPTIONTITLE.AsString;
        Chart1.Series[i].Title := UserSession.Ratio4Caption;
        iwcbSeries4.Caption := UserSession.Ratio4Caption;
        Series4.LinePen.Hide;
        Series4.Pointer.Visible := true;
      end;
      5 : begin
        UserSession.Ratio5Caption := dmgDV.cdsUserOptCaptionsOPTIONTITLE.AsString;
        Chart1.Series[i].Title := UserSession.Ratio5Caption;
        iwcbSeries5.Caption := UserSession.Ratio5Caption;
        Series5.LinePen.Hide;
        Series5.Pointer.Visible := true;
      end;
    end;
    dmgDV.cdsUserOptCaptions.Next;
  end;
  dmgDV.cdsTempDataMap.First;
  for i := 1 to MaxSeries do
  begin
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    case i of
      1 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.Ratio1Caption+'''';
      2 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.Ratio2Caption+'''';
      3 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.Ratio3Caption+'''';
      4 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.Ratio4Caption+'''';
      5 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.Ratio5Caption+'''';
    end;
    dmgDV.cdsTempDataMap.Filtered := true;
    dmgDV.cdsTempDataMap.First;
    repeat
      if ((dmgDV.cdsTempDataMapLongitude.AsFloat <> 0.0) and
          (dmgDV.cdsTempDataMapLatitude.AsFloat <> 90.0)) then
      begin
        {note change in series value i below to handle map polygons first}
        Chart1.Series[i].AddXY(dmgDV.cdsTempDataMapLongitude.AsFloat,dmgDV.cdsTempDataMapLatitude.AsFloat);
      end;
      dmgDV.cdsTempDataMap.Next;
    until dmgDV.cdsTempDataMap.Eof;
  end;
  dmgDV.cdsTempDataMap.Filtered := false;
  dmgDV.cdsTempDataMap.First;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  iweXMinimum.Text := FormatFloat('###0.00000',UserSession.LongitudeMin);
  iweXMaximum.Text := FormatFloat('###0.00000',UserSession.LongitudeMax);
  iweYMinimum.Text := FormatFloat('###0.00000',UserSession.LatitudeMin);
  iweYMaximum.Text := FormatFloat('###0.00000',UserSession.LatitudeMax);
end;

procedure TIWChartMapSHP.iwcbAutomaticScalingClick(Sender: TObject);
begin
  if not iwcbAutomaticScaling.Checked then
  begin
    try
      Chart1.LeftAxis.Minimum := StrToFloat(iweYMinimum.Text);
      Chart1.LeftAxis.Maximum := StrToFloat(iweYMaximum.Text);
      Chart1.BottomAxis.Minimum := StrToFloat(iweXMinimum.Text);
      Chart1.BottomAxis.Maximum := StrToFloat(iweXMaximum.Text);
    except
    end;
  end;
  Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
  Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
  // After zooming, set axes isometric
  {
  MakeIsoAxis(Chart1);
  }
end;

procedure TIWChartMapSHP.LoadMapDetails;
// Load a map file and optionally a dBase table with
// map shapes "Z" values.

  procedure TryLoadTable;
  var
    tmp : String;
  begin
    tmp := UserSession.MapDBFName;
    if FileExists(tmp) then
    begin
      dmgDV.cdsTable1.Close;
      dmgDV.cdsTable1.FileName:=ExtractFileName(tmp);
      dmgDV.cdsTable1.Open;
      dmgDV.cdsTable1.First;
    end;
  end;

var
  MapFieldName, MapValueFieldName : string;
begin
  try
    if UserSession.UseDBF then
    begin
      TryLoadTable;
      MapFieldName := UserSession.MapFieldName;
      MapValueFieldName := UserSession.MapValueFieldName;
      try
        LoadMap(Series6,UserSession.MapFileName,dmgDV.cdsTable1,MapFieldName,MapValueFieldName,true);
      finally
        dmgDV.cdsTable1.Close;
      end;
    end else
    begin
      try
        LoadMap(Series6,UserSession.MapFileName);
      except
      end;
    end;
  finally
    Series6.UseColorRange:= true;
    if Series6.UseColorRange then
    begin
      try
        Series6.StartColor:=clLtGray;
        Series6.MidColor:=clWhite;
        Series6.EndColor:=clSilver;
      finally
      end;
    end
    else
    begin
      Series6.UsePalette:=True;
      Series6.PaletteStyle := psPale;
    end;
  end;
end;

procedure TIWChartMapSHP.GraphMapByDateBand(GraphType : string);
var
  i : integer;
begin
  if (UserSession.LongitudeMin < -180.0) then UserSession.LongitudeMin := -180.0;
  if (UserSession.LongitudeMax <= UserSession.LongitudeMin) then UserSession.LongitudeMax := UserSession.LongitudeMin + 1.0;
  if (UserSession.LatitudeMax <= UserSession.LatitudeMin) then UserSession.LatitudeMax := UserSession.LatitudeMin + 1.0;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  Chart1.Title.Text.Text := UserSession.GraphType;
  for i := 1 to MaxSeries do
  begin
    {note change in series value i below to handle map polygons first}
    Chart1.Series[i].Clear;
    case i of
      1 : begin
        Chart1.Series[i].Title := UserSession.DateBand1Caption;
        iwcbSeries1.Caption := UserSession.DateBand1Caption;
        Series1.LinePen.Hide;
        Series1.Pointer.Visible := true;
      end;
      2 : begin
        Chart1.Series[i].Title := UserSession.DateBand2Caption;
        iwcbSeries2.Caption := UserSession.DateBand2Caption;
        Series2.LinePen.Hide;
        Series2.Pointer.Visible := true;
      end;
      3 : begin
        Chart1.Series[i].Title := UserSession.DateBand3Caption;
        iwcbSeries3.Caption := UserSession.DateBand3Caption;
        Series3.LinePen.Hide;
        Series3.Pointer.Visible := true;
      end;
      4 : begin
        Chart1.Series[i].Title := UserSession.DateBand4Caption;
        iwcbSeries4.Caption := UserSession.DateBand4Caption;
        Series4.LinePen.Hide;
        Series4.Pointer.Visible := true;
      end;
      5 : begin
        Chart1.Series[i].Title := UserSession.DateBand5Caption;
        iwcbSeries5.Caption := UserSession.DateBand5Caption;
        Series5.LinePen.Hide;
        Series5.Pointer.Visible := true;
      end;
    end;
  end;
  dmgDV.cdsTempDataMap.First;
  for i := 1 to MaxSeries do
  begin
    dmgDV.cdsTempDataMap.Filtered := false;
    dmgDV.cdsTempDataMap.First;
    case i of
      1 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand1Caption+'''';
      2 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand2Caption+'''';
      3 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand3Caption+'''';
      4 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand4Caption+'''';
      5 : dmgDV.cdsTempDataMap.Filter := 'AgeBand ='+''''+UserSession.DateBand5Caption+'''';
    end;
    dmgDV.cdsTempDataMap.Filtered := true;
    dmgDV.cdsTempDataMap.First;
    repeat
      if ((dmgDV.cdsTempDataMapLongitude.AsFloat <> 0.0) and
          (dmgDV.cdsTempDataMapLatitude.AsFloat <> 90.0)) then
      begin
        {note change in series value i below to handle map polygons first}
        Chart1.Series[i].AddXY(dmgDV.cdsTempDataMapLongitude.AsFloat,dmgDV.cdsTempDataMapLatitude.AsFloat);
      end;
      dmgDV.cdsTempDataMap.Next;
    until dmgDV.cdsTempDataMap.Eof;
  end;
  dmgDV.cdsTempDataMap.Filtered := false;
  dmgDV.cdsTempDataMap.First;
  Chart1.BottomAxis.Automatic := true;
  Chart1.LeftAxis.Automatic := true;
  iweXMinimum.Text := FormatFloat('###0.00',UserSession.LongitudeMin);
  iweXMaximum.Text := FormatFloat('###0.00',UserSession.LongitudeMax);
  iweYMinimum.Text := FormatFloat('###0.00000',UserSession.LatitudeMin);
  iweYMaximum.Text := FormatFloat('###0.00000',UserSession.LatitudeMax);
end;

procedure TIWChartMapSHP.iwcbSeries1Click(Sender: TObject);
begin
  if iwcbSeries1.Checked then
  begin
    Chart1.Series[1].ShowInLegend := true;
    Chart1.Series[1].Visible := true;
  end else
  begin
    Chart1.Series[1].ShowInLegend := false;
    Chart1.Series[1].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries2Click(Sender: TObject);
begin
  if iwcbSeries2.Checked then
  begin
    Chart1.Series[2].ShowInLegend := true;
    Chart1.Series[2].Visible := true;
  end else
  begin
    Chart1.Series[2].ShowInLegend := false;
    Chart1.Series[2].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries3Click(Sender: TObject);
begin
  if iwcbSeries3.Checked then
  begin
    Chart1.Series[3].ShowInLegend := true;
    Chart1.Series[3].Visible := true;
  end else
  begin
    Chart1.Series[3].ShowInLegend := false;
    Chart1.Series[3].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries4Click(Sender: TObject);
begin
  if iwcbSeries4.Checked then
  begin
    Chart1.Series[4].ShowInLegend := true;
    Chart1.Series[4].Visible := true;
  end else
  begin
    Chart1.Series[4].ShowInLegend := false;
    Chart1.Series[4].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwcbSeries5Click(Sender: TObject);
begin
  if iwcbSeries5.Checked then
  begin
    Chart1.Series[5].ShowInLegend := true;
    Chart1.Series[5].Visible := true;
  end else
  begin
    Chart1.Series[5].ShowInLegend := false;
    Chart1.Series[5].Visible := false;
  end;
end;

procedure TIWChartMapSHP.iwbExportGraphValuesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
begin
  FlxTitles.Open;
  FlxTitles.Clear;
  if (UserSession.GraphType = gtMapRatio64) then
  begin
    FlxTitles.AddRecord([UserSession.Ratio1Caption,UserSession.Ratio2Caption,
        UserSession.Ratio3Caption,UserSession.Ratio4Caption,UserSession.Ratio5Caption]);
  end;
  if (UserSession.GraphType = gtMapAgeBand) then
  begin
    FlxTitles.AddRecord([UserSession.DateBand1Caption,UserSession.DateBand2Caption,
        UserSession.DateBand3Caption,UserSession.DateBand4Caption,UserSession.DateBand5Caption]);
  end;
  if (UserSession.GraphType = gtMapRatio64) then
  begin
    FlxTempDataMap.Open;
    Report1.Template := WebApplication.ApplicationPath+DefaultFlexCellFolder+'FlxTempDataMapInterp.xls';
    dmgDV.cdsTempDataMap.First;
    repeat
      FlxTempDataMap.AddRecord([dmgDV.cdsTempDataMapInterpretation.AsVariant,dmgDV.cdsTempDataMapAgeBand.AsVariant,
            dmgDV.cdsTempDataMapInterpAbr.AsVariant,dmgDV.cdsTempDataMapColumnNo.AsVariant,
            dmgDV.cdsTempDataMapSampleNo.AsVariant,dmgDV.cdsTempDataMapAge.AsVariant,
            dmgDV.cdsTempDataMapAgePlus.AsVariant,dmgDV.cdsTempDataMapAgeMinus.AsVariant,
            dmgDV.cdsTempDataMapLatitude.AsVariant,dmgDV.cdsTempDataMapLongitude.AsVariant,
            dmgDV.cdsTempDataMapElevation.AsVariant,dmgDV.cdsTempDataMapColumnNoDate.AsVariant,
            dmgDV.cdsTempDataMapRecordID.AsVariant]);
      dmgDV.cdsTempDataMap.Next;
    until dmgDV.cdsTempDataMap.Eof;
  end;
  if (UserSession.GraphType = gtMapAgeBand) then
  begin
    FlxTempDataMap.Open;
    Report1.Template := DefaultFlexCellFolder+'FlxTempDataMapAgeBand.xls';
    dmgDV.cdsTempDataMap.First;
    repeat
      FlxTempDataMap.AddRecord([dmgDV.cdsTempDataMapInterpretation.AsVariant,dmgDV.cdsTempDataMapAgeBand.AsVariant,
            dmgDV.cdsTempDataMapInterpAbr.AsVariant,dmgDV.cdsTempDataMapColumnNo.AsVariant,
            dmgDV.cdsTempDataMapSampleNo.AsVariant,dmgDV.cdsTempDataMapAge.AsVariant,
            dmgDV.cdsTempDataMapAgePlus.AsVariant,dmgDV.cdsTempDataMapAgeMinus.AsVariant,
            dmgDV.cdsTempDataMapLatitude.AsVariant,dmgDV.cdsTempDataMapLongitude.AsVariant,
            dmgDV.cdsTempDataMapElevation.AsVariant,dmgDV.cdsTempDataMapColumnNoDate.AsVariant,
            dmgDV.cdsTempDataMapRecordID.AsVariant]);
      dmgDV.cdsTempDataMap.Next;
    until dmgDV.cdsTempDataMap.Eof;
  end;
  MemStream:=TMemoryStream.Create;
  try
    Report1.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','DepositMapData.xls'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
    FlxTempDataMap.Close;
    FlxTitles.Close;
  end; //finally
end;


end.
