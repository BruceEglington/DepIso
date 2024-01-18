unit IWDep_chartcurve;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, TeEngine, Series,
  Controls, ExtCtrls, TeeProcs, Chart, IWExtCtrls, IWCompTeeChart,
  IWHTMLControls, IWCompEdit, IWCompListbox, IWCompLabel, IWVCLBaseControl,
  IWBaseControl, IWControl, IWCompCheckbox, Graphics, IWHTMLTag,
  IWCompButton, IWBaseHTMLControl,
  IWDBStdCtrls, IWGrids, IWDBGrids, UExcelAdapter,
  XLSAdapter, XlsBaseTemplateStore, 
  UCustomFlexCelReport, UFlexCelReport, DB, DBClient, UFlxMemTable;

type
  TIWChartInterpretation = class(TIWAppForm)
    IWChart1: TIWChart;
    Chart1: TChart;
    iwcbShowLegend: TIWCheckBox;
    iwcbShowBackground: TIWCheckBox;
    iwbClose: TIWButton;
    iwbExportGraphValues: TIWButton;
    Series1: TLineSeries;
    Series3: TLineSeries;
    Series2: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iweYMinimum: TIWEdit;
    iweXMinimum: TIWEdit;
    iweXMaximum: TIWEdit;
    iweYMaximum: TIWEdit;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    iwbChangeAxisScales: TIWButton;
    iwcbAutomaticScaling: TIWCheckBox;
    iwlNormalisationType: TIWLabel;
    iwlMinimumDateUncertainty: TIWLabel;
    iwcbSeries1: TIWCheckBox;
    iwcbSeries2: TIWCheckBox;
    iwcbSeries3: TIWCheckBox;
    iwcbSeries4: TIWCheckBox;
    iwcbSeries5: TIWCheckBox;
    iwlPDFType: TIWLabel;
    Report1: TFlexCelReport;
    XLSAdapter1: TXLSAdapter;
    FlxProb: TFlxMemTable;
    FlxTitles: TFlxMemTable;
    FlxTempDataDI: TFlxMemTable;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwcbShowLegendClick(Sender: TObject);
    procedure iwcbShowBackgroundClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbChangeAxisScalesClick(Sender: TObject);
    procedure iwcbAutomaticScalingClick(Sender: TObject);
    procedure iwbExportGraphValuesClick(Sender: TObject);
    procedure iwcbSeries1Click(Sender: TObject);
    procedure iwcbSeries2Click(Sender: TObject);
    procedure iwcbSeries3Click(Sender: TObject);
    procedure iwcbSeries4Click(Sender: TObject);
    procedure iwcbSeries5Click(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  private
    MinimumCurveValue : double;
    NumDataPoints : array[1..5] of integer;
    procedure CreateChart;
    procedure GraphDI(iSeries, iPlotSequence : integer);
    procedure GraphDateByInterpretation(GraphType : string);
  protected
  public
  end;

implementation

uses IWForm, ServerController,
  DVIW_mathproc, JPEG, IWDep_uMain, IWDep_constants,
  IWDep_selectgraph;

{$R *.dfm}


procedure TIWChartInterpretation.IWAppFormCreate(Sender: TObject);
begin
  MinimumCurveValue := 1.0e-4;
  Chart1.BufferedDisplay := false;
  Chart1.Foot.Clear;
  Chart1.Foot.Text.Add(Copyright1);
  Chart1.Foot.Text.Add(Copyright2);
  iwbExportGraphValues.Visible := UserSession.CanViewPlus;
  iwcbSeries1.Visible := UserSession.CanViewPlus;
  iwcbSeries2.Visible := UserSession.CanViewPlus;
  iwcbSeries3.Visible := UserSession.CanViewPlus;
  iwcbSeries4.Visible := UserSession.CanViewPlus;
  iwcbSeries5.Visible := UserSession.CanViewPlus;
  if (UserSession.GraphType = gtInterpretationProbabilityCurves) then
  begin
    iwbExportGraphValues.Visible := true;
    iwcbSeries1.Visible := true;
    iwcbSeries2.Visible := true;
    iwcbSeries3.Visible := true;
    iwcbSeries4.Visible := true;
    iwcbSeries5.Visible := true;
  end else
  begin
    iwbExportGraphValues.Visible := UserSession.CanViewPlus;
    iwcbSeries1.Visible := UserSession.CanViewPlus;
    iwcbSeries2.Visible := UserSession.CanViewPlus;
    iwcbSeries3.Visible := UserSession.CanViewPlus;
    iwcbSeries4.Visible := UserSession.CanViewPlus;
    iwcbSeries5.Visible := UserSession.CanViewPlus;
  end;
  CreateChart;
  if ((UserSession.GraphType = gtInterpretationProbabilityCurves)) then
    GraphDateByInterpretation(UserSession.GraphType);
end;

procedure TIWChartInterpretation.CreateChart;
var tmp : TChartSeriesClass;
    tmpSeries : TChartSeries;
begin
  Chart1.Title.Text.Clear;
  Chart1.View3D:=false;
  if ((UserSession.GraphType = gtInterpretationProbabilityCurves)) then
  begin
  end else
  begin
    iwlNormalisationType.Caption := '';
    iwlMinimumDateUncertainty.Caption := '';
    iwlPDFType.Caption := '';
  end;
end;

procedure TIWChartInterpretation.iwcbShowLegendClick(Sender: TObject);
begin
  Chart1.Legend.Visible:=iwcbShowLegend.Checked;
end;

procedure TIWChartInterpretation.iwcbShowBackgroundClick(Sender: TObject);
begin
  Chart1.Gradient.Visible:=iwcbShowBackground.Checked;

  if iwcbShowBackground.Checked then
     Chart1.BevelOuter:=bvRaised
  else
     Chart1.BevelOuter:=bvNone;

  Chart1.Color:=clWhite;
end;

procedure TIWChartInterpretation.iwbCloseClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFSelectGraph.Create(WebApplication).Show;
end;

procedure TIWChartInterpretation.GraphDI(iSeries, iPlotSequence : integer);    // sequencial interpretation dates with error bars
var
  tMean, tPlus, tMinus, tError : double;
begin
  //tPlus := dmDV.cdsTempDataDIAgePlusError.AsFloat;
  //tMinus := dmDV.cdsTempDataDIAgeMinusError.AsFloat;
  if (tPlus = 0.0) and (tMinus > 0.0) then tPlus := tMinus;
  if (tMinus = 0.0) and (tPlus > 0.0) then tMinus := tPlus;
  //tMean :=  ((dmDV.cdsTempDataDIAge.AsFloat + tPlus) + (dmDV.cdsTempDataDIAge.AsFloat - tMinus))/2.0;
  tError := (tPlus + tMinus)/2.0;
  //Chart1.Series[iSeries-1].AddXY(1.0*iPlotSequence, dmDV.cdsTempDataDIAge.AsFloat);
end;

procedure TIWChartInterpretation.GraphDateByInterpretation(GraphType : string);
var
  i, j, k, l, kstart, iPlotSequence, MaxPlotSequence : integer;
  Icnt : integer;
  X1, X2, Y2, tempRD : double;
  tempmax : array[1..MaxSeries] of double;
  SD1, SD2, t1, tempd : double;
  NPts : array[1..MaxSeries] of integer;
  Spectrum2d : array[0..Steps,1..MaxSeries] of double;
  MaxRows : integer;
  tplus, tminus, tx, tx1 : double;
  FromDate, ToDate : double;
  iCode : integer;
  MaxRowCount : integer;
  tSuitName, tInterpAbr, tInterpretation : string;
  tAge, tAgePlusError, tAgeMinusError, tAgeErrorAv : double;
  tColumnNo : integer;
  NumGroupsToUse : integer;
  MinimumUncertainty : double;
  tmpStr : string;
  tempGauss : double;
begin
    MinimumUncertainty := 2;
    MinimumUncertainty := MinimumUncertainty/1.96;
    //dmDV.cdsTempdataDI.IndexFieldNames := 'Age';
    if (UserSession.StartAtX < 0.0) then UserSession.StartAtX := 0.0;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX + 1.0;
    UserSession.StartAtX := 100.0*(Trunc(UserSession.StartAtX) div 100);
    UserSession.EndAtX := 100.0*(Trunc(UserSession.EndAtX) div 100 + 1);
    if UserSession.IncludeDateFromValue then
    begin
      Val(UserSession.DateFromField,FromDate,iCode);
      if (iCode = 0) then UserSession.StartAtX := FromDate;
    end;
    if UserSession.IncludeDateToValue then
    begin
      Val(UserSession.DateToField,ToDate,iCode);
      if (iCode = 0) then UserSession.EndAtX := ToDate;
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
    Chart1.Title.Text.Text := UserSession.GraphType;
    for i := 1 to MaxSeries do
    begin
      //dmDV.cdsTempDataDI.Filtered := false;
      //dmDV.cdsTempDataDI.First;
      {
      case i of
        1 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation1Caption+'''';
        2 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation2Caption+'''';
        3 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation3Caption+'''';
        4 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation4Caption+'''';
        5 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation5Caption+'''';
      end;
      }
      //dmDV.cdsTempDataDI.Filtered := true;
      NPts[i] := 0;
      //NPts[i] := dmDV.cdsTempDataDI.RecordCount;
      Chart1.Series[i-1].Clear;
      Chart1.Series[MaxSeries+i-1].Clear;
      if (GraphType = gtInterpretationProbabilityCurves) then
      begin
        Chart1.LeftAxis.Title.Caption := 'Probability (%)';
        Chart1.BottomAxis.Title.Caption := 'Date';
        Chart1.LeftAxis.Title.Visible := true;
        Chart1.BottomAxis.Title.Visible := true;
        case i of
          1 : begin
            //Chart1.Series[i-1].Title := UserSession.Interpretation1Caption+' (n='+IntToStr(Npts[i])+')';
            //iwcbSeries1.Caption := UserSession.Interpretation1Caption;
            Series1.LinePen.Show;
            Series1.Pointer.Visible := false;
          end;
          2 : begin
            //Chart1.Series[i-1].Title := UserSession.Interpretation2Caption+' (n='+IntToStr(Npts[i])+')';
            //iwcbSeries2.Caption := UserSession.Interpretation2Caption;
            Series2.LinePen.Show;
            Series2.Pointer.Visible := false;
          end;
          3 : begin
            //Chart1.Series[i-1].Title := UserSession.Interpretation3Caption+' (n='+IntToStr(Npts[i])+')';
            //iwcbSeries3.Caption := UserSession.Interpretation3Caption;
            Series3.LinePen.Show;
            Series3.Pointer.Visible := false;
          end;
          4 : begin
            //Chart1.Series[i-1].Title := UserSession.Interpretation4Caption+' (n='+IntToStr(Npts[i])+')';
            //iwcbSeries4.Caption := UserSession.Interpretation4Caption;
            Series4.LinePen.Show;
            Series4.Pointer.Visible := false;
          end;
          5 : begin
            //Chart1.Series[i-1].Title := UserSession.Interpretation5Caption+' (n='+IntToStr(Npts[i])+')';
            //iwcbSeries5.Caption := UserSession.Interpretation5Caption;
            Series5.LinePen.Show;
            Series5.Pointer.Visible := false;
          end;
        end;
      end;
    end;
    //dmDV.cdsTempDataDI.First;
    {Plot Interpretation graphs}
    MaxPlotSequence := 0;
    for i := 1 to MaxSeries do
    begin
      {
      dmDV.cdsTempDataDI.Filtered := false;
      dmDV.cdsTempDataDI.First;
      case i of
        1 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation1Caption+'''';
        2 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation2Caption+'''';
        3 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation3Caption+'''';
        4 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation4Caption+'''';
        5 : dmDV.cdsTempDataDI.Filter := 'Interpretation ='+''''+UserSession.Interpretation5Caption+'''';
      end;
      dmDV.cdsTempDataDI.Filtered := true;
      }
      if (NPts[i] > 0) then
      begin
        {VtChCum}
        if (GraphType = gtInterpretationProbabilityCurves) then
        begin
          for k := 0 to Steps do
          begin
            Spectrum2d[k,i] := 0.0;
          end;
          //dmDV.cdsTempDataDI.First;
          {
          repeat
            //tx := dmDV.cdsTempDataDIAge.AsFloat;
            //tx1 := dmDV.cdsTempDataDIAgeErrorAv.AsFloat;
            if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
            for l := 0 to Steps do
            begin
              X1 := UserSession.ToAge + 1.0*l*(UserSession.FromAge-UserSession.ToAge)/Steps;
              tempGauss := Gauss(X1,tx,tx1);
              if (UserSession.PDFType = 'AND') then Spectrum2d[l,i] := Spectrum2d[l,i] + tempGauss;
              if (UserSession.PDFType = 'OR') then
              begin
                if (Spectrum2d[l,i] < tempGauss) then Spectrum2d[l,i] := tempGauss;
              end;
            end;
            //dmDV.cdsTempDataDI.Next;
          until dmDV.cdsTempDataDI.EOF;
          }
        end;
      end else
      begin
        if (GraphType = gtInterpretationProbabilityCurves) then
        begin
          for k := 1 to Steps do
          begin
            Spectrum2d[k,i] := 0.0;
          end;
        end;
      end;
    end;
    {VtChCum}
    if (GraphType = gtInterpretationProbabilityCurves) then
    begin
      for i := 1 to MaxSeries do
      begin
        tempmax[i] := 0.0;
      end;
      for k := 0 to Steps do
      begin
        for i := 1 to MaxSeries do
        begin
          if (tempmax[i] < Spectrum2d[k,i]) then tempmax[i] := Spectrum2d[k,i];
        end;
      end;
      for i := 1 to MaxSeries do
      begin
        if (tempmax[i] = 0.0) then tempmax[i] := 1.0e-9;
        for k := 0 to Steps do
        begin
          x2 := UserSession.ToAge + 1.0*k*(UserSession.FromAge-UserSession.ToAge)/Steps;
          if (y2 < MinimumCurveValue) then y2 := 0.0;
          Chart1.Series[i-1].AddXY(x2,y2);
        end;
      end;
    end;
    //dmDV.cdsTempDataDI.First;
    if (GraphType = gtInterpretationProbabilityCurves) then
    begin
      {output to clientdataset}
      //dmDV.cdsTempDataProb.Open;
      //dmDV.cdsTempDataProb.EmptyDataSet;
      for i := 1 to MaxSeries do
      begin
        {
        case i of
          1 : tmpStr := UserSession.Interpretation1Caption+' (n='+IntToStr(Npts[i])+')';
          2 : tmpStr := UserSession.Interpretation2Caption+' (n='+IntToStr(Npts[i])+')';
          3 : tmpStr := UserSession.Interpretation3Caption+' (n='+IntToStr(Npts[i])+')';
          4 : tmpStr := UserSession.Interpretation4Caption+' (n='+IntToStr(Npts[i])+')';
          5 : tmpStr := UserSession.Interpretation5Caption+' (n='+IntToStr(Npts[i])+')';
        end;
        }
        for k := 0 to Steps do
        begin
          //dmDV.cdsTempDataProb.Append;
          //dmDV.cdsTempDataProbCurveNumber.AsInteger := i;
          //dmDV.cdsTempDataProbCurveTitle.AsString := tmpStr;
          x2 := UserSession.StartAtX + 1.0*k*(UserSession.EndAtX-UserSession.StartAtX)/Steps;
          if (y2 < MinimumCurveValue) then y2 := 0.0;
          //dmDV.cdsTempDataProbAge.AsFloat := x2;
          //dmDV.cdsTempDataProbCurveValue.AsFloat := y2;
        end;
      end;
    end;
    {
    UserSession.NumberOfPoints := dmDV.cdsTempDataDI.RecordCount;;
    dmDV.cdsTempDataDI.First;
    dmDV.cdsTempDataDI.Filtered := false;
    dmDV.cdsTempDataDI.Filtered := false;
    dmDV.cdsTempDataDI.First;
    }
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX +1;
    if (GraphType = gtInterpretationProbabilityCurves) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      iweXMinimum.Text := FormatFloat('###0.00',UserSession.StartAtX);
      iweXMaximum.Text := FormatFloat('###0.00',UserSession.EndAtX);
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
end;

procedure TIWChartInterpretation.iwbChangeAxisScalesClick(Sender: TObject);
var
  iCode : integer;
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
    UserSession.StartAtX := StrToFloat(iweXMinimum.Text);
    UserSession.EndAtX := StrToFloat(iweXMaximum.Text);
    UserSession.StartAtY := StrToFloat(iweYMinimum.Text);
    UserSession.EndAtY := StrToFloat(iweYMaximum.Text);
  except
  end;
end;

procedure TIWChartInterpretation.iwcbAutomaticScalingClick(
  Sender: TObject);
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
end;

procedure TIWChartInterpretation.iwbExportGraphValuesClick(
  Sender: TObject);
var
  {
  tmpPath : string;
  tmpFileName : string;
  }
  MemStream: TMemoryStream;
  l,i : integer;
  X1 : double;
  Spectrum2d : array[0..Steps,1..MaxSeries] of double;
begin
  {
  Report1.DataModule := UserSession.dmDV;
  }
    FlxTitles.Open;
    FlxTitles.Clear;
    {
    if ((UserSession.GraphType = gtInterpretationProbabilityCurves)) then
    begin
      FlxTitles.AddRecord([UserSession.Interpretation1Caption,UserSession.Interpretation2Caption,
          UserSession.Interpretation3Caption,UserSession.Interpretation4Caption,UserSession.Interpretation5Caption]);
    end;
    }
    if ((UserSession.GraphType = gtInterpretationProbabilityCurves)) then
    begin
      Report1.Template := DefaultFlexCellFolder+'DataProb.xls';
      //dmDV.cdsTempDataProb.First;
      for i := 1 to MaxSeries do
      begin
        for l := 0 to Steps do
        begin
          //Spectrum2d[l,i] := dmDV.cdsTempDataProbCurveValue.AsFloat;
          //dmDV.cdsTempDataProb.Next;
        end;
      end;
      FlxProb.Open;
      for l := 0 to Steps do
      begin
        X1 := UserSession.ToAge + 1.0*l*(UserSession.FromAge-UserSession.ToAge)/Steps;
        FlxProb.AddRecord([X1,Spectrum2d[l,1],Spectrum2d[l,2],Spectrum2d[l,3],Spectrum2d[l,4],Spectrum2d[l,5]]);
      end;
    end;
  MemStream:=TMemoryStream.Create;
  try
    Report1.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','CurveData.xls'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
    FlxProb.Close;
    FlxTempDataDI.Close;
    FlxTitles.Close;
  end; //finally
end;

procedure TIWChartInterpretation.iwcbSeries1Click(Sender: TObject);
begin
  if iwcbSeries1.Checked then
  begin
    Chart1.Series[0].ShowInLegend := true;
    Chart1.Series[0].Visible := true;
  end else
  begin
    Chart1.Series[0].ShowInLegend := false;
    Chart1.Series[0].Visible := false;
  end;
end;

procedure TIWChartInterpretation.iwcbSeries2Click(Sender: TObject);
begin
  if iwcbSeries2.Checked then
  begin
    Chart1.Series[1].ShowInLegend := true;
    Chart1.Series[1].Visible := true;
  end else
  begin
    Chart1.Series[1].ShowInLegend := false;
    Chart1.Series[1].Visible := false;
  end;
end;

procedure TIWChartInterpretation.iwcbSeries3Click(Sender: TObject);
begin
  if iwcbSeries3.Checked then
  begin
    Chart1.Series[2].ShowInLegend := true;
    Chart1.Series[2].Visible := true;
  end else
  begin
    Chart1.Series[2].ShowInLegend := false;
    Chart1.Series[2].Visible := false;
  end;
end;

procedure TIWChartInterpretation.iwcbSeries4Click(Sender: TObject);
begin
  if iwcbSeries4.Checked then
  begin
    Chart1.Series[3].ShowInLegend := true;
    Chart1.Series[3].Visible := true;
  end else
  begin
    Chart1.Series[3].ShowInLegend := false;
    Chart1.Series[3].Visible := false;
  end;
end;

procedure TIWChartInterpretation.iwcbSeries5Click(Sender: TObject);
begin
  if iwcbSeries5.Checked then
  begin
    Chart1.Series[4].ShowInLegend := true;
    Chart1.Series[4].Visible := true;
  end else
  begin
    Chart1.Series[4].ShowInLegend := false;
    Chart1.Series[4].Visible := false;
  end;
end;

procedure TIWChartInterpretation.IWAppFormRender(Sender: TObject);
begin
  if ((UserSession.GraphType = gtInterpretationProbabilityCurves)) then
  begin
    iwbExportGraphValues.Visible := true;
    iwcbSeries1.Visible := true;
    iwcbSeries2.Visible := true;
    iwcbSeries3.Visible := true;
    iwcbSeries4.Visible := true;
    iwcbSeries5.Visible := true;
  end else
  begin
    iwbExportGraphValues.Visible := UserSession.CanViewPlus;
    iwcbSeries1.Visible := UserSession.CanViewPlus;
    iwcbSeries2.Visible := UserSession.CanViewPlus;
    iwcbSeries3.Visible := UserSession.CanViewPlus;
    iwcbSeries4.Visible := UserSession.CanViewPlus;
    iwcbSeries5.Visible := UserSession.CanViewPlus;
  end;
end;

end.
