program pilihan_menu_dengan_case
{I.S. : user memasukkan pilihan menu}
{F.S. : menampilkan keluaran dari setiap menu yang dipilih}

kamus:
    pilihan : integer
    a, b, i : integer
    pangkat : integer
    batas1, batas2, batas3, k : integer
    hasil : integer

algoritma:
    repeat
        input(pilihan)
        
        {validasi menu}
        while (pilihan < 0) or (pilihan > 2) do
            output('Pilihan hanya 0/1/2. ulangi!');
            input(pilihan)
        endwhile    

        {pilihan menu}
        dependon (pilihan)
            1 : 
                input(a,b)
                
                {validasi pangkat}
                while (b < 0) do 
                    output('harga b tidak boleh negatif! ulangi!')
                    input(b)
                endwhile

                {proses perpangkatan}
                if(b = 0) then
                    pangkat <- 1;
                    output(pangkat)
                else
                    if(b = 1) then
                        pangkat <- 1
                        for i <- 1 to b do
                            output(a)
                            if(i <> b) then
                                output(' x ')
                            endif
                            pangkat <- pangkat * a
                        endfor
                        output('             = ',pangkat)
                    endif
                endif

            2 : 
                input(batas1, batas2, batas3)
                
                {validasi batas}
                while (batas1 < 0) and (batas2 < 0) and (batas3 < 0) then
                    output('harga batas tidak boleh negatif, ulangi!')
                    input(batas1, batas2, batas3)
                endwhile 

                {proses penjumlahan deret}
                for k <- bata1 to batas3 + 1 do
                    output(batas1,' ')
                    batas1 <- batas1 + batas2
                endfor
                hasil <- batas1 - batas2 
                
                output(hasil)
        enddepend
        
    until (pilihan = 0)