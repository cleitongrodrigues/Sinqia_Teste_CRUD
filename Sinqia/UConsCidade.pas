unit UConsCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TfrmConsCidade = class(TForm)
    dbgConsCidade: TDBGrid;
    lblPesqCidade: TLabel;
    edtPesqCidade: TEdit;
    btnPesquisar: TBitBtn;
    dsConsCidade: TDataSource;
    RdtRelatorio: TfrxDBDataset;
    rpRelatorio: TfrxReport;
    btnRelatorio: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure dbgConsCidadeDblClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CadastroClientes: boolean;
  end;

var
  frmConsCidade: TfrmConsCidade;

implementation

{$R *.dfm}

uses UDM, UCadCidade, URelClienteCidades;

procedure TfrmConsCidade.btnPesquisarClick(Sender: TObject);
begin
  DM.qryConsCidades.Close;
  DM.qryConsCidades.Parameters.ParamByName('pNome_Cidade').Value := '%' + edtPesqCidade.Text + '%';
  DM.qryConsCidades.Open;
end;

procedure TfrmConsCidade.btnRelatorioClick(Sender: TObject);
begin
  frmRelClientesCidades := TfrmRelClientesCidades.Create(Self);
  try
   frmRelClientesCidades.ShowModal;
  finally
   frmRelClientesCidades.Free;
  end;
end;

procedure TfrmConsCidade.dbgConsCidadeDblClick(Sender: TObject);
begin
  if (CadastroClientes) then
  begin
    DM.qryCadClientesCodigo_Cidade.AsInteger := DM.qryConsCidadesCodigo_Cidade.AsInteger;
    Close;
  end
  else
  begin
    DM.qryCadCidades.Close;
    DM.qryCadCidades.Parameters.ParamByName('pCodigo_Cidade').Value := DM.qryConsCidadesCodigo_Cidade.AsInteger;
    DM.qryCadCidades.Open;
    if not Assigned (frmCadCidade) then
    begin
      Application.CreateForm(TfrmCadCidade, frmCadCidade);
      frmCadCidade.Show;
    end;
    Close;
  end;
end;

procedure TfrmConsCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryConsCidades.Close;
end;

procedure TfrmConsCidade.FormShow(Sender: TObject);
begin
  DM.qryConsCidades.Open;
end;

end.
