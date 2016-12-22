program latihan_sorting;
uses crt;

const 
    maks = 50;
    username = 'Andri';
    password = '10116189';

type
    buku = record
        kd_buku     : string;
        nm_buku     : string;
        tahun       : integer;
        pengarang   : string;
    end;

    Larik = array[1..maks] of buku;

var
    array_buku      : Larik;
    jml_data, menu  : integer;
    menu_selesai    : boolean;

    procedure jml_data_buku(var jml_data : integer);
    begin
        clrscr;
        gotoxy(5, 1); write('Banyaknya Data Buku    : '); readln(jml_data);
        while (jml_data < 1) or (jml_data > maks) do begin
            textcolor(12);gotoxy(1, 2);write('Banyaknya data buku hanya antara 1-20, ulangi!');
            readln;
            gotoxy(1, 2); clreol;
            gotoxy(26, 1); readln(jml_data);
        end; 
    end;

    procedure isi_data(var array_buku : Larik);
    var
        i : integer;
        
    begin
        clrscr;
        gotoxy(33,1); write('ISI DAFTAR BUKU');
        gotoxy(5,2);  write('------------------------------------------------------------------');
        gotoxy(5,3);  write('| No | Kode Buku |    Nama Buku    |   Tahun   |    Pengarang    |');
        gotoxy(5,4);  write('------------------------------------------------------------------');
        
        for i := 1 to jml_data do
        begin
            gotoxy(5, i+4); write('|    |           |                 |           |                 |');
            gotoxy(7, i+4); write(i);
            gotoxy(12, i+4); readln(array_buku[i].kd_buku);
            gotoxy(24, i+4); readln(array_buku[i].nm_buku);
            gotoxy(42, i+4); readln(array_buku[i].tahun);
            gotoxy(54, i+4); readln(array_buku[i].pengarang);        

        end;
        gotoxy(5,i+5);
        write('------------------------------------------------------------------');
        gotoxy(5,i+7);write('Data Buku berhasil disimpan!');
        gotoxy(5,i+8);write('----------------------------'); 
        gotoxy(5,i+9);write('Tekan Enter Untuk Kembali ke menu!'); readln;
    end;

    procedure bubble_sort_asc(var array_buku : Larik);
    var
        i, j : integer;
        temp : buku;
    begin
        for i := 1 to (jml_data-1) do
        begin
            for j := jml_data downto i+1 do
            begin
                if(array_buku[j].kd_buku < array_buku[j-1].kd_buku) then
                begin
                    temp := array_buku[j];
                    array_buku[j] := array_buku[j-1];
                    array_buku[j-1] := temp;
                end;
            end; 
        end;
    end;

    procedure bubble_sort_desc(var array_buku : Larik);
    var
        i, j : integer;
        temp : buku;
    begin
        for i := 1 to (jml_data-1) do
        begin
            for j := 1 to (jml_data-1) do
            begin
                if(array_buku[j].kd_buku < array_buku[j+1].kd_buku) then
                begin
                    temp := array_buku[j];
                    array_buku[j] := array_buku[j+1];
                    array_buku[j+1] := temp;
                end;
            end; 
        end;
    end;

    procedure tampil_data(jml_data : integer; var array_buku : Larik);
    var
        i : integer;
        
    begin
        clrscr;
        
        gotoxy(33,1); write('TAMPIL DAFTAR BUKU');
        gotoxy(5,2);  write('------------------------------------------------------------------');
        gotoxy(5,3);  write('| No | Kode Buku |    Nama Buku    |   Tahun   |    Pengarang    |');
        gotoxy(5,4);  write('------------------------------------------------------------------');
        
        for i := 1 to jml_data do
        begin
            gotoxy(5, i+4); write('|    |           |                 |           |                 |');
            gotoxy(7, i+4); write(i);
            gotoxy(12, i+4); write(array_buku[i].kd_buku);
            gotoxy(24, i+4); write(array_buku[i].nm_buku);
            gotoxy(42, i+4); write(array_buku[i].tahun);
            gotoxy(54, i+4); write(array_buku[i].pengarang);        

        end;
        gotoxy(5,i+5);
        write('------------------------------------------------------------------');
        gotoxy(5,i+7);write('Tekan Enter Untuk Kembali ke menu!'); readln;
    end;
    
    procedure menu_sorting(jml_data : integer; var array_buku : Larik);
    var
        pilih_sort : integer;
    begin
        if (jml_data = 0) then
        begin
            clrscr;
            gotoxy(30, 10); write('----#### Data Buku Masih Kosong ###----');
            readln;
        end
        else
        begin
            clrscr;
            gotoxy(30, 1); writeln('|================================|');
            gotoxy(30, 2); writeln('|           Menu Sorting         |');
            gotoxy(30, 3); writeln('|================================|');
            gotoxy(30, 4); writeln('|    1. Berdasarkan Kode Buku    |');
            gotoxy(30, 5); writeln('|    2. Berdasarkan Judul Buku   |');
            gotoxy(30, 6); writeln('|    3. Berdasarkan Tahun        |');
            gotoxy(30, 7); writeln('|    4. Berdasarkan Pengarang    |');
            gotoxy(30, 8); writeln('|    0. Kembali                  |');
            gotoxy(30, 9); writeln('|================================|');
            gotoxy(30, 10); writeln('|    Pilihan (1,2,3,4,0) :       |');
            gotoxy(30, 11); writeln('|================================|');
            gotoxy(57, 10); readln(pilih_sort);

            case (pilih_sort) of
                1 : 
                    begin
                        bubble_sort_asc(array_buku);
                        tampil_data(jml_data, array_buku);
                    end;
                
            end;  
        end;
        
    end;

begin
    menu_selesai := false;
    while (not menu_selesai) do
    begin
        clrscr;
        gotoxy(30, 1); writeln('|============================|');
        gotoxy(30, 2); writeln('|          DATA BUKU         |');
        gotoxy(30, 3); writeln('|============================|');
        gotoxy(30, 4); writeln('|    1. Isi Data Buku        |');
        gotoxy(30, 5); writeln('|    2. Tampil Data Buku     |');
        gotoxy(30, 6); writeln('|    0. Tampil Data Buku     |');
        gotoxy(30, 7); writeln('|============================|');
        gotoxy(30, 8); writeln('|    Pilihan (1,2,0) :       |');
        gotoxy(30, 9); writeln('|============================|');
        gotoxy(53, 8); readln(menu);

        case (menu) of
            1 : 
                begin
                    jml_data_buku(jml_data);
                    isi_data(array_buku);
                end;
            
            2 :
                begin
                    menu_sorting(jml_data, array_buku);
                end;

            0 : 
                begin
                    menu_selesai := true;
                end;
            
        end;
    end;
    
    // jml_data_buku(jml_data);
    // isi_data(array_buku);
    // bubble_sort_asc(array_buku);
    // tampil_data(array_buku);
end.