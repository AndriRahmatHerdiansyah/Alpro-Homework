program Daftar_Barang;
{I.S.: user memasukkan kode barang dan stok minimum}
{F.S.: menampilkan nama barang, harga satuan dan status}
uses crt;
//kamus global
const 
    MaksBrg = 3;
type
    data = record
        KdBrg, NmBrg, Status : string;
        Harga, Stok : integer;
    end;

    array_data = array[1..MaksBrg] of data;
var
    data_barang : array_data;

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
            
            while((data[i].KdBrg <> 'BRG01') and (data[i].KdBrg <> 'BRG02') and (data[i].KdBrg <> 'BRG03')) do
            begin
               gotoxy(12, i+5); write('Kode Barang Tidak Ada! Ulangi!');
               readln;
               gotoxy(12, i+5); clreol;
               gotoxy(10, i+4); write('|             |             | RP.          |      |            |');
               gotoxy(12, i+4); readln(data[i].KdBrg);
            end;

            gotoxy(55, i+4); readln(data[i].Stok);            

        end;
        gotoxy(5,i+5);
        write('---------------------------------------------------------------------');
    end;

    function NamaBrg(Kode : string):string;
    {I.S.: kode barang sudah terdefinisi}
    {F.S.: menghasilkan fungsi nama barang}
    begin
        if(Kode = 'BRG01') then
            NamaBrg := 'Pakaian'
        else if(Kode = 'BRG02') then
            NamaBrg := 'Sepatu'
        else
            NamaBrg := 'Tas';
    end;

    function HargaSatuan(Kode : string):integer;
    {I.S.: kode barang sudah terdefinisi}
    {F.S.: menghasilkan fungsi HargaSatuan}
    begin
        if(Kode = 'BRG01') then
            HargaSatuan := 6750
        else if(Kode = 'BRG02') then
            HargaSatuan := 11800
        else
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
    end;

//algoritma utama
begin
    IsiData(data_barang);
    TampilData(data_barang);
    writeln();
    readln;
end.
