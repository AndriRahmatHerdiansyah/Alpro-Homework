program pos_trial;

Var
  S : String;

begin

  S:='Andri Rahmat Herdiansyah';
//   Writeln (S,pos('Andri',S));
  S:='The last letter of the alphabet doesn''t appear in this sentence ';
  If (pos('Andri',S) <> 0) then
    Writeln (S);
end.