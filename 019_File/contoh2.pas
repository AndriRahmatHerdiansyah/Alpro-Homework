program cari_data_tertentu;
uses crt;
type
   mhs=record
      npm: string[7];
      nama: string[25];
      nilai: real;
   end;

var
   fmhs: file of mhs;
   rmhs: mhs;
   i,jml: integer;
   nocari: string[7];
   lagi: char;
   ketemu: boolean;
      begin
         assign(fmhs,'mhs.dat');
         reset(fmhs);
         jml:= filesize(fmhs);
         lagi:='y';
         while upcase(lagi)='Y' do
            begin
            clrscr;
            ketemu:= false;
            write('Masukan NPM yang di Cari : ');
            readln(nocari);
            writeln;
            for i:= 1 to jml do
               begin
                  seek(fmhs,i-1);
                  read(fmhs,rmhs);
                     if rmhs.npm=nocari then
                        begin
                           ketemu:= true;
                           writeln('Nama Mahasiswa  : ',rmhs.nama);
                           writeln('Nilai Mahasiswa : ',rmhs.nilai:2:0);
                        end;
               end;
                     if not ketemu then
                        writeln('Tidak nomor tersebut!!!');
                        writeln;
                        write('Cari Data Lagi [Y/T] ? ');
                        readln(lagi);
            end;
         close(fmhs);
      end. 