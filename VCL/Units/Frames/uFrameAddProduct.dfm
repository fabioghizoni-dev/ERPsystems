object frameAddProduct: TframeAddProduct
  Left = 0
  Top = 0
  Width = 633
  Height = 829
  Color = 16580327
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object pnlAddClient: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 829
    Align = alClient
    BevelOuter = bvNone
    Color = 16580327
    ParentBackground = False
    TabOrder = 0
    object pnlMargins: TPanel
      AlignWithMargins = True
      Left = 38
      Top = 109
      Width = 557
      Height = 682
      Margins.Left = 38
      Margins.Top = 0
      Margins.Right = 38
      Margins.Bottom = 38
      Align = alClient
      BevelOuter = bvNone
      Color = 16580327
      ParentBackground = False
      TabOrder = 0
      object pnlLbls: TPanel
        Left = 0
        Top = 117
        Width = 557
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 0
        object lblAmount: TLabel
          AlignWithMargins = True
          Left = 332
          Top = 0
          Width = 77
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 148
          Margins.Bottom = 0
          Align = alRight
          AutoSize = False
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitLeft = 420
        end
        object lblProdID: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 124
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 206
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'C'#243'digo do Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
      end
      object pnlEdts: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 142
        Width = 557
        Height = 41
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 50
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 1
        object pnlAmount: TPanel
          Left = 332
          Top = 0
          Width = 225
          Height = 41
          Align = alRight
          BevelOuter = bvNone
          Color = 16580327
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 0
          object edtAmount: TEdit
            Left = 0
            Top = 0
            Width = 225
            Height = 26
            Align = alClient
            NumbersOnly = True
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
        object pnlCod: TPanel
          Left = 0
          Top = 0
          Width = 241
          Height = 41
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 1
          object edtCod: TEdit
            Left = 0
            Top = 0
            Width = 231
            Height = 26
            Align = alClient
            NumbersOnly = True
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
      end
      object pnlLbls2: TPanel
        Left = 0
        Top = 233
        Width = 557
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 2
        object lblPrice: TLabel
          Left = 0
          Top = 0
          Width = 95
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Pre'#231'o Unit'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
      end
      object pnlEdts2: TPanel
        Left = 0
        Top = 258
        Width = 557
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 3
        object pnlPrice: TPanel
          Left = 0
          Top = 0
          Width = 225
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 0
          object edtPrice: TEdit
            Left = 0
            Top = 0
            Width = 225
            Height = 26
            Align = alClient
            NumbersOnly = True
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
      end
      object pnlBtns: TPanel
        Left = 0
        Top = 641
        Width = 557
        Height = 41
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 4
        object btnAddProduct: TButton
          AlignWithMargins = True
          Left = 307
          Top = 0
          Width = 250
          Height = 41
          Cursor = crHandPoint
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Adicionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnAddProductClick
        end
        object btnExclude: TButton
          Left = 0
          Top = 0
          Width = 275
          Height = 41
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnExcludeClick
        end
      end
      object pnl: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 25
        Width = 557
        Height = 45
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 47
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 5
        object pnlID: TPanel
          Left = 332
          Top = 0
          Width = 225
          Height = 45
          Align = alRight
          BevelOuter = bvNone
          Color = 16580327
          ParentBackground = False
          TabOrder = 0
          object edtDate: TEdit
            Left = 0
            Top = 0
            Width = 225
            Height = 26
            Align = alClient
            NumbersOnly = True
            TabOrder = 0
            ExplicitHeight = 23
          end
          object check: TCheckBox
            AlignWithMargins = True
            Left = 1
            Top = 28
            Width = 79
            Height = 17
            Cursor = crHandPoint
            Margins.Left = 1
            Margins.Top = 2
            Margins.Right = 145
            Margins.Bottom = 0
            Align = alBottom
            Caption = 'Data Atual'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = checkClick
          end
        end
        object pnlEdtProduct: TPanel
          Left = 0
          Top = 0
          Width = 241
          Height = 45
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 19
          ParentBackground = False
          TabOrder = 1
          object edtProduct: TEdit
            Left = 0
            Top = 0
            Width = 231
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 557
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 6
        object lblDate: TLabel
          AlignWithMargins = True
          Left = 332
          Top = 0
          Width = 133
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 92
          Margins.Bottom = 0
          Align = alRight
          AutoSize = False
          Caption = 'Data de Lan'#231'amento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object lblProduct: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Anchors = [akTop, akBottom]
          Caption = 'Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
      end
    end
    object pnlTitle: TPanel
      AlignWithMargins = True
      Left = 80
      Top = 38
      Width = 473
      Height = 41
      Margins.Left = 80
      Margins.Top = 38
      Margins.Right = 80
      Margins.Bottom = 30
      Align = alTop
      BevelOuter = bvNone
      Color = 16580327
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lblTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 206
        Height = 29
        Align = alClient
        Alignment = taCenter
        Caption = 'ADICIONAR PRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6845186
        Font.Height = -24
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
  end
end
