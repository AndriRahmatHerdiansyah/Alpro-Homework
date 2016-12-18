program matriks_penjumlahan_perkalian;  
  
{$APPTYPE CONSOLE}  
  
uses crt, SysUtils;  
  
var  
    oprtr: char;  
    i,j,a,b,p,q: integer;  
    z:char;  
    
    procedure penjumlahan;  
    type  
        matrix= array[1..25,1..25] of integer;  
    var  
        x : array [1..100] of longint;  
        k,l,m : matrix;  
  
  
        procedure InputMat(var k:matrix);  
        begin  
            for i := 1 to a do  
            begin  
                for j := 1 to b do  
                begin  
                    write('Masukan elemen[',i,'][',j,']: '); readln(k[i,j]);  
                end;  
            end;  
        end;  
  
  
  
        procedure InputMat2(var l:matrix);  
        begin  
            for i := 1 to a do  
            begin  
                for j := 1 to b do  
                begin  
                    write('Masukan elemen[',i,'][',j,']: '); readln(l[i,j]);  
                end;  
            end;  
        end;  
  
  
  
        procedure CetakMat(var k:matrix);  
        begin  
            for i:= 1 to a do  
            begin  
                for j:=1 to b do  
                begin  
                    write(k[i,j], ' ');  
                end;  
                writeln;  
            end;  
        end;  
  
  
  
        procedure CetakMat2(var l:matrix);  
        begin  
            for i:= 1 to a do  
            begin  
                for j:=1 to b do  
                begin  
                    write(l[i,j], ' ');  
                end;  
                writeln;  
            end;  
        end;  
  
  
        procedure tambah(var m:matrix);  
        begin  
            for i:= 1 to a do  
            begin  
                for j:=1 to b do  
                begin  
                    m[i,j]:=k[i,j]+l[i,j];  
                    write(m[i,j], ' ');  
                end;  
                writeln;  
            end;  
        end;  
  
    begin  
    repeat  
        write('Masukan jml baris: '); readln(a);  
        write('Masukan jml kolom: '); readln(b);  
        writeln;writeln;  
        writeln('Input Matrix ke 1');  
        InputMat(k);writeln;writeln;writeln;  
        writeln('Input Matrix ke 2');  
        InputMat2(l);  
        writeln;writeln;  
        write('Matrix ke 1 :');  
        writeln;  
        CetakMat(k);writeln;writeln;writeln;  
        write('Matrix ke 2 :');  
        writeln;  
        CetakMat2(l);writeln;writeln;writeln;  
        write('Hasil Penjumlahan :');  
        writeln;  
        tambah(m);  
        writeln;  
        writeln('Apakah Anda Ingin Mengulang [Y/T]: ');readln(z);  
    until upcase(z)='T';  
    readln;  
    end;  
  
  
    procedure perkalian;  
    type  
    matrix= array[1..25,1..25] of integer;  
    var  
    
        x : array [1..100] of longint;  
        k,l,m : matrix;  
        
        
        procedure InputMat(var k:matrix);  
        begin  
            for i := 1 to a do  
            begin  
                for j := 1 to b do  
                begin  
                    write('Masukan elemen[',i,'][',j,']: '); readln(k[i,j]);  
                end;  
            end;  
        end;  
    
        procedure InputMat2(var l:matrix);  
        begin  
            for i := 1 to a do  
            begin  
                for j := 1 to b do  
                begin  
                    write('Masukan elemen[',i,'][',j,']: '); readln(l[i,j]);  
                end;  
            end;  
        end;  
  
  
  
        procedure CetakMat(var k:matrix);  
        begin  
            for i:= 1 to a do  
            begin  
                for j:=1 to b do  
                begin  
                    write(k[i,j], ' ');  
                end;  
                writeln;  
            end;  
        end;  
  
  
  
        procedure CetakMat2(var l:matrix);  
        begin  
            for i:= 1 to a do  
            begin  
                for j:=1 to b do  
                begin  
                    write(l[i,j], ' ');  
                end;  
                writeln;  
            end;  
        end;  
  
  
        procedure kali(var m:matrix);  
        begin  
            for i:= 1 to a do  
            begin  
                for j:=1 to b do  
                begin  
                    m[i,j]:=0;  
                    for p:=1 to q do  
                    begin  
                        m[i,j] := m[i,j]+k[i,p]*l[p,j];  
                    end;  
                    write(m[i,j], ' ');  
                end;  
                writeln;  
            end;  
        end;  
  
  
    begin  
        repeat  
            write('Masukan jml baris: '); readln(a);  
            write('Masukan jml kolom: '); readln(b);  
            writeln;writeln;  
            writeln('Input Matrix ke 1');  
            InputMat(k);writeln;writeln;writeln;  
            write('Masukan jml baris: '); readln(b);  
            write('Masukan jml kolom: '); readln(q);  
            writeln('Input Matrix ke 2');  
            InputMat2(l);  
            writeln;writeln;  
            write('Matrix ke 1 :');  
            writeln;  
            CetakMat(k);writeln;writeln;writeln;  
            write('Matrix ke 2 :');  
            writeln;  
            CetakMat2(l);writeln;writeln;writeln;  
            write('Hasil Perkalian :');  
            writeln;  
            kali(m);  
            write;  
            writeln;  
            writeln;writeln;  
            writeln('Apakah Anda Ingin Mengulang [Y/T]: ');readln(z);  
        until upcase(z)='T';  
    readln;  
    end;  
  
  
begin  
    repeat  
        writeln('~~~~~~~~~MENU~~~~~~~~');  
        writeln('----------------------');  
        writeln('1. Penjumlahan Matriks');  
        writeln('2. Perkalian Matriks');  
        writeln('3. Keluar');  
        writeln('----------------------');  
        writeln(' ');  
        write('Pilihan [1/2/3]: ');readln(oprtr);  
        writeln(' ');  
        case oprtr of  
            '1':penjumlahan;  
            '2':perkalian;  
            '3':exit;  
        else  
            writeln('Masukan Salah');readln;  
        end;  
    until oprtr = '3';  
end. 