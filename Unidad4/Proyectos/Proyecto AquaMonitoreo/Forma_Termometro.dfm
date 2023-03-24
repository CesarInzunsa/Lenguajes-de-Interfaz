object FormaTermometro: TFormaTermometro
  Left = 0
  Top = 0
  Caption = 'Informaci'#243'n del Termometro'
  ClientHeight = 386
  ClientWidth = 743
  Color = clBtnFace
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
    Width = 745
    Height = 385
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 32
      Top = 24
      Width = 673
      Height = 41
      Caption = 'Informaci'#243'n del Termometro'
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
      Left = 32
      Top = 88
      Width = 673
      Height = 233
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 40
        Top = 40
        Width = 585
        Height = 137
        Alignment = taCenter
        Caption = 
          'El termometro es un dispositivo utilizado para emular la lectura' +
          ' de la contaminaci'#243'n en tiempo real, de una fuente de agua natur' +
          'al; esta informaci'#243'n es enviada al Dot Matrix Display el cual se' +
          ' encargara de enviar un mensaje indicando el estado del agua en ' +
          'ese momento.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object Button1: TButton
      Left = 616
      Top = 336
      Width = 89
      Height = 33
      Caption = 'Regresar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
