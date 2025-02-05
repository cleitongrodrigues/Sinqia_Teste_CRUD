unit UCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  Data.DB, Vcl.Buttons, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompListbox, IWDBStdCtrls, Vcl.ExtCtrls;

type
  TfrmCadClientes = class(TForm)
    lblCodCliente: TLabel;
    edtCgcCPF: TDBEdit;
    lblNomeCliente: TLabel;
    edtNomeCliente: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblCep: TLabel;
    edtCep: TDBEdit;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    lblCodCidade: TLabel;
    edtCidade: TDBEdit;
    dbtCodigo: TDBText;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnConsulta: TBitBtn;
    btnPesqCIdade: TBitBtn;
    Label1: TLabel;
    edtNomeCidade: TDBEdit;
    dsCadCliente: TDataSource;
    pnlCpfCnpj: TPanel;
    rbtCpf: TRadioButton;
    rbtCnpj: TRadioButton;
    mkCpfCnpj: TMaskEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesqCIdadeClick(Sender: TObject);
    procedure dsCadClienteStateChange(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtNomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtCgcCPFKeyPress(Sender: TObject; var Key: Char);
    procedure rbtCpfClick(Sender: TObject);
    procedure rbtCnpjClick(Sender: TObject);
    procedure mkCpfCnpjChange(Sender: TObject);
    procedure mkCpfCnpjKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

uses UCadCidade, UDM, UConsCliente, UConsCidade;

procedure TfrmCadClientes.btnAnteriorClick(Sender: TObject);
begin
  DM.qryCadCidades.First;
end;

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin
  DM.qryCadClientes.Cancel;
end;

procedure TfrmCadClientes.btnConsultaClick(Sender: TObject);
begin
  frmConsCliente := TfrmConsCliente.Create(Self);
  try
    frmConsCliente.ShowModal;
  finally
    frmConsCliente.Free;
  end;
end;

procedure TfrmCadClientes.btnEditarClick(Sender: TObject);
begin
  DM.qryCadClientes.Edit;
//  mkCpfCnpj.Text := edtCgcCPF.Text;
  mkCpfCnpj.ReadOnly := False;
end;

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Realmente deseja excluir esse registro?','Confirmação',
                                      MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.qryCadClientes.Delete;
  end;

end;

procedure TfrmCadClientes.btnNovoClick(Sender: TObject);
begin
  mkCpfCnpj.ReadOnly := False;
//  mkCpfCnpj.Clear;
//  rbtCpf.Checked;
  DM.qryCadClientes.Append;
//  rbtCpf.Checked;
end;

procedure TfrmCadClientes.btnPesqCIdadeClick(Sender: TObject);
begin
  frmConsCidade := TfrmConsCidade.Create(Self);
  try
    frmConsCidade.CadastroClientes := True;
    frmConsCidade.ShowModal;
  finally
    frmConsCidade.Free;
  end;
end;

procedure TfrmCadClientes.btnPrimeiroClick(Sender: TObject);
begin
  DM.qryCadCidades.Prior;
end;

procedure TfrmCadClientes.btnProximoClick(Sender: TObject);
begin
  DM.qryCadCidades.Next;
end;

procedure TfrmCadClientes.btnSalvarClick(Sender: TObject);
var
  cepCliente, cepInicial, cepFinal : Integer;
  cepInicialStr, cepFinalStr : String;
begin
  if (Trim(edtNomeCliente.Text) = '') then
  begin
    Application.MessageBox('O campo do nome não pode estar vazio','ERRO', MB_OK + MB_ICONERROR);
    edtNomeCliente.SetFocus();
    Exit;
  end;
  if (Trim(mkCpfCnpj.Text) = '') then
  begin
    Application.MessageBox('O campo de CNPJ/CPF não pode estar vazio','ERRO', MB_OK + MB_ICONERROR);
    edtCgcCPF.SetFocus;
    Exit;
  end;
  if (Trim(edtEndereco.Text) = '') then
  begin
    Application.MessageBox('O campo de endereço não pode estar vazio','ERRO', MB_OK + MB_ICONERROR);
    edtEndereco.SetFocus;
    Exit;
  end;
  if (Trim(edtBairro.Text) = '') then
  begin
    Application.MessageBox('O campo do bairro não pode estar vazio','ERRO', MB_OK + MB_ICONERROR);
    edtBairro.SetFocus;
    Exit;
  end;
  if (Trim(edtCep.Text) = '') then
  begin
    Application.MessageBox('O campo de CEP não pode estar vazio','ERRO', MB_OK + MB_ICONERROR);
    edtCep.SetFocus;
    Exit;
  end;
  if (Trim(edtEmail.Text) = '') then
  begin
    Application.MessageBox('O campo de Email não pode estar vazio','ERRO', MB_OK + MB_ICONERROR);
    edtEmail.SetFocus;
    Exit;
  end;
  if (rbtCpf.Checked = False) and (rbtCnpj.Checked = False) then
  begin
    Application.MessageBox('Por favor selecione se o usuário sera cadastrado com CPF ou CNPJ','ERRO', MB_OK + MB_ICONERROR);
  end;
  if edtCidade.Text = '' then
  begin
    if Application.MessageBox('Não há nenhuma cidade com este CEP cadastrado, deseja cadastra-la?','CONFIRMAÇÃO',
       MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if not Assigned(frmCadCidade) then
      begin
        Application.CreateForm(TfrmCadCidade, frmCadCidade);
        frmCadCidade.Show;
        Exit;
      end;
      Exit;
    end;
  end;
    DM.qryCadClientes.Post;
    Application.MessageBox('Cadastro realizado com sucesso!','SUCESSO', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCadClientes.btnUltimoClick(Sender: TObject);
begin
  DM.qryCadCidades.Last;
end;

procedure TfrmCadClientes.dsCadClienteStateChange(Sender: TObject);
begin
 btnNovo.Enabled := dsCadCliente.State = dsBrowse;
 btnEditar.Enabled := dsCadCliente.State = dsBrowse;
 btnExcluir.Enabled := dsCadCliente.State = dsBrowse;
 btnSalvar.Enabled := dsCadCliente.State in [dsInsert, dsEdit];
 btnCancelar.Enabled := dsCadCliente.State in [dsInsert, dsEdit];
 btnPesqCIdade.Enabled := dsCadCliente.State in [dsInsert, dsEdit];
end;

procedure TfrmCadClientes.edtCepExit(Sender: TObject);
begin
  DM.qryCepCliente.Close;
  DM.qryCepCliente.Parameters.ParamByName('CepParam').Value := edtCep.Text;
  DM.qryCepCliente.Open;

  if not (DM.qryCepCliente.IsEmpty) then
  begin
    DM.qryCadClientesCodigo_Cidade.AsInteger := DM.qryCepClienteCodigo_Cidade.AsInteger;
  end;

end;

procedure TfrmCadClientes.edtCgcCPFKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then  // Permite apenas números e backspace
    Key := #0;
end;

procedure TfrmCadClientes.edtNomeClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['A'..'Z', 'a'..'z', ' ', #8]) then
    Key := #0; // Bloqueia caracteres inválidos
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryCadClientes.Close;
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  DM.qryCadClientes.Open;
  mkCpfCnpj.ReadOnly := True;
  rbtCpf.Checked;
end;

procedure TfrmCadClientes.mkCpfCnpjChange(Sender: TObject);
begin
  if (DM.qryCadClientes.State in [dsInsert, dsEdit]) then
  begin
    DM.qryCadClientes.FieldByName('CGC_CPF_Cliente').Value := mkCpfCnpj.Text;
  end;
end;

procedure TfrmCadClientes.mkCpfCnpjKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmCadClientes.rbtCnpjClick(Sender: TObject);
begin

  mkCpfCnpj.EditMask := '00.000.000/0000-00;0;_'; // Máscara CNPJ
  mkCpfCnpj.Text := '';
  //mkCpfCnpj.Visible := True;
  //edtCgcCPF.Visible := False;
  mkCpfCnpj.SetFocus;
end;

procedure TfrmCadClientes.rbtCpfClick(Sender: TObject);
begin
  //if DM.qryConsClientes.State in [dsInsert, dsEdit] then
  //begin
    mkCpfCnpj.EditMask := '000.000.000-00;0;_'; // Máscara CPF
    mkCpfCnpj.Text := '';
    //mkCpfCnpj.Visible := True;
//    edtCgcCPF.Visible := False;
    mkCpfCnpj.SetFocus;
  //end;
end;

end.
