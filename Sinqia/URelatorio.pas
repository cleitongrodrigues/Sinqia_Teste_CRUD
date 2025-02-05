unit URelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, frxDBSet, Vcl.Grids, Vcl.DBGrids;

type
  TfrmRelatorio = class(TForm)
    pnlPrimeiro: TPanel;
    pnlPrincipal: TPanel;
    rbtCodCliente: TRadioButton;
    rbtCodcidade: TRadioButton;
    rbtEstado: TRadioButton;
    btnPesquisar: TBitBtn;
    btnGerarRelatorio: TBitBtn;
    edtPesquisar: TEdit;
    dsRelatorio: TDataSource;
    dtRelatorioFinal: TfrxDBDataset;
    rpRelatorioFinal: TfrxReport;
    dbgRelatorioFinal: TDBGrid;
    pnlAgrupar: TPanel;
    rbtAgrupar: TRadioButton;
    btnLimpar: TBitBtn;
    lblPesquisa: TLabel;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmRelatorio.btnGerarRelatorioClick(Sender: TObject);
begin
  DM.qryRelatorio.Close;
  DM.qryRelatorio.Open;
  rpRelatorioFinal.ShowReport();
end;

procedure TfrmRelatorio.btnLimparClick(Sender: TObject);
begin
    edtPesquisar.Clear;
    DM.qryRelatorio.Close;
    DM.qryRelatorio.SQL.Clear;
    DM.qryRelatorio.SQL.Add('SELECT C.Nome_Cliente, C.Codigo_Cliente, CI.Nome_Cidade, CI.Estado_UF_Cidade, CI.Codigo_Cidade FROM Clientes C');
    DM.qryRelatorio.SQL.Add('INNER JOIN Cidade CI ON CI.Codigo_Cidade = C.Codigo_Cidade');
    DM.qryRelatorio.Open;
end;

procedure TfrmRelatorio.btnPesquisarClick(Sender: TObject);
var
  filtro, agrupamento, ordenacao : String;
begin

  if DM.qryRelatorio.Active then
    DM.qryRelatorio.Close;
    DM.qryRelatorio.SQL.Clear;
    DM.qryRelatorio.SQL.Add('SELECT C.Nome_Cliente, C.Codigo_Cliente, CI.Nome_Cidade, CI.Estado_UF_Cidade, CI.Codigo_Cidade FROM Clientes C');
    DM.qryRelatorio.SQL.Add('INNER JOIN Cidade CI ON CI.Codigo_Cidade = C.Codigo_Cidade');

    // Validando os RadioButtons
    if (rbtCodCliente.Checked) and (edtPesquisar.Text <> '') then
    begin
      filtro  := 'WHERE C.Codigo_Cliente = :Codigo_Cliente';
      DM.qryRelatorio.SQL.Add(filtro);
      DM.qryRelatorio.Parameters.ParamByName('Codigo_Cliente').Value := StrToInt(edtPesquisar.Text);
    end
    else if (rbtCodcidade.Checked) and (edtPesquisar.Text <> '') then
    begin
      filtro := 'WHERE CI.Codigo_Cidade = :Codigo_Cidade';
      DM.qryRelatorio.SQL.Add(filtro);
      DM.qryRelatorio.Parameters.ParamByName('Codigo_Cidade').Value := StrToInt(edtPesquisar.Text);
    end
    else if (rbtEstado.Checked) and (edtPesquisar.Text <> '') then
    begin
      filtro := 'WHERE CI.Estado_UF_Cidade = :Estado';
      DM.qryRelatorio.SQL.Add(filtro);
      DM.qryRelatorio.Parameters.ParamByName('Estado').Value := edtPesquisar.Text;
    end;

    if (rbtAgrupar.Checked) then
    begin
      filtro := ' WHERE CI.Nome_Cidade LIKE :Nome_Cidade';
      agrupamento := '  GROUP BY  C.Codigo_Cliente, C.Nome_Cliente, CI.Nome_Cidade, CI.Codigo_Cidade, CI.Estado_UF_Cidade';
      ordenacao := '  ORDER BY  CI.Nome_Cidade ASC';
      edtPesquisar.SetFocus;
      DM.qryRelatorio.SQL.Add(filtro);
      DM.qryRelatorio.Parameters.ParamByName('Nome_Cidade').Value := '%' + edtPesquisar.Text + '%';
      DM.qryRelatorio.SQL.Add(agrupamento);
      DM.qryRelatorio.SQL.Add(ordenacao);
    end;

  Dm.qryRelatorio.Open;
end;

procedure TfrmRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryRelatorio.Close;
end;

procedure TfrmRelatorio.FormShow(Sender: TObject);
begin
  DM.qryRelatorio.Open;
end;

end.
