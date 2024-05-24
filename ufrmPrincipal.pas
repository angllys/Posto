unit ufrmPrincipal;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.Grids, System.SysUtils, System.Generics.Collections,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs, Vcl.ComCtrls, System.Classes,
  uAbastecimento, uTanque, uConexaoFirebird, Vcl.WinXPickers, uDBHelper,
  Data.DB, Vcl.DBGrids, FireDAC.Comp.Client, Vcl.Mask;

type
  TfrmPrincipal = class(TForm)
    lblQuantidadeLitros: TLabel;
    edtQuantidadeLitros: TEdit;
    lblValorAbastecido: TLabel;
    edtValorAbastecido: TEdit;
    btnAddAbastecimento: TButton;
    btnGerarRelatorio: TButton;
    pnTopo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    rgBombas: TRadioGroup;
    rgTanques: TRadioGroup;
    GroupBox1: TGroupBox;
    lblData: TLabel;
    edtData: TDateTimePicker;
    Label3: TLabel;
    edtValorLitroGasolina: TEdit;
    Label4: TLabel;
    edtValorLitroDiesel: TEdit;
    gd: TDBGrid;
    ds: TDataSource;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnAddAbastecimentoClick(Sender: TObject);
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure edtQuantidadeLitrosExit(Sender: TObject);
    procedure edtValorAbastecidoExit(Sender: TObject);
    procedure edtValorLitroGasolinaExit(Sender: TObject);
    procedure edtValorLitroDieselExit(Sender: TObject);
  private
    FConexao: TConexaoFirebird;
    FAbastecimentos: TObjectList<TAbastecimento>;
    FTanques: TObjectList<TTanque>;
    procedure AdicionarAbastecimento(const AAbastecimento: TAbastecimento);
    function ValidarBomba(ATanque: String; ABomba: Integer): Boolean;
    function FormatarCurrency(const AValor: string): String;
    function CalcularValorTotal(const AValorPorLitro: Currency; const AQuantidadeLitros: Double): Currency;
    function CalcularQuantidadeLitros(const AValorTotal: Currency; const AValorPorLitro: Currency): Double;
  public
    FTabela: TFDTable;
    FDBHelper: TDBHelper;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ufrmRelatorio;

{$R *.dfm}

function TfrmPrincipal.FormatarCurrency(const AValor: string): String;
var
  lValue: Currency;
begin
  lValue := StrToCurrDef(AValor, 0);
  Result := FormatFloat('0.00', lValue);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lTanqueGasolina: TTanque;
  lTanqueDiesel: TTanque;
begin
  FConexao := TConexaoFirebird.Create;
  try
    FConexao.DriverId := 'FB';
    FConexao.Porta := 3050;
    FConexao.Database := Format('%s%s', [ExtractFilePath(ParamStr(0)), 'database\dbposto.fdb']);
    FConexao.Usuario := 'SYSDBA';
    FConexao.Senha := 'masterkey';
    FConexao.Dialect := 1;
    FConexao.Conectar;
  except
    raise Exception.Create('Desculpe, ocorrreu um erro ao tentar estabelecer conexão.' + SlineBreak + '  O módulo será encerrado!');
    Sleep(100);
    Application.Terminate;
  end;

  FDBHelper := TDBHelper.Create(FConexao.Conexao);
  if not(FDBHelper.TestaQuery) then
  begin
    raise Exception.Create('Desculpe, ocorrreu um erro ao tentar estabelecer conexão.' + SlineBreak + '  O módulo será encerrado!');
    Sleep(100);
    Application.Terminate;
  end;

  FTabela := FDBHelper.RetornaTable('ABASTECIMENTO');
  ds.DataSet := FTabela;

  FAbastecimentos := TObjectList<TAbastecimento>.Create;
  FTanques := TObjectList<TTanque>.Create;

  lTanqueGasolina := TTanque.Create('Gasolina');
  lTanqueGasolina.Bombas.Add(1);
  lTanqueGasolina.Bombas.Add(2);

  lTanqueDiesel := TTanque.Create('Diesel');
  lTanqueDiesel.Bombas.Add(1);
  lTanqueDiesel.Bombas.Add(2);

  FTanques.Add(lTanqueGasolina);
  FTanques.Add(lTanqueDiesel);
end;

function TfrmPrincipal.ValidarBomba(ATanque: String; ABomba: Integer): Boolean;
var
  lTanque: TTanque;
begin
  Result := False;
  for lTanque in FTanques do
  begin
    if (lTanque.Tipo = ATanque) and (lTanque.Bombas.Contains(ABomba)) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TfrmPrincipal.btnAddAbastecimentoClick(Sender: TObject);
var
  lData: TDateTime;
  lBomba: Integer;
  lQuantidadeLitros: Double;
  lValorAbastecido: Double;
  lTanque: String;
  lAbastecimento: TAbastecimento;
