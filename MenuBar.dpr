program MenuBar;

uses
  Vcl.Forms,
  FMain in 'FMain.pas' {FormMain},
  Menu.NavBar.Group in 'NavBar\Menu.NavBar.Group.pas' {NavBarGroup: TFrame},
  Menu.NavBar.Item in 'NavBar\Menu.NavBar.Item.pas' {NavBarItem: TFrame},
  Menu.NavBar in 'NavBar\Menu.NavBar.pas' {NavBar: TFrame},
  Menu.NavBar.Colors in 'NavBar\Menu.NavBar.Colors.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
