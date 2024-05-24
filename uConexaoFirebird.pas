{******************************************************************************}
{                                                                              }
{ Descrição:                                                                   }
{   Biblioteca de componentes Delphi para interação com banco de dados         }
{   Firebird utilizando componentes FireDAC.                                   }
{                                                                              }
{ Direitos Autorais Reservados (c) 2023 Angllys Bandeira Soares                }
{ Contato:                                                                     }
{   Email: angllys.desenvolvimento@gmail.com                                   }
{   Whatsapp: 85 98791.8207                                                    }
{                                                                              }
{ Notas de Versão:                                                             }
{   - Versão 1.0.0 (10/02/2023): Primeira versão da classe de conexão.         }
{                                                                              }
{ Autor:                                                                       }
{   Angllys Bandeira Soares                                                    }
{******************************************************************************}

unit uConexaoFirebird;

interface

uses
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB;

type
  TConexaoFirebird = class
  private
    FConexao: TFDConnection;
    FHost: string;
    FPorta: Integer;
    FDatabase: string;
    FUsuario: string;
    FSenha: string;
    FDriverId: string;
    FDialect: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Conectar;
    procedure Desconectar;
    property Conexao: TFDConnection read FConexao write FConexao;
    property DriverId: string read FDriverId write FDriverId;
    property Host: string read FHost write FHost;
    property Porta: Integer read FPorta write FPorta;
    property Database: string read FDatabase write FDatabase;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;
    property Dialect: Integer read FDialect write FDialect;
  end;

implementation

{ TConexaoFirebird }

constructor TConexaoFirebird.Create;
begin
  FConexao := TFDConnection.Create(nil);
end;

destructor TConexaoFirebird.Destroy;
begin
  FConexao.Free;
  inherited;
end;

procedure TConexaoFirebird.Conectar;
begin
  FConexao.Params.Clear;
  FConexao.Params.Add('DriverID=' + FDriverId);
  FConexao.Params.Add('Server=' + FHost);
  FConexao.Params.Add('Port=' + IntToStr(FPorta));
  FConexao.Params.Add('Database=' + FDatabase);
  FConexao.Params.Add('User_name=' + FUsuario);
  FConexao.Params.Add('Password=' + FSenha);
  FConexao.Params.Add('SQLDialect=' + FDialect.ToString);
  FConexao.Params.Add('VendorLib=fbclient.dll');
  FConexao.Connected := True;
end;

procedure TConexaoFirebird.Desconectar;
begin
  FConexao.Connected := False;
end;

end.

