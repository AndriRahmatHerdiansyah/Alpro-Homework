program data_nilai_mahasiswa;
uses crt;

const
   MaksBaris = 50;
   MaksKolom = 5;

type
    matkul = record
        kd_mk, nm_mk : string;
        sks : integer;  
    end;

    mhs = record // record
        NIM, Nama: string;
        Ipk : real;
    end;

    Nilai = array[1..MaksBaris, 1..MaksKolom] of integer;
    Indeks = array[1..MaksBaris, 1..MaksKolom] of char;
    Larik1 = array[1..MaksKolom] of matkul;
    Larik2 = array[1..MaksBaris] of mhs;

var 
    data_nilai : Nilai;
    data_indeks : Indeks;
    data_matkul : Larik1;
    data_mahasiswa : Larik2;
    jml_mhs, jml_mk, baris : integer;

    procedure jumlah_data_mhs(var jml_mhs: integer);
    begin
        gotoxy(1, 1); write('Masukkan banyaknya mahasiswa : '); readln(jml_mhs); 
        while (jml_mhs < 1) or (jml_mhs > MaksBaris) do begin
            gotoxy(1, 2);write('Banyaknya data mahasiswa hanya antara 1-50');
            readln;
            gotoxy(1, 2); clreol;
            gotoxy(32, 1); readln(jml_mhs); 
        end;
    end;

    procedure jumlah_data_mk(var jml_mk: integer);
    begin
    gotoxy(1, 2); write('Masukkan banyaknya matkul    : '); readln(jml_mk);
    while (jml_mk <= 0) or (jml_mk > MaksKolom) do begin
        gotoxy(1, 3);write('Banyaknya data matakuliah hanya antara 1-5');
            readln;
            gotoxy(1, 3); clreol;
            gotoxy(32, 2); readln(jml_mk);
    end;
    end;
    
    procedure isi_data_mahasiswa(var data_mahasiswa : Larik2);
    var
        i : integer;
    begin
        clrscr;
        gotoxy(5,1); write('Daftar Mahasiswa');
        gotoxy(5,2);  write('----------------------------------');
        gotoxy(5,3);  write('| No |   N I M   | Nama Mahasiswa |');
        gotoxy(5,4);  write('----------------------------------');
        
        for i := 1 to jml_mhs do
        begin
            gotoxy(5, i+4); write('|    |           |                |');
            gotoxy(7, i+4); write(i);
            gotoxy(12, i+4); readln(data_mahasiswa[i].NIM);
            while (length(data_mahasiswa[i].NIM) > 8) do
            begin
                gotoxy(12, i+5); write('NIM Tidak Boleh Lebih dari 8 Digit! Ulangi!');
                readln;
                gotoxy(12, i+5); clreol;
                gotoxy(5, i+4); write('|    |           |                |');
                gotoxy(7, i+4); write(i);
                gotoxy(12, i+4); readln(data_mahasiswa[i].NIM);
            end;
            gotoxy(24, i+4); readln(data_mahasiswa[i].Nama);
        end;
        gotoxy(5,i+5);
        baris := i+5;
        write('----------------------------------');
    end;

    procedure isi_data_matkul(var data_matkul : Larik1);
    var
        i, j : integer;
    begin
        j := baris;
        gotoxy(5,j+2); write('Daftar Mata Kuliah');
        gotoxy(5,j+3);  write('--------------------------------------------------');
        gotoxy(5,j+4);  write('| No | Kode Mata Kuliah | Nama Mata Kuliah | Sks |');
        gotoxy(5,j+5);  write('--------------------------------------------------');
        
        for i := 1 to jml_mk do
        begin
            gotoxy(5, i+j+5); write('|    |                  |                  |     |');
            gotoxy(7, i+j+5); write(i);
            gotoxy(12, i+j+5); readln(data_matkul[i].kd_mk);
            gotoxy(31, i+j+5); readln(data_matkul[i].nm_mk);
            gotoxy(50, i+j+5); readln(data_matkul[i].sks);
        end;
        gotoxy(5,i+j+6);
        writeln('--------------------------------------------------');
        gotoxy(5,i+j+7);write('Tekan Enter Untuk Melanjutkan!'); readln;
    end;
    
    procedure isi_data_nilai(data_matkul : Larik1; data_mahasiswa : Larik2; var data_nilai : Nilai);
    var
        i, j: integer;
    begin
        clrscr;
        gotoxy(13, 3); write('Kode Mata Kuliah');
        gotoxy(1, 4); write('NIM');
        // tampilan
        for j := 1 to jml_mk do
        begin
            gotoxy(j * 8+5, 4); write(data_matkul[j].kd_mk);
        end;
        for i := 1 to jml_mhs do
        begin
            gotoxy(1, i + 4); write(data_mahasiswa[i].NIM);
        end;

        for i := 1 to jml_mhs do
        begin
            for j := 1 to jml_mk do
            begin
                gotoxy(j * 8+5, i+4); readln(data_nilai[i, j]);
            end;
            writeln;
        end;
                
    end;

    function hitung_indeks(nilai : integer): char;
    begin
        case (nilai) of
            80..100 : hitung_indeks := 'A';
            70..79: hitung_indeks := 'B';
            60..69: hitung_indeks := 'C';
            50..59: hitung_indeks := 'D';
            0..49: hitung_indeks := 'E';
        end;
    end;

    function bobot(idx : char; sks : integer): real;
    begin
        case idx of
            'A' : bobot := 4.0 * sks;
            'B' : bobot := 3.0 * sks;
            'C' : bobot := 2.0 * sks;
            'D' : bobot := 1.0 * sks;
            'E' : bobot := 0.0 * sks;
        end;
    end;

    procedure tampil_indeks(data_nilai : Nilai; var data_indeks : Indeks);
    var
        i, j, k: integer;
    begin

        for i := 1 to jml_mhs do
        begin
            for j := 1 to jml_mk do
            begin
                data_indeks[i, j] := hitung_indeks(data_nilai[i, j]);
                gotoxy(j * 8+5, i+4); clreol; delay(700); write(data_indeks[i, j]);
            end;
            writeln;
            baris := i+4;
        end;
        k := baris;
        gotoxy(1,k+1);write('Tekan Enter Untuk Melanjutkan!'); readln;
        
    end;

    procedure tampil_data_khs(data_matkul : Larik1; data_mahasiswa : Larik2; data_indeks : Indeks; data_nilai : Nilai);
    var
        i, j, baris : integer; 
        total_sks, total_bobot: real;
    begin
        clrscr;
        baris := 0;
        gotoxy(10, 1 + baris); writeln('HASIL STUDY MAHASISWA TEKNIK INFORMATIKA UNIKOM SEBANYAK ',jml_mhs,' MAHASISWA');
        gotoxy(10, 2 + baris); writeln('====================================================================');
        
        for i := 1 to jml_mhs do begin
            total_bobot := 0;
            total_sks := 0;

            gotoxy(1, i+3+baris); write('----------------------------------Mahasiswa ke-', i,'----------------------------------');
            gotoxy(1, i+5+baris); write('NIM   : ', UpCase(data_mahasiswa[i].NIM));
            gotoxy(1, i+6+baris); write('Nama  : ', UpCase(data_mahasiswa[i].Nama));
            gotoxy(1, i+8+baris); write('-----------------------------------------------------------');
            gotoxy(1, i+9+baris); write('| No | Kode Mata Kuliah | Nama Mata Kuliah | SKS | Indeks |');
            gotoxy(1, i+10+baris); write('-----------------------------------------------------------');
            baris := baris + i+10;
            for j := 1 to jml_mk do 
            begin
                total_sks := total_sks + data_matkul[j].sks;
                total_bobot := total_bobot + (bobot(data_indeks[i, j], data_matkul[j].sks));
                gotoxy(1,  j + baris); write('|    |                  |                  |     |        |');
                gotoxy(3,  j + baris); write(j);
                gotoxy(1 * 8,  j + baris); write(UpCase(data_matkul[j].kd_mk));
                gotoxy(1 * 27,  j + baris); write(UpCase(data_matkul[j].nm_mk));
                gotoxy(1 * 46,  j + baris); write(data_matkul[j].sks);
                gotoxy(1 * 52,  j + baris); write(data_indeks[i, j]);
            end;
            gotoxy(1, j + 1 + baris);writeln('-----------------------------------------------------------');
            data_mahasiswa[i].Ipk := total_bobot / total_sks;
            gotoxy(1, j + 3 + baris); write('IPK: ', data_mahasiswa[i].Ipk:1:1);
            baris := baris + j + 1;
        end;       
    end;

    

