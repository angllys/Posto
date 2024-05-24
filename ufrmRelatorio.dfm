object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#195#179'rio de Abastecimentos'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 0
        Width = 100
        Height = 34
        Align = faLeft
        Layout = tlCenter
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 618
        Top = 0
        Width = 100
        Height = 34
        Align = faRight
        Alignment = taRightJustify
        Info = itHour
        Layout = tlCenter
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 100
        Top = 0
        Width = 518
        Height = 34
        Align = faClient
        Alignment = taCenter
        Caption = 'Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 73
      Width = 718
      Height = 45
      BandType = btTitle
      object RLLabel2: TRLLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 718
        Height = 45
        Align = faClient
        Alignment = taCenter
        Caption = 'RELAT'#211'RIO DE ABASTECIMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 118
      Width = 718
      Height = 136
      DataFields = 'DATA;TANQUE;BOMBA'
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 27
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel3: TRLLabel
          Left = 9
          Top = 5
          Width = 100
          Height = 16
          Alignment = taCenter
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 132
          Top = 5
          Width = 100
          Height = 16
          Alignment = taCenter
          Caption = 'Tanque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 251
          Top = 5
          Width = 100
          Height = 16
          Alignment = taCenter
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 608
          Top = 5
          Width = 100
          Height = 16
          Alignment = taCenter
          Caption = 'Imposto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 484
          Top = 5
          Width = 100
          Height = 16
          Alignment = taCenter
          Caption = 'V. Abastecimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 366
          Top = 5
          Width = 100
          Height = 16
          Alignment = taCenter
          Caption = 'Qtd. Litros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 27
        Width = 718
        Height = 30
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBText1: TRLDBText
          Left = 9
          Top = 11
          Width = 100
          Height = 16
          Alignment = taCenter
          DataField = 'DATA'
          DataSource = DataSource
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 132
          Top = 11
          Width = 100
          Height = 16
          DataField = 'TANQUE'
          DataSource = DataSource
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 251
          Top = 11
          Width = 100
          Height = 16
          DataField = 'BOMBA'
          DataSource = DataSource
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 366
          Top = 11
          Width = 100
          Height = 16
          Alignment = taRightJustify
          DataField = 'QUANTIDADELITROS'
          DataSource = DataSource
          DisplayMask = ' #,##0.00'
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 484
          Top = 11
          Width = 100
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALORABASTECIDO'
          DataSource = DataSource
          DisplayMask = 'R$ #,##0.00'
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 608
          Top = 11
          Width = 100
          Height = 16
          Alignment = taRightJustify
          DataField = 'IMPOSTO'
          DataSource = DataSource
          DisplayMask = 'R$ #,##0.00'
          Text = ''
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 57
        Width = 718
        Height = 59
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBResult1: TRLDBResult
          Left = 366
          Top = 6
          Width = 100
          Height = 16
          Alignment = taRightJustify
          DataField = 'QUANTIDADELITROS'
          DataSource = DataSource
          DisplayMask = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult2: TRLDBResult
          Left = 484
          Top = 6
          Width = 100
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALORABASTECIDO'
          DataSource = DataSource
          DisplayMask = 'R$ #,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult3: TRLDBResult
          Left = 608
          Top = 6
          Width = 100
          Height = 16
          Alignment = taRightJustify
          DataField = 'IMPOSTO'
          DataSource = DataSource
          DisplayMask = 'R$ #,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 254
      Width = 718
      Height = 51
      BandType = btFooter
      object RLLabel9: TRLLabel
        Left = 246
        Top = 7
        Width = 150
        Height = 16
        Alignment = taCenter
        Caption = 'Total Listros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
      object RLDBResult4: TRLDBResult
        Left = 246
        Top = 29
        Width = 150
        Height = 16
        Alignment = taRightJustify
        DataField = 'QUANTIDADELITROS'
        DataSource = DataSource
        DisplayMask = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 402
        Top = 7
        Width = 150
        Height = 16
        Alignment = taCenter
        Caption = 'Total Abastecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
      object RLDBResult5: TRLDBResult
        Left = 402
        Top = 29
        Width = 150
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALORABASTECIDO'
        DataSource = DataSource
        DisplayMask = 'R$ #,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel11: TRLLabel
        Left = 558
        Top = 7
        Width = 150
        Height = 16
        Alignment = taCenter
        Caption = 'Total Impostos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
      object RLDBResult6: TRLDBResult
        Left = 558
        Top = 29
        Width = 150
        Height = 16
        Alignment = taRightJustify
        DataField = 'IMPOSTO'
        DataSource = DataSource
        DisplayMask = 'R$ #,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
    end
  end
  object DataSource: TDataSource
    Left = 720
    Top = 512
  end
end
