unit Formulario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Etiqueta: TLabel;
    Editor: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  X, Y, Z: integer;
  Xstr, Ystr, Zstr: string;
  mensaje: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Editor.Lines.Add('Hola mundo');
  //Etiqueta.Caption := 'Hola mundo';
  mensaje := 'Hola mundo cruel';
  Etiqueta.Caption := mensaje;
  //Edit1.text := 'Hola';
  Editor.Lines.Add(Edit1.text);
  X := 235;
  Y := 700;
  Z := X + Y;
  Xstr := InttoStr(X);
  Ystr := InttoStr(Y);
  Zstr := InttoStr(Z);
  Editor.Lines.Add(Xstr + ' + '  + Ystr + ' = ' + Zstr);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit4.Text := InttoStr(StrToInt(Edit2.Text) + StrtoInt(Edit3.Text));
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin

end;

end.

