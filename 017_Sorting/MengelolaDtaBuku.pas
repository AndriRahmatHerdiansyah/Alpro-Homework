Program MengelolaDataBuku;
{I.S. : user memasukkan data buku}
{F.S. : menampilkan data buku yang telah diurutkan}
Uses crt;

const 
    MaksBuku    = 30;
    User        = 'Andri';
    Pass        = '10116189'; 
type
    DataBuku = record
        KodeBuku, NamaBuku  : string;
        Tahun, Pengarang    : string;
    end;

    Buku = array[1..MaksBuku] of DataBuku;

var 
    BK           : Buku;
    N, Menu      : integer;
    NP, KS, NmP  : string;

    //fungsi login
    function Login(NP, KS : string) : Boolean;
    {I.S. : nama pengguna (NP) dan kata sandi (KS) sudah terdefinisi }
    {I.S. : menghasilkan fungsi login}
    var
        i : integer;
    begin
        i := 1;
        while ((NP <> User) or (KS <> Pass)) and (i < 3) do
        begin
            gotoxy(1, 3); write('Salah Login');
            readln; gotoxy(1, 3); clreol; gotoxy(17, 1); clreol;
            gotoxy(17, 2); clreol;
            gotoxy(17, 1); readln(NP); gotoxy(17, 2); readln(KS);
            i := i + 1;
        end;
        if (i <= 3) and (NP = User) and (KS = Pass) then
            Login := true
        else
            Login := false;
    end;
    
    //prosedur Menu Pilihan
    procedure MenuPilihan(var Menu : integer);
    {I. S. : user memilih salah satu menu}
    {F. S. : menghasilkan menu yang dipilih}
    begin    
        gotoxy(30, 1); writeln('|============================|');
        gotoxy(30, 2); writeln('|          MAIN MENU         |');
        gotoxy(30, 3); writeln('|============================|');
        gotoxy(30, 4); writeln('|    1. Isi Data Buku        |');
        gotoxy(30, 5); writeln('|    2. Tampil Data Buku     |');
        gotoxy(30, 6); writeln('|    3. Cari Data Buku       |');
        gotoxy(30, 7); writeln('|    4. Cari Pengarang       |');
        gotoxy(30, 8); writeln('|    0. Keluar               |');
        gotoxy(30, 9); writeln('|============================|');
        gotoxy(30, 10); writeln('|  Pilihan (1,2,3,4,0) :     |');
        gotoxy(30, 11); writeln('|============================|');
        gotoxy(55, 10); readln(Menu);
        while (menu > 4) or (menu < 0) do
        begin
            gotoxy(15, 13); write('Menu Salah, Pilihan Hanya 0-4!, Tekan Enter Untuk Ulangi!');
            readln;
            gotoxy(15, 13); clreol;
            gotoxy(55, 10); clreol; readln(menu);
        end;     
    end; 

    //prosedur memasukkan data buku
    procedure IsiDataBuku(var N : integer; var BK : Buku);
    {I. S. : user memasukkan Banyaknya data (N) dan data buku}
    {F. S. : menghasilkan Banyaknya data (n) dan data buku}
    var
        i : integer;
    begin
        clrscr;
        gotoxy(5, 1); write('Banyaknya Data Buku    : '); readln(N);
        while (N < 1) or (N > MaksBuku) do begin
            textcolor(12);gotoxy(1, 2);write('Banyaknya data buku hanya antara 1-30, ulangi!');
            readln;
            gotoxy(1, 2); clreol;
            gotoxy(26, 1); readln(N);
        end; 
        clrscr;
        gotoxy(33,1); write('ISI DAFTAR BUKU');
        gotoxy(5,2);  write('------------------------------------------------------------------');
        gotoxy(5,3);  write('| No | Kode Buku |    Nama Buku    |   Tahun   |    Pengarang    |');
        gotoxy(5,4);  write('------------------------------------------------------------------');
        for i := 1 to N do
        begin
            gotoxy(5, i+4); write('|    |           |                 |           |                 |');
            gotoxy(7, i+4); write(i);
            gotoxy(12, i+4); readln(BK[i].KodeBuku);
            gotoxy(24, i+4); readln(BK[i].NamaBuku);
            gotoxy(42, i+4); readln(BK[i].Tahun);
            gotoxy(54, i+4); readln(BK[i].Pengarang);        
        end;
        gotoxy(5,i+5);
        write('------------------------------------------------------------------');
        gotoxy(5,i+7);write('Data Buku berhasil disimpan!');
        gotoxy(5,i+8);write('----------------------------'); 
        gotoxy(5,i+9);write('Tekan Enter Untuk Kembali ke menu!'); readln;
    end;

    //prosedur mengurtukan data buku
    procedure UrutDataBuku(N: integer; var BK : Buku);
    {I. S. : Banyaknya data (N) dan data buku (BK) sudah terdefinisi}
    {F. S. : menghasilkan data buku yang sudah diurutkan}
    var
        i, j : integer;
        temp : DataBuku;
    begin
        for i := 1 to (N-1) do
        begin
            for j := N downto (i+1) do
            begin
                if(BK[j].KodeBuku < BK[j-1].KodeBuku) then
                begin
                    temp    := BK[j];
                    BK[j]   := BK[j-1];
                    BK[j-1] := temp;
                end;
            end;
        end;
    end;

    // binary search dengan kode terurut secara ascending
    procedure CariKode(N : integer; BK : Buku);
    {I.S. : banyaknya data (N), data buku sudah terdefinisi}
    {F.S. : menampilkan kode buku yang dicari}
    var
        Ia, Ib, K : integer;
        Ketemu    : boolean;
        Kode      : string;
    begin
        write('Kode Buku yang dicari : '); readln(Kode);
        Ia := 1; // inisialisasi ujung kiri array
        Ib := N; // inisialisasi ujung kanan array
        Ketemu := false;
        while (not Ketemu) and (Ia <= Ib) do
        begin
            K := (Ia + Ib) div 2;
            if (BK[K].KodeBuku = Kode) then
                Ketemu := true
            else
                if (BK[K].KodeBuku < Kode) then
                    Ia := K + 1
                else
                    Ib := K - 1;
        end;
        if (Ketemu) then
        begin
            clrscr;
            writeln('Kode Buku      : ', Kode);
            writeln('Nama Buku      : ', BK[K].NamaBuku);
            writeln('Tahun          : ', BK[K].Tahun);
            writeln('Pengarang      : ', BK[K].Pengarang);
        end
        else
            writeln('Kode Buku ',Kode,' Tidak Ada!');
    end;

    procedure CariPengarang(N : integer; BK : Buku; NmP : string);
    {I.S. : banyaknya data (N), data buku dan pengarang sudah terdefinisi}
    {F.S. : menampilkan nama pengarang yang dicari}
    var
        i, j, baris : integer;
        Ketemu      : boolean;
    begin
        //sequential search dengan boolean
        i := 1;
        Ketemu := false;
        while (not Ketemu) and (i <= N) do
        begin
            if (BK[i].Pengarang = NmP) then
                Ketemu := true
            else
                i := i + 1;
        end;
        if (Ketemu) then
        begin
            clrscr;
            gotoxy(33,1); write('DATA BUKU');
            gotoxy(5,3);  write('Nama Pengarang : ', NmP);
            gotoxy(5,4);  write('------------------------------------------------');
            gotoxy(5,5);  write('| No | Kode Buku |    Nama Buku    |   Tahun   |');
            gotoxy(5,6);  write('------------------------------------------------');
            baris := 6;
            for j := 1 to N do
            begin
                if (BK[j].Pengarang = NmP) then
                begin
                    gotoxy(5, baris + 1); write('|    |           |                 |           |');
                    gotoxy(7, baris + 1); write(j);
                    gotoxy(12, baris + 1); write(BK[j].KodeBuku);
                    gotoxy(24, baris + 1); write(BK[j].NamaBuku);
                    gotoxy(42, baris + 1); write(BK[j].Tahun);
                    baris := baris + 1;
                end;
            end;
            gotoxy(5, baris + 1);
            write('------------------------------------------------');
            gotoxy(5, baris + 2);write('Tekan Enter Untuk Kembali ke Menu!');
        end
        else
            writeln('Pengarang ',NmP,' Tidak Ada!');
    end;

    //prosedur menampilkan data buku yang sudah terurut
    procedure TampilDataBuku(N : integer; BK : Buku);
    {I. S. : Banyaknya data (N) dan data buku (BK) sudah terdefinisi}
    {F. S. : menampilkan data buku yang telah diurutkan}
    var
        i : integer;
    begin
        clrscr;
        gotoxy(33,1); write('TAMPIL DAFTAR BUKU');
        gotoxy(5,4);  write('------------------------------------------------------------------');
        gotoxy(5,5);  write('| No | Kode Buku |    Nama Buku    |   Tahun   |    Pengarang    |');
        gotoxy(5,6);  write('------------------------------------------------------------------');
        for i := 1 to N do
        begin
            gotoxy(5, i+6); write('|    |           |                 |           |                 |');
            gotoxy(7, i+6); write(i);
            gotoxy(12, i+6); write(BK[i].KodeBuku);
            gotoxy(24, i+6); write(BK[i].NamaBuku);
            gotoxy(42, i+6); write(BK[i].Tahun);
            gotoxy(54, i+6); write(BK[i].Pengarang);        
        end;
        gotoxy(5,i+7);
        write('------------------------------------------------------------------');
        gotoxy(5,i+9);write('Tekan Enter Untuk Kembali ke Menu!');   
    end;

