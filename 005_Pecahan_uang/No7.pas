program Untitled;
uses CRT;

var
   Ribuan, Ratusan1, Ratusan2, Puluhan1, Puluhan2, Satuan, SisaUang, JumlahUang: integer;

begin

     write('Masukkan nilai uang : ');readln(JumlahUang);
     Ribuan := JumlahUang div 1000;
     SisaUang := JumlahUang mod 1000;
     Ratusan1 := SisaUang div 500;
     SisaUang := SisaUang mod 500;
     Ratusan2 := SisaUang div 100;
     SisaUang := SisaUang mod 100;
     Puluhan1 := SisaUang div 50;
     SisaUang := SisaUang mod 50;
     Puluhan2 := SisaUang div 25;

     writeln(Ribuan,' buah pecahan Rp.1000');
     writeln(Ratusan1,' buah pecahan Rp.500');
     writeln(Ratusan2,' buah pecahan Rp.100');
     writeln(Puluhan1,' buah pecahan Rp.50');
     writeln(Puluhan2,' buah pecahan Rp.25');


     readln;
end.
