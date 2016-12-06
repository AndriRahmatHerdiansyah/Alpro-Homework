menentukan_nilai_uang_dalam_kelipatan_25
{I.S.: user memasukkan jumlah uang yang akan dipecah kelipatan 25}
{F.S.: menampilkan pecahan jumlah uang yang dimasukkan}

Kamus:
	Ribuan, Ratusan1, Ratusan2, Puluhan1, Puluhan2, Satuan, SisaUang, JumlahUang: integer
	
Algoritma:
	input(JumlahUang)
	Ribuan <- JumlahUang div 1000
	SisaUang <- JumlahUang mod 1000
	Ratusan1 <- SisaUang div 500
	SisaUang <- SisaUang mod 500
	Ratusan2 <- SisaUang div 100
	SisaRatusan2 <- SisaUang mod 100
	Puluhan1 <- SisaUang div 50
	SisaUang <- SisaUang mod 50
	Puluhan2 <- SisaUang div 25
	output(Ribuan, Ratusan1, Ratusan2, Puluhan1, Puluhan2, Satuan)
	