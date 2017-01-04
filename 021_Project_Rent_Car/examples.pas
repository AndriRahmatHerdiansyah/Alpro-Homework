program rental_mobil;
uses crt;

const password='1234';

type
        transactionRecord = Record
        total     : real;
        mobil   : integer;
        harg     : real;

end;



var
        transaksi          : array[1..100] of transactionRecord;
        n                      : integer;
        nama               : string;
        subtotal           : array [1..100] of real;
        subtot             : array [1..100] of real;
        jenis               : array [1..100] of string;
        harga              : array [1..100] of real;
        lama               : array [1..100] of longint;
        sopir              : array [1..100] of string;
        tarif_sopir      : array [1..100] of real;
        pilihan            : array [1..100] of char;
        a                    : integer;
        b                    : real;
        nim                : string;
        alamat            : string;
        pas                : string;
        pas1              : string;
        ktp                : string;
        pass              : string;
        user              : string;
        username      : string;
        ctr                : integer;
       ctr2              : integer;
       c                  : char;
        pilih              : integer;
        pi                : integer;
        pil                 : integer;
        bayar            : real;
        sisa             : real;
        uang           : real;
        status          : boolean;
        totalharga    :real;
        totaljenis     :real;
       passs            : string;
    //password    : string;
      sub            : real;

procedure pendapatan;
begin
 writeln('      Pendapatan');
 if (b=0) then
 begin
  writeln;
  writeln('Belum ada Pemasukan hari ini');
 end
 else
 for ctr2:=1 to ctr do
 begin
  transaksi[ctr].mobil:=a;
  transaksi[ctr].total:=b;
 end;
 writeln;
 writeln('Total Mobil yang keluar   : ',transaksi[ctr].mobil,' Unit');
 writeln('Total Pendapatan          : Rp.',transaksi[ctr].total:2:0);
 write('Tekan Enter untuk keluar. . .');
    readln;
end;

procedure passwordAdmin;
begin
  write('Masukkan password : ');readln(passs);
  while passs<>password do
  begin
  clrscr;
                writeln('-----------------------------------------');
                writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
                writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
                writeln('------->> No. Tlp : 085397696258 <<------');
                writeln('-----------------------------------------');
                writeln();
                writeln(' Maaf, Password anda salah');
                write(' Tekan ENTER untuk login kembali. . . ');
                readln;
                clrscr;
                writeln('-----------------------------------------');
                writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
                writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
                writeln('------->> No. Tlp : 085397696258 <<------');
                writeln('-----------------------------------------');
                writeln;
                write('Masukkan password : ');readln(passs);
 end;
