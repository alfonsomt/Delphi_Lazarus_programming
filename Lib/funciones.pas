unit funciones;

{$mode ObjFPC}{$H+}

interface
uses
  Classes, SysUtils;

procedure CicloWhile(inicio, termino: integer);

procedure CicloFor(inicio, termino: integer);

procedure CicloRepeat(inicio, termino: integer);

implementation
function Multiplicar(A, B: integer):integer;
begin
  result := A*B;
end;

procedure CicloWhile(inicio, termino: integer);
var X, Y: integer;
begin
  inicio := 1;
  while (inicio < (termino+1)) do begin
    X := inicio;
    Y := Multiplicar(X, X);
    if (inicio = 10) then begin
        writeln ('Aqui inicio vale 10');
        writeln('Bravo!');
    end;
    writeln (X, ' al cuadrado es ', Y);
    inc(inicio)
  end;
end;

procedure CicloFor(inicio, termino: integer);
var X, Y, w: integer;

begin
    for w := inicio to termino do begin
        X := w;
        Y := Multiplicar(X, X);
        writeln (X, ' al cuadrado es ', Y);
     end;
end;

procedure CicloRepeat(inicio, termino: integer);
var X, Y, j: integer;
begin
j := inicio;
Repeat
  X := j;
  Y := Multiplicar(X, X);
  writeln (X, ' al cuadrado es ', Y);
  inc(j)
until (j > termino);

end;


end.

