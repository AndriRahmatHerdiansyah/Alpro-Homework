program regexprs;
uses regexpr;

var
  RegexObj: TRegExpr;
  text : string;

begin
  RegexObj := TRegExpr.Create;
  readln(text);
  RegexObj.Expression := text;
  if RegexObj.Exec('Please try to login here') then 
    WriteLn('The login was found!')
   else
    WriteLn('not found!');
  RegexObj.Free;
end.