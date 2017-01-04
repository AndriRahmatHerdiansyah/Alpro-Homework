Program Rental_Mobil;
Uses Crt;
Var
    Jenis,Kode,Tipe :string;
    lama                   :integer;
    Total,Harga       :real;
    lagi                    :char;
begin
clrscr;
   lagi:='Y';
   while lagi ='Y'do
begin
ClrScr;
writeln('##### Rental Mobil #####    ');
writeln;
writeln('###KODE JENIS TIPE MOBIL### ');
Writeln;
writeln('-##########################-');
writeln('- 1  #   Toyota Kijang   ');
writeln('- 2  #   Toyota Innova   ');
writeln('- 3  #   Daihatsu Taruna ');
writeln('- 4  #   Honda Jazz      ');
writeln('- 5  #   Suzuki APV      ');
writeln('- 6  #   Suzuki Swift   ');
writeln;
writeln('-##########################-');
writeln;
write ('kode Mobil:');readln(kode);
begin
clrscr;
If Kode='1'then
Begin
Jenis:='Toyota';
Tipe:='Kijang';
Harga:=150000
end else
If Kode='2'then
Begin
Jenis:='Toyota';
Tipe:='Innova';
Harga:=250000
end else;
If Kode='3'then
begin
Jenis:='Daihatsu';
Tipe:='Taruna';
Harga:=200000
end else;
If Kode='4'then
Begin
Jenis:='Honda';
Tipe:='Jazz';
Harga:=270000
end else;
If Kode='5'then
Begin
Jenis:='Suzuki';
Tipe:='APV';
Harga:=240000
end else;
If Kode='6'then
Begin
Jenis:='Suzuki';
Tipe:='Swift';
Harga:=250000
end else;
begin
clrscr;
writeln   ('##########"HASIL"##########');
writeln;
write     (' Kode Mobil   :',Kode) ;readln(kode);
writeln;
writeln   (' harga mobil :Rp.',harga:10:2);
writeln;
write     (' Jenis Mobil  :',Jenis);readln(Jenis);
writeln;
write     (' Tipe Mobil   :',Tipe) ;readln(Tipe);
writeln;
write     (' Lama Rental  : ') ;readln(lama);
Total:= Lama*Harga;
writeln;
Writeln   (' Total Harga  :Rp.',Total:10:2);
writeln   ('-------------------------');
write   ('Ada penyewa lagi (Y/T) !');
readln (lagi);
lagi :=UPCASE(lagi);
end;
end;
writeln   ('****TERIMA KASIH ******');
end;
end.
