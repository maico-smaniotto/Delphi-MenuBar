unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Menu.NavBar.Group, Menu.NavBar, Menu.NavBar.Item;

type
  TFormMain = class(TForm)
    NavBar1: TNavBar;
    procedure FormCreate(Sender: TObject);
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

end.
