program Looping_Pangkat;
uses crt;

var
   a, b, i, pangkat : integer;
begin
     write('Masukan nilai   : '); readln(a);
     write('Masukan pangkat : '); readln(b);
     writeln('----------------------');
     while(b < 0) do
     begin
          writeln('Pangkat tidak boleh negatif!');
          write('Masukan pangkat : '); readln(b);
     end;

     write(a,' Pangkat ',b,' = ');
     if(b = 0)
          then
          begin
               pangkat := 1;
               writeln(pangkat);
          end
     else
     begin
          pangkat := 1;
          for i := 1 to b do
          begin
              write(a);
              pangkat := pangkat * a;
              if(i <> b) then
                  write(' x ');
          end;
     end;

      write(' = ', pangkat);
   readln;
end.
