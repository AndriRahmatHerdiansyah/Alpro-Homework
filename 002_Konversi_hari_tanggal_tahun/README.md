menghitung_hari_jarak_kedua_tanggal
{I.S.: user memasukan tanggal pertama dan tanggal kedua}
{F.S.: menampilkan selisih hari kedua tanggal}

Kamus:
	T1dd, T1mm, T1yy, T2dd, T2mm, T2yy, SelisihHari : integer
	
Algoritma:
	input(T1dd, T1mm, T1yy);
	input(T2dd, T2mm, T2yy);

--konversi ke hari
	/*TotalHari1 <- (T1yy*365) + (T1mm*30) + T1dd
	TotalHari2 <- (T2yy*365) + (T2mm*30) + T2dd
	SelisihHari <- TotalHari2 - TotalHari1*/
	
	SelisihHari <- (T2dd+(30 * T2mm)+(365 * T2yy)) - (T1dd + ( 30 * T1mm) + (365 * T1yy))
	
--konversi ke tahun
	
--output 
	output(T1dd, T1mm, T1yy)
	output(T2dd, T2mm, T2yy)
	output(SelisihHari)