Program HitungHarga;
uses crt;

var
  menu_makanan : integer;
  porsi_makanan : integer;
  banyak_pesanan : integer;
  jenis_pesanan : integer;

  diskon : real;
  pajak : real;
  bayar : real;
  harga_makanan : real;
  total_harga : real;
  besar_diskon : real;
  besar_pajak : real;
  
begin
  writeln('Menu Makanan');
  writeln('--------------------');
  writeln('1. Capcay Goreng');
  writeln('2. Kakap Asem Manis');
  writeln('3. Puyung Hay');
  write('Masukan Menu Makanan : ');readln(menu_makanan);

  writeln('Porsi Makanan');
  writeln('--------------------');
  writeln('1. Kecil');
  writeln('2. Sedang');
  writeln('3. Besar');
  write('Masukan Porsi : ');readln(porsi_makanan);

  //if untuk capcay goreng
  if((menu_makanan = 1) and (porsi_makanan = 1)) then
    harga_makanan := 15000
  else
    if((menu_makanan = 1) and (porsi_makanan = 2)) then
      harga_makanan := 20000
    else
      harga_makanan := 25000;

  if(menu_makanan = 2) then
    begin
      if(porsi_makanan = 1) then
        harga_makanan := 30000
      else
      if(porsi_makanan = 2) then
        harga_makanan := 40000
       else
           harga_makanan := 50000;
    end;

  if((menu_makanan = 3) and (porsi_makanan = 1)) then
    harga_makanan := 10000
  else
    if((menu_makanan = 3) and (porsi_makanan = 2)) then
      harga_makanan := 15000
    else
      harga_makanan := 20000;

   write('Berapa banyak pesanan : '); readln(banyak_pesanan);

   //if untuk diskon
   diskon := 0;
   if((menu_makanan = 2) and (porsi_makanan = 3)) then
      diskon := 0.05;

   writeln('Jenis Pesanan');
  writeln('--------------------');
  writeln('1. Makan ditempat');
  writeln('2. Dibungkus');
  write('Masukan Jenisi Pesanan : ');readln(jenis_pesanan);

   //if pajak
   pajak := 0;
  if(jenis_pesanan = 1) then
     pajak := 0.1;

  total_harga := harga_makanan * banyak_pesanan;
  besar_diskon := diskon * total_harga;
  besar_pajak := pajak * total_harga;

  bayar := total_harga + besar_pajak - besar_diskon;

  writeln('Hasil Perhitungan');
  writeln('--------------------');
  writeln('Diskon      : ',besar_diskon:1:2);
  writeln('Total Harga : ',total_harga:1:2);
  writeln('Pajak       : ',besar_pajak:1:2);
  writeln('Bayar       : ',bayar:1:2);

  readln;

end.

