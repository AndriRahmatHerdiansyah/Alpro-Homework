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
    currLen: integer;
    temp : string;

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

    // procedure sort;
    // var
    //     prevUnsorted, i: integer;
    //     swapped: boolean;
        
    // begin
    // // using bubble sort algorithm
    // repeat
    //     swapped := false;
    //     prevUnsorted := currlen;
    //     for i := 1 to prevUnsorted do 
    //     begin
    //         if ( data[i].tempKode > data[i + 1].tempKode ) then 
    //         begin
    //             temp := data[i].tempKode;
    //             data[i].tempKode := data[i + 1].tempKode;
    //             data[i + 1].tempKode := temp;
    //             swapped := true;
    //             // writeln('swapped');
    //         end;
    //         // writeln('maximum reached');
    //     end;
    //     prevUnsorted := prevUnsorted - 1;
    //     // writeln('mark previous max, as sorted element');
    // until (swapped);

    // for i := 1 to maksbrg do begin
    //   writeln(tempKode[i]);
    // end;
    //end;

    // function isEqualInList(Kode: string): boolean;
    // var
    //     found: boolean;
    //     first, mid, last: integer;
    // begin
    // // using binary search algorithm
    // // even though it's doesn't have to.
    // // due to small element in the list / array
    // // use linear search instead.
    //     found := false;
    //     first := 1; last := currLen;
    //     while (not found) and (first <= last) {and (isSorted(kode))} do 
    //     begin
    //         mid := (first + last) div 2;
    //         if Kode < tempKode[mid] then
    //         last := mid - 1
    //         else if Kode > tempKode[mid] then
    //         first := mid + 1
    //         else
    //             found := true;
    //     end;
    //     isEqualInList := found;
    // end;

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

            // cek kode yang salah
            while (isInvalid(data[i].KdBrg)) do
            begin
                gotoxy(12, i+5); write('Kode Barang Salah! Ulangi!');
                readln;
                gotoxy(12, i+5); clreol;
                gotoxy(10, i+4); write('|             |             | RP.          |      |            |');
                gotoxy(12, i+4); readln(data[i].KdBrg);
            end;

            // // cek kode yang sama
            // while (isEqualInList(data[i].KdBrg)) do begin
            //     gotoxy(12, i+5); write('Kode Barang Tidak Boleh Sama! Ulangi!');
            //     readln;
            //     gotoxy(12, i+5); clreol;
            //     gotoxy(10, i+4); write('|             |             | RP.          |      |            |');
            //     gotoxy(12, i+4); readln(data[i].KdBrg);
            // end;


            // while((data[i].KdBrg <> 'BRG01') and (data[i].KdBrg <> 'BRG02') and (data[i].KdBrg <> 'BRG03')) do
            // begin
            //    gotoxy(12, i+5); write('Kode Barang Tidak Ada! Ulangi!');
            //    readln;
            //    gotoxy(12, i+5); clreol;
            //    gotoxy(10, i+4); write('|             |             | RP.          |      |            |');
            //    gotoxy(12, i+4); readln(data[i].KdBrg);
            // end;

            gotoxy(55, i+4); readln(data[i].Stok);            

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
            StatusBrg := 'Aman'
        else
            StatusBrg := 'Tidak Aman'
    end;

    function stokMax(data_barang : array_data):integer;
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
        gotoxy(5,9); writeln('Stok tertinggi dari ',MaksBrg,' barang yaitu: ', stokMax(data_barang));
        gotoxy(5,10); writeln('Stok terendah dari ',MaksBrg,' barang yaitu: ', stokMin(data_barang));
    end;

//algoritma utama
begin
    IsiData(data_barang);
    TampilData(data_barang);
    writeln();
    readln;
end.
