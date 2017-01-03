program CreateFile;
 
uses
 Sysutils;
 
Type
	Str25    = String[25];
	TBookRec = Record
        Title, Author, ISBN : Str25;
        Price : Real;
    End;

Var
	bookRecArray : Array[1..2] of TBookRec;
	tempBookRec  : Array[1..2] of TBookRec;
	bookRecFile  : File of TBookRec;
	i            : 1..2;

	Procedure EnterNewBook(var newBook : TBookRec);
	Begin
		Writeln('Please enter the book details: ');
		Write('ISBN: ');
		Readln(newBook.ISBN);
		Write('Book Name: ');
		Readln(newBook.Title);
		Write('Author: ');
		Readln(newBook.Author);
		Write('Price: ');
		Readln(newBook.Price);
	End;

	procedure sort;
	var
		i, j : integer;
		temp : integer;
	begin
		
	end;

Begin
	Assign(bookRecFile, 'bookrec.txt');
	

	For i := 1 to 2 do
	Begin
		EnterNewBook(bookRecArray[i]);
		{ bookRecArray[i] now contains the book details }
		Append(bookRecFile);
		Write(bookRecFile, bookRecArray[i]);
	End;



	Close(bookRecFile);



	Writeln('They are saved in a file!');
	Write('Now choose a record to display from 1 to 2: ');
	Readln(i);

	ReSet(bookRecFile);
	Seek(bookRecFile, i-1);
	Read(bookRecFile, tempBookRec);
	Close(bookRecFile);
	Writeln('Here are the book details of record #',i,':');
	Writeln;
	Writeln('ISBN:   ', tempBookRec.ISBN);
	Writeln('Title:  ', tempBookRec.Title);
	Writeln('Author: ', tempBookRec.Author);
	Writeln('Price:  ', tempBookRec.Price:0:0);
	Readln;
End.