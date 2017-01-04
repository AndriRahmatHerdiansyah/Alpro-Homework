program rent_car;
 
uses
 crt, Sysutils, regexpr;

Const 
    MaksData    = 20;
    CarDatabase = 'CarDatabase.txt';
    User        = 'admin';
    Pass        = 'admin';

Type
	Str25    = String[25];
	CarRecord = Record
        IdCar, CarName  : Str25;
        Manufactur, AC  : Str25;
        Condition, Fuel : Str25;
        Year, Seats     : Integer;
        Price           : Real;
    End;

    ArrayCar = Array[1..MaksData] of CarRecord;

Var
    RegexObj     : TRegExpr;
	carRecArray  : ArrayCar;
	carRecFile   : File of CarRecord;
    carFileTemp  : File of CarRecord;
	i            : byte;
    N, menu      : integer;
    CarNameSearch   : String;

    procedure OpenDatabase(var carRecArray : ArrayCar);
    var 
        i : integer;
    begin
        Assign(carRecFile, CarDatabase);
        {$I-} Reset(carRecFile);
        {$I+} if (IOResult <> 0) then
            begin
                Rewrite(carRecFile);
                
            end
            else
            begin
                i := 1;
                N := filesize(carRecFile);
                seek(carRecFile, 0);
                while not eof(carRecFile) do
                begin
                    seek(carRecFile, i-1);
                    Read(carRecFile, carRecArray[i]); 
                    i := i + 1;
                end;
            end;
    end;

     procedure MainMenu(var menu : integer);
    {I. S. : user memilih salah satu menu}
    {F. S. : menghasilkan menu yang dipilih}
    begin 
        writeln(N);   
        gotoxy(70, 1); writeln('|============================|');
        gotoxy(70, 2); writeln('|          MAIN MENU         |');
        gotoxy(70, 3); writeln('|============================|');
        gotoxy(70, 4); writeln('|    1. Isi Data Mobil       |');
        gotoxy(70, 5); writeln('|    2. Tampil Data Mobil    |');
        gotoxy(70, 6); writeln('|    3. Hapus Data Mobil     |');
        gotoxy(70, 7); writeln('|    4. Cari Data            |');
        gotoxy(70, 8); writeln('|    0. Keluar               |');
        gotoxy(70, 9); writeln('|============================|');
        gotoxy(70, 10); writeln('|  Pilihan (1,2,3,4,0) :     |');
        gotoxy(70, 11); writeln('|============================|');
        gotoxy(95, 10); readln(menu);
        while (menu > 4) or (menu < 0) do
        begin
            gotoxy(15, 13); write('Menu Salah, Pilihan Hanya 0-4!, Tekan Enter Untuk Ulangi!');
            readln;
            gotoxy(15, 13); clreol;
            gotoxy(95, 10); clreol; readln(menu);
        end;     
    end; 

    Procedure InputNewCar(var carRecArray : ArrayCar);
    var
        N_Input : integer;
    Begin
        clrscr;
        OpenDatabase(carRecArray);
        gotoxy(5, 1); write('Banyaknya Data Mobil    : '); readln(N_Input);
        while (N_Input < 1) or (N_Input > MaksData) do begin
            textcolor(12);gotoxy(1, 2);write('Banyaknya data mobil hanya antara 1-20, ulangi!');
            readln;
            gotoxy(1, 2); clreol;
            gotoxy(26, 1); readln(N_Input);
        end;
        clrscr;
        gotoxy(70,2); write('TAMBAH DATA MOBIL RENTAL');
        gotoxy(70,3); write('=========================');
        gotoxy(1,5);  write('=====================================================================================================================================================================');
        gotoxy(1,6);  write('| No |   ID Car   |          Car Name         |   Manufacturer   |    Year    |  Seats  |         AC         |     Condition    |     Fuel Type    |      Price     |');
        gotoxy(1,7);  write('=====================================================================================================================================================================');
        for i := 1 to N_Input do
        begin
            gotoxy(1, i+7); write('|    |            |                           |                  |            |         |                    |                  |                  | Rp.            |');
            gotoxy(3, i+7); write(i);
            gotoxy(8, i+7); readln(carRecArray[i+N].IdCar);
            gotoxy(21, i+7); readln(carRecArray[i+N].CarName);
            gotoxy(49, i+7); readln(carRecArray[i+N].Manufactur);
            gotoxy(68, i+7); readln(carRecArray[i+N].Year);
            gotoxy(84, i+7); readln(carRecArray[i+N].Seats);
            gotoxy(91, i+7); readln(carRecArray[i+N].AC);
            gotoxy(112, i+7); readln(carRecArray[i+N].Condition);  
            gotoxy(131, i+7); readln(carRecArray[i+N].Fuel);    
            gotoxy(154, i+7); readln(carRecArray[i+N].Price);  
            Seek(carRecFile, filesize(carRecFile));
            write(carRecFile, carRecArray[i+N]);
        end;
        gotoxy(1,i+8);
        write('==================================================================================================================================================================');
        gotoxy(1,i+11);write('Data Mobil berhasil disimpan!');
        gotoxy(1,i+12);write('----------------------------'); 
        gotoxy(1,i+13);write('Tekan Enter Untuk Kembali ke menu!'); readln;
        close(carRecFile);
    End;

    procedure Sort(N : integer; var carRecArray : ArrayCar);
    var
        i, j : integer;
        temp : CarRecord;
    begin
        //OpenDatabase(carRecArray);
        for i := 1 to (N-1) do
        begin
            for j := N downto (i+1) do
            begin
                if(carRecArray[j].IdCar < carRecArray[j-1].IdCar) then
                begin
                    temp    := carRecArray[j];
                    carRecArray[j]   := carRecArray[j-1];
                    carRecArray[j-1] := temp;
                end;
            end;
        end;
    end;

    procedure Overwrite;  
    begin
        Rewrite(carRecFile);
        for i := 1 to N do
        begin
            Seek(carRecFile, i-1);
            write(carRecFile, carRecArray[i]);
        end;
    end;

    procedure DeleteData ;  
    var
        xIdCar  : string;
        find    : boolean;
    begin  
        Assign(carFileTemp, 'temp.dat') ;  
        {$I-} Reset(carFileTemp) ;  
        {$I+} if ioresult <> 0 then Rewrite(carFileTemp) ;   
        Rewrite(carFileTemp) ;  
        OpenDatabase(carRecArray);
            GotoXY(40,5) ; Write('Input Data Produk yang dihapus');  
            GotoXY(40,6) ; Write('-----------------------------') ;  
            GotoXY(40,7) ; Write('ID Car  : ')  ; Readln(carRecArray[i].IdCar) ;
            xIdCar := carRecArray[i].IdCar;
            i := 1;  
            seek(carRecFile, 0) ; find := false ;  
            while not eof(carRecFile) do  
            begin  
                seek(carRecFile, i-1); read (carRecFile, carRecArray[i]) ;
                if carRecArray[i].IdCar = xIdCar then
                begin  
                    find := true ;  
                end  
                else  
                begin  
                    seek(carFileTemp, filesize(carFileTemp));  
                    write(carFileTemp, carRecArray[i]) ;
                end;  
                inc(i);  
            end;  
            i := 1;  
            rewrite(carRecFile) ;  
            seek(carFileTemp,0) ;  
            while not eof(carFileTemp) do  
            begin  
                seek(carFileTemp, i-1); 
                read (carFileTemp, carRecArray[i]) ;
                seek(carRecFile, filesize(carRecFile));  
                write(carRecFile, carRecArray[i]) ;
                inc(i);  
            end;  
            if not find then  
            begin  
                GotoXY(40,8) ; Write('Data ini tidak ada')  
            end  
            else  
            begin  
                GotoXY(40,8) ; Write('Data ini sudah di hapus')  
            end;   
        close(carFileTemp) ;  
        close(carRecFile) ;  
    end;
    
    procedure SearchIdCar(N : integer; carRecArray : ArrayCar);
    var
        i, j, k, l : integer;
        temp       : ArrayCar;
        row        : integer;
    begin
        gotoxy(60, 1); write('=============================     ========================');
        gotoxy(60, 2); Write('|  Merk Mobil Yang Di Cari  |  => |                      |');
        gotoxy(60, 3); write('=============================     ========================'); 
        
        gotoxy(97, 2); readln(CarNameSearch);
        RegexObj := TRegExpr.Create;
        RegexObj.Expression := CarNameSearch;
        i := 1;
        k := 0;
        while (i <= N) do
        begin
            if RegexObj.Exec(carRecArray[i].CarName) then
            begin
                k := k + 1;
                temp[k] := carRecArray[i];
            end;
            i := i + 1;
        end;
        
        if (k > 0) then
        begin
            row := 0;
            for j := 1 to k do
            begin
                gotoxy(70,5+row);   write('----------------------------------');
                gotoxy(70,6+row);   write('|                                |');
                gotoxy(70,7+row);   write('----------------------------------');
                gotoxy(70,8+row);   write('|  ID Car    |                   |');
                gotoxy(70,9+row);   write('|  Year      |                   |');
                gotoxy(70,10+row);  write('|  Seats     |                   |');
                gotoxy(70,11+row);  write('|  AC        |                   |');
                gotoxy(70,12+row);  write('|  Condition |                   |');
                gotoxy(70,13+row);  write('|  Fuel Type |                   |');
                gotoxy(70,14+row);  write('|  Price     |  Rp.              |');
                gotoxy(70,15+row);  write('----------------------------------');
                    gotoxy(73, 6+row); write(uppercase(temp[j].CarName));
                    gotoxy(86, 8+row); write(temp[j].IdCar);
                    gotoxy(86, 9+row); write(temp[j].Year);
                    gotoxy(86, 10+row); write(temp[j].Seats);
                    gotoxy(86, 11+row); write(temp[j].AC);
                    gotoxy(86, 12+row); write(temp[j].Condition);  
                    gotoxy(86, 13+row); write(temp[j].Fuel);    
                    gotoxy(90, 14+row); write(temp[j].Price:0:0);
                row := row + 12;
            end;
        end
        else
            write('Data not found!');
        RegexObj.Free;
    end;
    
    procedure ShowDataCar(N : integer; carRecArray : ArrayCar);
    begin
        clrscr;
        writeln(N, 'ShowDataCar');
        gotoxy(70,2); write('DAFTAR KESELURUHAN MOBIL RENTAL');
        gotoxy(70,3); write('===============================');
        gotoxy(1,5);  write('=====================================================================================================================================================================');
        gotoxy(1,6);  write('| No |   ID Car   |          Car Name         |   Manufacturer   |    Year    |  Seats  |         AC         |     Condition    |     Fuel Type    |      Price     |');
        gotoxy(1,7);  write('=====================================================================================================================================================================');
        for i := 1 to (N+1) do
        begin
            gotoxy(1, i+7); write('|    |            |                           |                  |            |         |                    |                  |                  | Rp.            |');
            gotoxy(3, i+7); write(i);
            gotoxy(8, i+7); write(carRecArray[i].IdCar);
            gotoxy(21, i+7); write(carRecArray[i].CarName);
            gotoxy(49, i+7); write(carRecArray[i].Manufactur);
            gotoxy(68, i+7); write(carRecArray[i].Year);
            gotoxy(84, i+7); write(carRecArray[i].Seats);
            gotoxy(91, i+7); write(carRecArray[i].AC);
            gotoxy(112, i+7); write(carRecArray[i].Condition);  
            gotoxy(131, i+7); write(carRecArray[i].Fuel);    
            gotoxy(154, i+7); write(carRecArray[i].Price:0:0); 
        end;
        
        gotoxy(1,i+7);
        write('=====================================================================================================================================================================');
        gotoxy(1,i+9);write('Tekan Enter Untuk Kembali ke menu!'); readln;
        close(carRecFile);
    end;

Begin
repeat
    OpenDatabase(carRecArray);
    close(carRecFile);
    clrscr;
    MainMenu(menu);
    case (menu) of
        1 : begin
            clrscr;
            InputNewCar(carRecArray); readln;
        end;

        2 : begin
            Sort(N, carRecArray);
            Overwrite;
            ShowDataCar(N, carRecArray);
        end;   
        3 : begin
            clrscr;
            DeleteData; readln;
        end;
        4 : begin
            clrscr;
            SearchIdCar(N, carRecArray); readln;
        end;
    end;
until (menu = 0);

End.
