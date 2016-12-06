program Daftar_Barang;
{I.S.: user memasukkan kode barang dan stok minimum}
{F.S.: menampilkan nama barang, harga satuan dan status}

//kamus global
kamus:
    const 
        MaksBrg = 3;
    type
        Larik1 = array[1..MaksBrg] of String
        Larik2 = array[1..MaksBrg] of integer

        KdBrg, NmBrg, Status <- Larik1
        Harga, Stok <- Larik2

    procedure IsiData(output KdBrg : Larik1, output Stok : Larik2)
    {I.S.: user memasukkan kode barang dan stok minimum}
    {F.S.: menghasilkan kode barang dan stok minimum}
    kamus
        i <- integer
    algoritma
        for i <- 1 to MaksBrg do
            input(KdBrg(i))
            while((KdBrg(i) <> 'BRG01') and (KdBrg(i) <> 'BRG02') and (KdBrg(i) <> 'BRG03')) do
               output('Kode Barang Tidak Ada! Ulangi!')
            end;

            input(Stok(i));            
    endprocedure

    function NamaBrg(input Kode : string) -> string
    {I.S.: kode barang sudah terdefinisi}
    {F.S.: menghasilkan fungsi nama barang}
    algoritma:
        if(Kode = 'BRG01') then
            NamaBrg <- 'Pakaian'
        else if(Kode = 'BRG02') then
            NamaBrg <- 'Sepatu'
        else
            NamaBrg <- 'Tas'
    endfunction

    function HargaSatuan(input Kode : string) -> integer;
    {I.S.: kode barang sudah terdefinisi}
    {F.S.: menghasilkan fungsi HargaSatuan}
    algoritma:
        if(Kode = 'BRG01') then
            HargaSatuan <- 6750
        else if(Kode = 'BRG02') then
            HargaSatuan <- 11800
        else
            HargaSatuan <- 7250
    endfunction

    function StatusBrg(input StokMin : integer) -> string
    {I.S.: Stok Minimum sudah terdefinisi}
    {F.S.: menghasilkan fungsi StatusBrg}
    begin
        if(StokMin >= 20) then
            StatusBrg <- 'Aman'
        else
            StatusBrg <- 'Tidak Aman'
    endfunction

    procedure TampilData(input KdBrg : Larik1, input Stok : Larik2)
    {I.S.: kode barang dan stok minimum sudah terdefinisi}
    {F.S.: menampilkan nama barang, harga satuan dan status}
    kamus:
        i <- integer
    algoritma
        for i <- 1 to MaksBrg do
            NmBrg(i) <- NamaBrg(KdBrg(i) {memanggil fungsi NamaBrg}
            Harga(i) <- HargaSatuan(KdBrg(i) {memanggil fungsi HargaSatuan}
            Status(i) <- StatusBrg(Stok(i)); {memanggil fungsi StatusBrg}
            output(NmBrg(i))
            output(Harga(i))
            output(Status(i))
        endfor
    endprocedure

//algoritma utama
algoritma:
    IsiData(KdBrg, Stok)
    TampilData(KdBrg, Stok)
