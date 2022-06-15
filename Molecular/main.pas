unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

type TMoleculaclass = class(TObject)
      protected
        FSecuencia: string;
        FName: string;
      public
        constructor create;
        destructor destroy;
        procedure ReadFASTAFile(filename: string);
        property Secuencia: string read FSecuencia write FSecuencia;
        property Name: string read FName write FName;
      end;



var
  Form1: TForm1;
  filename: string;
  Proteina: TMoleculaclass;

implementation

{$R *.lfm}

{ TForm1 }
constructor TMoleculaclass.create;
begin
  FName := '';
  FSecuencia := '';

end;

destructor TMoleculaclass.destroy;
begin

end;

procedure TMoleculaclass.ReadFASTAFile(filename: string);
var Arch: TextFile;
    linea: string;
begin
  AssignFile(Arch, filename);
  Reset(Arch);
  Readln(Arch, FName);
  while not eof(Arch) do begin
    Readln(Arch, linea);
    Secuencia := Secuencia + linea;
  end;
  CloseFile(Arch);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
     filename := OpenDialog1.filename;
     Edit1.text:= filename;
     //Proteina.Secuencia:= 'ALGHVBD';
     Proteina.ReadFASTAFile(filename);
     Edit2.Text:= Proteina.Name;
     Memo1.Lines.Text:= Proteina.Secuencia;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Proteina := TMoleculaclass.create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Proteina.destroy;
end;

end.

