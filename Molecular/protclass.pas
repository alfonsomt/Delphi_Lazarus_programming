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
        procedure SaveFASTAFile(filename: string);
        procedure Clear;
        property Secuencia: string read FSecuencia write FSecuencia;
        property Name: string read FName write FName;
      end;


//Para definir objetos descendientes
  {TProteinaclass = class(TMoleculaclass)
      FPesoMolecular: integer;
      procedure CalcularPM;
  end;

  TDNAclass = class(TDMoleculaclass)
    FComplemente: string;
    procedure CalcularReverseComplement;
  end;}




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
  //FSequence := '';
  while not eof(Arch) do begin
    Readln(Arch, linea);
    Secuencia := Secuencia + linea;
  end;
  CloseFile(Arch);
end;

procedure TMoleculaclass.SaveFASTAFile(filename: string);
var Arch: TextFile;
    i, colmax: integer;
begin
  colmax := 80;
  AssignFile(Arch, filename);
  Rewrite(Arch);
  writeln(Arch, FName);
  for i := 1 to length(FSecuencia) do begin
    write(Arch, FSecuencia[i]);
    if ((i mod 80) = 0) or (i = length(FSecuencia)) then writeln(Arch);
  end;
  CloseFile(Arch);

end;

procedure TMoleculaclass.Clear;
begin
  FSecuencia := '';
end;


end.

