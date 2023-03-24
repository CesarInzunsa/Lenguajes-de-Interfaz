object FormaInfoEmu: TFormaInfoEmu
  Left = 0
  Top = 0
  Caption = 'Dot Matrix y Seven Segment Display'
  ClientHeight = 387
  ClientWidth = 771
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
    Width = 769
    Height = 385
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 16
      Top = 16
      Width = 729
      Height = 41
      Caption = 'Informaci'#243'n del Dot Matrix y Seven Segment Display'
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
      Top = 88
      Width = 729
      Height = 233
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 48
        Top = 20
        Width = 641
        Height = 109
        Alignment = taCenter
        Caption = 
          'Estos dispositivos son utilizados para indicar los estados en cu' +
          'ando al nivel de contaminaci'#243'n del agua cuando se registra de fo' +
          'rma manual o se lee de forma automatica para el Seven Segment Di' +
          'splay y el Dot Matrix Display respectivamente.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label2: TLabel
        Left = 32
        Top = 135
        Width = 177
        Height = 74
        Caption = 'Drastico >= 70% Delicado >= 50% Adecuado >= 10%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object Button1: TButton
      Left = 656
      Top = 335
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
