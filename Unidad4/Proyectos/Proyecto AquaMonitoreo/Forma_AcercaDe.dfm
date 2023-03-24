object FormaAcercaDe: TFormaAcercaDe
  Left = 0
  Top = 0
  Caption = 'Acerca de'
  ClientHeight = 341
  ClientWidth = 749
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
    Width = 753
    Height = 345
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 24
      Top = 16
      Width = 697
      Height = 41
      Caption = 'Acerca de'
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
      Left = 24
      Top = 80
      Width = 697
      Height = 193
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 72
        Top = 16
        Width = 542
        Height = 125
        Alignment = taCenter
        Caption = 
          'AquaMonitoreo es un proyecto dedicado al monitoreo del nivel de ' +
          'contaminaci'#243'n del agua con el prop'#243'sito de proteger las fuentes ' +
          'de agua, al mismo tiempo que concientizamos a las personas del d' +
          'a'#241'o que estamos haciendo a este preciado recurso natural'
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
      Left = 632
      Top = 287
      Width = 89
      Height = 34
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
