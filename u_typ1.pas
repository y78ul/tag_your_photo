unit u_typ1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TForm1 = class(TForm)
    memTagList: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    leSeparator: TLabeledEdit;
    paPreview: TPanel;
    laPreview: TLabel;
    memPreview: TMemo;
    bbCopyCommaSeparated: TBitBtn;
    gbUmlaut: TGroupBox;
    cbChangeUmlaute: TCheckBox;
    cbAddUmlautWord: TCheckBox;
    gbTagList: TGroupBox;
    bbLoadTagList: TBitBtn;
    bbSaveTagList: TBitBtn;
    bbClearTagList: TBitBtn;
    bbAppendTagList: TBitBtn;
    ActionList1: TActionList;
    acLoadTagList: TAction;
    acSaveTagList: TAction;
    acClearTagList: TAction;
    acAppendTagList: TAction;
    Panel1: TPanel;
    Image1: TImage;
    laAppName: TLabel;
    laVersion: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bCopyCommaSeparatedClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure memTagListChange(Sender: TObject);
    procedure acLoadTagListExecute(Sender: TObject);
    procedure acSaveTagListExecute(Sender: TObject);
    procedure acClearTagListExecute(Sender: TObject);
    procedure acAppendTagListExecute(Sender: TObject);
  private
    FFileName: string;
    procedure SetFileName(AFileName: string);
    procedure UpdateTitle;
    function  Save: boolean;
    function  FormatList: string;
    function  CheckForUmlaute(const s: string): string;
    procedure LoadFromRegistry;
    procedure SaveToRegistry;
  public
    property FileName: string read FFileName write SetFileName;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Clipbrd, waaRegistry;

const
  AppTitle = 'Tag your photo';

  TYP_REGISTRY_KEY_NAME = '\Software\Gelbland\TYP';
  CURRENT_FILE_NAME = 'CurrentFileName';
  SEPARATOR = 'Separator';
  CHANGE_UMLAUTE = 'ChangeUmlaute';
  ADD_UMLAUT_WORD = 'AddUmlautWord';


function TForm1.CheckForUmlaute(const s: string): string;
const
  NO_OF_UMLAUTE = 7;
  Umlaute: array[1..NO_OF_UMLAUTE] of string = ('ä', 'Ä', 'ö', 'Ö', 'ü', 'Ü', 'ß');
  Replacement: array[1..NO_OF_UMLAUTE] of string = ('ae', 'Ae', 'oe', 'Oe', 'ue', 'Ue', 'ss');
var
  i, p: integer;
  changed: boolean;
begin
  Result:= s;

  if not cbChangeUmlaute.Checked then
    Exit;

  for i:= 1 to NO_OF_UMLAUTE do
  begin
    changed:= false;

    repeat
      p:= Pos(Umlaute[i], Result);
      if p > 0 then
      begin
        Delete(Result, p, 1);
        Insert(Replacement[i], Result, p);
        changed:= true;
      end;
    until p = 0;

    if changed and cbAddUmlautWord.Checked then
      Result:= Result + leSeparator.Text + s;
  end;
end;


function TForm1.FormatList: string;
var
  i: integer;
begin
  Result:= '';

  for i:= 0 to memTagList.Lines.Count-1 do
  begin
    if Length(Result) > 0 then
      Result:= Result + leSeparator.Text;

    Result:= Result + CheckForUmlaute(memTagList.Lines[i]);
  end;
end;


procedure TForm1.UpdateTitle;
begin
  Caption:= AppTitle;

  if Length(FFileName) > 0 then
    Caption:= Caption + ' [' + ExtractFilename(FFilename) + ']';
end;


function TForm1.Save: boolean;
begin
  Result:= SaveDialog1.Execute;

  if not Result then
    Exit;

  memTagList.Lines.SaveToFile(SaveDialog1.FileName);
  memTagList.Modified:= false;

  if not SameText(SaveDialog1.FileName, FileName) then
    FileName:= SaveDialog1.FileName;
end;


procedure TForm1.SaveToRegistry;
begin
  WriteStringToRegistry(CURRENT_FILE_NAME, FFileName);
  WriteStringToRegistry(SEPARATOR, leSeparator.Text);
  WriteBooleanToRegistry(CHANGE_UMLAUTE, cbChangeUmlaute.Checked);
  WriteBooleanToRegistry(ADD_UMLAUT_WORD, cbAddUmlautWord.Checked);
end;


procedure TForm1.LoadFromRegistry;
var
  s: string;
begin
  RegistryKeyName:= TYP_REGISTRY_KEY_NAME;

  leSeparator.Text:=        ReadStringFromRegistry(SEPARATOR, '');
  cbChangeUmlaute.Checked:= ReadBooleanFromRegistry(CHANGE_UMLAUTE, false);
  cbAddUmlautWord.Checked:= ReadBooleanFromRegistry(ADD_UMLAUT_WORD, false);

  if Length(FFileName) = 0 then
  begin
    s:= ReadStringFromRegistry(CURRENT_FILE_NAME, '');
    if Length(s) > 0 then
      FileName:= s;
  end;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  UpdateTitle;

  if ParamCount > 0 then
    FileName:= ParamStr(1);

  LoadFromRegistry;
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveToRegistry;
end;


procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if memTagList.Modified then
    case Application.MessageBox('Die Schlagwortliste wurde geändert. Speichern?', 'Änderungen speichern', MB_ICONQUESTION or MB_YESNOCANCEL) of
      IDYES:    CanClose:= Save;
      IDCANCEL: CanClose:= false;
    end;
end;


procedure TForm1.bCopyCommaSeparatedClick(Sender: TObject);
begin
  ClipBoard.AsText:= FormatList;
end;


procedure TForm1.memTagListChange(Sender: TObject);
begin
  cbAddUmlautWord.Visible:= cbChangeUmlaute.Checked;
  memPreview.Text:= FormatList;
end;


procedure TForm1.SetFileName(AFileName: string);
begin
  if not FileExists(AFileName) then
  begin
    Application.MessageBox(PChar('Datei nicht gefunden: ' + AFileName), 'Fehler', MB_ICONHAND or MB_OK);
    Exit;
  end;

  FFileName:= AFileName;
  memTagList.Lines.LoadFromFile(FFileName);
  UpdateTitle;
end;


procedure TForm1.acAppendTagListExecute(Sender: TObject);
var
  sl: TStringList;
  i: integer;
begin
  if not OpenDialog1.Execute then
    Exit;

  sl:= TStringList.Create;
  sl.LoadFromFile(OpenDialog1.FileName);
  for i:= 0 to sl.Count-1 do
    memTagList.Lines.Add(sl[i]);
  FreeAndNil(sl);
end;


procedure TForm1.acClearTagListExecute(Sender: TObject);
begin
  memTagList.Clear;
  memTagList.Modified:= true;
end;


procedure TForm1.acLoadTagListExecute(Sender: TObject);
var
  goAhead: boolean;
begin
  goAhead:= true;

  if memTagList.Modified then
    case Application.MessageBox('Die Schlagwortliste wurde geändert. Speichern?', 'Änderungen speichern', MB_ICONQUESTION or MB_YESNOCANCEL) of
      IDYES:    goAhead:= Save;
      IDCANCEL: goAhead:= false;
    end;

  if not goAhead then
    Exit;

  if not OpenDialog1.Execute then
    Exit;

  FileName:= OpenDialog1.FileName;
end;


procedure TForm1.acSaveTagListExecute(Sender: TObject);
begin
  Save;
end;


end.
