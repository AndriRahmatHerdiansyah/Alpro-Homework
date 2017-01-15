program rent_car;
 
uses
 crt, Sysutils, regexpr;

Const 
    MaksData         = 20;
    CarDatabase      = 'CarDatabase.txt';
    TransaksiDatabase = 'TransaksiDatabase.txt';
    User             = 'admin';
    Pass             = 'admin';

Type
	Str25    = String[25];
	CarRecord = Record
        IdCar, CarName  : Str25;
        Manufactur, AC  : Str25;
        Condition, Fuel : Str25;
        Year            : string;
        Seats           : Integer;
        Price           : Real;
    End;

    TransaksiRecord = Record
        IdTransaksi     : integer;
        CarName         : Str25;
        PickupDate      : TDateTime;
        ReturnDate      : integer;
        Driver, Gasoline, Wifi, BabySeats : char;
        Customer, email : String;
        Phone, Address  : String;
        Cost            : Real;
    end;

    ArrayCar = Array[1..MaksData] of CarRecord;
    ArrayTransaksi  = Array[1..MaksData] of TransaksiRecord;

Var
    RegexObj            : TRegExpr;
	carRecArray         : ArrayCar;
    transaksiRecArray   : ArrayTransaksi;
	carRecFile          : File of CarRecord;
    carFileTemp         : File of CarRecord;
    transaksiRecFile    : File of TransaksiRecord;
    ThisMoment          : TDateTime;
	i                   : byte;
    N, M, menu          : integer;
    NP, KS              : string;

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

    procedure OpenDatabaseTransaksi(var transaksiRecArray : ArrayTransaksi);
    var 
        i : integer;
    begin
        Assign(transaksiRecFile, TransaksiDatabase);
        {$I-} Reset(transaksiRecFile);
        {$I+} if (IOResult <> 0) then
            begin
                Rewrite(transaksiRecFile);      
            end
            else
            begin
                i := 1;
                M := filesize(transaksiRecFile);
                seek(transaksiRecFile, 0);
                while not eof(transaksiRecFile) do
                begin
                    seek(transaksiRecFile, i-1);
                    Read(transaksiRecFile, transaksiRecArray[i]); 
                    i := i + 1;
                end;
            end;
    end;

    function Login(NP, KS : string) : Boolean;
    {I.S. : nama pengguna (NP) dan kata sandi (KS) sudah terdefinisi }
    {I.S. : menghasilkan fungsi login}
    var
        i : integer;
    begin
        i := 1;
        while ((NP <> User) or (KS <> Pass)) and (i < 3) do
        begin
            gotoxy(1, 3); write('Salah Login');
            readln; gotoxy(1, 3); clreol; 
            gotoxy(79, 16); clreol;
            gotoxy(79, 20); clreol;
            gotoxy(79, 16); readln(NP); gotoxy(79, 20); readln(KS);
            i := i + 1;
        end;
        if (i <= 3) and (NP = User) and (KS = Pass) then
            Login := true
        else
            Login := false;
    end;

    procedure LoginProgram;
    begin
        Gotoxy(50,10); write('___________________________________________________________');
        Gotoxy(50,11); Write('|                                                         |');
        Gotoxy(50,12); Write('|                           MENU LOGIN                    |');
        Gotoxy(50,13); Write('|                         -------------                   |');
        Gotoxy(50,14); Write('|                                                         |');
        Gotoxy(50,15); Write('|                           _________________             |');
        Gotoxy(50,16); Write('|            Username  :   |                 |            |');
        Gotoxy(50,17); Write('|                          |_________________|            |');
        Gotoxy(50,18); Write('|                                                         |');
        Gotoxy(50,19); Write('|                           _________________             |');
        Gotoxy(50,20); Write('|            Password :    |                 |            |');
        Gotoxy(50,21); Write('|                          |_________________|            |');
        Gotoxy(50,22); Write('|                                                         |');
        Gotoxy(50,23); Write('|                                -------                  |');
        Gotoxy(50,24); Write('|                               | Enter |                 |');
        Gotoxy(50,25); Write('|                                -------                  |');
        Gotoxy(50,26); Write('|_________________________________________________________|');
        Gotoxy(79,16); readln(NP);
        Gotoxy(79,20); readln(KS);
    end;

     procedure MainMenu(var menu : integer);
    {I. S. : user memilih salah satu menu}
    {F. S. : menghasilkan menu yang dipilih}
    begin 
        writeln(N);
        gotoxy(45, 1);  writeln('                              DIRGANTARA CAR RENTAL');
        gotoxy(45, 2);  writeln('             Agen sewa mobil di Bandung, Jawa Barat. Cipaganti, Coblong');
        gotoxy(45, 3);  writeln('Alamat: Jl. Lamping No.7, Cipaganti, Coblong, Kota Bandung, Jawa Barat 40131, Indonesia');
        gotoxy(45, 4);  writeln('=======================================================================================');

        gotoxy(50, 7);   writeln('|============================================================================|');   
        gotoxy(50, 8);   writeln('|        * ---------SELAMAT DATANG DI DIRGANTARA CAR RENTAL--------- *       |');
        gotoxy(50, 9);   writeln('|============================================================================|');
        gotoxy(50, 10);  writeln('|                                  MAIN MENU                                 |');
        gotoxy(50, 11);  writeln('|============================================================================|');
        gotoxy(50, 12);  writeln('|                        1. Booking Rental Mobil                             |');
        gotoxy(50, 13);  writeln('|                        2. Tampil Data Booking                              |');
        gotoxy(50, 14);  writeln('|                        3. Invoice Pembayaran                               |');
        gotoxy(50, 15);  writeln('|                        4. Isi Data Mobil                                   |');
        gotoxy(50, 16);  writeln('|                        5. Tampil Data Mobil                                |');
        gotoxy(50, 17);  writeln('|                        6. Hapus Data Mobil                                 |');
        gotoxy(50, 18);  writeln('|                        7. Cari Data Berdasarkan ID Mobil                   |');
        gotoxy(50, 19);  writeln('|                        8. Cari Data Berdasarkan Nama Mobil                 |');
        gotoxy(50, 20);  writeln('|                        9. Cari Data Berdasarkan Tahun Mobil                |');
        gotoxy(50, 21);  writeln('|                        0. Keluar                                           |');
        gotoxy(50, 22);  writeln('|============================================================================|');
        gotoxy(50, 24);  writeln('                        |===============================|                     ');
        gotoxy(50, 25);  writeln('                        |      Silakan Memilih Menu     |                     ');
        gotoxy(50, 26);  writeln('                        |===============================|                     ');
		gotoxy(50, 27);  writeln('                        |                               |                     ');
		gotoxy(50, 28);  writeln('                        |===============================|                     ');
          
        gotoxy(90, 27); readln(menu);
        while (menu > 9) or (menu < 0) do
        begin
            gotoxy(60, 29); write('Menu Salah, Pilihan Hanya 0-9!, Tekan Enter Untuk Ulangi!');
            readln;
            gotoxy(60, 29); clreol;
            gotoxy(90, 27); clreol; readln(menu);
        end;     
    end; 

    procedure TransaksiRental(var carRecArray : ArrayCar; var transaksiRecArray : ArrayTransaksi);
    var
        i, j, k, Id : integer;
        xIdCar      : string;
        find        : boolean;
        Car         : string;
        CostCar     : real;
    begin
        clrscr;
        OpenDatabaseTransaksi(transaksiRecArray);      
            i := 1;
            writeln(M);
            OpenDatabase(carRecArray);
            gotoxy(2, 1); writeln('Step[1] - Request');
            gotoxy(2, 2); writeln('=================');
            gotoxy(3, 4); write('----RENT CAR---------------------------------------');
            gotoxy(3, 5); write('|                                                 |');
            gotoxy(3, 6); write('|                                                 |');
            gotoxy(5, 6); write('---------------------------------------------');
            for j := 1 to filesize(carRecFile) do
            begin
                gotoxy(3, j+6); write('|                                                 |');
                gotoxy(5, j+6); write('|        |                   | Rp.          |');
                gotoxy(7, j+6); write(carRecArray[j].IdCar);
                gotoxy(16, j+6); write(carRecArray[j].CarName);
                gotoxy(40, j+6); write(carRecArray[j].Price:0:0);
            end;
            gotoxy(3, j+7); write('|                                                 |');
            gotoxy(3, j+8); write('|                                                 |');
            gotoxy(3, j+9); write('|                                                 |');
            gotoxy(3, j+10); write('|                                                 |');
            gotoxy(3, j+11); write('|                                                 |');
            gotoxy(3, j+12); write('|                                                 |');
            gotoxy(3, j+13); write('|                                                 |');
            gotoxy(3, j+14); write('---------------------------------------------------');
            gotoxy(5, j+7); write('---------------------------------------------');
            gotoxy(5, j+9); write('Pilih Mobil (Kode Mobil) : '); readln(xIdCar);  
            seek(carRecFile, 0) ;
            find := false ;  
            while not eof(carRecFile) do  
            begin  
                seek(carRecFile, i-1);
                read (carRecFile, carRecArray[i]) ;
                
                if carRecArray[i].IdCar = xIdCar then
                begin  
                    find := true ;  
                    gotoxy(5, j+11); Write('Merk Mobil  : ',carRecArray[i].CarName);
                    gotoxy(5, j+12); Write('Harga Sewa  : ',carRecArray[i].Price:0:0);
                    Car := carRecArray[i].CarName;
                    CostCar := carRecArray[i].Price;
                end; 
                inc(i);  
            end;
            if (not find) then
            begin
                gotoxy(5, j+11); Write('Kode Mobil Tidak Tersedia!');
            end
            else
            
            begin
                gotoxy(3, j+16); write('----PICKUP CAR-------------------------------------');
                gotoxy(3, j+17); write('|                                                 |');
                gotoxy(3, j+18); write('|                                                 |');
                gotoxy(3, j+19); write('|                                                 |');
                gotoxy(3, j+20); write('|                                                 |');
                gotoxy(3, j+21); write('|                                                 |');
                gotoxy(3, j+22); write('---------------------------------------------------');

                transaksiRecArray[i+M].PickupDate:=Now;
                ThisMoment := now;
                gotoxy(5, j+18); Write('Pickup Date    : ',FormatDateTime('DD/MM/YYYY',transaksiRecArray[i+M].PickupDate)); Write('   Jam  : ',FormatDateTime('hh:nn',ThisMoment),' WIB');
                gotoxy(5, j+19); write('Jumlah Hari    :    Hari'); 
                gotoxy(22, j+19); readln(transaksiRecArray[i+M].ReturnDate);
                transaksiRecArray[i+M].IdTransaksi := M+1;
                transaksiRecArray[i+M].CarName := Car;
                transaksiRecArray[i+M].Cost := CostCar;

                gotoxy(58, 1); writeln('Step[2] - Extras');
                gotoxy(58, 2); writeln('=================');
                gotoxy(59, 4);  write('----CAR FITUR INCLUDE-----------------------------');
                gotoxy(59, 5);  write('|                                          |     |');
                gotoxy(59, 6);  write('| Driver (Mandatory) = Rp. 100.000,- [y/t] |     |');
                gotoxy(59, 7);  write('| Gasoline (Include) = Rp. 50.000,-  [y/t] |     |');
                gotoxy(59, 8);  write('| FREE In-Car Wi-Fi  = Rp. -         [y/t] |     |');
                gotoxy(59, 9);  write('| FREE Baby Seats    = Rp. -         [y/t] |     |');
                gotoxy(59, 10); write('|                                          |     |');
                gotoxy(59, 11); write('--------------------------------------------------');
                gotoxy(105, 6); readln(transaksiRecArray[i+M].Driver);
                gotoxy(105, 7); readln(transaksiRecArray[i+M].Gasoline);
                gotoxy(105, 8); readln(transaksiRecArray[i+M].Wifi);
                gotoxy(105, 9); readln(transaksiRecArray[i+M].BabySeats);

                gotoxy(113, 1); writeln('Step[3] - Get Quotation');
                gotoxy(113, 2); writeln('=======================');
                gotoxy(114, 4);  write('----PERSONAL INFORMATION--------------------------');
                gotoxy(114, 5);  write('|                                                |');
                gotoxy(114, 6);  write('| Name           :                               |');
                gotoxy(114, 7);  write('| E-Mail         :                               |');
                gotoxy(114, 8);  write('| Phone Number   :                               |');
                gotoxy(114, 9);  write('| Pickup Address :                               |');
                gotoxy(114, 10); write('|                                                |');
                gotoxy(114, 11); write('--------------------------------------------------');
                gotoxy(133, 6); readln(transaksiRecArray[i+M].Customer);
                gotoxy(133, 7); readln(transaksiRecArray[i+M].email);
                gotoxy(133, 8); readln(transaksiRecArray[i+M].Phone);
                gotoxy(133, 9); readln(transaksiRecArray[i+M].Address);    
            end;
            seek(transaksiRecFile, filesize(transaksiRecFile));
            write(transaksiRecFile, transaksiRecArray[i+M]);
            close(carRecFile);
            close(transaksiRecFile);
    end;

    procedure ShowDataTransaksi(M : integer; transaksiRecArray : ArrayTransaksi);
    begin
        clrscr;
        writeln(M, 'ShowDataTransaksi');
        gotoxy(70,2); write('DAFTAR KESELURUHAN TRANSAKSI MOBIL RENTAL');
        gotoxy(70,3); write('=========================================');
        gotoxy(1,5);  write('=====================================================================================================================================================================');
        gotoxy(1,6);  write('| ID Car   |          Customer         |         Car Name         | Pickup Date | Return Date | Driver | Gasoline | WiFi | BabySeats |        Email       | ');
        gotoxy(1,7);  write('=====================================================================================================================================================================');
        for i := 1 to (M+1) do
        begin
            gotoxy(1, i+7); write('|           |                          |                          |             |             |        |          |      |           |                    |');
            gotoxy(3, i+7); write(transaksiRecArray[i].IdTransaksi);
            gotoxy(14, i+7); write(transaksiRecArray[i].Customer);
            gotoxy(42, i+7); write(transaksiRecArray[i].CarName);
            gotoxy(69, i+7); write(FormatDateTime('DD/MM/YYYY',transaksiRecArray[i].PickupDate));
            gotoxy(83, i+7); write(transaksiRecArray[i].ReturnDate);
            gotoxy(97, i+7); write(transaksiRecArray[i].Driver);
            gotoxy(106, i+7); write(transaksiRecArray[i].Gasoline);
            gotoxy(118, i+7); write(transaksiRecArray[i].WiFi);
            gotoxy(125, i+7); write(transaksiRecArray[i].BabySeats);
            gotoxy(137, i+7); write(transaksiRecArray[i].Email);

        end;
        
        gotoxy(1,i+7);
        write('=====================================================================================================================================================================');
        gotoxy(1,i+9);write('Tekan Enter Untuk Kembali ke menu!');
    end;

    function SubTotal(cost : real; return: integer): real;
    begin
        SubTotal := cost * return;
    end;

    function GrandTotal(drive : char; gas : char; subtotal : real): real;
    begin
        if(drive = 'y') and (gas = 'y') then
            GrandTotal := subtotal + 150000
        else if (drive = 'y') then
            GrandTotal := subtotal + 100000
        else if (gas = 'y') then
            GrandTotal := subtotal + 50000
        else
            GrandTotal := subtotal;
    end;

    procedure InvoiceTransaksi(var M : integer; var transaksiRecArray : ArrayTransaksi);
    var
        xIdTransaksi, j, data : integer;
        cost, kembalian, bayar    : real;
        find    : boolean;
    begin
        clrscr;
        OpenDatabaseTransaksi(transaksiRecArray);
        
        gotoxy(77, 1); write('INVOICE TRANSAKSI');
        gotoxy(77, 2); write('=================');
        gotoxy(50, 4); write('----Booking Customer------------------------------------------------');
        gotoxy(50, 5); write('|                                                                   |');
        gotoxy(50, 6); write('|                                                                   |');
        gotoxy(52, 6); write('----------------------------------------------------------------');
        for j := 1 to filesize(transaksiRecFile) do
        begin
            gotoxy(50, j+6); write('|                                                                   | ');
            gotoxy(52, j+6); write('|        |                             |                       |');
            gotoxy(57, j+6); write(transaksiRecArray[j].IdTransaksi);
            gotoxy(66, j+6); write(transaksiRecArray[j].Customer);
            gotoxy(96, j+6); write(transaksiRecArray[j].CarName);
        end;
        gotoxy(50, j+7); write('|                                                                   |');
        gotoxy(50, j+8); write('|                                                                   |');
        gotoxy(50, j+9); write('|                                                                   |');
        gotoxy(50, j+10); write('|                                                                   |');
        gotoxy(50, j+11); write('|                                                                   |');
        gotoxy(50, j+12); write('|                                                                   |');
        gotoxy(50, j+13); write('|                                                                   |');
        gotoxy(50, j+14); write('---------------------------------------------------------------------');
        gotoxy(52, j+7); write('----------------------------------------------------------------');
        gotoxy(52, j+9); write('Pilih No Transaksi : '); readln(xIdTransaksi);  
        seek(transaksiRecFile, 0) ;
        find := false ;  
        i := 1;
        while not eof(transaksiRecFile) do  
        begin  
            seek(transaksiRecFile, i-1);
            read (transaksiRecFile, transaksiRecArray[i]) ;
            
            if transaksiRecArray[i].IdTransaksi = xIdTransaksi then
            begin  
                find := true ;  
                gotoxy(55, j+11); Write('Customer    : ',transaksiRecArray[i].Customer);
                gotoxy(55, j+12); Write('Merk Mobil  : ',transaksiRecArray[i].CarName);
                gotoxy(50, j+15); write('Tekan Enter untuk melanjutkan proses Invoice Transaksi!'); readln;
            end; 
            
            data := i;
            inc(i);  
        end;
        
        if (not find) then
        begin
            gotoxy(5, j+11); Write('Anda salah memasukan data!');
        end
        else
        begin
           clrscr;
           gotoxy(1, 1);write('Data',xIdTransaksi);
            gotoxy(77, 1); write('INVOICE TRANSAKSI');
            gotoxy(77, 2); write('=================');
            gotoxy(50, 4);write('-----------------------------------------------------------------------------');
            gotoxy(50, 5);write('| No.      | Merk             | Harga          | lama      | Sub            |');
            gotoxy(50, 6);write('|          | Mobil            | Perhari        | Rental    | Total          |');
            gotoxy(50, 7);write('-----------------------------------------------------------------------------');
            gotoxy(50, 8);write('| 1        |                  | Rp.            |      Hari | Rp.            |');
            gotoxy(50, 9);write('=============================================================================');
            gotoxy(63, 10);write(transaksiRecArray[xIdTransaksi].CarName);
            gotoxy(86, 10);write(transaksiRecArray[xIdTransaksi].Cost:0:0);
            gotoxy(101, 10);write(transaksiRecArray[xIdTransaksi].ReturnDate);
            transaksiRecArray[xIdTransaksi].Cost := SubTotal(transaksiRecArray[xIdTransaksi].Cost, transaksiRecArray[xIdTransaksi].ReturnDate);
            gotoxy(115, 10);write(transaksiRecArray[xIdTransaksi].Cost:0:0);
            gotoxy(50, 12);write('-----------------------------------------------------------------------------');
            gotoxy(50, 13);write('| Fasilitas tambahan                                       |                |');
            gotoxy(50, 14);write('-----------------------------------------------------------|                |');
            gotoxy(50, 15);write('| No.      | Sopir      | Gasoline   | Sub    + Sopir      |                |');
            gotoxy(50, 16);write('|          |            |            | Total  + Gasoline   | Rp.            |');
            gotoxy(50, 17);write('|----------------------------------------------------------|                |');
            gotoxy(50, 18);write('| 1        |            |            | Rp.                 |                |');
            gotoxy(50, 19);write('============================================================================='); 
            gotoxy(63, 18);write(transaksiRecArray[xIdTransaksi].Driver);
            gotoxy(76, 18);write(transaksiRecArray[xIdTransaksi].Gasoline);
            cost := GrandTotal(transaksiRecArray[xIdTransaksi].Driver, transaksiRecArray[xIdTransaksi].Gasoline, transaksiRecArray[xIdTransaksi].Cost);
            gotoxy(93, 18);write(cost:0:0); 
            gotoxy(115, 16);write(cost:0:0);
            readln;
            gotoxy(92, 21);write('Harga Sewa/hari   : Rp. ', transaksiRecArray[xIdTransaksi].Cost:0:0);
            if (transaksiRecArray[xIdTransaksi].driver = 'y') and (transaksiRecArray[xIdTransaksi].Gasoline = 'y')  then
            begin
                gotoxy(92, 22);write('Sopir             : Rp. 100000');  
                gotoxy(92, 23);write('Gasoline          : Rp. 50000');  
            end
            else if (transaksiRecArray[xIdTransaksi].driver = 'y') then
            begin
                gotoxy(92, 22);write('Sopir             : Rp. 100000');  
                gotoxy(92, 23);write('Gasoline          : Rp. 0');  
            end
            else if (transaksiRecArray[xIdTransaksi].Gasoline = 'y') then
            begin
                gotoxy(92, 22);write('Sopir             : Rp. 0');
                gotoxy(92, 23);write('Gasoline          : Rp. 50000');
            end
            else
            begin
                gotoxy(92, 22);write('Sopir             : Rp. 0'); 
                gotoxy(92, 23);write('Gasoline          : Rp. 0');
            end;
            
            
            gotoxy(92, 24);write('===================================');
            gotoxy(92, 25);write('Grand Total       : Rp. ', cost:0:0);
            gotoxy(92, 26);write('===================================');
            gotoxy(92, 28);write('Bayar             : Rp. ');readln(bayar);
            while(bayar <= cost) do
            begin
                gotoxy(92, 29);write('Maaf uang anda kurang, ulangi!');
                readln;
                gotoxy(92, 29); clreol;
                gotoxy(116, 28); readln(bayar);
            end;
            kembalian := bayar - cost;
            gotoxy(92, 30);write('Kembalian         : Rp. ', kembalian:0:0);

        end;
        close(transaksiRecFile);
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
        gotoxy(1,i+13);write('Tekan Enter Untuk Kembali ke menu!');
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
        i, j, k    : integer;
        temp       : ArrayCar;
        row        : integer;
        IdCarSearch       : String;
    begin
        gotoxy(60, 1); write('=============================      ========================');
        gotoxy(60, 2); Write('| Id Mobil Yang Di Cari     |  =>  |                      |');
        gotoxy(60, 3); write('=============================      ========================'); 
        
        gotoxy(97, 2); readln(IdCarSearch);
        RegexObj := TRegExpr.Create;
        RegexObj.Expression := IdCarSearch;
        i := 1;
        k := 0;
        while (i <= N) do
        begin
            if RegexObj.Exec(carRecArray[i].IdCar) then
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
    
    procedure SearchNameCar(N : integer; carRecArray : ArrayCar);
    var
        i, j, k    : integer;
        temp       : ArrayCar;
        row        : integer;
        CarNameSearch       : String;
    begin
        gotoxy(60, 1); write('=============================      ========================');
        gotoxy(60, 2); Write('|  Merk Mobil Yang Di Cari  |  =>  |                      |');
        gotoxy(60, 3); write('=============================      ========================'); 
        
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

    procedure SearchCarYear(N : integer; carRecArray : ArrayCar);
    var
        i, j, k    : integer;
        temp       : ArrayCar;
        row        : integer;
        YearCarSearch : string;
    begin
        gotoxy(60, 1); write('=============================      ========================');
        gotoxy(60, 2); Write('|  Harga Mobil Yang Di Cari |  =>  |                      |');
        gotoxy(60, 3); write('=============================      ========================'); 
        
        gotoxy(97, 2); readln(YearCarSearch);
        RegexObj := TRegExpr.Create;
        RegexObj.Expression := YearCarSearch;
        i := 1;
        k := 0;
        while (i <= N) do
        begin
            if RegexObj.Exec(carRecArray[i].Year) then
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
textbackground(9);
clrscr;
LoginProgram;
if (Login(NP, KS)) then //login sukses
begin
repeat
    OpenDatabase(carRecArray);
    close(carRecFile);
    OpenDatabaseTransaksi(transaksiRecArray);
    close(transaksiRecFile);
    clrscr;
    MainMenu(menu);
    case (menu) of
        1 : begin
            clrscr;
            TransaksiRental(carRecArray, transaksiRecArray); readln;
        end;

        2 : begin
            clrscr;
            ShowDataTransaksi(M, transaksiRecArray); readln;
        end;

        3 : begin
            InvoiceTransaksi(M, transaksiRecArray); readln;
        end;

        4 : begin
            clrscr;
            InputNewCar(carRecArray); readln;
        end;

        5 : begin
            Sort(N, carRecArray);
            Overwrite;
            ShowDataCar(N, carRecArray);
        end;   
        6 : begin
            clrscr;
            DeleteData; readln;
        end;
        7 : begin
            clrscr;
            SearchIdCar(N, carRecArray); readln;
        end;
        8 : begin
            clrscr;
            SearchNameCar(N, carRecArray); readln;
        end;
        9 : begin
            clrscr;
            SearchCarYear(N, carRecArray); readln;
        end;
    end;
until (menu = 0);
end
else // 3 kali salah login
begin
    write('Maaf, Sudah 3 kali salah Login!'); readln;
end;
End.
