object Devices: TDevices
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Devices'
  ClientHeight = 353
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panel1: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 353
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 16
      Top = 16
      Width = 729
      Height = 41
      Caption = 'Devices'
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
      Top = 80
      Width = 729
      Height = 201
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 1
      object Button1: TButton
        Left = 16
        Top = 24
        Width = 369
        Height = 49
        Caption = 'Abrir Seven segment display / Dot Matrix Display'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 416
        Top = 23
        Width = 297
        Height = 50
        Caption = 'Abrir termometro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button4: TButton
        Left = 112
        Top = 79
        Width = 185
        Height = 36
        Caption = 'Informaci'#243'n del dispositivo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 472
        Top = 79
        Width = 193
        Height = 36
        Caption = 'Informaci'#243'n del dispositivo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 3
        OnClick = Button5Click
      end
    end
    object Button3: TButton
      Left = 654
      Top = 296
      Width = 91
      Height = 33
      Caption = 'Regresar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
