unit uAbastecimento;

interface

type
  TAbastecimento = class
  private
    FData: TDateTime;
    FBomba: Integer;
    FQuantidadeLitros: Double;
    FValorAbastecido: Currency;
    FImposto: Currency;
    FTanque: String;
    procedure CalcularImposto;
  public
    constructor Create(AData: TDateTime; ABomba: Integer; AQuantidadeLitros: Double; AValorAbastecido: Currency; ATanque: String);
    property Data: TDateTime read FData;
    property Bomba: Integer read FBomba;
    property QuantidadeLitros: Double read FQuantidadeLitros;
    property ValorAbastecido: Currency read FValorAbastecido;
    property Imposto: Currency read FImposto;
    property Tanque: String read FTanque;
  end;

implementation

{ TAbastecimento }

procedure TAbastecimento.CalcularImposto;
begin
  FImposto := FValorAbastecido * 0.13;
end;

constructor TAbastecimento.Create(AData: TDateTime; ABomba: Integer; AQuantidadeLitros: Double; AValorAbastecido: Currency; ATanque: String);
begin
  FData := AData;
  FBomba := ABomba;
  FQuantidadeLitros := AQuantidadeLitros;
  FValorAbastecido := AValorAbastecido;
  FTanque := ATanque;
  CalcularImposto;
end;

end.

