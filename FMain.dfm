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
    inherited ScrollNavBar: TScrollBox
      Height = 320
      ExplicitHeight = 320
    end
    inherited ScrollFooter: TPanel
      Top = 416
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 416
      inherited Label1: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited PanelFooter: TPanel
      Top = 438
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 438
      inherited Label4: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited LabelUserName: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited LabelPersonName: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited PanelHeader: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited LabelAppName: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited LabelAppVersion: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited ScrollHeader: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited MenuBarGroupButtonLabel: TLabel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited ScrollBar: TPanel
      StyleElements = [seFont, seClient, seBorder]
    end
  end
end
