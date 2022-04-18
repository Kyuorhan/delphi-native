object FrmPrincipal: TFrmPrincipal
  Left = 343
  Top = 231
  Caption = 'Sistema de Vendas POO-Interface'
  ClientHeight = 639
  ClientWidth = 1270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1270
    Height = 620
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 620
    Width = 1270
    Height = 19
    Panels = <>
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 24
    object mCompras: TMenuItem
      Caption = 'Compras'
      object mComprasCadastros: TMenuItem
        Caption = 'Cadastros'
        object mComprasCadastros_Produtos: TMenuItem
          Caption = 'Produtos'
          OnClick = mComprasCadastros_ProdutosClick
        end
      end
    end
    object mVendas: TMenuItem
      Caption = 'Vendas'
      object mVendasCadastros: TMenuItem
        Caption = 'Cadastro'
        object mVendasCadastros_Clientes: TMenuItem
          Caption = 'Clientes'
          OnClick = mVendasCadastros_ClientesClick
        end
      end
    end
    object mFinanceiro: TMenuItem
      Caption = 'Financeiro'
      object mFinanceiroCadastro: TMenuItem
        Caption = 'Cadastro'
        object mFinanceiroCadastros_Bancos: TMenuItem
          Caption = 'Bancos'
          OnClick = mFinanceiroCadastros_BancosClick
        end
      end
    end
    object mRH: TMenuItem
      Caption = 'Recursos Humanos'
      object mRHCadastros: TMenuItem
        Caption = 'Cadastros'
        object mRHCadastros_Funcionarios: TMenuItem
          Caption = 'Funcion'#225'rios'
          OnClick = mRHCadastros_FuncionariosClick
        end
      end
    end
    object mUtilitarios: TMenuItem
      Caption = 'Utilit'#225'rios'
      object mUtilitariosCadastros: TMenuItem
        Caption = 'Cadastros'
        object mUtilitariosCadastrosUsuarios: TMenuItem
          Caption = 'Usu'#225'rios'
          OnClick = mUtilitariosCadastrosUsuariosClick
        end
      end
    end
  end
end
