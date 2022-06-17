unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  protclass;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;




var
  Form1: TForm1;
  filename: string;
  Proteina: TMoleculaclass;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
     filename := OpenDialog1.filename;
     Edit1.text:= filename;
     //Proteina.Secuencia:= 'ALGHVBD';
     Proteina.Clear;
     Proteina.ReadFASTAFile(filename);
     Edit2.Text:= Proteina.Name;
     Memo1.Lines.Text:= Proteina.Secuencia;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Proteina := TMoleculaclass.create;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
     filename := SaveDialog1.filename;
     Proteina.SaveFASTAFile(filename);
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Proteina.destroy;
end;

end.

