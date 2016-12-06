program menghitung_lama_parkir_kendaraan_motor_dan_tarif_parkir;
{ I.S. : user memasukan No Polisi, Jam Masuk, dan Jam Keluar }
{ F.S. : menampilkan No Polisi, Jam Masuk, Jam Keluar, lama parkirnya dan biaya parkir}
uses crt;
{Kamus}
var
   J1hh,J1mm,J2hh,J2mm,J3hh,J3mm,NoPol,TotalMenit1,TotalMenit2,SelisihMenit,BiayaParkir : integer;
{Algoritma}
begin
   gotoxy(14,1);textcolor(white);write('SELAMAT DATANG');
   gotoxy(5,2);textcolor(white);write('DI UNIVERSITAS KOMPUTER INDONESIA');
   gotoxy(12,3);textcolor(white);writeln('JL.DIPATIUKUR NO.112');
   writeln('-----------------------------------------');

{--Input no polisi}
   write(' No. POLISI (max 4 digit) : ');readln(nopol);
   {validasi No.Polisi}
   if NoPol > 9999
   then
   begin
        gotoxy(2,6);
        write('No polisi tidak boleh melebihi 4 digit !'); readln;
        gotoxy(2,6);gotoxy(26,5);
        gotoxy(26,5);readln(NoPol);
   end;{endif}
   gotoxy(1,6);

{--Input waktu masuk}
   write(' MASUK  JAM            : ');readln(J1hh);
   write('        MENIT          : ');readln(J1mm);
   {validasi jam}
   if (J1hh > 24)
   then
   begin
        gotoxy(2,7);
        write('Jam tidak valid! Masukan jam dengan benar!'); readln;
        gotoxy(2,7);gotoxy(26,6);
        gotoxy(26,6);readln(J1hh);
   end;{endif}
   gotoxy(1,7);
   {validasi menit dgn if}
   if (J1mm > 59)
   then
   begin
        gotoxy(2,8);
        write('Menit tidak valid! Masukan menit dengan benar!');readln;
        gotoxy(2,8);gotoxy(26,7);
        gotoxy(26,7);readln(J1mm);
   end;{endif}
   gotoxy(1,8);

{--Input waktu keluar}
   gotoxy(1,9);
   write(' KELUAR JAM            : ');readln(J2hh);
   write('        MENIT          : ');readln(J2mm);
   {validasi jam}
   if (J2hh < J1hh) then
      begin
           J2hh := J2hh + 12;
      end;
   //endif

   if (J2hh > 24)
   then
   begin
        gotoxy(2,10);
        write('Jam tidak valid! Masukan jam dengan benar!');readln;
        gotoxy(2,10);gotoxy(26,9);
        gotoxy(26,9);readln(J2hh);
   end;{endif}
   gotoxy(1,10);
   {validasi menit}
   if (J2mm > 59)
   then
   begin
        gotoxy(2,11);
        write('Menit tidak valid! Masukan menit dengan benar!');readln;
        gotoxy(2,11);gotoxy(26,10);
        gotoxy(26,10);readln(J2mm);
   end;{endif}
   gotoxy(1,11);

{--konversi waktu ke menit}
   TotalMenit1 := (J1hh*60) + J1mm;
   TotalMenit2 := (J2hh*60) + J2mm;
   SelisihMenit := TotalMenit2 - TotalMenit1;

{--konversi selisih menit ke jam untuk lama parkir}
   J3hh := SelisihMenit div 60;
   J3mm := SelisihMenit mod 60;

{--menampilkan hasil input dan penghitungan}
   textcolor(green);
   gotoxy(1,12);writeln('-----------------------------------------');
   gotoxy(1,13);write(' No. POL               : ',NoPol);
   gotoxy(1,14);write(' MASUK                 : ');write(J1hh,':',J1mm);
   gotoxy(1,15);write(' KELUAR                : ');write(J2hh,':',J2mm);
   gotoxy(1,16);writeln('-----------------------------------------');
   gotoxy(1,17);write(' No. POL               : ',NoPol);
   gotoxy(1,18);write(' PARKIR SELAMA         : ');write(J3hh,':',J3mm);
   writeln;

{--Menentukan Tarif Parkir}
   if SelisihMenit <= 60
   then
       BiayaParkir := 1500
   else
              if SelisihMenit <= 240
       then
           BiayaParkir := 2000
       else
           if SelisihMenit <= 360
           then
               BiayaParkir := 2500
           else
               BiayaParkir := 5000;
           //endif
       //endif
   //endif
   write(' Tarif Parkir          : Rp. ');write(BiayaParkir);
   writeln;
   writeln('-----------------------------------------');
   gotoxy(14,21);writeln('Selamat Jalan');
   gotoxy(11,22);write('Selamat Sampai Tujuan');
   readln;
end.
