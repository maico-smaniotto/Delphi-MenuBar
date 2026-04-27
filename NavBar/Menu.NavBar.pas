unit Menu.NavBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Menu.NavBar.Group, System.Generics.Collections,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Consts, Menu.NavBar.Colors;

type
  TScrollBox = class(Vcl.Forms.TScrollBox)
  private
    procedure WndProc(var Message: TMessage); override;
  end;

  TNavBarGroupCollection = class
  private
    FItems: TList<TNavBarGroup>;
    function GetCount: Integer;
  public
    constructor Create; reintroduce;
    destructor Destroy; reintroduce; override;
    procedure AddItem(Item: TNavBarGroup);
    function GetItem(Index: Integer): TNavBarGroup;
    property Items[Index: Integer]: TNavBarGroup read GetItem; default;
    property Count: Integer read GetCount;
  end;

  TNavBar = class(TFrame)
    ScrollNavBar: TScrollBox;
    ScrollFooter: TPanel;
    ScrollButtonDown: TShape;
    Label1: TLabel;
    PanelHeader: TPanel;
    PanelFooter: TPanel;
    Shape2: TShape;
    Shape3: TShape;
    LabelAppName: TLabel;
    LabelAppVersion: TLabel;
    Image1: TImage;
    Shape4: TShape;
    Label4: TLabel;
    LabelUserName: TLabel;
    LabelPersonName: TLabel;
    ScrollHeader: TPanel;
    ScrollButtonUp: TShape;
    MenuBarGroupButtonLabel: TLabel;
    ScrollBar: TPanel;
    procedure ScrollNavBarMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FrameResize(Sender: TObject);
  private
    FGroups: TNavBarGroupCollection;
  public
    constructor Create(AOwner: TComponent); reintroduce; override;
    destructor Destroy; reintroduce; override;
    function AddGroup: TNavBarGroup;
    property Groups: TNavBarGroupCollection read FGroups;
  end;

implementation

{$R *.dfm}

{ TNavBar }

function TNavBar.AddGroup: TNavBarGroup;
begin
  Result := TNavBarGroup.Create(Self);
  Result.Name := 'MenuBarGroup' + (FGroups.Count + 1).ToString;
  Result.Parent := ScrollNavBar;
  Result.Align := alTop;
  FGroups.AddItem(Result);
end;

constructor TNavBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Color := TNavBarColors.Background;

  PanelHeader.Color := TNavBarColors.Background;
  PanelFooter.Color := TNavBarColors.Background;

  LabelAppName.Font.Color := clWhite;
  LabelAppVersion.Font.Color := TNavBarColors.SecondaryFont;
  LabelUserName.Font.Color := clWhite;
  LabelPersonName.Font.Color := TNavBarColors.SecondaryFont;

  ScrollHeader.Color := TNavBarColors.Background;
  ScrollNavBar.Color := TNavBarColors.Background;
  ScrollBar.Color := TNavBarColors.Background;
  ScrollFooter.Color := TNavBarColors.Background;

  ScrollNavBar.UseWheelForScrolling := True;

  FGroups := TNavBarGroupCollection.Create;
  ShowScrollBar(ScrollNavBar.Handle, SB_VERT, True);
end;

destructor TNavBar.Destroy;
begin
  FGroups.Free;
  inherited;
end;

procedure TNavBar.FrameResize(Sender: TObject);
begin
  ScrollBar.Height := ScrollNavBar.Height;
  ScrollBar.Top := ScrollNavBar.Top;
end;

procedure TNavBar.ScrollNavBarMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
//  ScrollButtonUp.Visible := ScrollNavBar.VertScrollBar.Position > 0;
//  ScrollButtonDown.Visible := (ScrollNavBar.ClientHeight > ScrollNavBar.Height) and (ScrollNavBar.VertScrollBar.Position = 0);
end;

{ TNavBarGroupCollection }

procedure TNavBarGroupCollection.AddItem(Item: TNavBarGroup);
begin
  FItems.Add(Item);
end;

constructor TNavBarGroupCollection.Create;
begin
  inherited Create;
  FItems := TList<TNavBarGroup>.Create;
end;

destructor TNavBarGroupCollection.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TNavBarGroupCollection.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TNavBarGroupCollection.GetItem(Index: Integer): TNavBarGroup;
begin
  Result := FItems[Index];
end;

{ TScrollBox }

procedure TScrollBox.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);

  // Após qualquer processamento que possa esconder a barra (redimensionamento, pintura, etc)
  case Message.Msg of
    WM_VSCROLL, WM_HSCROLL, WM_SIZE, WM_NCPAINT, WM_PAINT:
    begin
      // Força o Windows a exibir a barra vertical
      Winapi.Windows.ShowScrollBar(Handle, SB_VERT, True);
    end;
  end;
end;

end.