end;
procedure daftarRental;
begin
writeln(' ----------------------------------------');
        writeln(' ------->>>>> PT. Rent a Car <<<<<-------');
        writeln(' ----------------------------------------');
        writeln('Anda harus daftar dulu !!!');
        write('Nama              : ');readln(nama);
        write('Nim               : ');readln(nim);
        write('Alamat            : ');readln(alamat);
        write('No.KTP            : ');readln(ktp);
        write('Username          : ');readln(user);
        write('Password          : ');readln(pas);
        write('Re-enter Password : ');readln(pas1);
        while pas1<>pas do
        begin
                clrscr;
                writeln(' ----------------------------------------');
                writeln(' ------->>>>> PT. Rent a Car <<<<<-------');
                writeln(' ----------------------------------------');
                writeln('Anda harus daftar dulu !!!');
                writeln('Nama               : ',nama);
                writeln('Nim                : ',nim);
                writeln('Alamat             : ',alamat);
                writeln('No. KTP            : ',ktp);
                writeln('Username           : ',user);
                writeln('Password           : ',pas);
                writeln;
                writeln('Kesalahan konfirmasi password');
                writeln;
                write('Re-Enter Password  : ');readln(pas1);
        end;
        clrscr;
        writeln(' ----------------------------------------');
        writeln(' ------->>>>> PT. Rent a Car <<<<<-------');
        writeln(' ----------------------------------------');
        writeln('Ini data akun anda');
        writeln('Nama              : ',nama);
        writeln('Nim               : ',nim);
        writeln('Alamat            : ',alamat);
        writeln('No. KTP           : ',ktp);
        writeln('Username          : ',user);
        writeln('Password          : ',pas);
        write('Tekan enter untuk login !!!');
        readln();

        clrscr;
        writeln(' ----------------------------------------');
        writeln(' ------->>>>> PT. Rent a Car <<<<<-------');
        writeln(' ----------------------------------------');
        writeln('Login');
        write  ('username : ');readln(username);
        write  ('Password : ');readln(pass);

        while (pass<>pas) or (username<>user) do
        begin
                clrscr;
                writeln('-----------------------------------------');
                writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
                writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
                writeln('------->> No. Tlp : 085397696258 <<------');
                writeln('-----------------------------------------');
                writeln();
                writeln(' Maaf, Username/Password anda salah');
                write(' Tekan ENTER untuk login kembali. . . ');
                readln;
                clrscr;
                writeln('-----------------------------------------');
                writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
                writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
                writeln('------->> No. Tlp : 085397696258 <<------');
                writeln('-----------------------------------------');
                writeln('Login');
                write  ('username : ');readln(username);
                write  ('Password : ');readln(pass);
        end;
        if (pass=pas) and (username=user) then
        begin

        clrscr;
        status:=true;
        writeln(' ----------------------------------------');
        writeln(' ------->>>>> PT. Rent a Car <<<<<-------');
        writeln(' ----------------------------------------');
        writeln;
        write('Masukkan jumlah mobil yang dirental : ');readln(n);

        for ctr:=1 to n do
        begin
        clrscr;
        writeln(' ----------------------------------------');
        writeln(' ------->>>>> PT. Rent a Car <<<<<-------');
        writeln(' ----------------------------------------');
        writeln(' ----------------------------------------');
        writeln;
        writeln('Pembelian ke : ',ctr);
        writeln('------------------------------------------');
        writeln('| Pilih jenis mobil yang anda inginkan : |');
        writeln('|                                        |');
        writeln('| A. avanza    = Rp.250000               |');
        writeln('| B. xenia     = Rp.200000               |');
        writeln('| C. alphard   = Rp.700000               |');
        writeln('| D. Kijang    = Rp.150000               |');
        writeln('| E. innova    = Rp.300000               |');
        writeln('| F. Hoda jazz = Rp.300000               |');
        writeln('| G. APV       = Rp.250000               |');
        writeln('| H. Swift     = Rp.250000               |');
        writeln('| I. Rush      = Rp.300000               |');
        writeln('| J. Terrios   = Rp.270000               |');
        writeln('|----------------------------------------|');
        write('pilih jenis mobil : ');readln(pilihan[ctr]);

        case pilihan[ctr] of
 'a','A':begin
         jenis[ctr]:='Avanza';
         harga[ctr]:=250000;
 end;
 'b','B':begin
         jenis[ctr]:='Xenia';
        harga[ctr]:=200000;
 end;
 'c','C':begin
         jenis[ctr]:='Alphard';
         harga[ctr]:=700000;
 end;
 'd','D':begin
        jenis[ctr]:='Kijang';
         harga[ctr]:=150000;
 end;
 'e','E':begin
         jenis[ctr]:='Innova';
         harga[ctr]:=300000;
 end;
 'f','F':begin
         jenis[ctr]:='Honda Jazz';
        harga[ctr]:=300000;
 end;
 'g','G':begin
         jenis[ctr]:='APV';
         harga[ctr]:=250000;
 end;
 'h','H':begin
         jenis[ctr]:='Swift';
         harga[ctr]:=250000;
 end;
 'i','I':begin
        jenis[ctr]:='Rush';
         harga[ctr]:=300000;
 end;
 'j','J':begin
         jenis[ctr]:='Terrios';
         harga[ctr]:=270000;
                status:=true;
 end
        else    clrscr;
                writeln(' ----------------------------------------');
                writeln(' ------->>>>>> PT. Rent a Car <<<<<<-----');
                writeln(' ----------------------------------------');
                writeln;
                writeln(' Pilihan anda : ',pilihan[ctr]);
                writeln(' Maaf pilihan tersebut tidak ada');
                writeln(' Silahkan memulai lagi');
                status:=false;
end;

if status=true then
begin
write('Jumlah hari rental : ');readln(lama[ctr]);
write('sopir = Rp.100000 [y/t] : ');readln(sopir[ctr]);
 if sopir[ctr]='y' then
  tarif_sopir[ctr]:=100000
 else
                tarif_sopir[ctr]:=0;
subtot[ctr]:=(harga[ctr]*lama[ctr]);
subtotal[ctr]:=(harga[ctr]*lama[ctr]+tarif_sopir[ctr]);

if n=1 then
sub:=subtotal[ctr]
else
sub:=subtotal[ctr]*n;

end;
end;
clrscr;
writeln('-----------------------------------------');
writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
writeln('------->> No. Tlp : 085397696258 <<------');
writeln('-----------------------------------------');
writeln;
writeln('Nama Pembeli : ',nama);
writeln;
writeln('-----------------------------------------------------');
writeln('No.      | Jenis      | Harga    | lama   | Sub     |');
writeln('         | Mobil      | Perhari  | Rental | Total   |');
writeln('-----------------------------------------------------');
for ctr:=1 to n do
begin
 writeln(ctr:3,' ',jenis[ctr]:15,' ',harga[ctr]:10:0,' ',lama[ctr]:10,' ',subtot[ctr]:10:0,'|');
