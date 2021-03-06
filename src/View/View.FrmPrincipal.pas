unit View.FrmPrincipal;

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
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Controller.Formularios,
  Controller.Conexao,
  Controller.ComponenteQuery;

type
  TFrmPrincipal = class(TForm)
    pnPrincipal: TPanel;
    StatusBar: TStatusBar;
    MainMenu: TMainMenu;
    mCompras: TMenuItem;
    mVendas: TMenuItem;
    mFinanceiro: TMenuItem;
    mRH: TMenuItem;
    mUtilitarios: TMenuItem;
    mComprasCadastros: TMenuItem;
    mComprasCadastros_Produtos: TMenuItem;
    mVendasCadastros: TMenuItem;
    mVendasCadastros_Clientes: TMenuItem;
    mFinanceiroCadastro: TMenuItem;
    mFinanceiroCadastros_Bancos: TMenuItem;
    mRHCadastros: TMenuItem;
    mRHCadastros_Funcionarios: TMenuItem;
    mUtilitariosCadastros: TMenuItem;
    mUtilitariosCadastrosUsuarios: TMenuItem;
    procedure mComprasCadastros_ProdutosClick(Sender: TObject);
    procedure mVendasCadastros_ClientesClick(Sender: TObject);
    procedure mFinanceiroCadastros_BancosClick(Sender: TObject);
    procedure mRHCadastros_FuncionariosClick(Sender: TObject);
    procedure mUtilitariosCadastrosUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  TControllerConexao
   .New
    .Conexao;
end;

procedure TFrmPrincipal.mComprasCadastros_ProdutosClick(Sender: TObject);
begin
  TAbrirFormularios
   .New
    .CadastroProdutos
     .CadastroProdutos(Self)
      .ShowModal;
end;

procedure TFrmPrincipal.mFinanceiroCadastros_BancosClick(Sender: TObject);
begin
  TAbrirFormularios
   .New
    .CadastroBancos
     .CadastroBanco(Self)
      .ShowModal;
end;

procedure TFrmPrincipal.mRHCadastros_FuncionariosClick(Sender: TObject);
begin
  TAbrirFormularios
   .New
    .CadastroFuncionarios
     .CadastroFuncionarios(Self)
      .ShowModal;
end;

procedure TFrmPrincipal.mUtilitariosCadastrosUsuariosClick(Sender: TObject);
begin
  TAbrirFormularios
   .New
    .CadastroUsuarios
     .CadastroUsuarios(Self)
      .ShowModal;
end;

procedure TFrmPrincipal.mVendasCadastros_ClientesClick(Sender: TObject);
begin
  TAbrirFormularios
   .New
    .CadastrClientes
     .CadastroClientes(Self)
      .ShowModal;
end;

end.
