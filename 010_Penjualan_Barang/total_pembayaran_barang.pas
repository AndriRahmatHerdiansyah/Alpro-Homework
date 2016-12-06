program total_pembayaran_barang;
{I.S.:User memasukkan kode barang}
{F.S.:Menampilkan informasi hasil pembelian barang}
uses crt;
var
   kode,barang,kodevalid,adadiskon : string;
   beli,harga,hargatotal,bayar,besardiskon : integer;
   hargadiskon,totalbayar,kembalian : real;

begin
   //menentukan apakah kode barang valid atau tidak
   write('Kode barang                     : ');readln(kode);
    if(kode = 'PK01') or (kode = 'TS02') or (kode = 'SP03') or (kode = 'AK04')
     then
      begin
       kodevalid := 'ya';
      end
      else
       begin
        kodevalid := 'tidak';
       end;

   //bisa beli kalau kodenya valid
   if (kodevalid = 'ya')
    then
     begin
      write('Jumlah beli                     : ');readln(beli);
     end
     else
      begin
       writeln(' ----------------------------------');
       writeln('|  Maaf kode barang tidak valid    |');
       writeln(' ----------------------------------');
      end;

   //memasukkan barang dan harga ke memori
   if(kode = 'PK01')
    then
     begin
      barang := 'Pakaian';
      harga  := 75000;
     end
     else
      if(kode = 'TS02')
       then
        begin
         barang := 'Tas';
         harga  := 65500;
        end
        else
         if(kode = 'SP03')
          then
           begin
            barang := 'Sepatu';
            harga  := 157000;
           end
           else
            if(kode = 'AK04')
             then
              begin
               barang := 'Aksesoris';
               harga  := 45000;
              end;

   //dari sini sampe terakhir biar tampil di layar harus kodevalid = 'ya'
   if(kodevalid = 'ya')
    then
     begin //dimulai dari sini
      if(beli > 10)
       then
        begin
         write('Ada diskon [Ya/Tidak]           : ');readln(adadiskon);
        end
        else
         begin
          adadiskon   := 'tidak';
          besardiskon := 0;
         end;
      if(adadiskon = 'ya') or (adadiskon = 'Ya')//masukkan besar diskon
       then
        begin
         write('Besar diskon (%)                : ');readln(besardiskon);
        end
        else
         if(adadiskon = 'tidak') or (adadiskon = 'Tidak')
          then
           begin
            besardiskon :=0;
           end
           else
            begin
             writeln(' --------------------------------- ');
             writeln('| Tidak jelas didiskon atau tidak |');
             writeln(' --------------------------------- ');
            end;
      hargatotal := harga * beli;
      hargadiskon := hargatotal * besardiskon div 100;
      totalbayar := hargatotal - hargadiskon;
      if(adadiskon = 'ya') or (adadiskon = 'Ya') or (adadiskon = 'tidak') or (adadiskon = 'Tidak')
       then
        begin
         writeln('Harga barang barang yang dibeli : Rp.',totalbayar:10:0);
         write('Masukkan uang pembayaran        : Rp.');readln(bayar);
         kembalian := bayar - totalbayar;
        end;
      end; //selesai disini

   //output,pake "gotoxy" kalo perlu
   if(kodevalid = 'ya')
    then
     begin
      if(adadiskon = 'ya') or (adadiskon = 'Ya') or (adadiskon = 'tidak') or (adadiskon = 'Tidak')
       then
        begin
         writeln('----------------------------');
         writeln('Kode Barang  : ',kode);
         writeln('Nama Barang  : ',barang);
         writeln('Jumlah Beli  : ',beli);
         writeln('Harga Satuan : Rp.',harga:10);
         writeln('Harga Total  : Rp.',hargatotal:10);
         writeln('Diskon ',besardiskon,' %  : Rp.',hargadiskon:10:0);
         writeln('Total Bayar  : Rp.',totalbayar:10:0);
         writeln('Bayar        : Rp.',bayar:10);
         writeln('Uang Kembali : Rp.',kembalian:10:0);
        end;
     end;
   readln;
end.
