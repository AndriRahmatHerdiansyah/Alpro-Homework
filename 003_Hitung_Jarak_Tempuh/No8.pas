program Untitled;
uses crt;

var
   JarakTempuh, Km, M, Cm, Sisa1 : integer;

begin
     write('Masukan jarak tempuh : ');readln(JarakTempuh);
     Km := JarakTempuh div 100000;
     Sisa1 := JarakTempuh mod 100000;
     M := Sisa1 div 100;
     Cm := Sisa1 mod 100;


     writeln('Hasil Konversi');
     writeln('=======================');
     writeln('Jarak ',JarakTempuh,' cm Sama dengan :');
     writeln(Km,' Kilometer');
     writeln(M,' Meter');
     writeln(Cm,' Centimeter');
     readln;
end.