// program utama
begin
    clrscr;
    write('Nama Pengguna : '); readln(NP);
    write('Kata Kunci    : '); readln(KS);
    if (Login(NP, KS)) then //login sukses
    begin
        repeat
            clrscr;
            MenuPilihan(Menu);
            case (Menu) of
                1 : IsiDataBuku(N, BK);
                2 : begin
                       if (N = 0) then
                       begin
                           clrscr;
                           writeln('Harap Pilih Menu No. 1 Terlebih Dahulu!');
                           readln;
                       end
                       else
                       begin
                           UrutDataBuku(N, BK);
                           TampilDataBuku(N, BK);
                           readln;
                       end;
                    end;
                3 : begin
                       if (N = 0) then
                       begin
                           clrscr;
                           writeln('Harap Pilih Menu No. 1 Terlebih Dahulu!');
                           readln;
                       end
                       else
                       begin
                           clrscr;
                           UrutDataBuku(N, BK);
                           CariKode(N, BK);
                           readln;
                       end;
                    end;
                4 : begin
                       if (N = 0) then
                       begin
                           clrscr;
                           writeln('Harap Pilih Menu No. 1 Terlebih Dahulu!');
                           readln;
                       end
                       else
                       begin
                           clrscr;
                           write('Pengarang Yand Dicari : '); readln(NmP);
                           CariPengarang(N, BK, NmP);
                           readln;
                       end;
                    end;
            end; //endcase
        until (Menu = 0);
    end
    else // 3 kali salah login
    begin
        write('Maaf, Sudah 3 kali salah Login!'); readln;
    end;
end.
