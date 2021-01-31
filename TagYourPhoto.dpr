program TagYourPhoto;

uses
  Forms,
  u_typ1 in 'u_typ1.pas' {Form1},
  waaRegistry in '..\LM Project Group\Common\waaRegistry.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
