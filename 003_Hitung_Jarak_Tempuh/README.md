program Untitled;
{I.S.: User memasukkan jarak tempuh}
{F.S.: menghasilkan konversi jarak}

kamus:
   JarakTempuh, Km, M, Cm, Sisa1 <- integer

algoritma:
     input(JarakTempuh)
     Km <- JarakTempuh div 100000
     Sisa1 <- JarakTempuh mod 100000
     M <- Sisa1 div 100
     Cm <- Sisa1 mod 100
     output(Km)
     output(M)
     output(Cm)
