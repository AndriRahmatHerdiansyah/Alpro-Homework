program Books_sort;
uses
	crt;
const
	MaxBooks = 50;
	Username = 'alarai';
	Password = '10116006';
type
	BookRecord = record
		code,title : string;
		qty        : integer;
	end;
	Books = array[1..MaxBooks] of BookRecord;
var
	Book 	   : Books;
	TotalBooks : integer;
	isLogin	   : boolean;

function SortAsc(Book : Books) : Books;
var
	i,j : integer;
	tempBook : Books;
begin
	for i := 1 to TotalBooks - 1 do
	begin
		for j := TotalBooks downto i + 1 do
		begin
			if Book[j].code < Book[j-1].code then
			begin
				tempBook[1]:= Book[j];
				Book[j]    := Book[j-1];
				Book[j - 1]:= tempBook[1];
			end;
		end;
	end;
	SortASC := Book;
end;

function SortDesc(Book : Books) : Books;
var
	i,j : integer;
	tempBook : Books;
begin
	for i := 1 to TotalBooks - 1 do
	begin
		for j := 1 to TotalBooks do
		begin
			if Book[j].code < Book[j+1].code then
			begin
				tempBook[1]:= Book[j];
				Book[j]    := Book[j+1];
				Book[j + 1]:= tempBook[1];
			end;
		end;
	end;
	SortDesc := Book;
end;

procedure Login(var isLogin : boolean);
var
	login_chance : integer;
	uname,pass   : string;
begin
	login_chance := 3;
	isLogin		 := true;
	repeat
        clrscr;
		gotoxy(33,1);writeln('< < Login > >');
		gotoxy(33,2);writeln('-------------');
		gotoxy(27,4);write('U s e r n a m e : ');
		gotoxy(27,5);write('P a s s w o r d : ');
		gotoxy(45,4);readln(uname);
		gotoxy(45,5);readln(pass);
		if(uname <> Username) or (pass <> Password) then
		begin
			login_chance := login_chance - 1;
			gotoxy(25,7);writeln('Username atau password salah');
			gotoxy(25,8);writeln('Kesempatan untuk login tersisa ',login_chance);
			readln;
		end;
	until(((uname = Username) and (pass = Password)) or (login_chance = 0));
	if(login_chance = 0) then
	begin
		isLogin := false;
	end;
end;

procedure InsertBook(var Book : Books);

var
	row,i : integer;
begin
	clrscr;
	row := 0;
	writeln('Isi Data');
	write('Masukkan Jumlah Buku   : ');readln(TotalBooks);
  	while (TotalBooks <= 0) or (TotalBooks > MaxBooks) do
  	begin
    	writeln('Jumlah Mahasiswa Hanya 1 - ',MaxBooks,', Tekan Enter Untuk Ulangi');
    	readln;
    	gotoxy(1,2);clreol;
    	gotoxy(1,1);clreol;
    	write('Masukkan Jumlah Buku   : ');readln(TotalBooks);
  	end;
  	row := row + 2;
  	gotoxy(1,row + 1);writeln('DAFTAR BUKU');
  	gotoxy(1,row + 2);writeln('----------------------------------------------------');
  	gotoxy(1,row + 3);writeln('| NO |   K O D E   |     JUDUL BUKU     |  JUMLAH  |');
  	gotoxy(1,row + 4);writeln('----------------------------------------------------');
  	row := row + 4;
  	for i := 1 to TotalBooks do
  	begin
  		gotoxy(1,row + i);
  		writeln('|    |             |                    |          |');
  		gotoxy(3,row + i);write(i);
  		gotoxy(8,row + i);readln(Book[i].code);
  		gotoxy(24,row + i);readln(Book[i].title);
  		gotoxy(44,row + i);readln(Book[i].qty);
  	end;
  	gotoxy(1,row + i + 1);writeln('----------------------------------------------------');
  	gotoxy(1,row + i + 2);writeln('Tekan Enter Untuk Kembali');
    readln;
end;

procedure fetchData(Book :Books;Filter : string);
var
	row,i : integer;
begin
	clrscr;
	row := 0;
	gotoxy(1,row + 1);writeln('Data Buku');
	gotoxy(1,row + 2);writeln('Di Sorting Secara ', Filter);
  	gotoxy(1,row + 3);writeln('----------------------------------------------------');
  	gotoxy(1,row + 4);writeln('| NO |   K O D E   |     JUDUL BUKU     |  JUMLAH  |');
  	gotoxy(1,row + 5);writeln('----------------------------------------------------');
  	row := row + 5;
  	for i := 1 to TotalBooks do
  	begin
  		gotoxy(1,row + i);
  		writeln('|    |             |                    |          |');
  		gotoxy(3,row + i);write(i);
  		gotoxy(8,row + i);writeln(Book[i].code);
  		gotoxy(24,row + i);writeln(Book[i].title);
  		gotoxy(44,row + i);writeln(Book[i].qty);
  	end;
  	gotoxy(1,row + i + 1);writeln('----------------------------------------------------');
  	gotoxy(1,row + i + 2);writeln('Tekan Enter Untuk Kembali');
	readln;
end;

procedure ShowBook(Book:Books);
var
	SortMethod : integer;
begin
	clrscr;
		if TotalBooks > 1 then
		begin
			writeln('Urutkan');
	   		writeln('------------');
			writeln('1. Ascending (A-Z 0-9)');
			writeln('2. Descending (Z-A 9-0)');
			write('Pilihan   : ');readln(SortMethod);
			while (SortMethod > 2) or (SortMethod < 0) do
	        begin
	          gotoxy(1, 6);
	          writeln('Menu Tidak Valid!, Hanya Ada Pilihan Menu 0-2!, Tekan Enter Untuk Ulangi');
	          readln;
	          gotoxy(1, 6);clreol;
	          gotoxy(1, 5);clreol;write('Pilihan   : ');readln(SortMethod);
	        end;
	        case SortMethod of
	        	1 :begin
	        		fetchData(SortAsc(Book),'Ascending');
	        	end;
	        	2 : begin
	        		fetchData(SortDesc(Book),'Descending');
	        	end;
	        end;
	    end
	    else
	    begin
	    	writeln('Tidak ada Data Buku');
	    	readln;
        end;
end;

procedure Menu(var book : Books);
var
	choice : integer;
begin
	if isLogin then
	begin
		  repeat
			clrscr;
			writeln('Memilih Menu');
   			writeln('------------');
			writeln('1. Mengisi Buku');
			writeln('2. Melihat Data Buku');
			writeln('0. Keluar');
			write('Pilih Menu : ');readln(choice);
            while (choice > 2) or (choice < 0) do
            begin
              gotoxy(1, 7);
              writeln('Menu Tidak Valid!, Hanya Ada Pilihan Menu 0-2!, Tekan Enter Untuk Ulangi');
              readln;
              gotoxy(1, 7);clreol;
              gotoxy(1, 6);clreol;write('Pilih Menu : ');readln(choice);
            end;
			case choice of
				1 : begin
                   InsertBook(book);
				end;

				2: begin
                   ShowBook(book);
				end;
			end;
		  until(choice = 0);
	end;
end;
begin
	Login(isLogin);
 	Menu(Book);
end. 