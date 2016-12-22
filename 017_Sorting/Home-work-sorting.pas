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
    isLogin         : boolean;
    uname,pass      : string;

    procedure Login(var isLogin : boolean);
    var
        login_chance : integer;
    begin
        login_chance := 3;
        isLogin		 := true;
        repeat
            clrscr;
            gotoxy(32, 10); write('<< L O G I N >>');
            gotoxy(30, 12); write('Nama Pengguna : '); 
            gotoxy(30, 13); write('Kata Sandi    : '); 
            gotoxy(46, 12);readln(uname);
            gotoxy(46, 13);readln(pass);
            if(uname <> Username) or (pass <> Password) then
            begin
                login_chance := login_chance - 1;
                gotoxy(30,4);writeln('Username atau password salah');
                gotoxy(30,5);writeln('Kesempatan untuk login tersisa ',login_chance);
                readln;
            end;
        until(((uname = Username) and (pass = Password)) or (login_chance = 0));
        if(login_chance = 0) then
        begin
            clrscr;
            gotoxy(30, 10); write('----#### Maaf! Akun Anda Telah Di Blokir! ###----');
            readln;
            isLogin := false;
        end;
    end;


    procedure isi_data(var jml_data : integer; var array_buku : Larik);
    var
        i : integer;
        
    begin
        clrscr;
        gotoxy(5, 1); write('Banyaknya Data Buku    : '); readln(jml_data);
        while (jml_data < 1) or (jml_data > maks) do begin
            textcolor(12);gotoxy(1, 2);write('Banyaknya data buku hanya antara 1-50, ulangi!');
            readln;
            gotoxy(1, 2); clreol;
            gotoxy(26, 1); readln(jml_data);
        end; 
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

    function SortAsc(array_buku : Larik) : Larik;
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
        SortAsc  := array_buku;
    end;

    function SortDesc(array_buku : Larik) : Larik;
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
        SortDesc := array_buku;
    end;

    procedure tampil_data(jml_data : integer; array_buku : Larik; sort : string);
    var
        i : integer;
        
    begin
        clrscr;
        gotoxy(33,1); write('TAMPIL DAFTAR BUKU');
        gotoxy(5,3);  write('Di Sorting Secara ', sort);
        gotoxy(5,4);  write('------------------------------------------------------------------');
        gotoxy(5,5);  write('| No | Kode Buku |    Nama Buku    |   Tahun   |    Pengarang    |');
        gotoxy(5,6);  write('------------------------------------------------------------------');
        for i := 1 to jml_data do
        begin
            gotoxy(5, i+6); write('|    |           |                 |           |                 |');
            gotoxy(7, i+6); write(i);
            gotoxy(12, i+6); write(array_buku[i].kd_buku);
            gotoxy(24, i+6); write(array_buku[i].nm_buku);
            gotoxy(42, i+6); write(array_buku[i].tahun);
            gotoxy(54, i+6); write(array_buku[i].pengarang);        
        end;
        gotoxy(5,i+7);
        write('------------------------------------------------------------------');
        gotoxy(5,i+9);write('Tekan Enter Untuk Kembali ke Menu!'); readln;
    end;
    
    procedure menu_sorting(jml_data : integer; var array_buku : Larik);
    var
        pilih_sort : integer;
    begin
        if (jml_data > 1) then
            begin
                clrscr;
                gotoxy(30, 1); writeln('|================================|');
                gotoxy(30, 2); writeln('|           Menu Sorting         |');
                gotoxy(30, 3); writeln('|================================|');
                gotoxy(30, 4); writeln('|    1. Ascending (A-Z 0-9)      |');
                gotoxy(30, 5); writeln('|    2. Descending (Z-A 9-0)     |');
                gotoxy(30, 6); writeln('|    0. Kembali                  |');
                gotoxy(30, 7); writeln('|================================|');
                gotoxy(30, 8); writeln('|    Pilihan (1,2,0) :           |');
                gotoxy(30, 9); writeln('|================================|');
                gotoxy(57, 8); readln(pilih_sort);
                while (pilih_sort > 2) or (pilih_sort < 0) do
                begin
                    gotoxy(30, 11); writeln('Menu Salah, Pilihan Hanya 0-2!, Tekan Enter Untuk Ulangi!');
                    readln;
                    gotoxy(30, 11); clreol;
                    gotoxy(57, 8); clreol; readln(pilih_sort); 
                end;
                case (pilih_sort) of
                    1 : begin
                        tampil_data(jml_data, SortAsc(array_buku), 'Ascending');
                    end;
                    2 : begin
                        tampil_data(jml_data, SortDesc(array_buku), 'Descending');
                    end; 
                end;  
            end
        else
            begin
                clrscr;
                gotoxy(30, 10); write('----#### Data Buku Masih Kosong ###----');
                readln;
            end;    
    end;

    procedure MainMenu(var array_buku : Larik);
    begin
        if isLogin then
        begin
            clrscr;
            gotoxy(32, 10); writeln('      << Selamat datang ',uname,' >>');
            gotoxy(32, 11); writeln('=====================================');
            gotoxy(32, 14); write('        Please enter key.......');
            readln;
            menu_selesai := false;
            while (not menu_selesai) do
            begin     
                clrscr;
                gotoxy(30, 1); writeln('|============================|');
                gotoxy(30, 2); writeln('|          MAIN MENU         |');
                gotoxy(30, 3); writeln('|============================|');
                gotoxy(30, 4); writeln('|    1. Isi Data Buku        |');
                gotoxy(30, 5); writeln('|    2. Tampil Data Buku     |');
                gotoxy(30, 6); writeln('|    0. Keluar               |');
                gotoxy(30, 7); writeln('|============================|');
                gotoxy(30, 8); writeln('|    Pilihan (1,2,0) :       |');
                gotoxy(30, 9); writeln('|============================|');
                gotoxy(53, 8); readln(menu);
                while (menu > 4) or (menu < 0) do
                begin
                    gotoxy(30, 11); writeln('Menu Salah, Pilihan Hanya 0-2!, Tekan Enter Untuk Ulangi!');
                    readln;
                    gotoxy(30, 11); clreol;
                    gotoxy(53, 8); clreol; readln(menu); 
                end;
                case (menu) of
                    1 : 
                        begin
                            isi_data(jml_data, array_buku);
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
        end;
        
    end;

//algoritma utama
begin
    Login(isLogin);
    MainMenu(array_buku);
end.