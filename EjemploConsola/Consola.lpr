program Consola;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils, funciones;

Type
   TMatriz = array[1..2,1..3] of integer;


   TRegistro = record
     Nombre: string;
     APaterno, AMaterno: string;
     Zipcode: integer;
     Direccion: string;
   end;

   TMinidb = array of TRegistro;


var N: integer;
    F: Real;
    C: Char;
    S, Ssub: string;
    M: array[1..2,1..3] of integer;
    W : TMatriz;
    i,j : integer;
    Registro: TRegistro;
    Minidb : TMinidb;





begin
  writeln('Con for');
  CicloFor(1, 20);
  writeln('Ahora con Repeat until');
  CicloRepeat(1, 20);
  writeln('Ahora con While');
  CicloWhile(1, 20);
  writeln('Hola mundo');
  N := 3670;
  F := 43.3567;
  C := 'A';
  S := 'Es una cadena';
  writeln('N = ', N);
  writeln('F = ', F:15:3);
  F := 385.34;
  writeln('F = ', F:15:3);
  writeln('C = ', C);
  writeln('S = ', S);
  writeln(S[5]);
  Ssub := Copy(S, 5, 4);
  writeln(Ssub);
  for i := 1 to 2 do begin
      for j := 1 to 3 do begin
        M[i,j] := i+j;
        write(M[i,j]:4);
      end;
      writeln;
  end;
  writeln;
  for i := 1 to 2 do begin
      for j := 1 to 3 do begin
        W[i,j] := i*i*j*j;
        write(W[i,j]:4);
      end;
      writeln;
  end;
  Registro.Nombre:='Alfonso';
  Registro.APaterno := 'Mendez';
  Registro.AMaterno:='Tenorio';
  Registro.Zipcode:=11340;
  Registro.Direccion:='Mi escuela';
  With Registro do begin
      writeln(Nombre, ' ', APaterno, ' ', AMaterno);
  end;
  SetLength(Minidb, 100);
  Minidb[1] := Registro;
  writeln('La Minidb, tiene ', length(Minidb), ' registros');



  Readln;
end.

