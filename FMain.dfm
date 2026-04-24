object FormMain: TFormMain
  Left = 2
  Top = 2
  Caption = 'FormMain'
  ClientHeight = 512
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  inline NavBar1: TNavBar
    Left = 0
    Top = 0
    Width = 281
    Height = 512
    Align = alLeft
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    ExplicitHeight = 512
    inherited NavBarScrollButtonUp: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited MenuBarGroupButtonLabel: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited NavBarScrollButtonDown: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited Label1: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
  end
end
