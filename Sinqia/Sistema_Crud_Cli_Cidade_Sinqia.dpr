program Sistema_Crud_Cli_Cidade_Sinqia;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UCadCidade in 'UCadCidade.pas' {frmCadCidade},
  UDM in 'UDM.pas' {DM: TDataModule},
  UCadCliente in 'UCadCliente.pas' {frmCadClientes},
  UConsCliente in 'UConsCliente.pas' {frmConsCliente},
  UConsCidade in 'UConsCidade.pas' {frmConsCidade},
  URelatorio in 'URelatorio.pas' {frmRelatorio},
  URelClienteCidades in 'URelClienteCidades.pas' {frmRelClientesCidades};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
