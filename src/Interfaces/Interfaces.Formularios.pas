unit Interfaces.Formularios;

interface

uses
  Vcl.Forms,
  View.Utilitarios.Cadastros.Usuarios,
  View.Compras.Cadastros.Produtos,
  View.Vendas.Cadastros.Clientes,
  View.Financeiro.Cadastros.Bancos,
  View.RH.Cadastros.Funcionarios;

  type
    iFormularios = interface
      ['{E053B5B1-AD92-46AF-B439-2DCAC6F0129F}']
      function CadastroProdutos(Owner : TForm) : TFrmCadProdutos;
      function CadastroClientes(Owner : TForm) : TFrmCadClientes;
      function CadastroBanco(Owner : TForm) : TFrmCadBancos;
      function CadastroFuncionarios(Owner : TForm) : TFrmCadFuncionarios;
      function CadastroUsuarios(Owner : TForm) : TFrmCadUsuarios;
    end;

implementation

end.
