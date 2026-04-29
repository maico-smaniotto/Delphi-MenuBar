object NavBarGroup: TNavBarGroup
  AlignWithMargins = True
  Left = 0
  Top = 0
  Width = 281
  Height = 137
  Margins.Left = 16
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Color = clWhite
  Padding.Left = 1
  Padding.Top = 1
  Padding.Right = 1
  Padding.Bottom = 1
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object GroupHeader: TPanel
    Left = 1
    Top = 1
    Width = 279
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
      279
      32)
    object ShapeMenuBarGroupButton: TShape
      Left = 0
      Top = 0
      Width = 279
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
      Left = 32
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
      Left = 264
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
      ExplicitLeft = 250
    end
    object Image: TImage
      Left = 6
      Top = 6
      Width = 20
      Height = 20
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF6100000009704859730000007600000076014E7B2608
        0000001974455874536F667477617265007777772E696E6B73636170652E6F72
        679BEE3C1A0000015A4944415478DA95D23D2845611CC7F17316D7CB8C417750
        062E06E525AC52184C0C0813296441060649AECDC070BDA4B0B8D35D50360391
        4109914D5E06238585EFBFFB3B753BEEA5F3D467789E739EDFF37F5E5CE777CB
        C620BA11D1D8157610C347EACFAE6F7211F650864D1C6BBC117D0A6AC353BA80
        10CE908376DCF8C2AD9A04DE50872F7FC028E6518B6B277D2BD7221358F6079C
        E242FBFFABADA202F55E40012631AC3DDEFF1350A24A5610B5802314E3C409D6
        EC1C1E5D1DCA18D60206D8ADC42CE00EDB98D5875BF4ABA2A8C66C8B0DD840A9
        C6A630600176EFAFE8D5876F74228E5D8D59BF437DEFE0D711B6CE126AB44290
        003BBB4BEB8C6006F901039EB1689D261C3AC9676C4FF45313123A1B6B3D4EF2
        755A404857FF82560BC852C7F6348E6A2B4D4161053C686225CEB18021147AE5
        7469352B7B1FEF19AE2E172DAAD0AE712BF52937631A55C8CB1060C1F6DCE770
        60033FB39050D7B6EB89680000000049454E44AE426082}
      Proportional = True
    end
  end
  object GroupContent: TPanel
    Left = 1
    Top = 33
    Width = 279
    Height = 103
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 16
    TabOrder = 1
  end
end
