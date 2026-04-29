unit Menu.NavBar.Group;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Menu.NavBar.Item, System.Generics.Collections,
  Menu.NavBar.Colors, Vcl.Imaging.pngimage;

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
    GroupHeader: TPanel;
    ShapeMenuBarGroupButton: TShape;
    MenuBarGroupButtonLabel: TLabel;
    LabelArrow: TLabel;
    GroupContent: TPanel;
    Image: TImage;
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
    FContentTotalHeight: Integer;
    procedure DrawSelection;
    procedure HideSelection;
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
  Result := TNavBarItem.Create(GroupContent);
  Result.Name := 'MenuBarItem' + (FItems.Count + 1).ToString;
  Result.Parent := GroupContent;
  FItems.AddItem(Result);
  ArrangeItems;
end;

procedure TNavBarGroup.AdjustHeight;
begin
  var LGroupHeight := GroupHeader.Height + Padding.Top + Padding.Bottom;

  if FExpanded then
    LGroupHeight := LGroupHeight + FContentTotalHeight;

  Self.Height := LGroupHeight;
end;

procedure TNavBarGroup.ArrangeItems;
begin
  var ItemVertSpace := 2;
  var ItemTop := 0;

  for var I := 0 to FItems.Count - 1 do
  begin
    if I = 0 then
      ItemTop := GroupContent.Padding.Top;

    var Item := FItems[I];
    Item.Top := ItemTop;
    Item.Left := GroupContent.Padding.Left;
    Item.Width := GroupContent.Width - GroupContent.Padding.Left - GroupContent.Padding.Right;

    Inc(ItemTop, Item.Height + ItemVertSpace);
  end;
  FContentTotalHeight := ItemTop;
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

procedure TNavBarGroup.DrawSelection;
begin
  ShapeMenuBarGroupButton.Brush.Color := TNavBarColors.MenuItemBackgroundSelected;
  ShapeMenuBarGroupButton.Pen.Color := TNavBarColors.MenuItemBackgroundSelected;

  MenuBarGroupButtonLabel.Color := TNavBarColors.MenuItemBackgroundSelected;
  MenuBarGroupButtonLabel.Font.Color := TNavBarColors.MenuItemFontSelected;

  LabelArrow.Color := TNavBarColors.MenuItemBackgroundSelected;
  LabelArrow.Font.Color := TNavBarColors.MenuItemFontSelected;
end;

procedure TNavBarGroup.Expand;
begin
  FExpanded := True;
  LabelArrow.Caption := 'v';
  AdjustHeight;
end;

procedure TNavBarGroup.HideSelection;
begin
  ShapeMenuBarGroupButton.Brush.Color := TNavBarColors.MenuItemBackground;
  ShapeMenuBarGroupButton.Pen.Color := TNavBarColors.MenuItemBackground;

  MenuBarGroupButtonLabel.Color := TNavBarColors.MenuItemBackground;
  MenuBarGroupButtonLabel.Font.Color := TNavBarColors.MenuItemFont;

  LabelArrow.Color := TNavBarColors.MenuItemBackground;
  LabelArrow.Font.Color := TNavBarColors.SecondaryFont;
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
  DrawSelection;
end;

procedure TNavBarGroup.MenuBarGroupButtonLabelMouseLeave(Sender: TObject);
begin
  HideSelection;
end;

procedure TNavBarGroup.ShapeMenuBarGroupButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    DoClick;
end;

procedure TNavBarGroup.ShapeMenuBarGroupButtonMouseEnter(Sender: TObject);
begin
  DrawSelection;
end;

procedure TNavBarGroup.ShapeMenuBarGroupButtonMouseLeave(Sender: TObject);
begin
  HideSelection;
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