begin
  lQuantidadeLitros := StrToFloatDef(edtQuantidadeLitros.Text, 0);
  lValorAbastecido := StrToFloatDef(edtValorAbastecido.Text, 0);
  lData := edtData.Date;
  lBomba := rgBombas.ItemIndex + 1;
  lTanque := rgTanques.Items[rgTanques.ItemIndex];

  if (lQuantidadeLitros < 0) or (lValorAbastecido < 0) then
  begin
    ShowMessage('A quantidade de litros e o valor devem ser maiores ou iguais a zero.');
    Exit;
  end;

  if not(ValidarBomba(lTanque, lBomba)) then
  begin
    ShowMessage('A bomba selecionada não é válida para o tanque selecionado.');
    Exit;
  end;

  lAbastecimento := TAbastecimento.Create(lData, lBomba, lQuantidadeLitros, lValorAbastecido, lTanque);
  AdicionarAbastecimento(lAbastecimento);
end;

procedure TfrmPrincipal.AdicionarAbastecimento(const AAbastecimento: TAbastecimento);
const
  CSQL = 'INSERT INTO Abastecimento (data, bomba, quantidadelitros, valorabastecido, imposto, tanque) VALUES ("%s", %s, %s, %s, %s, "%s")';
begin
  FDBHelper.ExecuteQuery(Format(CSQL, [
    FormatDateTime('mm/dd/yyyy', AAbastecimento.Data),
    IntToStr(AAbastecimento.Bomba),
    StringReplace(FormatarCurrency(FloatToStr(AAbastecimento.QuantidadeLitros)), ',', '.', [rfReplaceAll]),
    StringReplace(FormatarCurrency(CurrToStr(AAbastecimento.ValorAbastecido)), ',', '.', [rfReplaceAll]),
    StringReplace(FormatarCurrency(CurrToStr(AAbastecimento.Imposto)), ',', '.', [rfReplaceAll]),
    AAbastecimento.Tanque
  ]));
  FTabela.Refresh;
end;

procedure TfrmPrincipal.btnGerarRelatorioClick(Sender: TObject);
begin
  TfrmRelatorio.GetInstance().Carregar(Self);
end;

function TfrmPrincipal.CalcularQuantidadeLitros(const AValorTotal, AValorPorLitro: Currency): Double;
begin
  if (AValorPorLitro <= 0) then
    raise Exception.Create('O valor por litro deve ser maior que zero.');

  Result := (AValorTotal / AValorPorLitro);
end;

function TfrmPrincipal.CalcularValorTotal(const AValorPorLitro: Currency; const AQuantidadeLitros: Double): Currency;
begin
  Result := (AValorPorLitro * AQuantidadeLitros);
end;

procedure TfrmPrincipal.edtValorLitroDieselExit(Sender: TObject);
begin
  edtValorLitroDiesel.Text := FormatarCurrency(edtValorLitroDiesel.Text);
end;

procedure TfrmPrincipal.edtQuantidadeLitrosExit(Sender: TObject);
var
  lQuantidadeLitros: Double;
  lValorTotal: Currency;
begin
  lQuantidadeLitros := StrToFloatDef(edtQuantidadeLitros.Text, 0);

  if (lQuantidadeLitros > 0) then
  begin
    if (rgTanques.ItemIndex = 0) then
      lValorTotal := CalcularValorTotal(lQuantidadeLitros, StrToCurr(edtValorLitroGasolina.Text))
    else
      lValorTotal := CalcularValorTotal(lQuantidadeLitros, StrToCurr(edtValorLitroDiesel.Text));

    edtValorAbastecido.Text := FormatarCurrency(CurrToStr(lValorTotal));
  end;
end;

procedure TfrmPrincipal.edtValorAbastecidoExit(Sender: TObject);
var
  lValorAbastecido: Currency;
  lQuantidadeLitros: Double;
begin
  lValorAbastecido := StrToCurrDef(FormatFloat('0.00', StrToFloat(edtValorAbastecido.Text)), 0);

  if (lValorAbastecido > 0) then
  begin
    if (rgTanques.ItemIndex = 0) then
      lQuantidadeLitros := CalcularQuantidadeLitros(lValorAbastecido, StrToCurr(edtValorLitroGasolina.Text))
    else
      lQuantidadeLitros := CalcularQuantidadeLitros(lValorAbastecido, StrToCurr(edtValorLitroDiesel.Text));

    edtQuantidadeLitros.Text := FormatarCurrency(FloatToStr(lQuantidadeLitros));
  end;
end;

procedure TfrmPrincipal.edtValorLitroGasolinaExit(Sender: TObject);
begin
  edtValorLitroGasolina.Text := FormatarCurrency(edtValorLitroGasolina.Text);
end;

end.

