program mengalikan_dua_matriks;
{I.S : memasukan data matriks A dan B}
{F.S : menghasilkan hasil perkalian matriks A dengan B, yakni matriks C}
 
uses
    crt;
 
//Kamus Global
const
     maks_array = 50;
 
type
    larik1 = array [1..maks_array,1..maks_array] of integer;
 
var
   a,b,c:larik1;
   i,j,k,x,y,z:integer;
 
   procedure isi_matriks(var a,b:larik1);
   {I.S : memasukan data matriks A dan B}
   {F.S : mendefinisikan baris, kolom, dan data matriks A, B}
 
   begin
        clrscr();
        textcolor(14);
        writeln('MENGALIKAN DUA MATRIKS');
        writeln('----------------------');
        writeln();
        textcolor(15);
        writeln('Input Data Matriks A');
        write('Baris : ');readln(x);
        write('Kolom : ');readln(y);
        writeln();
        writeln('Input Data Matriks B');
        write('Baris : ');
        writeln(y);
        write('Kolom : ');readln(z);
        writeln();

        for i:=1 to x do
        begin
             for j:=1 to y do
             begin
                  write('Matriks A[',i,',',j,']:');
                  readln(a[i,j]);
             end;//EndFor
        end;//EndFor
 
        writeln();
 
        for i:=1 to y do
        begin
             for j:=1 to z do
             begin
                  write('Matriks B[',i,',',j,']:');
                  readln(b[i,j]);
             end;//EndFor
        end;//EndFor
 
     end;//EndProcedure
 
     procedure tampil_matriks(var a,b,c:larik1);
     {I.S : data matriks A dan B sudah terdefinisi}
     {F.S : menghasilkan hasil perkalian matriks A dengan B, yakni matriks C}
 
     begin
          isi_matriks(a,b);
          for i:=1 to x do
          begin
              for j:=1 to y do
              begin
                  for k:=1 to z do
                  begin
                      c[i,j]:=c[i,j] + a[i,k] * b[k,j];
                  end;//EndFor
              end;//EndFor
          end;//EndFor
 
          writeln();
          textcolor(14);
          writeln('Hasil Kali Matriks A Dengan Matriks B Adalah :');
          writeln('----------------------------------------------');
          textcolor(15);
          for i:=1 to x do
          begin
               for j:=1 to z do
                   write(c[i,j],' ');
                   write();
               //EndFor
          end;//EndFor
 
     end;//EndProcedure
 
//Program Utama
begin
     tampil_matriks(a,b,c);
     readln();

end.