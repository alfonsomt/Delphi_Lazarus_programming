unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  SynEdit, SynHighlighterPython, PythonEngine, PythonGUIInputOutput;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Memo2: TMemo;
    OpenDialog1: TOpenDialog;
    PythonEngine1: TPythonEngine;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    PythonModule1: TPythonModule;
    SpeedButton1: TSpeedButton;
    SynEdit1: TSynEdit;
    SynPythonSyn1: TSynPythonSyn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PythonModule1Create(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  filenamepy: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  PythonEngine1.ExecString(AnsiString(SynEdit1.Text));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SynEdit1.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MaskFPUExceptions(True);
end;

procedure TForm1.PythonModule1Create(Sender: TObject);
begin
{  PyDelphiWrapper := TPyDelphiWrapper.Create(Self);  // no need to destroy
  PyDelphiWrapper.Engine := PyEngine;
  PyDelphiWrapper.Module := PythonModule;
  PyDelphiWrapper.Initialize;  // Should only be ca  }
end;



procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
     filenamepy := OpenDialog1.FileName;
     Edit1.Text:= filenamepy;
     SynEdit1.Lines.LoadFromFile(filenamepy);
  end;
end;

end.

