unit Menu.NavBar.Colors;

interface

uses
  WinApi.Windows, Vcl.Graphics;

type
  TNavBarColors = class
  private
    class var FBackground: TColor;
    class var FMenuItemBackground: TColor;
    class var FMenuItemBackgroundSelected: TColor;
    class var FMenuItemFont: TColor;
    class var FMenuItemFontSelected: TColor;
    class var FSecondaryFont: TColor;

    class procedure LoadColors; static;
  public
    class property Background: TColor read FBackground;
    class property MenuItemBackground: TColor read FMenuItemBackground;
    class property MenuItemFont: TColor read FMenuItemFont;
    class property MenuItemBackgroundSelected: TColor read FMenuItemBackgroundSelected;
    class property MenuItemFontSelected: TColor read FMenuItemFontSelected;
    class property SecondaryFont: TColor read FSecondaryFont;
  end;

implementation

{ TNavBarColors }

class procedure TNavBarColors.LoadColors;
begin
  FBackground := RGB(0, 0, 0);

  // RGB(19, 19, 24);
  // RGB(255, 255, 255);
  FMenuItemBackground := RGB(0, 0, 0);

  // RGB(28, 28, 33);
  // RGB(239, 238, 243);
  FMenuItemBackgroundSelected := RGB(255, 255, 255);

  FMenuItemFont := RGB(255, 255, 255);

  FMenuItemFontSelected := RGB(0, 0, 0);

  FSecondaryFont := RGB(100, 100, 100);
end;

initialization
  TNavBarColors.LoadColors;

end.
