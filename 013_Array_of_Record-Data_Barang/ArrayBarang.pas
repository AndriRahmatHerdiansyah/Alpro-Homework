program ArrayBarang;
uses
    crt, sysutils;
const
     maksbrg = 3;
type
    arrStr = array[1..maksbrg] of string;
    arrInt = array[1..maksbrg] of longint;
var
  kode, tempKode, namabrg, status: arrStr;
  harga, stok: arrInt;
  currLen: integer;

function isEmpty(kd: string): boolean;
begin
  isEmpty := false;
  if (kd = '') then
    isEmpty := true;
end;

function isInvalid(kd: string): boolean;
var len01, len02, len03: integer;
begin
  len01 := comparetext(kd, 'brg01'); // case-insensitive
  len02 := comparetext(kd, 'brg02');
  len03 := comparetext(kd, 'brg03');
  isInvalid := false;
  if (len01 <> 0) and (len02 <> 0) and (len03 <> 0) then
    isInvalid := true
end;

function isEqual(kode1, kode2: string): boolean;
begin
  isEqual := false;
  if (kode1 = kode2) then
    isEqual := true;
end;

procedure sort;
var
    prevUnsorted, i: integer;
    swapped: boolean;
    temp: string;
begin
  // using bubble sort algorithm
  repeat
    swapped := false;
    prevUnsorted := currlen;
    for i := 1 to prevUnsorted do begin
        if (tempKode[i] > tempKode[i + 1]) then begin
          temp := tempKode[i];
          tempKode[i] := tempKode[i + 1];
          tempKode[i + 1] := temp;
          swapped := true;
          // writeln('swapped');
        end;
        // writeln('maximum reached');
    end;
    prevUnsorted := prevUnsorted - 1;
    // writeln('mark previous max, as sorted element');
  until (swapped);

  // for i := 1 to maksbrg do begin
  //   writeln(tempKode[i]);
  // end;
end;

function isSorted(kd: arrStr): boolean;
begin
  // if 

end;

function isEqualInList(kd: string): boolean;
var
  found: boolean;
  first, mid, last: integer;
begin
  // using binary search algorithm
  // even though it's doesn't have to.
  // due to small element in the list / array
  // use linear search instead.
  found := false;
  first := 1; last := currLen;
  while (not found) and (first <= last) {and (isSorted(kode))} do begin
    mid := (first + last) div 2;
    if kd < tempKode[mid] then
      last := mid - 1
    else if kd > tempKode[mid] then
      first := mid + 1
    else
        found := true;
  end;

  // if (found) then
  //   writeln('value of ', num, ' is already exists');
  isEqualInList := found;
end;

function  konversinamabrg(kode:string) : string;
{I.S                    }
{F.S                    }
begin
     if ( kode='BRG01' ) or ( kode='brg01' ) or ( kode='Brg01' ) then begin
            konversinamabrg := 'Pakaian';
     end else if  ( kode='BRG02' ) or ( kode='brg02' ) or ( kode='Brg02' ) then begin
        konversinamabrg := 'Sepatu';
     end else if ( kode='BRG03' ) or ( kode='brg03' ) or ( kode='Brg03' ) then begin
        konversinamabrg := 'Tas';
     end;

end;//endfunction

function konversiharga(kode:string): longint;
{I.S                     }
{F.S                     }
begin
    if ( kode='BRG01' ) or ( kode='brg01' ) or ( kode='Brg01' ) then begin
        konversiharga := 67500;
    end else if ( kode='BRG02' ) or ( kode='brg02' ) or ( kode='Brg02' ) then begin
        konversiharga := 118000;
    end else if ( kode='BRG03' ) or ( kode='brg03' ) or ( kode='Brg03' ) then begin
        konversiharga := 72500;
    end;
end;//endfungction

 function konversistatus(stok:integer): string;
 {I.S          }
 {F.S          }
 begin
      if ( stok >= 20 ) then
      begin
          konversistatus := 'Aman';
      end
      else
          begin
             konversistatus:= 'Tidak Aman';
          end;

 end;//endfunction


procedure tampildata ();
var
   i : integer;
begin//mulai procedure
clrscr;
gotoxy(35,2); writeln('STOCK TOKO');
gotoxy(6,3);
writeln('----------------------------------------------------------------------');
gotoxy(6,4);
writeln('| No | Kode Barang | Nama Barang | Harga Satuan | Stock | Status     |');
gotoxy(6,5);
writeln('----------------------------------------------------------------------');
       for i := 1 to maksbrg do
       begin
            gotoxy(6,i+5); writeln('|    |             |             |              |       |            |');
            gotoxy(8,i+5);write(i);
            gotoxy(13,i+5);readln(kode[i]);

            // cek kode yang kosong
            while (isEmpty(kode[i])) do
            begin
                gotoxy(16,i+6); write('Kode Barang Tidak Boleh Kosong!'); readln;//47
                gotoxy(16,i+6);clreol;
                gotoxy(13,i+5);readln(kode[i]);
            end;
            
            // cek kode yang salah
            while (isInvalid(kode[i])) do
            begin
                gotoxy(16,i+6); write('Kode Barang Salah!'); readln;//47
                gotoxy(16,i+6);clreol;
                gotoxy(13,i+5);readln(kode[i]);
            end;
            
            // cek kode yang sama
            while (isEqualInList(kode[i])) do begin
              gotoxy(16,i+6); write('Kode Barang Sama!'); readln;//47
              gotoxy(16,i+6); clreol;
              gotoxy(13,i+5); readln(kode[i]);
            end;

            namabrg[i]:= konversinamabrg(kode[i]);// Masukan ke array namabrg dengan fungsi konversinamabrg(kode)
            gotoxy(27,i+5);write(namabrg[i]);
            harga[i]:= konversiharga(kode[i]); // Masukan ke array harga dengan fungsi konversiharga(kode)
            gotoxy(41,i+5);write(harga[i]);
            gotoxy(56,i+5);readln(stok[i]);
            status[i]:= konversistatus(stok[i]);// Masukan ke array STATUS dengan fungsi konversistatus(stok)
            gotoxy(64,i+5);write(status[i]);
            
            // store previous code, in temp variable
            tempKode[i] := kode[i];
            currLen := i;
            if i > 1 then
              sort; // sort the element first
       end;
gotoxy(6,i+6);
writeln('----------------------------------------------------------------------');

end;//end procedure memasukan




begin // algoritma utama
      tampildata();
    readln;
end.
