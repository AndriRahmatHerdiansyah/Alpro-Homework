program Untitled;
USES CRT;

VAR
   TinggiBadan,BeratBadan,BeratIdeal,BeratIdealMax,BeratIdealMin : real;
   Pesan : string;


BEGIN
     write('Masukan Tinggi Badan : ');readln(TinggiBadan);
     write('Masukan Berat Badan  : '); readln(BeratBadan);

     BeratIdeal:=(TinggiBadan-100) - ((TinggiBadan - 100)*0.1);
     BeratIdealMax:= BeratIdeal + 2;
     BeratIdealMin:= BeratIdeal - 2;

     writeln('Berat yang ideal adalah antara ',BeratIdealMin:4:2,' sampai ',BeratIdealMax:4:2);
     writeln ('------------------------------------');
     write('Berat Badan Anda : ');

     if(BeratBadan <= BeratIdealMax) AND (BeratBadan >= BeratIdealMin) then
        begin
             pesan := 'IDEAL';
             write(Pesan);
        end
     else
        begin
             pesan := 'TIDAK IDEAL';
             write (Pesan);
        end;
     readln;

END.