begin
    clrscr;
    window(1 , 1 , 100 , 1000);
    jumlah_data_mhs(jml_mhs);
    jumlah_data_mk(jml_mk);
    isi_data_mahasiswa(data_mahasiswa);
    isi_data_matkul(data_matkul);
    isi_data_nilai(data_matkul, data_mahasiswa, data_nilai);
    tampil_indeks(data_nilai, data_indeks);
    tampil_data_khs(data_matkul, data_mahasiswa, data_indeks, data_nilai);
    readln;
end.

    // procedure tampil_data_nilai(data_indeks : Indeks);
    // var
    //     i, j, total_sks : integer;
    // begin
    //     total_sks := 0;
    //     for i := 1 to jml_mhs do
    //     begin
    //         for j := 1 to jml_mk do
    //         begin
    //            write(bobot(data_indeks[i, j])); 
    //         end;             
    //     end;
    // end;

    // procedure hitung_ipk(data_nilai : Nilai; data_indeks : indeks; data_matkul : Larik1);
    // var
    //     i,j, total_sks,  : integer;
    // begin
    //     total_sks := 0;
    //     for i := 1 to jml_mk do
    //     begin
    //         total_sks := total_sks + data_matkul[i].sks;              
    //     end;
    //     write(total_sks);
    // end;

    // procedure tampil_data_matkul(data_matkul : Larik1);
    // var
    //     i : integer;
    // begin
    //     for i := 1 to jml_mk do
    //     begin
    //         writeln(data_matkul[i].kd_mk);
    //         writeln(data_matkul[i].nm_mk);
    //         writeln(data_matkul[i].sks);    
    //     end;
        
    // end;
