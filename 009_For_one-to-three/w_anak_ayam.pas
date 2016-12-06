program Untitled;

uses crt;

var
   kata_sandi : string;
   ulang : string;

   x, i : integer;
   pilihan : integer;
   jumlah_ayam : integer;
   batas : integer;
   jumlahBilanganGenap : integer;
   j, b1, a, b, c, d, k : integer;

begin
clrscr;
x:=0;
for i:=1 to 3 do
    begin
    write('Masukan password : ');readln(kata_sandi);

    if (kata_sandi = '1234') then
       begin
              x:=1;
              break;

       end;
       clrscr;
       writeln('password salah!');
       writeln;
    end;
    clrscr;
    if (x=0) then
       writeln('Maaf, akun anda telah diblokir!')
    else
    if (x=1) then
    begin
    clrscr;
    repeat
    writeln('        Menu');
    writeln('--------------------');
    writeln('1. Kasus anak ayam');
    writeln('2. Jumlah bilangan genap');
    writeln('3. Tampilan angka segitiga');
    writeln('4. Keluar');
    writeln('---------------------');

    write('Masukan pilihan [1..4] : ');readln(pilihan);

    case pilihan of

    1 :
       begin
          clrscr;
          write('Masukan jumlah ayam : ');readln(jumlah_ayam);
          for j := jumlah_ayam downto 1 do
          begin
            if(j > 1) then
               writeln('Anak ayam turun ',j,' mati satu tinggal ', j-1)
            else
            begin
               writeln('Anak ayam turun ',j,' mati satu tinggal ', j);
            end;
          end;
          write('press key [ya,tidak]');readln(ulang);
          clrscr;
       end;

     2 :
       begin
       clrscr;
              jumlahBilanganGenap:=0;
              write('Masukkan batas bilangan : ');readln(batas);
              write('Jumlah bilangan genap = ');
              for k := 1 to batas do
                  begin
                    if(k mod 2 = 0) then
                     begin
                       write(k);
                       if((k mod 2 = 0) and (k <> batas-1)) then
                        write(' + ');

                       jumlahBilanganGenap := jumlahBilanganGenap + k;
                     end;
                  end;
              writeln;
              writeln('                      = ',jumlahBilanganGenap);
              writeln('Press any key to continue ...');ReadKey;
              clrscr;
            end;


    3 :
      begin
      clrscr;
      b := 1 ;
      write ('masukan tinggi segitiga:' ) ;readln (a) ;
      while b <= a do
      begin
         for c := 1 to b do
         begin
            write ('*') ;
         end ;
         b := b + 1 ;
         writeln;
      end ;
      d := a ;
      while d >= 1 do
      begin
         for c := d downto 1 do
         begin
            write ( '*' ) ;
         end ;
         d := d - 1 ;
         writeln ('') ;
      end ;
      writeln('Press any key to continue ...');ReadKey;
              clrscr;
    end;
    end;
    until(ulang = 'tidak');
    readln;
     end;
end.

