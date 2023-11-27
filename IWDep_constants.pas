unit IWDep_constants;

interface

const
  ValueForUndefinedContinentID = 'UND';
  ValueForUndefinedCountryID = 'UND';
  ValueForPublished = 'PUBL';

  usDetails = 'Details';
  usDetailsEdit = 'DetailsEdit';
  usGrid = 'Grid';
  usDeposits = 'Deposits';
  usProspectCompare = 'Compare';

  MaxGuestRecords = 10;
  DefaultMapFolder = 'files/maps/';
  DefaultMapFileName = 'country.shp';
  DefaultMapDBFName = 'country.dbf';
  DefaultFlexCellFolder = './wwwroot/files/flexcell/';

  gtMapAgeBand = 'Map by age band';
  gtMapRatio64 = 'Map of present day 206Pb/204Pb';
  gtMapRatio74 = 'Map of present day 207Pb/204Pb';
  gtMapRatio84 = 'Map of present day 208Pb/204Pb';
  gtMapMuSource = 'Map of model source 238U/204Pb';
  gtMapRatio64Model = 'Map of model initial 206Pb/204Pb';
  gtMapRatio74Model = 'Map of model initial 207Pb/204Pb';

  NothingChosen = 'nothing';
  Copyright1 = '(c) Bruce Eglington (2006-2022)';
  Copyright2 = 'Deposit Isotope Database';

  Steps        = 1000;
  SpectrumStartAge = 0.0;
  SpectrumEndAge = 4600.0;
  MaxSeries  = 5;
  MaxSamp    = 1000;
  MaxMedianSamp = 200;
  SKAge_Stage1 = 4570.0;
  SK64_Stage1 = 9.307;
  SK74_Stage1 = 10.294;
  SK84_Stage1 = 29.487;
  SKmu_Stage1 = 7.19;
  SKAge_Stage2 = 3700.0;
  SK64_Stage2 = 11.152;
  SK74_Stage2 = 12.998;
  SK84_Stage2 = 31.230;
  SKmu_Stage2 = 9.74;
  SKW_Stage2 = 37.19;
  SK64_Modern = 18.703;
var
  DefaultValue : double = -999.0;
  DecayConst238 : double = 1.55125e-10;
  DecayConst235 : double = 9.8485e-10;
  DecayConst232 : double = 4.9475e-11;
  U238U235 : double = 137.88;
  Age74Dominant : double = 542.00;
  AgeTolerance : double = 1000.0;

type
  DoubleArray = array[1..MaxMedianSamp] of double;


implementation

end.
