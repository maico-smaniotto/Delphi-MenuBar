object NavBar: TNavBar
  Left = 0
  Top = 0
  Width = 281
  Height = 480
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  OnResize = FrameResize
  DesignSize = (
    281
    480)
  object ScrollNavBar: TScrollBox
    Left = 0
    Top = 96
    Width = 281
    Height = 288
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    HorzScrollBar.Visible = False
    VertScrollBar.Tracking = True
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clWhite
    ParentColor = False
    TabOrder = 0
    OnMouseWheel = ScrollNavBarMouseWheel
  end
  object ScrollFooter: TPanel
    Left = 0
    Top = 384
    Width = 281
    Height = 22
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWhite
    Locked = True
    ParentBackground = False
    TabOrder = 1
    object ScrollButtonDown: TShape
      Left = 8
      Top = 0
      Width = 266
      Height = 22
      Brush.Color = 15986415
      Pen.Color = 15986415
      Shape = stRoundRect
      Visible = False
    end
    object Label1: TLabel
      Left = 30
      Top = 3
      Width = 221
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = 'v'
      Color = clDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10851990
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
  end
  object PanelFooter: TPanel
    Left = 0
    Top = 406
    Width = 281
    Height = 74
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object Shape3: TShape
      Left = 0
      Top = 0
      Width = 281
      Height = 1
      Align = alTop
      Pen.Color = 3947580
      ExplicitLeft = 48
      ExplicitTop = 16
      ExplicitWidth = 65
    end
    object Shape4: TShape
      Left = 19
      Top = 16
      Width = 44
      Height = 44
      Pen.Color = clWhite
      Shape = stCircle
    end
    object Label4: TLabel
      Left = 32
      Top = 25
      Width = 18
      Height = 25
      Caption = 'M'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelUserName: TLabel
      Left = 76
      Top = 20
      Width = 41
      Height = 17
      Caption = 'MAICO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelPersonName: TLabel
      Left = 76
      Top = 38
      Width = 87
      Height = 13
      Caption = 'Maico Smaniotto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object PanelHeader: TPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object Shape2: TShape
      Left = 0
      Top = 73
      Width = 281
      Height = 1
      Align = alBottom
      Pen.Color = 3947580
      ExplicitLeft = 48
      ExplicitTop = 16
      ExplicitWidth = 65
    end
    object LabelAppName: TLabel
      Left = 76
      Top = 18
      Width = 71
      Height = 20
      Caption = 'AppName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelAppVersion: TLabel
      Left = 76
      Top = 40
      Width = 30
      Height = 15
      Caption = 'v1.0.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Image1: TImage
      Left = 19
      Top = 16
      Width = 44
      Height = 44
    end
  end
  object ScrollHeader: TPanel
    Left = 0
    Top = 74
    Width = 281
    Height = 22
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clWhite
    Locked = True
    ParentBackground = False
    TabOrder = 4
    object ScrollButtonUp: TShape
      Left = 8
      Top = 0
      Width = 266
      Height = 22
      Brush.Color = 15986415
      Pen.Color = 15986415
      Shape = stRoundRect
      Visible = False
    end
    object MenuBarGroupButtonLabel: TLabel
      Left = 30
      Top = 3
      Width = 221
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Caption = '^'
      Color = clDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10851990
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
  end
  object ScrollBar: TPanel
    Left = 263
    Top = 93
    Width = 18
    Height = 288
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 5
  end
end
