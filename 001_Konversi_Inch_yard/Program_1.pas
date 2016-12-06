program Untitled;

uses crt;

var
   yard,kaki,inch,meter : real;

begin

//hasil inputan
     window (2,2,35,24); textbackground (7);
     clrscr;
     window (4,4,35,24); textbackground (7);
     clrscr;
     gotoxy(6,2);textcolor(black);writeln('Masukan nilai konversi');
     gotoxy(6,3);textcolor(black);write('======================');
     writeln(' ');

     gotoxy(3,5);textcolor(black);write('Masukan Yard : '); readln(yard);
     gotoxy(3,6);textcolor(black);write('Masukan Kaki : '); readln(kaki);
     gotoxy(3,7);textcolor(black);write('Masukan inch : '); readln(inch);

     meter := 0.9144*yard + 0.3048*kaki + 0.254*inch;


//hasil keluaran
     window (37,2,90,20); textbackground (7);
     clrscr;
     gotoxy(10,2);textcolor(black);writeln('Hasil konversi');
     gotoxy(10,2);textcolor(black);writeln(' ');

   textcolor(red);  write(yard:0:1);
   textcolor(15);   write(' Yard ');
   textcolor(red);  write(kaki:0:1);
   textcolor(15);   write(' Kaki ');
   textcolor(red);  write(inch:0:1);
   textcolor(15);   write(' Inch = ');
   textcolor(red);  write(meter:0:4);
   textcolor(15);   write(' Meter ');
     readln;

end.
