unit Menu.NavBar.Item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Menu.NavBar.Colors;

type
  TNavBarItem = class;

  TNavBarItemClickEvent = reference to procedure(Item: TNavBarItem);

  TNavBarItem = class(TFrame)
    pnlMenuGroupHeader: TPanel;
    ShapeItemBackground: TShape;
    LabelItem: TLabel;
    procedure ShapeItemBackgroundMouseEnter(Sender: TObject);
    procedure ShapeItemBackgroundMouseLeave(Sender: TObject);
    procedure LabelItemClick(Sender: TObject);
    procedure ShapeItemBackgroundMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FOnClick: TNavBarItemClickEvent;
  public
    property OnClick: TNavBarItemClickEvent read FOnClick write FOnClick;
    constructor Create(AOwner: TComponent); reintroduce; override;
  end;

implementation

{$R *.dfm}

constructor TNavBarItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Color := TNavBarColors.Background;
  ShapeItemBackground.Brush.Color := TNavBarColors.MenuItemBackground;
  ShapeItemBackground.Pen.Color := TNavBarColors.MenuItemBackground;

  LabelItem.Font.Color := TNavBarColors.MenuItemFont;
end;

procedure TNavBarItem.LabelItemClick(Sender: TObject);
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TNavBarItem.ShapeItemBackgroundMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    if Assigned(FOnClick) then
      FOnClick(Self);
end;

procedure TNavBarItem.ShapeItemBackgroundMouseEnter(Sender: TObject);
begin
  TShape(Sender).Brush.Color := TNavBarColors.MenuItemBackgroundSelected;
  TShape(Sender).Pen.Color := TNavBarColors.MenuItemBackgroundSelected;

  LabelItem.Color := TNavBarColors.MenuItemBackgroundSelected;
  LabelItem.Font.Color := TNavBarColors.MenuItemFontSelected;
end;

procedure TNavBarItem.ShapeItemBackgroundMouseLeave(Sender: TObject);
begin
  TShape(Sender).Brush.Color := TNavBarColors.MenuItemBackground;
  TShape(Sender).Pen.Color := TNavBarColors.MenuItemBackground;

  LabelItem.Color := TNavBarColors.MenuItemBackground;
  LabelItem.Font.Color := TNavBarColors.MenuItemFont;
end;

end.
