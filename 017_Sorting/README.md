{======================================}
{         Prosedur dan Fungsi          }
{======================================}

procedure Login(ouput isLogin : boolean)
{I.S. : user memasukkan username dan password untuk melakukan proses login}
{F.S. : menghasilkan data username dan berhasil melakukan proses login}
kamus
    login_chance <- integer
algoritma
    repeat
        input(uname)
        input(pass)
        if(uname <> Username) or (pass <> Password) then
            login_chance <- login_chance - 1
            output('Username atau password salah')
            output('Kesempatan untuk login tersisa ',login_chance)
        endif
    until ((uname = Username) and (pass = Password)) or (login_chance = 0)
    if(login_chance = 0) then
        ouput('Maaf! Akun Anda Telah Di Blokir!')
        isLogin := false
    endfor
endprocedure

procedure isi_data(output jml_data : integer, output array_buku : Larik)
{I.S. : user memasukkan (jml_data), (kd_buku), (nm_buku), (tahun) dan (pengarang)}
{F.S. : menghasilkan data buku yaitu (jml_data), (kd_buku), (nm_buku), (tahun) dan (pengarang)}
kamus
    i : integer
algoritma
    input(jml_data)
    while (jml_data < 1) or (jml_data > maks) do 
        output('Banyaknya data buku hanya antara 1-50, ulangi!')
    endwhile
    for i <- 1 to jml_data do
        input(array_buku[i].kd_buku)
        input(array_buku[i].nm_buku)
        input(array_buku[i].tahun)
        input(array_buku[i].pengarang)       
    endfor
endprocedure

function SortAsc(array_buku : Larik) -> Larik
{I.S. : data (array_buku) sudah terdefinisi}
{F.S. : menghasilkan fungsi (SortAsc)}
kamus
    i, j : integer
    temp : buku
algoritma
    for i <- 1 to (jml_data-1) do
        for j <- jml_data downto i+1 do
            if(array_buku(j).kd_buku < array_buku(j-1).kd_buku) then
                temp <- array_buku(j)
                array_buku(j) <- array_buku(j-1)
                array_buku(j-1) <- temp
            endif
        endif 
    endfor
    SortAsc  <- array_buku
endprocedure

function SortDesc(array_buku : Larik) : Larik
{I.S. : data (array_buku) sudah terdefinisi}
{F.S. : menghasilkan fungsi (SortDesc)}
kamus
    i, j : integer
    temp : buku
algoritma
    for i <- 1 to (jml_data-1) do
        for j <- 1 to (jml_data-1) do
            if(array_buku(j).kd_buku < array_buku(j+1).kd_buku) then
                temp <- array_buku(j)
                array_buku(j) <- array_buku(j+1)
                array_buku(j+1) <- temp
            end
        end 
    end
    SortDesc <- array_buku
end

procedure tampil_data(jml_data : integer, array_buku : Larik sort : string)
{I.S. : data (jml_data) dan (array_buku) sudah terdefinisi}
{F.S. : menampilkan data buku yang sudah diurutkan}
kamus
    i : integer
algoritma
    output('TAMPIL DAFTAR BUKU')
    output('Di Sorting Secara ', sort)
    output('------------------------------------------------------------------')
    output('| No | Kode Buku |    Nama Buku    |   Tahun   |    Pengarang    |')
    output('------------------------------------------------------------------')
    for i <- 1 to jml_data do
        output('|',i,'|',array_buku[i].kd_buku,'|',array_buku[i].nm_buku,'|',array_buku[i].tahun,'|',array_buku[i].pengarang,'|')       
    endfor
end

procedure menu_sorting(jml_data : integer, output array_buku : Larik)
{I.S. : user memasukkan (pilih_sort) untuk memilih menu sorting}
{F.S. : menampilkan menu pilihan untuk sorting}
kamus
    pilih_sort : integer
algoritma
    if (jml_data > 1) then
            output('|           Menu Sorting         |')
            output('|    1. Ascending (A-Z 0-9)      |')
            output('|    2. Descending (Z-A 9-0)     |')
            output('|    0. Kembali                  |')
            while (pilih_sort > 2) or (pilih_sort < 0) do
                output('Menu Salah, Pilihan Hanya 0-2!, Tekan Enter Untuk Ulangi!')
            end
            dependon (pilih_sort)
                1 : tampil_data(jml_data, SortAsc(array_buku), 'Ascending')
                2 : tampil_data(jml_data, SortDesc(array_buku), 'Descending')
            enddepend  
        end
    else
        output('Data Buku Masih Kosong')
    endif    
end

procedure MainMenu(output array_buku : Larik)
{I.S. : user memasukkan pilihan (menu) untuk memilih menu}
{F.S. : menampilkan menu pilihan}
kamus
algoritma
    if (isLogin) then
        menu_selesai <- false
        while (not menu_selesai) do
            output('|============================|')
            output('|          MAIN MENU         |')
            output('|============================|')
            output('|    1. Isi Data Buku        |')
            output('|    2. Tampil Data Buku     |')
            output('|    0. Keluar               |')
            output('|============================|')
            output('|    Pilihan (1,2,0) :       |')
            output('|============================|')
            input(menu)
            while (menu > 4) or (menu < 0) do
                output('Menu Salah, Pilihan Hanya 0-2!, Tekan Enter Untuk Ulangi!')
            end
            dependon (menu)
                1 : isi_data(jml_data, array_buku)                
                2 : menu_sorting(jml_data, array_buku)
                0 : menu_selesai <- true
            enddepend
        endwhile 
    endif
endprocedure

