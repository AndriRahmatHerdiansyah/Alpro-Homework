{======================================}
{         Prosedur dan Fungsi          }
{======================================}

{prosedur jumlah_data_mhs}
    procedure jumlah_data_mhs(output jml_mhs, jml_mk: integer)
    {I.S. : User memasukkan nilai (jml_mhs) dan nilai (jml_mk)}
    {F.S. : menghasilkan nilai (jml_mhs) dan nilai (jml_mk)}
    algoritma
        input(jml_mhs); 
        while (jml_mhs < 1) or (jml_mhs > MaksBaris) do
            output('Banyaknya data mahasiswa hanya antara 1-50! ulangi!')
        endwhile
        while (jml_mk < 1) or (jml_mk > MaksKolom) do 
            output('Banyaknya data matakuliah hanya antara 1-5' ulangi!)
        endwhile
    endprocedure

{prosedur isi_data_mahasiswa}
    procedure isi_data_mahasiswa(input jml_mhs, jml_mk : integer, output data_mahasiswa : Larik2)
    {I.S. : nilai (jml_mhs) dan (jml_mk) sudah terdefinisi}
    {F.S. : menghasilkan data mahasiswa (NIM) dan (Nama)}
    kamus
        i : integer
    algoritma
        output('Daftar Mahasiswa')
        output('-----------------------------------')
        output('| No |   N I M   | Nama Mahasiswa |')
        output('-----------------------------------')
        for i <- 1 to jml_mhs do
            input(data_mahasiswa(i).NIM)
            while (length(data_mahasiswa(i).NIM) > 8) do
                output('NIM Tidak Boleh Lebih dari 8 Digit! Ulangi!')
            endwhile
            input(data_mahasiswa(i).Nama);
            output('|', i ,'|', data_mahasiswa(i).NIM ,'|', data_mahasiswa(i).Nama ,'|')     
        endfor
        output('-----------------------------------')
    endprocedure

{prosedur isi_data_matkul}
    procedure isi_data_matkul(input jml_mhs, jml_mk : integer, output data_matkul : Larik1)
    {I.S. : nilai (jml_mhs) dan (jml_mk) sudah terdefinisi}
    {F.S. : menghasilkan data matakuliah (kd_mk), (nm_mk) dan (sks)}
    kamus
        i, j : integer
    algoritma
        output('Daftar Mata Kuliah');
        output('--------------------------------------------------')
        output('| No | Kode Mata Kuliah | Nama Mata Kuliah | Sks |')
        output('--------------------------------------------------')
        for i :<- 1 to jml_mk do
            input(data_matkul(i)).kd_mk)
            input(data_matkul(i)).nm_mk)
            input(data_matkul(i)).sks)
            output('|', i ,'|', data_matkul(i)).kd_mk ,'|', data_matkul(i)).nm_mk ,'|', data_matkul(i)).sks ,'|')
        endfor
    endprocedure

{fungsi isi_data_nilai}
    procedure isi_data_nilai(input jml_mhs, jml_mk : integer, output data_nilai : Nilai)
    {I.S. : nilai (jml_mhs) dan (jml_mk) sudah terdefinisi}
    {F.S. : menghasilkan (data_nilai)}
    kamus
        i, j : integer
    algoritma
        for i <- 1 to jml_mhs d
            for j <- 1 to jml_mk do
                input(data_nilai(i,j)));
            endfor
        endfor          
    endprocedure

{fungsi hitung_indeks}
    function hitung_indeks(input nilai : integer) -> char
    {I.S. : (nilai) sudah terdefinisi}
    {F.S. : menghasilkan fungsi (hitung_indeks)}
    algoritma
        dependon (nilai)
            80..100 : hitung_indeks <- 'A'
            70..79  : hitung_indeks <- 'B'
            60..69  : hitung_indeks <- 'C'
            50..59  : hitung_indeks <- 'D'
            0..49   : hitung_indeks <- 'E'
        enddepend
    endfunction

{fungsi bobot}
    function bobot(input idx : char, input sks : integer) -> real
    {I.S. : (idx) dan (sks) sudah terdefinisi}
    {F.S. : menghasilkan fungsi (bobot)}
    algoritma
        dependon (idx)
            'A' : bobot <- 4.0 * sks
            'B' : bobot <- 3.0 * sks
            'C' : bobot <- 2.0 * sks
            'D' : bobot <- 1.0 * sks
            'E' : bobot <- 0.0 * sks
        enddepend
    endfunction

