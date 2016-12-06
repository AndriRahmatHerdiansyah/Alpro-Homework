program Untitled;

uses crt;
const
     Username = 'Andri';
     Password = '10116189';

var
   KodeBarang, AdaDiskon, NamaBarang, NamaPengguna, KataSandi   : string;
   Jumlah, BesarDiskon, HargaSatuan, HargaTotal, JumlahBayar,x, i   : integer;
   HargaDiskon, TotalBayar, Kembalian                           : real;

begin
clrscr;
x:=0;
for i:=1 to 3 do
    begin
    gotoxy(32, 10); write('<< L O G I N >>');
    gotoxy(30, 12); write('Nama Pengguna : '); readln(NamaPengguna);
    gotoxy(30, 13); write('Kata Sandi    : '); readln(KataSandi);

    {if(NamaPengguna <> Username) or (KataSandi <> Password)
    then
    begin
       write('Login Gagal!');
       readln;
       gotoxy(32, 10); write('<< L O G I N >>');
       gotoxy(30, 12); clreol; write('Nama Pengguna : '); readln(NamaPengguna);
       gotoxy(30, 13); clreol; write('Kata Sandi    : '); readln(KataSandi);
    end

    else }

    if (NamaPengguna = Username) then
       begin
         if (KataSandi = Password) then
            begin
              x:=1;
              break;
            end;
       end;
       clrscr;
       writeln('Username dan password salah!');
       writeln;
    end;
    clrscr;
    if (x=0) then
       writeln('Maaf, akun anda telah diblokir!')
    else
    if (x=1) then
    begin
    clreol;
    gotoxy(32, 10); writeln('      << Selamat datang ',NamaPengguna,' >>');
    gotoxy(32, 11); writeln('=====================================');

    gotoxy(32, 14); write('        Please enter key.......');
    readln;
    clrscr;
    writeln('Masukan Data Pembelian');
    writeln('----------------------');
    writeln;
    write('Kode Barang           : '); readln(KodeBarang);


    if(KodeBarang <> 'PK01') and (KodeBarang <> 'pk01') and
      (KodeBarang <> 'TS02') and (KodeBarang <> 'ts01') and
      (KodeBarang <> 'SP03') and (KodeBarang <> 'sp03') and
      (KodeBarang <> 'AK04') and (KodeBarang <> 'ak04')
       then
          begin
             textcolor(yellow); writeln('Maaf! Kode Barang tidak tersedia!')
          end
    else
    begin
       write('Jumlah Beli           : '); readln(Jumlah);
       if(KodeBarang = 'PK01') or (KodeBarang = 'pk01')
          then
          begin
             NamaBarang := 'Pakaian';
             HargaSatuan := 75000;
          end
          else
          if(KodeBarang = 'TS02') or (KodeBarang = 'ts02')
          then
             begin
                NamaBarang := 'Tas';
                HargaSatuan := 65500;
             end
             else
             if(KodeBarang = 'TS02') or (KodeBarang = 'ts02')
                then
                   begin
                      NamaBarang := 'Tas';
                      HargaSatuan := 65500;
                   end
            end;
        HargaTotal := HargaSatuan * Jumlah;
        BesarDiskon := 0;

        if(Jumlah >= 10)
           then
           begin
              write('Ada Diskon [ya/tidak] : '); readln(AdaDiskon);
           end;
           if(AdaDiskon = 'ya')
              then
              begin
                 write('Masukan Besar Diskon (%) : '); readln(BesarDiskon);
                 end;

              HargaDiskon := HargaTotal * BesarDiskon div 100;
              TotalBayar := HargaTotal - HargaDiskon;

             writeln;
             writeln('Layar Output');
             writeln('------------');

             textcolor(15);
             write('Kode Barang         : ');
             textcolor(yellow); writeln(KodeBarang);

             textcolor(15);
             write('Nama Barang         : ');
             textcolor(yellow); writeln(NamaBarang);

             textcolor(15);
             write('Jumlah Beli         : ');
             textcolor(yellow); writeln(Jumlah);

             textcolor(15);
             write('Harga Satuan        : ');
             textcolor(yellow); writeln(HargaSatuan);

             textcolor(15);
             write('Harga Total         : ');
             textcolor(yellow); writeln(HargaTotal:7);

             textcolor(15);
             write('Harga Diskon        : ');
             textcolor(yellow); writeln(HargaDiskon:1:0);

             textcolor(15);
             write('Total Bayar         : ');
             textcolor(yellow); writeln(TotalBayar:1:0);
             writeln('------------------------------------');
             textcolor(15);
             write('Jumlah Bayar        : ');textcolor(yellow);clreol; readln(JumlahBayar);

             if(JumlahBayar <= TotalBayar)
             then
             begin
                  writeln('Data tidak valid');
                  readln;
             end
             else
             begin
                  Kembalian := JumlahBayar - TotalBayar;
             end;
             textcolor(15);
             write('Kembalian           : ');
             textcolor(yellow); writeln(Kembalian:1:0);
    end;
    readln;

end.
