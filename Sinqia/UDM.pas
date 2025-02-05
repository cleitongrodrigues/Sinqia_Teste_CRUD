unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDM = class(TDataModule)
    Conexao: TADOConnection;
    qryCadCidades: TADOQuery;
    qryConsCidades: TADOQuery;
    qryCadClientes: TADOQuery;
    qryConsClientes: TADOQuery;
    qryCadCidadesCodigo_Cidade: TAutoIncField;
    qryCadCidadesNome_Cidade: TStringField;
    qryCadCidadesEstado_UF_Cidade: TStringField;
    qryCadCidadesCep_Inicial_Cidade: TStringField;
    qryConsCidadesCodigo_Cidade: TAutoIncField;
    qryConsCidadesNome_Cidade: TStringField;
    qryConsCidadesEstado_UF_Cidade: TStringField;
    qryConsCidadesCep_Inicial_Cidade: TStringField;
    qryConsCidadesCep_Final_Cidade: TStringField;
    qryCadClientesCodigo_Cliente: TAutoIncField;
    qryCadClientesCGC_CPF_Cliente: TStringField;
    qryCadClientesNome_Cliente: TStringField;
    qryCadClientesTelefone_Cliente: TStringField;
    qryCadClientesEndereco_Cliente: TStringField;
    qryCadClientesBairro_Cliente: TStringField;
    qryCadClientesComplemento_Cliente: TStringField;
    qryCadClientesCEP_Cliente: TStringField;
    qryCadClientesEmail_Cliente: TStringField;
    qryCadClientesCodigo_Cidade: TIntegerField;
    qryCadCidadesCep_Final_Cidade: TStringField;
    qryCepCliente: TADOQuery;
    qryCepClienteCodigo_Cidade: TAutoIncField;
    qryNomeCidade: TADOQuery;
    qryNomeCidadeCodigo_Cidade: TAutoIncField;
    qryNomeCidadeNome_Cidade: TStringField;
    qryCadClientesCidade: TStringField;
    qryConsClientesCodigo_Cliente: TAutoIncField;
    qryConsClientesCGC_CPF_Cliente: TStringField;
    qryConsClientesNome_Cliente: TStringField;
    qryConsClientesTelefone_Cliente: TStringField;
    qryConsClientesEndereco_Cliente: TStringField;
    qryConsClientesBairro_Cliente: TStringField;
    qryConsClientesComplemento_Cliente: TStringField;
    qryConsClientesCEP_Cliente: TStringField;
    qryConsClientesEmail_Cliente: TStringField;
    qryConsClientesCodigo_Cidade: TIntegerField;
    qryRelatorio: TADOQuery;
    qryRelatorioNome_Cliente: TStringField;
    qryRelatorioCodigo_Cliente: TAutoIncField;
    qryRelatorioNome_Cidade: TStringField;
    qryRelatorioEstado_UF_Cidade: TStringField;
    qryRelatorioCodigo_Cidade: TAutoIncField;
    qryRelClientesCidades: TADOQuery;
    qryRelClientesCidadesCodigo_Cliente: TAutoIncField;
    qryRelClientesCidadesCGC_CPF_Cliente: TStringField;
    qryRelClientesCidadesNome_Cliente: TStringField;
    qryRelClientesCidadesTelefone_Cliente: TStringField;
    qryRelClientesCidadesEndereco_Cliente: TStringField;
    qryRelClientesCidadesBairro_Cliente: TStringField;
    qryRelClientesCidadesComplemento_Cliente: TStringField;
    qryRelClientesCidadesCEP_Cliente: TStringField;
    qryRelClientesCidadesEmail_Cliente: TStringField;
    qryRelClientesCidadesCodigo_Cidade: TAutoIncField;
    qryRelClientesCidadesNome_Cidade: TStringField;
    qryRelClientesCidadesEstado_UF_Cidade: TStringField;
    procedure qryConsClientesCGC_CPF_ClienteGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.qryConsClientesCGC_CPF_ClienteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
// Verifica o tamanho do valor no campo
  if Length(Sender.AsString) > 11 then
  begin
        // Aplica a máscara para CNPJ: 00.000.000/0000-00
    Text := Format('%s.%s.%s/%s-%s',
                   [Copy(Sender.AsString, 1, 2), Copy(Sender.AsString, 3, 3),
                    Copy(Sender.AsString, 6, 3), Copy(Sender.AsString, 9, 4), Copy(Sender.AsString, 13, 2)]);
  end
  else
  begin
    // Aplica a máscara para CPF: 000.000.000-00
    Text := Format('%s.%s.%s-%s',
                   [Copy(Sender.AsString, 1, 3), Copy(Sender.AsString, 4, 3),
                    Copy(Sender.AsString, 7, 3), Copy(Sender.AsString, 10, 2)]);
  end;
end;

end.
