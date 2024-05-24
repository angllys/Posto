unit uTanque;

interface

uses
  System.Generics.Collections;

type
  TTanque = class
  private
    FTipo: String;
    FBombas: TList<Integer>;
  public
    constructor Create(ATipo: String);
    destructor Destroy; override;
    property Tipo: String read FTipo;
    property Bombas: TList<Integer> read FBombas;
  end;

implementation

{ TTanque }

constructor TTanque.Create(ATipo: String);
begin
  FTipo := ATipo;
  FBombas := TList<Integer>.Create;
end;

destructor TTanque.Destroy;
begin
  FBombas.Free;
  inherited;
end;

end.

