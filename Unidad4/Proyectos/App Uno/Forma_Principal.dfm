object FormaPrincipal: TFormaPrincipal
  Left = 0
  Top = 0
  Caption = 'Mi primera App en Delphi'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 112
    Top = 48
    Width = 57
    Height = 18
    Caption = 'Nombre:'
  end
  object Edit1: TEdit
    Left = 112
    Top = 88
    Width = 203
    Height = 26
    TabOrder = 0
  end
  object Button1: TButton
    Left = 112
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Saludar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 2
    OnClick = Button2Click
  end
end
