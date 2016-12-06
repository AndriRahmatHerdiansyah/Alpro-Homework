mengkonversi_satuan_sentimeter_ke_meter_dan_kilometer

{I.S.: user memasukkan jarak tempuh}

{F.S.: menampilkan hasil konversi ke Km, M dan Cm}


Kamus:
		JarakTempuh, Km, M, Cm : integer


Algoritma:
		input(JarakTempuh) --cm
		Km <- JarakTempuh div 100000 
		Sisa1 <- JarakTempuh mod 100000
		M <- Sisa1 div 100
		Cm <- Sisa1 mod 100
		output(Km, M, Cm)