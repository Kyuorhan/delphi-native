inherited FrmCadProdutos: TFrmCadProdutos
  Caption = 'Cadastro de Produtos'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnFundo: TPanel
    inherited pnMenu: TPanel
      inherited BtnExcluir: TButton
        OnClick = BtnExcluirClick
      end
      inherited BtnGravar: TButton
        OnClick = BtnGravarClick
      end
    end
    inherited PageControl: TPageControl
      inherited TabCadastro: TTabSheet
        inherited pnCentralTabCadastro: TPanel
          ExplicitLeft = 2
          ExplicitTop = -8
          ExplicitWidth = 579
          ExplicitHeight = 409
          object Label1: TLabel [1]
            AlignWithMargins = True
            Left = 3
            Top = 44
            Width = 55
            Height = 13
            Caption = 'Descri'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          inherited edtCodigo: TDBEdit
            DataField = 'codigo'
          end
          object edtDescricao: TDBEdit
            Left = 3
            Top = 64
            Width = 390
            Height = 21
            DataField = 'descricao'
            DataSource = DataSource
            TabOrder = 1
          end
        end
      end
    end
  end
end
