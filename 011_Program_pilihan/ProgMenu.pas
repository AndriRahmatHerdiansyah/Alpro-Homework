program ProgMenu;
{I.S.: user memasukkan pilihan menu yang telah tersedia}
{F.S.: menampilkan setiap data yang dipilih dari program utama}

uses crt;

var
   pilihan : integer;
   a, b, i : integer;
   pangkat : integer;
   x, k : integer;
   suku1, suku2, suku: integer;

begin
   repeat
      clrscr; textcolor(15);
      writeln('             Menu Pilihan');
      writeln('==========================================');
      writeln('1. A Pangkat B menggunakan operator kali');
      writeln('2. Barisan dari N suku : 3, 5, 15, 20,...');
      writeln('0. Keluar');
      writeln('==========================================');
      write('PILIHAN ANDA? ');readln(pilihan);

      //Validasi menu pilihan
      while (pilihan < 0) or (pilihan > 2) do
      begin
         gotoxy(1,8); textcolor(yellow);
         write('Pilihan hanya 0, 1, 2. Ulangi Tekan Enter!');
         readln;
         gotoxy(1,8); clreol;
         gotoxy(15,7); clreol; textcolor(15);readln(pilihan);
      end; //endwhile;

      case pilihan of //dependon

         1 :
            begin
               clrscr;
               writeln('A PANGKAT B');
               writeln('===========');
               write('Masukkan Nilai A   : ');readln(a);
               write('Masukkan Pangkat B : ');readln(b);

               //validasi pangkat
               while(b < 0) do
               begin
                  gotoxy(1,5); textcolor(yellow);
                  writeln('Pangkat B tidak boleh negatif! Ulangi Tekan Enter!');
                  readln;
                  gotoxy(1,5); clreol;
                  gotoxy(22,4); clreol; textcolor(15); readln(b);
               end;

               writeln;
               writeln('Hasil Keluaran');
               writeln('==============');
               write(a,' Pangkat ',b,' = ');
               if(b = 0) then
               begin
                  pangkat := 1;
                  writeln(pangkat);
               end
               else
               begin
                  pangkat := 1;
                  for i := 1 to b do
                  begin
                     write(a);
                     pangkat := pangkat * a;
                     if(i <> b) then
                        write(' x ');
                     end;
               end;
               writeln;
               writeln('            = ', pangkat);
               readln;
               end;

         2 :
            begin
                  clrscr;
                  writeln('BARISAN DARI N SUKU');
                  writeln('===================');
                  write('Masukkan Suku ke N     : ');readln(x);
                  writeln;
                  writeln('Hasil Keluaran');
                  writeln('==============');
                  writeln;
                  write('Deretnya adalah   : ');
                  for k:= 1 to x do
                  begin
                        suku1 := sqr(k) - 3 * k + 2;
                        suku2 := (suku1 * (k - 3) * 3) div 6; 
                        suku := 3 + (k - 1) * 2 + ((suku1 * 8) div 2) + suku2;
                        write(suku);
                        if (k <> x) then
                              write(', ');
                  end;
                  writeln;
                  write('Nilai suku ke-',x,' adalah: ',suku);
                  readln;
            end;
      end;
   until (pilihan = 0);
end.
