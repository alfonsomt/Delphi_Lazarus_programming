program Consola;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils, funciones;




begin
  writeln('Con for');
  CicloFor(1, 20);
  writeln('Ahora con Repeat until');
  CicloRepeat(1, 20);
  writeln('Ahora con While');
  CicloWhile(1, 20);
  writeln('Hola mundo');
  //Readln;
end.

