Program Example1;

{ This program demonstrates the Date function }

uses sysutils;

Var YY,MM,DD : Word;
ThisMoment : TDateTime;
    
Begin
 ThisMoment:=Now;
  Writeln ('Now : ',FormatDateTime('hh:nn',ThisMoment));
  Writeln ('Now : ',FormatDateTime('DD MM YYYY',ThisMoment));
  Writeln ('Now : ',FormatDateTime('c',ThisMoment));
 
 Writeln ('Date : ',Date:0:1);


 Writeln(DayOfWeek(Date) + 1);
Writeln ('The time is : ',TimeToStr(Time));
 DeCodeDate (Date,YY,MM,DD);
 Writeln (format ('Date is (DD/MM/YY): %d/%d/%d ',[dd,mm,yy]));
End.