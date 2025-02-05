unit UConsCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TfrmConsCliente = class(TForm)
    lblNome: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    btnConsultar: TBitBtn;
    dsConsCliente: TDataSource;
    btnRelatorio: TBitBtn;
    dtRelatorioCliente: TfrxDBDataset;
    rpRelatorioCliente: TfrxReport;
    procedure btnConsultarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCliente: TfrmConsCliente;

implementation

{$R *.dfm}

uses UDM, UCadCliente, URelClienteCidades;

procedure TfrmConsCliente.btnConsultarClick(Sender: TObject);
begin
  DM.qryConsClientes.Close;
  DM.qryConsClientes.Parameters.ParamByName('pNome_Cliente').Value :=
                                               '%' + edtNome.Text + '%';
  DM.qryConsClientes.Open;
end;

procedure TfrmConsCliente.btnRelatorioClick(Sender: TObject);
begin
  frmRelClientesCidades := TfrmRelClientesCidades.Create(Self);
  try
   frmRelClientesCidades.ShowModal;
  finally
   frmRelClientesCidades.Free;
  end;
end;

procedure TfrmConsCliente.DBGrid1DblClick(Sender: TObject);
begin
  if not DM.qryConsClientes.IsEmpty then
  begin
    DM.qryCadClientes.Close;
    DM.qryCadClientes.Parameters.ParamByName('pCodigo_Cliente').Value :=
                            DM.qryConsClientesCodigo_Cliente.AsInteger;
    DM.qryCadClientes.Open;
    if not Assigned(frmCadClientes) then
    begin
      Application.CreateForm(TfrmCadClientes, frmCadClientes);
      frmCadClientes.Show;
    end;
    if (DM.qryConsClientes.FieldByName('CGC_CPF_Cliente').AsString.Length > 11) then
      frmCadClientes.rbtCnpj.Checked := True
    else
      frmCadClientes.rbtCpf.Checked := True;

    frmCadClientes.mkCpfCnpj.Text := DM.qryConsClientes.FieldByName('CGC_CPF_Cliente').AsString;
    Close;
  end;

end;

procedure TfrmConsCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryConsClientes.Close;
end;

procedure TfrmConsCliente.FormShow(Sender: TObject);
begin
  DM.qryConsClientes.Open;
end;

end.
