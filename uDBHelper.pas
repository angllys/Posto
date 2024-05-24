{******************************************************************************}
{                                                                              }
{ Descrição:                                                                   }
{   Biblioteca de componentes Delphi para interação com banco de dados         }
{   Firebird especificamente com Querys/Tables(DataSets) utilizando            }
{   componentes FireDAC.                                                       }
{                                                                              }
{ Direitos Autorais Reservados (c) 2023 Angllys Bandeira Soares                }
{ Contato:                                                                     }
{   Email: angllys.desenvolvimento@gmail.com                                   }
{   Whatsapp: 85 98791.8207                                                    }
{                                                                              }
{ Notas de Versão:                                                             }
{   - Versão 1.0.0 (10/02/2023): Primeira versão da classe de utilitário.      }
{                                                                              }
{ Autor:                                                                       }
{   Angllys Bandeira Soares                                                    }
{******************************************************************************}

unit uDBHelper;

interface

uses
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB;

type
  TDBHelper = class
  private
    FConexao: TFDConnection;
  public
    constructor Create(const AConexao: TFDConnection);
    destructor Destroy; override;

    property Conexao: TFDConnection read FConexao write FConexao;
    function ExecuteQuery(const ASQL: string): Boolean;
    function RetornaQuery(const ASQL: string): TFDQuery;
    function RetornaTable(const ATabela: string): TFDTable;
    function TestaQuery: Boolean;
  end;

implementation

{ TDBHelper }

constructor TDBHelper.Create(const AConexao: TFDConnection);
begin
  FConexao := AConexao;
end;

destructor TDBHelper.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TDBHelper.ExecuteQuery(const ASQL: string): Boolean;
var
  lQuery: TFDQuery;
begin
  Result := True;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := Conexao;
    try
      lQuery.ExecSQL(ASQL);
    except
      Result := False;
    end;
  finally
    FreeAndNil(lQuery);
  end;
end;

function TDBHelper.RetornaQuery(const ASQL: string): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  try
    Result.Connection := Conexao;
    Result.Open(ASQL);
    Result.FetchAll;
  Except
    Result := nil;
  end;
end;

function TDBHelper.RetornaTable(const ATabela: string): TFDTable;
begin
  Result := TFDTable.Create(nil);
  try
    Result.Connection := Conexao;
    Result.TableName := ATabela;
    Result.IndexFieldNames := 'ID';
    Result.Open;
  except
    Result := nil;
  end;
end;

function TDBHelper.TestaQuery: Boolean;
var
  lQuery: TFDQuery;
begin
  Result := True;

  try
    lQuery := RetornaQuery('SELECT * FROM ABASTECIMENTO');
    if (lQuery.RecordCount = 1) then
      Result := True;
  except
    Result := False;
  end;
end;

end.

