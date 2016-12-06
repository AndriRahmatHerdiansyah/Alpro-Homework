program mengkonversi_lama_proyek_ke_tahun_bulan_hari;
uses crt;

var
   JumlahHari,Tahun,Bulan,Hari,SisaTahun,SisaBulan,SisaHari : integer;
begin
     write('Masukan lama hari projek : ');readln(JumlahHari);
     writeln('--------------------------');
     Tahun := JumlahHari div 365;
     SisaHari := JumlahHari mod 365;
     Bulan := SisaHari div 30;
     Hari := SisaHari mod 30;
     writeln('Hasil konversi ',JumlahHari,' hari : ',Tahun,' Tahun, ',Bulan,' Bulan, ',Hari,' Hari');
     readln;
end.
