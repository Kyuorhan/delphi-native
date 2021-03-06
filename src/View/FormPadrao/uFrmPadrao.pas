unit uFrmPadrao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Mask,
  Vcl.DBCtrls,
  math,
  system.strutils;

type
  TFrmPadrao = class(TForm)
    pnFundo: TPanel;
    pnMenu: TPanel;
    PageControl: TPageControl;
    TabConsulta: TTabSheet;
    TabCadastro: TTabSheet;
    BtnExcluir: TButton;
    BtnCancelar: TButton;
    BtnGravar: TButton;
    btnNovo: TButton;
    BtnSair: TButton;
    pnTopTabConsulta: TPanel;
    pnCentralpnTopTabConsulta: TPanel;
    pnCentralTabCadastro: TPanel;
    lbConsultar: TLabel;
    edtConsulta: TEdit;
    dbGrid: TDBGrid;
    DataSource: TDataSource;
    lbCodigo: TLabel;
    edtCodigo: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure edtConsultaChange(Sender: TObject);
  private
    { Private declarations }
    procedure TratarBotoes(aValue : string);
    procedure Busca();
  public
    { Public declarations }
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

procedure TFrmPadrao.BtnCancelarClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  TabConsulta.TabVisible := true;
  TabCadastro.TabVisible := false;
  BtnGravar.Caption := 'Editar';
  DataSource.DataSet.Refresh;

  TratarBotoes('Cancelar');
end;

procedure TFrmPadrao.BtnExcluirClick(Sender: TObject);
begin
  dbGrid.DataSource.DataSet.Refresh;
  PageControl.ActivePageIndex := 0;
  TratarBotoes('Novo');
end;

procedure TFrmPadrao.BtnGravarClick(Sender: TObject);
begin
  dbGrid.DataSource.DataSet.Refresh;
  PageControl.ActivePageIndex := 0;
  TratarBotoes('Novo');
  Busca();
end;

procedure TFrmPadrao.btnNovoClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 1;
  TabConsulta.TabVisible := false;
  TabCadastro.TabVisible := true;
  BtnGravar.Caption := 'Gravar';

  TratarBotoes('Gravar');
end;

procedure TFrmPadrao.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmPadrao.Busca;
begin
  dbGrid.DataSource.DataSet.Filter := 'codigo <> 0';
  if edtConsulta.Text <> '' then
   dbGrid.DataSource.DataSet.Filter := dbGrid.DataSource.DataSet.Filter +
     ' and (upper('+dbGrid.DataSource.DataSet.Fields[0].FieldName+') like ' + quotedstr('%' + UpperCase(edtConsulta.Text) + '%')
       + ' OR upper('+dbGrid.DataSource.DataSet.Fields[1].FieldName+') like ' + quotedstr('%' + UpperCase(edtConsulta.Text) + '%') + ')';
  dbGrid.DataSource.DataSet.Filtered := true;
end;

procedure TFrmPadrao.dbGridDblClick(Sender: TObject);
begin
  BtnGravar.Caption := 'Gravar';
  PageControl.ActivePageIndex := 1;
  TratarBotoes('Editar');
end;

procedure TFrmPadrao.edtConsultaChange(Sender: TObject);
begin
  Busca();
end;

procedure TFrmPadrao.FormActivate(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  TabCadastro.TabVisible := false;
end;
procedure TFrmPadrao.FormCreate(Sender: TObject);
begin
  TratarBotoes('Novo');
end;

procedure TFrmPadrao.TratarBotoes(aValue: string);
begin
  if (aValue = 'Novo') then
  begin
    btnNovo.Enabled := true;
    BtnGravar.Enabled := false;
    BtnExcluir.Enabled := false;
    BtnCancelar.Enabled := false;
    BtnGravar.Caption := 'Editar';
  end;
   if (aValue = 'Editar') then
  begin
    btnNovo.Enabled := false;
    BtnGravar.Enabled := true;
    BtnExcluir.Enabled := true;
    BtnCancelar.Enabled := true;
  end;
   if (aValue = 'Gravar') then
  begin
    btnNovo.Enabled := false;
    BtnGravar.Enabled := true;
    BtnExcluir.Enabled := false;
    BtnCancelar.Enabled := true;
  end;
   if (aValue = 'Excluir') then
  begin
    btnNovo.Enabled := false;
    BtnGravar.Enabled := false;
    BtnExcluir.Enabled := true;
    BtnCancelar.Enabled := true;
  end;
   if (aValue = 'Cancelar') then
  begin
    btnNovo.Enabled := true;
    BtnGravar.Enabled := false;
    BtnExcluir.Enabled := false;
    BtnCancelar.Enabled := false;
  end;

  BtnSair.Enabled := true;
end;

end.
