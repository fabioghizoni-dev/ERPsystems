object frameStock: TframeStock
  Left = 0
  Top = 0
  Width = 663
  Height = 829
  Color = 16580327
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object pnlAddClient: TPanel
    Left = 0
    Top = 0
    Width = 663
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
      Width = 587
      Height = 682
      Cursor = crHandPoint
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
        Top = 0
        Width = 587
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 0
        object lblProduct: TLabel
          AlignWithMargins = True
          Left = 363
          Top = 0
          Width = 124
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 100
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Produto Espec'#237'fico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object lblIDProd: TLabel
          Left = 0
          Top = 0
          Width = 72
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'ID Produto:'
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
        Top = 25
        Width = 587
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
        object pnlCombo: TPanel
          AlignWithMargins = True
          Left = 363
          Top = 0
          Width = 224
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          BevelOuter = bvNone
          Color = 16580327
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 0
          object combo: TComboBox
            Left = 0
            Top = 0
            Width = 224
            Height = 26
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Roboto Cn'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = comboChange
            Items.Strings = (
              'Todos')
          end
        end
        object pnlEdtID: TPanel
          Left = 0
          Top = 0
          Width = 224
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
          TabOrder = 1
          object edtID: TEdit
            Left = 0
            Top = 0
            Width = 224
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
      end
      object btnVenda: TButton
        AlignWithMargins = True
        Left = 10
        Top = 616
        Width = 567
        Height = 56
        Cursor = crHandPoint
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alBottom
        Caption = 'Fazer Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Roboto Cn'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnVendaClick
      end
      object pnlLbls2: TPanel
        Left = 0
        Top = 116
        Width = 587
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 3
        object lblPrice: TLabel
          Left = 0
          Top = 0
          Width = 115
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Pre'#231'o do Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object lblFull: TLabel
          AlignWithMargins = True
          Left = 363
          Top = 0
          Width = 114
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 110
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Total em Estoque:'
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
        AlignWithMargins = True
        Left = 0
        Top = 141
        Width = 587
        Height = 41
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 50
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 4
        object pnlPrice: TPanel
          Left = 0
          Top = 0
          Width = 233
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 0
          object edtPrice: TEdit
            Left = 0
            Top = 0
            Width = 223
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
        object pnlEdtStock: TPanel
          Left = 363
          Top = 0
          Width = 224
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          BevelOuter = bvNone
          Color = 16580327
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 1
          object edtStock: TEdit
            Left = 0
            Top = 0
            Width = 224
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
      end
    end
    object pnlTitle: TPanel
      AlignWithMargins = True
      Left = 80
      Top = 38
      Width = 503
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
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lblTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 92
        Height = 29
        Align = alClient
        Alignment = taCenter
        Caption = 'ESTOQUE'
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
