unit UCadCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmCadCidade = class(TForm)
    lblCodigo: TLabel;
    dsCadCidade: TDataSource;
    lblNome: TLabel;
    edtNomeCidade: TDBEdit;
    lblEstado: TLabel;
    edtEstado: TDBEdit;
    lblCepInicial: TLabel;
    edtCepInicial: TDBEdit;
    lblCepFinal: TLabel;
    edtCepFinal: TDBEdit;
    dbtCodCidade: TDBText;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnConsulta: TBitBtn;
    cbEstado: TComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure dsCadCidadeStateChange(Sender: TObject);
    procedure edtNomeCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure cbEstadoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCidade: TfrmCadCidade;

implementation

{$R *.dfm}

uses UDM, UConsCidade;

procedure TfrmCadCidade.btnCancelarClick(Sender: TObject);
begin
  DM.qryCadCidades.Cancel;
end;

procedure TfrmCadCidade.btnConsultaClick(Sender: TObject);
begin
  frmConsCidade := TfrmConsCidade.Create(Self);
  try
    frmConsCidade.ShowModal;
  finally
    frmConsCidade.Free;
  end;
end;

procedure TfrmCadCidade.btnEditarClick(Sender: TObject);
begin
  DM.qryCadCidades.Edit;
end;

procedure TfrmCadCidade.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Realmente deseja excluir esse registro?','Confirmação',
                                      MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    DM.qryCadCidades.Delete;
  end;
end;

procedure TfrmCadCidade.btnNovoClick(Sender: TObject);
begin
  DM.qryCadCidades.Append;
end;

procedure TfrmCadCidade.btnSalvarClick(Sender: TObject);
begin
  if (Trim(edtNomeCidade.Text) = '') then
  begin
    Application.MessageBox('O Nome da cidade não pode estar vazio','ERRO', MB_OK + MB_ICONERROR);
    edtNomeCidade.SetFocus;
    Exit;
  end;
  if (Trim(edtEstado.Text) = '') then
  begin
    Application.MessageBox('O Estado UF da cidade não pode ser vazio','ERRO', MB_OK + MB_ICONERROR);
    edtEstado.SetFocus;
    Exit;
  end;
  if (Trim(edtCepInicial.Text) = '')then
  begin
    Application.MessageBox('OS campos de CEP não podem estar vazios','ERRO', MB_OK + MB_ICONERROR);
    edtCepInicial.SetFocus;
    Exit;
  end;
   if (Trim(edtCepFinal.Text) = '') then
   begin
    Application.MessageBox('OS campos de CEP não podem estar vazios','ERRO', MB_OK + MB_ICONERROR);
    edtCepFinal.SetFocus;
    Exit;
   end;
      DM.qryCadCidades.Post;
      DM.qryNomeCidade.Close;
      DM.qryNomeCidade.Open;
      Application.MessageBox('Cadastro realizado com sucesso!','SUCESSO', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCadCidade.cbEstadoChange(Sender: TObject);
begin
  if (DM.qryCadCidades.State in [dsInsert, dsEdit]) then
  begin
    DM.qryCadCidades.FieldByName('Estado_UF_Cidade').Value := cbEstado.Text;
  end;
end;

procedure TfrmCadCidade.dsCadCidadeStateChange(Sender: TObject);
begin
  btnNovo.Enabled := dsCadCidade.State = dsBrowse;
  btnEditar.Enabled := dsCadCidade.State = dsBrowse;
  btnExcluir.Enabled := dsCadCidade.State = dsBrowse;
  btnSalvar.Enabled := dsCadCidade.State in [dsInsert, dsEdit];
  btnCancelar.Enabled := dsCadCidade.State in [dsInsert, dsEdit];
end;

procedure TfrmCadCidade.edtNomeCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (IsCharAlpha(Key) or (Key in [' ', #8, #9, #13])) then
    Key := #0; // Bloqueia números e outros caracteres inválidos
end;

procedure TfrmCadCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryCadCidades.Close;
end;

procedure TfrmCadCidade.FormShow(Sender: TObject);
begin
  DM.qryCadCidades.Open;
end;

end.
