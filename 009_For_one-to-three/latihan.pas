program project1;
uses crt;

var
  password : string;
  password_masukan : string;
  statusPassword : Boolean;

  i : integer;
  j : integer;
  k : integer;
  l : integer;
  m : integer;
  n : Integer;
  o : integer;
  jml_anakAyam : integer;
  batas_bilangan : integer;
  banyak_baris : integer;
  pilihanMenu : integer;
  jumlahBilanganGenap : integer;
begin 
  // validasi
  password := '1234';
  i:=1;
  repeat
    write('Masukkan password (kesempatan ke-',i,') : ');readln(password_masukan);
    if(password_masukan = password)then
     begin
       statusPassword := true;
       writeln('Password anda benar! Selamat datang!');
       write('Tekan Enter!');readkey;
     end
    else
     begin
       statusPassword := false;
       writeln('Password anda salah! Coba lagi!');
       write('Tekan Enter!');ReadKey;
     end;
    i := i + 1;
    ClrScr;
   until((statusPassword = true)or(i > 3));

   repeat
     ClrScr;
     // jika benar, menu utama ditampilkan
     writeln('Menu');
     writeln('------------------------');
     writeln('1. Kasus anak ayam');
     writeln('2. Jumlah bilangan genap');
     writeln('3. Tampilkan angka segitiga');
     writeln('4. Keluar');
     writeln('------------------------');
     write('Masukkan pilihan [1..4] : ');readln(pilihanMenu);

     ClrScr;
     case pilihanMenu of
          1 :
            // menu 1
            begin
              write('Masukkan jumlah anak ayam : ');readln(jml_anakAyam);
              for j := 1 to jml_anakAyam do
                  begin
                    if(jml_anakAyam <> 1)then
                     begin
                       writeln('Anak ayam turun ',jml_anakAyam,', mati satu tinggal ',jml_anakAyam-1);
                       jml_anakAyam:= jml_anakAyam - 1;
                     end
                    else
                     writeln('Anak ayam turun ',jml_anakAyam,', mati satu tinggal induknya');
                  end;
              writeln('Press any key to continue ...');ReadKey;
            end;
          2 :
            // menu 2
            begin
              jumlahBilanganGenap:=0;
              write('Masukkan batas bilangan : ');readln(batas_bilangan);
              write('Jumlah bilangan genap = ');
              for k := 1 to batas_bilangan do
                  begin
                    if(k mod 2 = 0) then
                     begin
                       write(k);
                       if((k mod 2 = 0) and (k <> batas_bilangan-1)) then
                        write(' + ');

                       jumlahBilanganGenap := jumlahBilanganGenap + k;
                     end;
                  end;
              writeln;
              writeln('                      = ',jumlahBilanganGenap);
              writeln('Press any key to continue ...');ReadKey;
            end;
          3 :
            // menu 3
            begin
              write('Masukkan banyak baris : ');readln(banyak_baris);
              o := 1;
              for l := 1 to banyak_baris do
                  begin
                    for m := 1 to l do
                      begin
                         write(o,' ');
                         o := 1+o;
                      end;
                    writeln;
                  end;
              n := banyak_baris-1;
              for l := 1 to banyak_baris do
                begin
                  for k := 1 to n do
                    begin
                      write(o,' ');
                      o := o+1;
                    end;
                  writeln;
                  n := n -1;
                end;

              writeln('Press any key to continue ...');ReadKey;
            end;

          4 :
            // menu 4
            begin
              writeln('Terima kasih sudah menggunakan program ini');
              writeln('Press any key to continue ... ');
              ReadKey;
            end;
          else
            writeln('Anda salah pilih');
            writeln('Press any key to continue ... ');
            readkey;
     end;
   until(pilihanMenu =4);

end.
