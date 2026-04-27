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
    procedure LabelItemMouseEnter(Sender: TObject);
    procedure LabelItemMouseLeave(Sender: TObject);
  private
    FOnClick: TNavBarItemClickEvent;
    procedure DrawSelection;
    procedure HideSelection;
    procedure DoClick;
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

procedure TNavBarItem.DoClick;
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TNavBarItem.DrawSelection;
begin
  ShapeItemBackground.Brush.Color := TNavBarColors.MenuItemBackgroundSelected;
  ShapeItemBackground.Pen.Color := TNavBarColors.MenuItemBackgroundSelected;

  LabelItem.Color := TNavBarColors.MenuItemBackgroundSelected;
  LabelItem.Font.Color := TNavBarColors.MenuItemFontSelected;
end;

procedure TNavBarItem.HideSelection;
begin
  ShapeItemBackground.Brush.Color := TNavBarColors.MenuItemBackground;
  ShapeItemBackground.Pen.Color := TNavBarColors.MenuItemBackground;

  LabelItem.Color := TNavBarColors.MenuItemBackground;
  LabelItem.Font.Color := TNavBarColors.MenuItemFont;
end;

procedure TNavBarItem.LabelItemClick(Sender: TObject);
begin
  DoClick;
end;

procedure TNavBarItem.LabelItemMouseEnter(Sender: TObject);
begin
  DrawSelection;
end;

procedure TNavBarItem.LabelItemMouseLeave(Sender: TObject);
begin
  HideSelection;
end;

procedure TNavBarItem.ShapeItemBackgroundMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    DoClick;
end;

procedure TNavBarItem.ShapeItemBackgroundMouseEnter(Sender: TObject);
begin
  DrawSelection;
end;

procedure TNavBarItem.ShapeItemBackgroundMouseLeave(Sender: TObject);
begin
  HideSelection;
end;

end.
