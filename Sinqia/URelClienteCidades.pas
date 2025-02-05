unit URelClienteCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, frxClass,
  frxDBSet, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmRelClientesCidades = class(TForm)
    edtCodigoClienteInicial: TEdit;
    Label1: TLabel;
    edtCodigoClienteFinal: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnGerarRelatorio: TBitBtn;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    dsrelClientesCidades: TDataSource;
    frxRelAgrupado: TfrxReport;
    chkAgruparCidade: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    edtCodigoCidadeInicial: TEdit;
    edtCodigoCidadeFinal: TEdit;
    Label4: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtEstadoInicial: TEdit;
    edtEstadoFinal: TEdit;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure edtCodigoClienteInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoClienteFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCidadeInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCidadeFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientesCidades: TfrmRelClientesCidades;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmRelClientesCidades.btnGerarRelatorioClick(Sender: TObject);
begin
  if (Trim(edtCodigoClienteInicial.Text) = '') or (Trim(edtCodigoClienteFinal.Text) = '')
  or (Trim(edtCodigoCidadeInicial.Text) = '')  or (Trim(edtCodigoCidadeFinal.Text) = '') then
  begin
    Application.MessageBox('Todos os campos devem ser preenchidos!','Erro', MB_OK + MB_ICONERROR);
    Exit;
  end
  else
  begin
  DM.qryRelClientesCidades.Close;
  DM.qryRelClientesCidades.Parameters.ParamByName('Codigo_Cliente_Inicial').Value := StrToInt(edtCodigoClienteInicial.Text);
  DM.qryRelClientesCidades.Parameters.ParamByName('Codigo_Cliente_Final').Value := StrToInt(edtCodigoClienteFinal.Text);
  DM.qryRelClientesCidades.Parameters.ParamByName('Codigo_Cidade_Inicial').Value := StrToInt(edtCodigoCidadeInicial.Text);
  DM.qryRelClientesCidades.Parameters.ParamByName('Codigo_Cidade_Final').Value := StrToInt(edtCodigoClienteFinal.Text);
  DM.qryRelClientesCidades.Parameters.ParamByName('Estado_Inicial').Value := edtEstadoInicial.Text;
  DM.qryRelClientesCidades.Parameters.ParamByName('Estado_Final').Value := edtEstadoFinal.Text;
  end;

  if (chkAgruparCidade.Checked) then
  begin
    frxRelAgrupado.ShowReport();
  end
  else
  begin
    frxReport1.ShowReport();
  end;

end;

procedure TfrmRelClientesCidades.edtCodigoCidadeFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #127]) then
    Key := #0; // Bloqueia qualquer outro caractere
end;

procedure TfrmRelClientesCidades.edtCodigoCidadeInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #127]) then
    Key := #0; // Bloqueia qualquer outro caractere
end;

procedure TfrmRelClientesCidades.edtCodigoClienteFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #127]) then
    Key := #0; // Bloqueia qualquer outro caractere
end;

procedure TfrmRelClientesCidades.edtCodigoClienteInicialKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #127]) then
    Key := #0; // Bloqueia qualquer outro caractere
end;

end.
