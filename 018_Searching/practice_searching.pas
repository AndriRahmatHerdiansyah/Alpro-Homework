program pracice_searching;
uses crt;

const 
    maks = 5;

type 
    Larik = array[1..maks] of integer;

var 
    angka : Larik;
    data_cari : integer;

    procedure IsiAngka(var angka : Larik);
    var
        i : integer;
    begin
        for i := 1 to maks do
        begin
            readln(angka[i]);
        end;
    end;
    
    // procedure SeqSearchTanpaSentinel(angka : Larik);
    // var
    //     i : integer;
    // begin
    //     write('Angka yang dicari = '); readln(data_cari);
    //     i := 1;
    //     while (angka[i] <> data_cari) and (i < maks) do
    //     begin
    //         i := i + 1;
    //     end;
    //     if(angka[i] = data_cari) then
    //         writeln(data_cari,' ditemukan di indeks ke-',i)
    //     else
    //         writeln('Data tidak ditemukan');
    // end;

    procedure SeqSearchSentinel(angka : Larik);
    var
        i : integer;
    begin
        write('Angka yang dicari = '); readln(data_cari);
        i := 1;
        angka[maks + 1] := data_cari;
        while (angka[i] <> data_cari) do
        begin
            i := i + 1;
        end;
        if (i < maks + 1) then
            writeln(data_cari,' ditemukan di indeks ke-',i)
        else
            writeln('Data tidak ditemukan');
    end;

    procedure SeqSearchBoolean(angka : Larik);
    var
        i : integer;
        ketemu : boolean;
    begin
        write('Angka yang dicari = '); readln(data_cari);
        i := 1;
        ketemu := false;
        while (not ketemu) and (i <= maks) do
        begin
            if (angka[i] = data_cari) then
                ketemu := true
            else
                i := i + 1;
        end;
        if (ketemu) then
            writeln(data_cari,' ditemukan di indeks ke-',i)
        else
            writeln('Data tidak ditemukan');
    end;

    procedure BinarySearch(angka : Larik);
    var
        Ia, Ib, k : integer;
        ketemu : boolean;
    begin
        write('Angka yang dicari = '); readln(data_cari);
        Ia := 1;
        Ib := maks;
        ketemu := false;
        while (not ketemu) and (Ia <- Ib) do
        begin
            k := (Ia + Ib) div 2;
            if (angka[k] = data_cari) then
                ketemu := true
            else if (angka[k] < data_cari) then
                Ia := k + 1
            else
                Ib := k - 1;
        end;
        if (ketemu) then
            writeln(data_cari,' ditemukan di indeks ke-',k)
        else
            writeln('Data tidak ditemukan');    
    end;

    procedure TampilAngka(angka : Larik);
    var
        i : integer;
    begin
        for i := 1 to maks do
        begin
            write(angka[i],' ');
        end;
    end;

begin
    IsiAngka(angka);
    //SeqSearchTanpaSentinel(angka);
    //SeqSearchSentinel(angka);
    //SeqSearchBoolean(angka);
    BinarySearch(angka);
    TampilAngka(angka);
end.