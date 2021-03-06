program Sistema;

uses
  Vcl.Forms,
  View.FrmPrincipal in 'View\View.FrmPrincipal.pas' {FrmPrincipal},
  uFrmPadrao in 'View\FormPadrao\uFrmPadrao.pas' {FrmPadrao},
  Interfaces.Formularios in 'Interfaces\Interfaces.Formularios.pas',
  Interfaces.Controller.Formularios in 'Interfaces\Interfaces.Controller.Formularios.pas',
  Controller.Formularios in 'Controller\Controller.Formularios.pas',
  Model.Formularios in 'Model\Model.Formularios.Pas',
  View.Utilitarios.Cadastros.Usuarios in 'View\Utilitarios\View.Utilitarios.Cadastros.Usuarios.pas' {FrmCadUsuarios},
  View.Compras.Cadastros.Produtos in 'View\Compras\View.Compras.Cadastros.Produtos.pas' {FrmCadProdutos},
  View.Vendas.Cadastros.Clientes in 'View\Vendas\View.Vendas.Cadastros.Clientes.pas' {FrmCadClientes},
  View.Financeiro.Cadastros.Bancos in 'View\Financeiro\View.Financeiro.Cadastros.Bancos.pas' {FrmCadBancos},
  View.RH.Cadastros.Funcionarios in 'View\RH\View.RH.Cadastros.Funcionarios.pas' {FrmCadFuncionarios},
  Interfaces.Conexao in 'Interfaces\Interfaces.Conexao.pas',
  Model.Conexao in 'Model\Model.Conexao.pas',
  Interfaces.Controller.Conexao in 'Interfaces\Interfaces.Controller.Conexao.pas',
  Controller.Conexao in 'Controller\Controller.Conexao.pas',
  Interfaces.ComponenteQuery in 'Interfaces\Interfaces.ComponenteQuery.pas',
  Model.ComponenteQuery in 'Model\Model.ComponenteQuery.pas',
  Controller.ComponenteQuery in 'Controller\Controller.ComponenteQuery.pas',
  Interfaces.Controller.ComponenteQuery in 'Interfaces\Interfaces.Controller.ComponenteQuery.pas',
  Interfaces.Crud in 'Interfaces\Interfaces.Crud.pas',
  Model.Crud in 'Model\Model.Crud.pas',
  Interfaces.Controller.Crud in 'Interfaces\Interfaces.Controller.Crud.pas',
  Controller.Crud in 'Controller\Controller.Crud.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
