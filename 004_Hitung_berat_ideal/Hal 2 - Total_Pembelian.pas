program Untitled;
uses crt;

var
   TotalHarga,NilaiDiskon,Diskon,TotalBayar : real;
begin
     write('Masukkan Total Pembelian  : '); readln(TotalHarga);
     write('Masukkan Diskon           : '); readln(NilaiDiskon);
     NilaiDiskon := NilaiDiskon * 0.01;
     if(TotalHarga > 100000) then
        begin
             Diskon := TotalHarga * NilaiDiskon;
             TotalBayar := TotalHarga - Diskon;
        end
     else
         begin
              TotalBayar := TotalHarga;
         end;
     //endif;
     writeln('Total Pembelian         : ', TotalHarga:4:2);
     writeln('Potongan diskon         : ', Diskon:4:2);
     writeln('Total Bayar             : ', TotalBayar:4:2);
     readln;
end.

