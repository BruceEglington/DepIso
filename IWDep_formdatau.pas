unit IWDep_formdatau;

interface

uses Classes;

type
  TFormData = class(TObject)
  private
    FIncludeContinentValues: Boolean;
    FContinentValues: TStrings;
    FIncludeAreaValues: Boolean;
    FAreaValues: TStrings;
    FIncludeUnitValues: Boolean;
    FUnitValues: TStrings;
    FIncludeReferenceValues: Boolean;
    FReferenceValues: TStrings;
    FIncludeValidationValues: Boolean;
    FValidationValues: TStrings;
    FIncludeDateFromValue: Boolean;
    FDateFromField: string;
    FIncludeDateToValue: Boolean;
    FDateToField: string;
    FOrderByValue: string;
    FSQLMemoField: TStrings;
    FParameterChosen: string;
    procedure SetContinentValues(const Value: TStrings);
    procedure SetAreaValues(const Value: TStrings);
    procedure SetUnitValues(const Value: TStrings);
    procedure SetReferenceValues(const Value: TStrings);
    procedure SetValidationValues(const Value: TStrings);
    procedure SetSQLMemoField(const Value: TStrings);
    function GetXML: string;
    procedure SetXML(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property IncludeContinentValues: Boolean read FIncludeContinentValues write FIncludeContinentValues;
    property ContinentValues: TStrings read FContinentValues write SetContinentValues;
    property IncludeAreaValues: Boolean read FIncludeAreaValues write FIncludeAreaValues;
    property AreaValues: TStrings read FAreaValues write SetAreaValues;
    property IncludeUnitValues: Boolean read FIncludeUnitValues write FIncludeUnitValues;
    property UnitValues: TStrings read FUnitValues write SetUnitValues;
    property IncludeReferenceValues: Boolean read FIncludeReferenceValues write FIncludeReferenceValues;
    property ReferenceValues: TStrings read FReferenceValues write SetReferenceValues;
    property IncludeValidationValues: Boolean read FIncludeValidationValues write FIncludeValidationValues;
    property ValidationValues: TStrings read FValidationValues write SetValidationValues;
    property IncludeDateFromValue: boolean read FIncludeDateFromValue write FIncludeDateFromValue;
    property DateFromField: string read FDateFromField write FDateFromField;
    property IncludeDateToValue: boolean read FIncludeDateToValue write FIncludeDateToValue;
    property DateToField: string read FDateToField write FDateToField;
    property OrderByValue: string read FOrderByValue write FOrderByValue;
    property SQLMemoField: TStrings read FSQLMemoField write SetSQLMemoField;
    property ParameterChosen: string read FParameterChosen write FParameterChosen;
    property XML: string read GetXML write SetXML;
  end;

implementation

uses XMLDoc, XMLIntf, SysUtils;

{ TFormData }

constructor TFormData.Create;
begin
  FContinentValues := TStringList.Create;
  FAreaValues := TStringList.Create;
  FUnitValues := TStringList.Create;
  FReferenceValues := TStringList.Create;
  FValidationValues := TStringList.Create;
  FSQLMemoField := TStringList.Create;
end;

destructor TFormData.Destroy;
begin
  inherited;
  FContinentValues.Free;
  FAreaValues.Free;
  FUnitValues.Free;
  FReferenceValues.Free;
  FValidationValues.Free;
  FSQLMemoField.Free;
end;

function TFormData.GetXML: string;
var
  XMLTop: IXMLNode;
  XMLDocument: IXMLDocument;
  XMLNode: IXMLNode;

  procedure WriteString(const TagName, Value: string);
  begin
    XMLNode := XMLTop.AddChild(TagName);
    XMLNode.SetText(Value);
  end;

  procedure WriteStrings(const TagName: string; Values: TStrings);
  var
    I: Integer;
  begin
    XMLNode := XMLTop.AddChild(TagName);
    for I := 0 to Values.Count - 1 do
      with XMLNode.AddChild('Item') do
        SetText(Values[I]);
  end;

  procedure WriteBoolean(const TagName: string; Value: Boolean);
  begin
    XMLNode := XMLTop.AddChild(TagName);
    if Value then
      XMLNode.SetText('TRUE')
    else
      XMLNode.SetText('FALSE');
  end;
begin
  XMLDocument := TXMLDocument.Create(nil);
  XMLDocument.Active := True;
  XMLTop := XMLDocument.AddChild('FormData');
  WriteBoolean('IncludeContinentValues', IncludeContinentValues);
  WriteStrings('ContinentValues', ContinentValues);
  WriteBoolean('IncludeAreaValues', IncludeAreaValues);
  WriteStrings('AreaValues', AreaValues);
  WriteBoolean('IncludeUnitValues', IncludeUnitValues);
  WriteStrings('UnitValues', UnitValues);
  WriteBoolean('IncludeReferenceValues', IncludeReferenceValues);
  WriteStrings('ReferenceValues', ReferenceValues);
  WriteBoolean('IncludeValidationValues', IncludeValidationValues);
  WriteStrings('ValidationValues', ValidationValues);
  WriteBoolean('IncludeDateFromValue', IncludeDateFromValue);
  WriteString('DateFromField', DateFromField);
  WriteBoolean('IncludeDateToValue', IncludeDateToValue);
  WriteString('DateToField', DateToField);
  WriteString('OrderByValue', OrderByValue);
  WriteStrings('SQLMemoField', SQLMemoField);
  WriteString('ParameterChosen', ParameterChosen);
  Result := XMLDocument.XML.Text;
end;

procedure TFormData.SetXML(const Value: string);
var
  XMLDocument: IXMLDocument;
  XMLNode: IXMLNode;
  XMLTop: IXMLNode;
  S: TStrings;

  function ReadString(const TagName: string): string;
  begin
    XMLNode := XMLTop.ChildNodes.Nodes[TagName];
    Result := XMLNode.Text;
  end;

  function ReadStrings(const TagName: string): TStrings;
  var
    I: Integer;
  begin
    XMLNode := XMLTop.ChildNodes.Nodes[TagName];
    S.Clear;
    for I := 0 to XMLNode.ChildNodes.Count - 1 do
      S.Add(XMLNode.ChildNodes.Nodes[I].Text);
    Result := S;
  end;

  function ReadBoolean(const TagName: string): Boolean;
  begin
    XMLNode := XMLTop.ChildNodes.Nodes[TagName];
    if UpperCase(XMLNode.Text) = 'TRUE' then
      Result := True
    else
      Result := False;
  end;
begin
  S := TStringList.Create;
  try
    XMLDocument := TXMLDocument.Create(nil);
    XMLDocument.LoadFromXML(Value);
    XMLTop := XMLDocument.DocumentElement;
    IncludeContinentValues := ReadBoolean('IncludeContinentValues');
    ContinentValues := ReadStrings('ContinentValues');
    IncludeAreaValues := ReadBoolean('IncludeAreaValues');
    AreaValues := ReadStrings('AreaValues');
    IncludeUnitValues := ReadBoolean('IncludeUnitValues');
    UnitValues := ReadStrings('UnitValues');
    IncludeReferenceValues := ReadBoolean('IncludeReferenceValues');
    ReferenceValues := ReadStrings('ReferenceValues');
    IncludeValidationValues := ReadBoolean('IncludeValidationValues');
    ValidationValues := ReadStrings('ValidationValues');
    IncludeDateFromValue := ReadBoolean('IncludeDateFromValue');
    DateFromField := ReadString('DateFromField');
    IncludeDateToValue := ReadBoolean('IncludeDateToValue');
    DateToField := ReadString('DateToField');
    OrderByValue := ReadString('OrderByValue');
    SQLMemoField := ReadStrings('SQLMemoField');
    ParameterChosen := ReadString('ParameterChosen');

    {need to set these false each time because of some error in code from Jim Tierney}
    IncludeContinentValues := false;
    IncludeAreaValues := false;
    IncludeUnitValues := false;
    IncludeReferenceValues := false;
    IncludeValidationValues := false;
    IncludeDateFromValue := false;
    IncludeDateToValue := false;
  finally
    S.Free;
  end;
end;

procedure TFormData.SetContinentValues(const Value: TStrings);
begin
  FContinentValues.Assign(Value);
end;

procedure TFormData.SetAreaValues(const Value: TStrings);
begin
  FAreaValues.Assign(Value);
end;

procedure TFormData.SetUnitValues(const Value: TStrings);
begin
  FUnitValues.Assign(Value);
end;

procedure TFormData.SetReferenceValues(const Value: TStrings);
begin
  FReferenceValues.Assign(Value);
end;

procedure TFormData.SetValidationValues(const Value: TStrings);
begin
  FValidationValues.Assign(Value);
end;

procedure TFormData.SetSQLMemoField(const Value: TStrings);
begin
  FSQLMemoField.Assign(Value);
end;

end.
