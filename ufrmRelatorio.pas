unit ufrmRelatorio;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Data.DB,
  RLReport, uDBHelper, FireDAC.Comp.Client, ufrmPrincipal;

type
  TfrmRelatorio = class(TForm)
    DataSource: TDataSource;
    RLReport: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLBand6: TRLBand;
    RLLabel9: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLLabel10: TRLLabel;
    RLDBResult5: TRLDBResult;
    RLLabel11: TRLLabel;
    RLDBResult6: TRLDBResult;
    procedure FormCreate(Sender: TObject);
  private
    FQuery: TFDQuery;
  public
    procedure CarregarDados;
    function Carregar(const AConteiner: TWinControl): TfrmRelatorio;
    class function GetInstance(): TfrmRelatorio;
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  CarregarDados;
end;

function TfrmRelatorio.Carregar(const AConteiner: TWinControl): TfrmRelatorio;
begin
  Result := Self;
  Self.Parent := AConteiner;
  Self.RLReport.Preview();
end;

class function TfrmRelatorio.GetInstance: TfrmRelatorio;
begin
  Result := TfrmRelatorio.Create(nil);
end;

procedure TfrmRelatorio.CarregarDados;
const
  CSQL = 'SELECT * FROM abastecimento ORDER BY data, tanque, bomba';
begin
  FQuery := frmPrincipal.FDBHelper.RetornaQuery(CSQL);
  DataSource.DataSet := FQuery;
end;

end.

