unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    mmMenu: TMainMenu;
    actPrincipal: TActionList;
    Cadastro1: TMenuItem;
    Sair1: TMenuItem;
    Cidades1: TMenuItem;
    Clientes1: TMenuItem;
    actCadCidades: TAction;
    actCadClientes: TAction;
    actConsCidades: TAction;
    actConsClientes: TAction;
    actSair: TAction;
    img_48_24: TImageList;
    tbMenu: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    stbMenu: TStatusBar;
    tmMenu: TTimer;
    Relatorio1: TMenuItem;
    actRelatorio: TAction;
    Gerar1: TMenuItem;
    procedure actSairExecute(Sender: TObject);
    procedure actConsCidadesExecute(Sender: TObject);
    procedure actCadCidadesExecute(Sender: TObject);
    procedure tmMenuTimer(Sender: TObject);
    procedure actCadClientesExecute(Sender: TObject);
    procedure actConsClientesExecute(Sender: TObject);
    procedure actRelatorioExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UConsCidade, UCadCidade, UDM, UCadCliente, UConsCliente, URelatorio,
  URelClienteCidades;

procedure TfrmPrincipal.actCadCidadesExecute(Sender: TObject);
begin
  frmCadCidade := TfrmCadCidade.Create(Self);
  try
    frmCadCidade.ShowModal;
  finally
    frmCadCidade.Free
  end;
end;

procedure TfrmPrincipal.actCadClientesExecute(Sender: TObject);
begin
  frmCadClientes := TfrmCadClientes.Create(Self);
  try
    frmCadClientes.ShowModal;
  finally
    frmCadClientes.Free;
  end;
end;

procedure TfrmPrincipal.actConsCidadesExecute(Sender: TObject);
begin
  frmConsCidade := TfrmConsCidade.Create(Self);
  try
    frmConsCidade.ShowModal;
  finally
    frmConsCidade.Free;
  end;

end;

procedure TfrmPrincipal.actConsClientesExecute(Sender: TObject);
begin
  frmConsCliente := TfrmConsCliente.Create(Self);
  try
    frmConsCliente.ShowModal;
  finally
    frmConsCliente.Free;
  end;
end;

procedure TfrmPrincipal.actRelatorioExecute(Sender: TObject);
begin
frmRelClientesCidades := TfrmRelClientesCidades.Create(Self);
  try
   frmRelClientesCidades.ShowModal;
  finally
   frmRelClientesCidades.Free;
  end;
end;

procedure TfrmPrincipal.actSairExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja fechar o sistema?','Confirmação', MB_YESNO +
                                                  MB_ICONQUESTION) = IDYES then
  begin
    Close;
  end;
end;

procedure TfrmPrincipal.tmMenuTimer(Sender: TObject);
begin
  stbMenu.Panels[0].Text := '' + FormatDateTime('hh::nn:ss', now);
  stbMenu.Panels[1].Text := '' + FormatDateTime(
           'dddd", "dd" de "mmmm" de "yyyy', now);
end;

end.
