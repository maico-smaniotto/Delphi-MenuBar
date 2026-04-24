object NavBarGroup: TNavBarGroup
  Left = 0
  Top = 0
  Width = 281
  Height = 137
  Color = clWhite
  Padding.Left = 8
  Padding.Top = 1
  Padding.Right = 8
  Padding.Bottom = 1
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object MenuBarGroupButton: TPanel
    Left = 8
    Top = 1
    Width = 265
    Height = 32
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Clientes'
    Locked = True
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      265
      32)
    object ShapeMenuBarGroupButton: TShape
      Left = 0
      Top = 0
      Width = 265
      Height = 32
      Align = alClient
      Brush.Color = 15986415
      Pen.Color = 15986415
      Shape = stRoundRect
      OnMouseDown = ShapeMenuBarGroupButtonMouseDown
      OnMouseEnter = ShapeMenuBarGroupButtonMouseEnter
      OnMouseLeave = ShapeMenuBarGroupButtonMouseLeave
      ExplicitWidth = 183
      ExplicitHeight = 35
    end
    object MenuBarGroupButtonLabel: TLabel
      Left = 24
      Top = 8
      Width = 35
      Height = 15
      Caption = 'Group'
      Color = clDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5456182
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      OnClick = MenuBarGroupButtonLabelClick
      OnMouseEnter = MenuBarGroupButtonLabelMouseEnter
      OnMouseLeave = MenuBarGroupButtonLabelMouseLeave
    end
    object LabelArrow: TLabel
      Left = 250
      Top = 8
      Width = 8
      Height = 15
      Anchors = [akRight]
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5456182
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelArrowClick
    end
  end
end
