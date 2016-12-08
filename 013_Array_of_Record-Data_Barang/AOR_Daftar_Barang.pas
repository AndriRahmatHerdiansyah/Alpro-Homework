program Daftar_Barang;
{I.S.: user memasukkan kode barang dan stok minimum}
{F.S.: menampilkan nama barang, harga satuan dan status}
uses crt, sysutils;
//kamus global
const 
    MaksBrg = 3;
type
    data = record
        KdBrg, NmBrg, Status, tempKode : string;
        Harga, Stok : integer;
    end;

    array_data = array[1..MaksBrg] of data;
var
    data_barang : array_data;
    currLen, statusAman, statusTdkAman : integer;

    function isEmpty(Kode: string): boolean;
    begin
        isEmpty := false;
        if (Kode = '') then
            isEmpty := true;
    end;

    function isInvalid(Kode: string): boolean;
    var 
        len01, len02, len03: integer;
    begin
        len01 := comparetext(Kode, 'brg01'); // case-insensitive
        len02 := comparetext(Kode, 'brg02');
        len03 := comparetext(Kode, 'brg03');
        isInvalid := false;
        if (len01 <> 0) and (len02 <> 0) and (len03 <> 0) then
            isInvalid := true
    end;

    procedure sort;
    var
        prevUnsorted, i: integer;
        swapped: boolean;
        temp : string;
    begin
    // using bubble sort algorithm
    repeat
        swapped := false;
        prevUnsorted := currlen;
        for i := 1 to prevUnsorted do 
        begin
            if (data_barang[i].tempKode > data_barang[i + 1].tempKode ) then 
            begin
                temp := data_barang[i].tempKode;
               data_barang[i].tempKode := data_barang[i + 1].tempKode;
                data_barang[i + 1].tempKode := temp;
                swapped := true;
                // writeln('swapped');
            end;
            // writeln('maximum reached');
        end;
        prevUnsorted := prevUnsorted - 1;
        // writeln('mark previous max, as sorted element');
    until (swapped);

    end;

    function isEqualInList(Kode: string): boolean;
    var
        found: boolean;
        first, mid, last: integer;
    begin
    // using binary search algorithm
    // even though it's doesn't have to.
    // due to small element in the list / array
    // use linear search instead.
        found := false;
        first := 1; last := currLen;
        while (not found) and (first <= last) {and (isSorted(kode))} do 
        begin
            mid := (first + last) div 2;
            if Kode < data_barang[mid].tempKode then
            last := mid - 1
            else if Kode > data_barang[mid].tempKode then
            first := mid + 1
            else
                found := true;
        end;
        isEqualInList := found;
    end;

    procedure IsiData(var data:array_data);
    {I.S.: user memasukkan kode barang dan stok minimum}
    {F.S.: menghasilkan kode barang dan stok minimum}
    var
        i : integer;
    begin
        clrscr;
        gotoxy(33,1); write('DAFTAR BARANG');
        gotoxy(5,2);
        write('---------------------------------------------------------------------');
        gotoxy(5,3);
        write('| No | Kode Barang | Nama Barang | Harga Satuan | Stok |   Status   |');
        gotoxy(5,4);
        write('---------------------------------------------------------------------');
        
        for i := 1 to MaksBrg do
        begin
            gotoxy(5, i+4);
            write('|    |             |             | RP.          |      |            |');
            gotoxy(7, i+4); write(i);
            gotoxy(12, i+4); readln(data[i].KdBrg);
            
            // validasi kode yang kosong
            while (isEmpty(data[i].KdBrg)) do
            begin
                gotoxy(12, i+5); write('Kode Barang Tidak Boleh Kosong! Ulangi!');
                readln;
                gotoxy(12, i+5); clreol;
                gotoxy(10, i+4); write('|             |             | RP.          |      |            |');
                gotoxy(12, i+4); readln(data[i].KdBrg);
            end;

            // validasi kode yang salah
            while (isInvalid(data[i].KdBrg)) do
            begin
                gotoxy(12, i+5); write('Kode Barang Salah! Ulangi!');
                readln;
                gotoxy(12, i+5); clreol;
                gotoxy(10, i+4); write('|             |             | RP.          |      |            |');
                gotoxy(12, i+4); readln(data[i].KdBrg);
            end;

            // validasi kode yang sama
            while (isEqualInList(data[i].KdBrg)) do begin
                gotoxy(12, i+5); write('Kode Barang Tidak Boleh Sama! Ulangi!');
                readln;
                gotoxy(12, i+5); clreol;
                gotoxy(10, i+4); write('|             |             | RP.          |      |            |');
                gotoxy(12, i+4); readln(data[i].KdBrg);
            end;

            gotoxy(55, i+4); readln(data[i].Stok);            
            
            data_barang[i].tempKode := data_barang[i].KdBrg;
            currLen := i;
            if i > 1 then
                sort;
        end;
        gotoxy(5,i+5);
        write('---------------------------------------------------------------------');
    end;

    function NamaBrg(Kode : string):string;
    {I.S.: kode barang sudah terdefinisi}
    {F.S.: menghasilkan fungsi nama barang}
    begin
        if(Kode = 'BRG01') or (Kode = 'brg01') or (Kode = 'Brg01') then
            NamaBrg := 'Pakaian'
        else if(Kode = 'BRG02')  or (Kode = 'brg02') or (Kode = 'Brg02') then
            NamaBrg := 'Sepatu'
        else if(Kode = 'BRG03')  or (Kode = 'brg03') or (Kode = 'Brg03') then
            NamaBrg := 'Tas';
    end;

    function HargaSatuan(Kode : string):integer;
    {I.S.: kode barang sudah terdefinisi}
    {F.S.: menghasilkan fungsi HargaSatuan}
    begin
        if(Kode = 'BRG01') or (Kode = 'brg01') or (Kode = 'Brg01') then
            HargaSatuan := 6750
        else if(Kode = 'BRG02')  or (Kode = 'brg02') or (Kode = 'Brg02') then
            HargaSatuan := 11800
        else if(Kode = 'BRG03')  or (Kode = 'brg03') or (Kode = 'Brg03') then
            HargaSatuan := 7250;
    end;

    function StatusBrg(StokMin : integer):string;
    {I.S.: Stok Minimum sudah terdefinisi}
    {F.S.: menghasilkan fungsi StatusBrg}
    begin

        if(StokMin >= 20) then
        begin
            StatusBrg := 'Aman';
            statusAman:= statusAman + 1;
        end
        else
        begin
            StatusBrg := 'Tidak Aman';
            statusTdkAman:= statusTdkAman + 1;
        end;
    end;

    function stokMax(data_barang : array_data):integer;
    {I.S.: Stok Minimum sudah terdefinisi}
    {F.S.: menghasilkan fungsi stokMax}
    var
        i : integer;
    begin
        stokMax := data_barang[1].Stok;
        for i := 2 to MaksBrg do
        begin
            if(data_barang[i].Stok > stokMax) then
                stokMax := data_barang[i].Stok
        end;
    end;

    function StokMin(data_barang : array_data):integer;
    {I.S.: Stok Minimum sudah terdefinisi}
    {F.S.: menghasilkan fungsi StokMin}
    var
        i : integer;
    begin
        StokMin := data_barang[1].Stok;
        for i := 2 to MaksBrg do
        begin
            if(data_barang[i].Stok < StokMin) then
                StokMin := data_barang[i].Stok
        end;
    end;

    function persentase(req : integer): real;
    {I.S.: Stok Minimum sudah terdefinisi}
    {F.S.: menghasilkan fungsi persentase}
    begin
        case(req) of
        1 : begin persentase := (statusAman / MaksBrg) * 100; end;
        2 : begin persentase := (statusTdkAman / MaksBrg) * 100; end;
        end;
    end;

    procedure TampilData(data:array_data);
    {I.S.: kode barang dan stok minimum sudah terdefinisi}
    {F.S.: menampilkan nama barang, harga satuan dan status}
    var
        i : integer;
    begin
        for i := 1 to MaksBrg do
        begin
            data[i].NmBrg := NamaBrg(data[i].KdBrg); {memanggil fungsi NamaBrg}
            data[i].Harga := HargaSatuan(data[i].KdBrg); {memanggil fungsi HargaSatuan}
            data[i].Status := StatusBrg(data[i].Stok); {memanggil fungsi StatusBrg}
            gotoxy(26, i+4); write(data[i].NmBrg);
            gotoxy(44, i+4); write(data[i].Harga);
            gotoxy(62, i+4); write(data[i].Status);
        end;
        gotoxy(5,10); writeln('Stok tertinggi dari ',MaksBrg,' barang yaitu: ', stokMax(data_barang));
        gotoxy(5,11); writeln('Stok terendah dari ',MaksBrg,' barang yaitu: ', stokMin(data_barang));
        gotoxy(5,12);writeln('Barang dengan Status Aman yaitu ',statusAman,' barang ( ',persentase(1):0:2,'% )');
        gotoxy(5,13);writeln('Barang dengan Status Tidak Aman yaitu ',statusTdkAman,' barang ( ',persentase(2):0:2,'% )');
    end;

//algoritma utama
begin
    IsiData(data_barang);
    TampilData(data_barang);
    writeln();
    readln;
end.
