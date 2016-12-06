program Daftar_Barang;
{I.S.: user memasukkan kode barang dan stok minimum}
{F.S.: menampilkan nama barang, harga satuan dan status}
uses crt;
//kamus global
const 
    MaksBrg = 3;
type
    Larik1 = array[1..MaksBrg] of String;
    Larik2 = array[1..MaksBrg] of integer;
var
    KdBrg, NmBrg, Status : Larik1;
    Harga, Stok : Larik2;

    procedure IsiData(var KdBrg : Larik1; var Stok : Larik2);
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
            gotoxy(12, i+4); readln(KdBrg[i]);
            
            while((KdBrg[i] <> 'BRG01') and (KdBrg[i] <> 'BRG02') and (KdBrg[i] <> 'BRG03')) do
            begin
               gotoxy(12, i+5); write('Kode Barang Tidak Ada! Ulangi!');
               readln;
               gotoxy(12, i+5); clreol;
               gotoxy(10, i+4); write('|             |             | RP.          |      |            |');
               gotoxy(12, i+4); readln(KdBrg[i]);
            end;

            gotoxy(55, i+4); readln(Stok[i]);            

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

    procedure TampilData(KdBrg : Larik1; Stok : Larik2);
    {I.S.: kode barang dan stok minimum sudah terdefinisi}
    {F.S.: menampilkan nama barang, harga satuan dan status}
    var
        i : integer;
    begin
        for i := 1 to MaksBrg do
        begin
            NmBrg[i] := NamaBrg(KdBrg[i]); {memanggil fungsi NamaBrg}
            Harga[i] := HargaSatuan(KdBrg[i]); {memanggil fungsi HargaSatuan}
            Status[i] := StatusBrg(Stok[i]); {memanggil fungsi StatusBrg}
            gotoxy(26, i+4); write(NmBrg[i]);
            gotoxy(44, i+4); write(Harga[i]);
            gotoxy(62, i+4); write(Status[i]);
        end;
    end;

//algoritma utama
begin
    IsiData(KdBrg, Stok);
    TampilData(KdBrg, Stok);
    writeln();
    readln;
end.
