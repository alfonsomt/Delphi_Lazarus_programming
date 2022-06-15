unit protclass;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type TMoleculaclass = class(TObject)
      protected
        FSecuencia: string;
        FName: string;
      public
        constructor create;
        destructor destroy; override;
        procedure ReadFASTAFile(filename: string);
        property Secuencia: string read FSecuencia write FSecuencia;
        property Name: string read FName write FName;
      end;


implementation
constructor TMoleculaclass.create;
begin
  inherited Create;
  FName := '';
  FSecuencia := '';
end;

destructor TMoleculaclass.destroy;
begin
   inherited Destroy;
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



end.

