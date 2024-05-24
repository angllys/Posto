object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Possto ABC'
  ClientHeight = 669
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblQuantidadeLitros: TLabel
    Left = 289
    Top = 195
    Width = 96
    Height = 13
    Caption = 'Quantidade Litros:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorAbastecido: TLabel
    Left = 289
    Top = 225
    Width = 90
    Height = 13
    Caption = 'Valor Abastecido:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtQuantidadeLitros: TEdit
    Left = 393
    Top = 192
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '10,00'
    OnExit = edtQuantidadeLitrosExit
  end
  object edtValorAbastecido: TEdit
    Left = 393
    Top = 222
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    Text = '50,00'
    OnExit = edtValorAbastecidoExit
  end
  object btnAddAbastecimento: TButton
    Left = 536
    Top = 190
    Width = 165
    Height = 25
    Caption = 'Adicionar Abastecimento'
    TabOrder = 2
    OnClick = btnAddAbastecimentoClick
  end
  object btnGerarRelatorio: TButton
    Left = 536
    Top = 221
    Width = 165
    Height = 25
    Caption = 'Gerar Relat'#243'rio'
    TabOrder = 3
    OnClick = btnGerarRelatorioClick
  end
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Color = 4539717
    ParentBackground = False
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 126
      Height = 37
      Caption = 'PostoABC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 39
      Width = 162
      Height = 20
      Caption = 'O amigo do seu ve'#237'culo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object rgBombas: TRadioGroup
    Left = 289
    Top = 136
    Width = 225
    Height = 42
    Caption = '  Bombas '
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Bomba 1'
      'Bomba 2')
    ParentFont = False
    TabOrder = 5
  end
  object rgTanques: TRadioGroup
    Left = 289
    Top = 88
    Width = 225
    Height = 42
    Caption = '  Tanques '
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Gasolina'
      'Diesel')
    ParentFont = False
    TabOrder = 6
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 88
    Width = 257
    Height = 161
    Caption = '  Configura'#231#245'es  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object lblData: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 247
      Height = 13
      Align = alTop
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 27
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 64
      Width = 247
      Height = 13
      Align = alTop
      Caption = 'Valor Litro Gasolina:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 104
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 110
      Width = 247
      Height = 13
      Align = alTop
      Caption = 'Valor Litro Diesel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 90
    end
    object edtData: TDateTimePicker
      AlignWithMargins = True
      Left = 5
      Top = 37
      Width = 247
      Height = 21
      Align = alTop
      Date = 45434.000000000000000000
      Time = 0.752965567131468600
      TabOrder = 0
    end
    object edtValorLitroGasolina: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 83
      Width = 247
      Height = 21
      Align = alTop
      NumbersOnly = True
      TabOrder = 1
      Text = '5,00'
      OnExit = edtValorLitroGasolinaExit
    end
    object edtValorLitroDiesel: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 129
      Width = 247
      Height = 21
      Align = alTop
      NumbersOnly = True
      TabOrder = 2
      Text = '6,50'
      OnExit = edtValorLitroDieselExit
    end
  end
  object gd: TDBGrid
    Left = 21
    Top = 272
    Width = 680
    Height = 361
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOMBA'
        Title.Caption = 'Bomba'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADELITROS'
        Title.Caption = 'Litros'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORABASTECIDO'
        Title.Caption = 'Valor Abastecido'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPOSTO'
        Title.Caption = 'Valor Imposto'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TANQUE'
        Title.Caption = 'Tanque'
        Width = 128
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 641
    Width = 719
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'desenvolvido por Angllys Bandeira Soares'
    Color = 4539717
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
    ExplicitTop = 660
  end
  object ds: TDataSource
    Left = 440
    Top = 368
  end
end