end;
writeln('=====================================================');
write('Tekan Enter untuk melanjutkan. . . ');
readln;
clrscr;
writeln('-----------------------------------------');
writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
writeln('------->> No. Tlp : 085397696258 <<------');
writeln('-----------------------------------------');
writeln;
writeln('Nama Pembeli : ',nama);
writeln;
writeln('-----------------------------------------------------');
writeln(' Fasilitas tambahan                   |','             |');
writeln('---------------------------------------','             |');
writeln('No.      | Sopir     | Sub    + Sopir |','             |');
writeln('         |           | Total          |','             |');
writeln('---------------------------------------','             |');
b:=b+sub;
a:=a+n;
for ctr:=1 to n do
begin
        writeln(ctr:3,' ',tarif_sopir[ctr]:15:0,' ',subtotal[ctr]:15:0,'   |','             |');
end;
writeln('                                      | ',nama,'        ');
writeln('-----------------------------------------------------');

writeln('Total : Rp.',sub:2:0,';');
writeln();
write('Bayar : Rp.');readln(uang);
{disini akan mengulang jika uangnya tidak mencukupi}
while uang<sub do
begin
        clrscr;
        writeln('-----------------------------------------');
        writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
        writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
        writeln('------->> No. Tlp : 085397696258 <<------');
        writeln('-----------------------------------------');
        writeln;
        writeln('Nama Pembeli : ',nama);
        writeln;
        writeln('-----------------------------------------------------');
        writeln(' Fasilitas tambahan                   |','             |');
        writeln('---------------------------------------','             |');
        writeln('No.      | Sopir     | Sub    + Sopir |','             |');
        writeln('         |           | Total          |','             |');
        writeln('---------------------------------------','             |');
        for ctr:=1 to n do
        begin
                writeln(ctr:3,' ',tarif_sopir[ctr]:15:0,' ',subtotal[ctr]:15:0,'   |','             |');
        end;
        writeln('                                      | ',nama,'        ');
        writeln('-----------------------------------------------------');
        writeln;
        writeln('Uang anda tidak mencukupi');
        writeln;
        writeln('Total : Rp.',sub:2:0,';');
        writeln;
        write('Bayar : Rp.');readln(uang);
        end;
{akan output kembalian jika uangnya melebihi total}
if uang>sub then
begin
        sisa:=uang-sub;
        writeln('Kembalian : Rp.',sisa:2:0);
        end;

writeln();
writeln('----------------Terimah kasih -----------------');
writeln();
write('Tekan >>> ENTER <<< untuk keluar. . .');
readln();
end;
end;
//program utama
begin
 repeat
        clrscr;
 writeln('-----------------------------------------');
        writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
        writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
        writeln('------->> No. Tlp : 085397696258 <<------');
        writeln('-----------------------------------------');
        writeln;
  writeln('         MENU ');
                writeln('1. Khusus pelanggan');
                writeln('2. Khusus Admin');
                writeln('3. Keluar');
  write('Pilih  : ');readln(pilih);
        case pilih of
        1:begin
         repeat
                clrscr;
  writeln('-----------------------------------------');
         writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
         writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
         writeln('------->> No. Tlp : 085397696258 <<------');
         writeln('-----------------------------------------');
         writeln;
  writeln('         MENU ');
                writeln('1. Perentalan');
         writeln('2. Keluar ke menu');
  write('Pilih  : ');readln(pi);
                case pi of
  1:begin
   clrscr;
   daftarRental;
  end;
  end;
  until pi=2;
  write('Press >>>>> ENTER <<<<< to Exit. . . ');
  readln;
end;
   2:begin

  clrscr;
  writeln('-----------------------------------------');
                writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
                writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
                writeln('------->> No. Tlp : 085397696258 <<------');
                writeln('-----------------------------------------');
                writeln;
  passwordAdmin;
                repeat
  clrscr;
         writeln('-----------------------------------------');
                writeln('-------->>>>>> PT. Rent a Car <<<<<<-----');
                writeln('--->> Jln. Terusan Buahbatu, bandung <<--');
                writeln('------->> No. Tlp : 085397696258 <<------');
                writeln('-----------------------------------------');
                writeln;
  writeln('         MENU ');
                writeln('1. Total Pendapatan');
                writeln('2. Keluar ke Menu utama');
  write('Pilih  : ');readln(pil);
  case pil of
  1:begin
   clrscr;
   pendapatan;
  end;
  end;
  until pil=2;
  write('Press >>>>> ENTER <<<<< to Exit. . . ');
  readln;
end;
end;
until pilih=3;
writeln('Terima kasih');
write('Press >>>>> ENTER <<<<< to Exit. . . ');
readln;
end.
