program Untitled;
uses crt;

var
     T1dd, T1mm, T1yy, T2dd, T2mm, T2yy, SelisihHari : integer;

Begin
     writeln('Masukan Data Tanggal Pertama');
     writeln('----------------------------');
     write('Tanggal : ');readln(T1dd);
     write('Bulan   : ');readln(T1mm);
     write('Tahun   : ');readln(T1yy);
     writeln('Tanggal Pertama : ',T1dd,'-',T1mm,'-',T1yy);
     writeln;
     writeln(' Masukan Data Tanggal Kedua');
     writeln('----------------------------');
     write('Tanggal : ');readln(T2dd);
     write('Bulan   : ');readln(T2mm);
     write('Tahun   : ');readln(T2yy);
     writeln('Tanggal Kedua : ',T2dd,'-',T2mm,'-',T2yy);
     writeln;
     SelisihHari := (T2dd+(30 * T2mm)+(365 * T2yy))-(T1dd + ( 30 * T1mm) + (365 * T1yy));
     writeln('Jumlah selisih hari dari tanggal ',T1dd,'-',T1mm,'-',T1yy, ' sampai ',T2dd,'-',T2mm,'-',T2yy,' adalah : ',SelisihHari,' Hari');
     readln;
end.
