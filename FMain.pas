unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Menu.NavBar.Group, Menu.NavBar, Menu.NavBar.Item, System.ImageList,
  Vcl.ImgList, Vcl.TitleBarCtrls;

type
  TFormMain = class(TForm)
    NavBar1: TNavBar;
    ImageList1: TImageList;
    TitleBarPanel1: TTitleBarPanel;
    procedure FormCreate(Sender: TObject);
    procedure NavBar1PanelHeaderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  for var I := 1 to 5 do
  begin
    var Group := NavBar1.AddGroup;
//    Group.Expanded := I = 1;
    Group.Expanded := False;
    ImageList1.GetBitmap(I mod 3, Group.Image.Picture.Bitmap);
    Group.MenuBarGroupButtonLabel.Caption := 'GRUPO ' + I.ToString;
    for var J := 1 to 5 do
    begin
      var Item := Group.AddItem;
      Item.LabelItem.Caption := 'Cadastro ' + J.ToString;
      Item.OnClick := procedure(AItem: TNavBarItem)
        begin
          ShowMessage(AItem.LabelItem.Caption);
        end;
    end;
  end;
end;

procedure TFormMain.NavBar1PanelHeaderClick(Sender: TObject);
begin
  if NavBar1.Width = 281 then
    NavBar1.Width := 66
  else
    NavBar1.Width := 281;
end;

end.
