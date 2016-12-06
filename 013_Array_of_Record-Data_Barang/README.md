Daftar_Barang
    {I.S.: user memasukkan kode barang dan stok minimum}
    {F.S.: menampilkan nama barang, harga satuan dan status}

kamus:
const
    MaksBrg = 3
type
    data = record
        KdBrg, NmBrg, Status <- String
        Harga, Stok <- integer;
    endrecord
    array_data = array[1..MaksBrg] of data

    data_barang <- array_data

    procedure IsiData(output data : array_data)
    {I.S.: user memasukkan kode barang dan stok minimum}
    {F.S.: menghasilkan kode barang dan stok minimum}
    kamus:
        i <- integer
    algoritma:
        for i <- 1 to MaksBrg do
            input(data(i).KdBrg)
            while((data(i).KdBrg <> 'BRG01') and (data(i).KdBrg <> 'BRG02') and (data(i).KdBrg <> 'BRG03')) do
                output('Kode barang tidak ada!')
            endwhile
            input(data(i).Stok)
            while(data(i).Stok < 0) do
                output('Stok tidak boleh negatif')
            endwhile
        endfor
    end 

    function NamaBrg(input Kode : string) -> string
    {I.S.: kode barang sudah terdefinisi}
    {F.S.: menghasilkan fungsi nama barang}
    algoritma
        if(Kode = 'BRG01') then
            NamaBrg <- 'Pakaian'
        else if(Kode = 'BRG02') then
            NamaBrg <- 'Sepatu'
        else
            NamaBrg <- 'Tas'  
    end

    function HargaSatuan(Kode : string) -> integer
    {I.S.: kode barang sudah terdefinisi}
    {F.S.: menghasilkan fungsi HargaSatuan}
    algoritma:
        if(Kode = 'BRG01') then
            HargaSatuan <- 6750
        else if(Kode = 'BRG02') then
            HargaSatuan <- 11800
        else
            HargaSatuan <- 7250
    end;

    function StatusBrg(StokMin : integer) -> string
    {I.S.: Stok Minimum sudah terdefinisi}
    {F.S.: menghasilkan fungsi StatusBrg}
    algoritma:
        if(StokMin >= 20) then
            StatusBrg <- 'Aman'
        else
            StatusBrg <- 'Tidak Aman'
    end;

    procedure TampilData(data:array_data);
    {I.S.: kode barang dan stok minimum sudah terdefinisi}
    {F.S.: menampilkan nama barang, harga satuan dan status}
    kamus:
        i <- integer
    algoritma:
        for i <- 1 to MaksBrg do
            data[i].NmBrg <- NamaBrg(data[i].KdBrg); {memanggil fungsi NamaBrg}
            data[i].Harga <- HargaSatuan(data(i).KdBrg); {memanggil fungsi HargaSatuan}
            data[i].Status <- StatusBrg(data(i).Stok); {memanggil fungsi StatusBrg}
            gotoxy(26, i+4); write(data(i).NmBrg);
            gotoxy(44, i+4); write(data(i).Harga);
            gotoxy(62, i+4); write(data(i).Status);
        endfor
    end;

//algoritma utama
algoritma:
    IsiData(data_barang)
    TampilData(data_barang)
end.

