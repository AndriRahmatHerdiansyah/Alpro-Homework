menghitung_lama_parkir_kendaraan_motor_dan_tarif_parkir;
{ I.S. : user memasukan No Polisi, Jam Masuk, dan Jam Keluar }
{ F.S. : menampilkan No Polisi, Jam Masuk, Jam Keluar dan lama parkirnya }

Kamus :
   J1hh,J1mm,J1ss : integer --waktu saat masuk}
   J2hh,J2mm,J2ss : integer --waktu saat keluar}
   J3hh,J3mm,J3ss : integer --waktu lamanya parkir}
   nopol    : integer
   TotalDetik1,TotalDetik2,selisihdetik,sisa : integer
   bayar_parkir : integer
   
Algoritma :
   Input (nopol)
   -- validasi No.Polisi
   if (nopol > 9999)
   then
        Output ('No polisi tidak boleh melebihi 4 digit !')
        Input (nopol);
   Endif

  --memasukkan waktu (jam, menit, detik) masuk }
   Input (J1hh) --memasukkan jam}
   --validasi jam}
   if (J1hh > 24)
   then
        Output ('Jam yang anda masukkan tidak valid !')
        Input (J1hh)
   endif
   Input (J1mm) --memasukkan menit}
   --validasi menit}
   if (J1mm > 59)
   then
        Output ('Menit yang anda masukkan tidak valid !')
        Input (J1mm)
   endif
   Input (J1ss) --memasukkan detik}
   --validasi detik}
   if (J1ss > 59)
   then
        Output ('Detik yang anda masukkan tidak valid !')
        Input (J1ss)
   Endif

   --Memasukkan waktu (jam,menit,detik) keluar}
   Input (J2hh) {memasukkan jam}
   {validasi jam}
   if (J2hh > 24)
   then
        Output ('Jam yang anda masukkan tidak valid !')
        Input (J2hh)
   endif
   Input (J2mm) --memasukkan menit}
   --validasi menit}
   if (J2mm > 59)
   then
        Output ('Menit yang anda masukkan tidak valid !')
        Input (J2mm)
   endif
   Input (J2ss) --memasukkan detik}
   --validasi detik}
   if (J2ss > 59)
   then
        Output ('Detik yang anda masukkan tidak valid !')
        Input (J2ss)
   endif

   --konversi masing masing jam ke detik dulu bro :)}
   TotalDetik1 ← (J1hh*3600) + (J1mm*60) + J1ss
   TotalDetik2 ← (J2hh*3600) + (J2mm*60) + J2ss
   --selisih detik}
   selisihdetik ← TotalDetik2 - TotalDetik1

   --konversi selisih detik ke jam-menit-detik agar dapet waktu lamanya parkir :) }
   J3hh ← selisihdetik div 3600
   sisa ← selisihdetik mod 3600
   J3mm ← sisa div 60
   J3ss ← sisa mod 60

   --menampilkan hasil input dan penghitungan}
   Output (nopol)
   Output (J1hh,':') Output (J1mm,':') Output (J1ss) --menampilkan waktu masuk parkir}
   Output (J2hh,':') Output (J2mm,':') Output (J2ss) --menampilkan waktu keluar parkir}
  
   --menampilkan waktu lamanya parkir}
   Output (nopol)
   Output (J3hh,':') Output (J3mm,':') Output (J3ss) --menampilkan lamanya parkir}

   --Menentukan Tarif Parkir}
   if j3hh < 2
   then
       bayar_parkir ← 1000
   else
       if j3hh <= 4
       then
           bayar_parkir ← 2000
       else
           if j3hh <= 6
           then
               bayar_parkir ← 4000
           else
               bayar_parkir ← 5000
           endif
       endif
   endif
   --menampilkan biaya atau tarif parkir}
   Output (bayar_parkir)