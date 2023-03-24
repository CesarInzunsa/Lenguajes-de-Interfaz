object FormaDatos: TFormaDatos
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Informaci'#243'n registrada'
  ClientHeight = 387
  ClientWidth = 579
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 385
    Caption = 'Leer'
    Color = clBtnHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 16
      Top = 16
      Width = 545
      Height = 41
      Caption = 'Informaci'#243'n registrada'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 16
      Top = 84
      Width = 545
      Height = 229
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 1
      object Memo1: TMemo
        Left = 16
        Top = 16
        Width = 513
        Height = 161
        TabOrder = 0
      end
      object Button1: TButton
        Left = 431
        Top = 183
        Width = 98
        Height = 33
        Caption = 'Leer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 328
        Top = 183
        Width = 97
        Height = 34
        Caption = 'Limpiar'
        TabOrder = 2
        OnClick = Button3Click
      end
    end
    object Button2: TButton
      Left = 480
      Top = 336
      Width = 81
      Height = 33
      Caption = 'Regresar'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
