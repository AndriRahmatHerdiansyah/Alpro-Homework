program selection-sort;
uses crt;

const 
    maks = 2;

var 

    procedure UrutDataBuku(N : integer; var BK : Buku);
    {I. S. : banyaknya data (N) dan data buku sudah terdefinisi}
    {F. S. : menghasilkan data buku yang sudah terurut berdasarkan kode}
    var
        i, j, min   : integer;
        temp        : DataBuku;
    begin
        // metode minimum sort secara ascending
        for i := 1 to (N-1) do
        begin
            min := i;
            for j := (i + 1) to N do
            begin
                if (BK[j].KodeBuku < BK[min].KodeBuku) then
                    min := j;
            end;
            temp    := BK[i];
            BK[i]   := BK[min];
            BK[min] := temp;
        end;
    end;

begin
    
end.