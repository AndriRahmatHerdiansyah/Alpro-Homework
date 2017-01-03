const
 maxrec = 50;

type
 MyRecord = record
             name: string[63];
             date: tdatetime;
             score: integer
            end;

var
 myfile: file of myrecord;
 rec: myrecord;
 data: array [1..maxrec] of myrecord;
 i, j, count: integer;

begin
 fillchar (data, sizeof (data), 0);
 assignfile (myfile, '.....');
 reset (myfile);
 read (myfile, rec);
 count:= 0;
 while not eof (myfile) do 
  begin
   i:= 1;
   while (i <= count) and (rec.score > data[i].score) do inc (i);   //**
   for j:= i to count do data[j+1]:= data[j];                       //**
   data[i]:= rec;
   inc (count);
  end;

 closefile (myfile);
 assignfile (myfile, 'book2.txt');
 rewrite (myfile);
 for i:= 1 to count do write (myfile, data[i]);
 closefile (myfile);
end;