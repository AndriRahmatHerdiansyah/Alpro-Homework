program Untitled;
uses crt;
var
    TinggiBadan : integer;
    BeratIdeal : real;

begin
   write('Masukan Tinggi Badan : ');readln(TinggiBadan);

   BeratIdeal := (TinggiBadan - 100) - (TinggiBadan - 100) * 0.1;

   writeln('Berat Yang Ideal adalah : ' , BeratIdeal:4:0);

readln;
end.
