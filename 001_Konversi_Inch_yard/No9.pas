program Untitled;
uses crt;

var
   PanjangMeter, Yard, Kaki, Inch : real;

begin
   write('Masukan Panjang Bidang : ');readln(PanjangMeter);
   Inch := PanjangMeter / 25.4;
   Kaki := PanjangMeter / 30.48;
   Yard := PanjangMeter * 0.9144;
    writeln('=====================');
	writeln(Yard:4:2,' Yard ',Kaki:4:2,' Kaki ',Inch:4:2,' Inch')
end.
