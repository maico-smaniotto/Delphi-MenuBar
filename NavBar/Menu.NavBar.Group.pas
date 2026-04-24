unit Menu.NavBar.Group;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Menu.NavBar.Item, System.Generics.Collections,
  Menu.NavBar.Colors;

type
  TNavBarItemCollection = class
  private
    FItems: TList<TNavBarItem>;
    function GetCount: Integer;
  public
    constructor Create; reintroduce;
    destructor Destroy; reintroduce; override;
    procedure AddItem(Item: TNavBarItem);
    function GetItem(Index: Integer): TNavBarItem;
    property Items[Index: Integer]: TNavBarItem read GetItem; default;
    property Count: Integer read GetCount;
  end;

  TNavBarGroup = class(TFrame)
    MenuBarGroupButton: TPanel;
    ShapeMenuBarGroupButton: TShape;
    MenuBarGroupButtonLabel: TLabel;
    LabelArrow: TLabel;
    procedure ShapeMenuBarGroupButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MenuBarGroupButtonLabelClick(Sender: TObject);
    procedure ShapeMenuBarGroupButtonMouseEnter(Sender: TObject);
    procedure ShapeMenuBarGroupButtonMouseLeave(Sender: TObject);
    procedure MenuBarGroupButtonLabelMouseEnter(Sender: TObject);
    procedure MenuBarGroupButtonLabelMouseLeave(Sender: TObject);
    procedure LabelArrowClick(Sender: TObject);
  private
    FExpanded: Boolean;
    FItems: TNavBarItemCollection;
    FTotalHeight: Integer;
    procedure DoClick;
    procedure SetExpanded(const Value: Boolean);
    procedure ArrangeItems;
    procedure AdjustHeight;
  public
    constructor Create(AOwner: TComponent); reintroduce; override;
    destructor Destroy; reintroduce; override;
    procedure Expand;
    procedure Collapse;
    function AddItem: TNavBarItem;
  published
    property Expanded: Boolean read FExpanded write SetExpanded;
    property Items: TNavBarItemCollection read FItems;
  end;

implementation

{$R *.dfm}

function TNavBarGroup.AddItem: TNavBarItem;
begin
  Result := TNavBarItem.Create(Self);
  Result.Name := 'MenuBarItem' + (FItems.Count + 1).ToString;
  Result.Parent := Self;
  FItems.AddItem(Result);
  ArrangeItems;
end;

procedure TNavBarGroup.AdjustHeight;
begin
  if FExpanded then
    Height := FTotalHeight
  else
    Height := MenuBarGroupButton.Height + Padding.Top + Padding.Bottom;
end;

procedure TNavBarGroup.ArrangeItems;
begin
  var ItemVertSpace := 2;
  var ItemTop := MenuBarGroupButton.Top + MenuBarGroupButton.Height + Padding.Top + Padding.Bottom;

  for var I := 0 to FItems.Count - 1 do
  begin
    var Item := FItems[I];
    Item.Top := ItemTop;
    Item.Left := Padding.Left;
    Item.Width := Width - Padding.Left - Padding.Right;

    Inc(ItemTop, Item.Height + ItemVertSpace);
  end;
  FTotalHeight := ItemTop;
  AdjustHeight;
end;

procedure TNavBarGroup.Collapse;
begin
  FExpanded := False;
  LabelArrow.Caption := '>';
  AdjustHeight;
end;

constructor TNavBarGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Color := TNavBarColors.Background;
  ShapeMenuBarGroupButton.Brush.Color := TNavBarColors.MenuItemBackground;
  ShapeMenuBarGroupButton.Pen.Color := TNavBarColors.MenuItemBackground;

  MenuBarGroupButtonLabel.Font.Color := TNavBarColors.MenuItemFont;

  FItems := TNavBarItemCollection.Create;
  Expand;
end;

destructor TNavBarGroup.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TNavBarGroup.DoClick;
begin
  if FExpanded then
    Collapse
  else
    Expand;
end;

procedure TNavBarGroup.Expand;
begin
  FExpanded := True;
  LabelArrow.Caption := 'v';
  AdjustHeight;
end;

procedure TNavBarGroup.LabelArrowClick(Sender: TObject);
begin
  DoClick;
end;

procedure TNavBarGroup.MenuBarGroupButtonLabelClick(Sender: TObject);
begin
  DoClick;
end;

procedure TNavBarGroup.MenuBarGroupButtonLabelMouseEnter(Sender: TObject);
begin
  ShapeMenuBarGroupButtonMouseEnter(ShapeMenuBarGroupButton);
end;

procedure TNavBarGroup.MenuBarGroupButtonLabelMouseLeave(Sender: TObject);
begin
  ShapeMenuBarGroupButtonMouseLeave(ShapeMenuBarGroupButton);
end;

procedure TNavBarGroup.ShapeMenuBarGroupButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    DoClick;
  end;
end;

procedure TNavBarGroup.ShapeMenuBarGroupButtonMouseEnter(Sender: TObject);
begin
  TShape(Sender).Brush.Color := TNavBarColors.MenuItemBackgroundSelected;
  TShape(Sender).Pen.Color := TNavBarColors.MenuItemBackgroundSelected;

  MenuBarGroupButtonLabel.Font.Color := TNavBarColors.MenuItemFontSelected;
end;

procedure TNavBarGroup.ShapeMenuBarGroupButtonMouseLeave(Sender: TObject);
begin
  TShape(Sender).Brush.Color := TNavBarColors.MenuItemBackground;
  TShape(Sender).Pen.Color := TNavBarColors.MenuItemBackground;

  MenuBarGroupButtonLabel.Font.Color := TNavBarColors.MenuItemFont;
end;

procedure TNavBarGroup.SetExpanded(const Value: Boolean);
begin
  if Value then
    Expand
  else
    Collapse;
end;

{ TNavBarItemCollection }

procedure TNavBarItemCollection.AddItem(Item: TNavBarItem);
begin
  FItems.Add(Item);
end;

constructor TNavBarItemCollection.Create;
begin
  inherited Create;
  FItems := TList<TNavBarItem>.Create;
end;

destructor TNavBarItemCollection.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TNavBarItemCollection.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TNavBarItemCollection.GetItem(Index: Integer): TNavBarItem;
begin
  Result := FItems[Index];
end;

end.
