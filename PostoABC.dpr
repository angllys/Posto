program PostoABC;

uses
  Vcl.Forms,
  ufrmPrincipal in 'form\ufrmPrincipal.pas' {frmPrincipal},
  uTanque in 'classes\uTanque.pas',
  uAbastecimento in 'classes\uAbastecimento.pas',
  uConexaoFirebird in 'classes\uConexaoFirebird.pas',
  uDBHelper in 'classes\uDBHelper.pas',
  ufrmRelatorio in 'form\ufrmRelatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
