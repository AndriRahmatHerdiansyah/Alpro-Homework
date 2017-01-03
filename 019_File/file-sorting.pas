program sort_highscore;

var 
textfile:text;
list:array[1..10] of integer;
i,j,temp:integer;

begin
assign(textfile,'book2.txt'); { choose file }
reset(textfile); { open file }
    for i:=1 to 10 do readln(textfile,list[i]); { read data }
close(textfile); { close file }

for i:=1 to 10 do 
writeln(i,'. ',list[i]); { display list - unsorted }

{ sort the list }

for i:=1 to 9 do { scan list }
for j:=i to 10 do
if list[j]<list[i] then { check if lower value found }
begin { and swap the values } 
temp:=list[i]; 
list[i]:=list[j];
list[j]:=temp; 
end; 

for i:=1 to 10 do 
writeln(i,'. ',list[i]); { display list - sorted }

assign(textfile,'book2-sorted.txt'); { save as new file }
rewrite(textfile);
for i:=1 to 10 do writeln(textfile,list[i]);
close(textfile);

end.