{prosedur tampil_indeks}
    procedure tampil_indeks(input jml_mhs, jml_mk : integer, input data_nilai : Nilai, output data_indeks : Indeks)
    {I.S. : nilai (jml_mhs), (jml_mk) dan (data_nilai) sudah terdefinisi}
    {F.S. : menghasilkan (data_indeks))}
    kamus
        i, j, k: integer
    algoritma
        for i <- 1 to jml_mhs do
            for j <- 1 to jml_mk do
                data_indeks(i,j)) <- hitung_indeks(data_nilai(i,j))
                output(data_indeks(i,j))
            endfor
        endfor   
    endprocedure

{prosedur tampil_data_khs}
    procedure tampil_data_khs(input jml_mhs, jml_mk : integer, input data_matkul : Larik1; input data_mahasiswa : Larik2 
                            input data_indeks : Indeks; input data_nilai : Nilai)
    {I.S. : nilai (jml_mhs), (jml_mk) dan (data_nilai) sudah terdefinisi}
    {F.S. : menghasilkan (data_indeks))}
    kamus
        i, j : integer 
        total_sks, total_bobot: real
    algoritma
        output('HASIL STUDY MAHASISWA TEKNIK INFORMATIKA UNIKOM SEBANYAK ',jml_mhs,' MAHASISWA')
        output('==============================================================================')
        for i <- 1 to jml_mhs do
            total_bobot <- 0
            total_sks <- 0
            output('----------------------------------Mahasiswa ke-', i,'----------------------------------')
            output('NIM   : ', UpCase(data_mahasiswa(i).NIM))
            output('Nama  : ', UpCase(data_mahasiswa(i).Nama))
            output('-----------------------------------------------------------')
            output('| No | Kode Mata Kuliah | Nama Mata Kuliah | SKS | Indeks |')
            output('-----------------------------------------------------------')
            for j <- 1 to jml_mk do 
                total_sks <- total_sks + data_matkul(j).sks
                total_bobot <- total_bobot + (bobot(data_indeks(i,j), data_matkul(j).sks))
                output('|',j,'|',UpCase(data_matkul(j).kd_mk),'|',UpCase(data_matkul(j).nm_mk),'|',data_matkul(j).sks,'|',data_indeks(i,j).'|')
            endfor
            output('-----------------------------------------------------------')
            data_mahasiswa(i).Ipk <- total_bobot / total_sks
            output('IPK: ', data_mahasiswa(i).Ipk)
        endfor       
    endprocedure


{==================================}
{         Algoritma Utama          }
{==================================}

data_nilai_mahasiswa
kamus:
    const
        MaksBaris = 50
        MaksKolom = 5

    type
        matkul = record
            kd_mk, nm_mk : string,
            sks : integer  
        end;

        mhs = record
            NIM, Nama : string,
            Ipk : real
        end

        Nilai = array[1..MaksBaris, 1..MaksKolom] of integer
        Indeks = array[1..MaksBaris, 1..MaksKolom] of char
        Larik1 = array[1..MaksKolom] of matkul
        Larik2 = array[1..MaksBaris] of mhs
 
    data_nilai : Nilai
    data_indeks : Indeks
    data_matkul : Larik1
    data_mahasiswa : Larik2
    jml_mhs, jml_mk : integer

    procedure jumlah_data_mhs(output jml_mhs, jml_mk: integer)
    procedure isi_data_mahasiswa(input jml_mhs, jml_mk : integer, output data_mahasiswa : Larik2)
    procedure isi_data_matkul(input jml_mhs, jml_mk : integer, output data_matkul : Larik1)
    procedure isi_data_nilai(input jml_mhs, jml_mk : integer, output data_nilai : Nilai)
    procedure tampil_indeks(input jml_mhs, jml_mk : integer, input data_nilai : Nilai, output data_indeks : Indeks)
    procedure tampil_data_khs(input jml_mhs, jml_mk : integer, input data_matkul : Larik1; input data_mahasiswa : Larik2,
                            input data_indeks : Indeks; input data_nilai : Nilai)

algoritma
    clrscr
    jumlah_data_mhs(jml_mhs, jml_mk)
    isi_data_mahasiswa(jml_mhs, jml_mk , data_mahasiswa)
    isi_data_matkul(jml_mhs, jml_mk , data_matkul)
    isi_data_nilai(jml_mhs, jml_mk , data_nilai)
    tampil_indeks(jml_mhs, jml_mk , data_nilai, data_indeks)
    tampil_data_khs(jml_mhs, jml_mk , data_matkul, data_mahasiswa, data_indeks, data_nilai)