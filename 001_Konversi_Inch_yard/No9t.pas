program Untitled;
uses crt;

var
   PanjangBidang, Yard, Kaki, Inch : real;

begin
   write('Masukan Panjang Bidang : ');readln(PanjangBidang);
   Inch := PanjangBidang * 1000 / 25.4;
   Kaki := PanjangBidang * 100 / 30.48;
   Yard := PanjangBidang / 0.9144;
   writeln('--------------------');
   writeln(Inch:4:2,' Inch');
   writeln(Kaki:4:2,' Kaki');
   writeln(Yard:4:2,' Yard');


   readln;
end.
