FUNCTION is_numstring, arg

   ;Sec-Doc
   ;  PURPOSE: This function returns 1 if the type of arg is STRING and
   ;  all characters of that string are digits (0 to 9), or the + or -
   ;  signs, or the decimal point, and 0 otherwise.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE()
   ;  to determine whether the argument is a STRING, and then check that
   ;  each and every character in that string is a digit, or a sign, or
   ;  the decimal point.
   ;
   ;  SYNTAX: res = is_numstring(arg)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   arg [I]: An arbitrary expression.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: INTEGER.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns 1 if arg is of type STRING and each
   ;      character of that string is either a digit, or a sign, or a
   ;      decimal point, and 0 otherwise.
   ;
   ;  EXCEPTION CONDITIONS: None.
   ;
   ;  DEPENDENCIES: None.
   ;
   ;  REMARKS:
   ;
   ;  *   NOTE 1: This function accepts any type of input argument,
   ;      including no argument at all, in which case it returns 0.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> a = '123'
   ;      IDL> PRINT, is_numstring(a)
   ;             1
   ;
   ;      IDL> b = '2*4/3'
   ;      IDL> PRINT, is_numstring(b)
   ;             0
   ;
   ;      IDL> c = '-567.89'
   ;      IDL> PRINT, is_numstring(c)
   ;             1
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2018–08–07: Version 0.9 — Initial release.
   ;Sec-Lic
   ;  INTELLECTUAL PROPERTY RIGHTS
   ;
   ;  *   Copyright (C) 2017-2018 Michel M. Verstraete.
   ;
   ;      Permission is hereby granted, free of charge, to any person
   ;      obtaining a copy of this software and associated documentation
   ;      files (the “Software”), to deal in the Software without
   ;      restriction, including without limitation the rights to use,
   ;      copy, modify, merge, publish, distribute, sublicense, and/or
   ;      sell copies of the Software, and to permit persons to whom the
   ;      Software is furnished to do so, subject to the following
   ;      conditions:
   ;
   ;      The above copyright notice and this permission notice shall be
   ;      included in all copies or substantial portions of the Software.
   ;
   ;      THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
   ;      EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
   ;      OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
   ;      NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
   ;      HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
   ;      WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
   ;      FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
   ;      OTHER DEALINGS IN THE SOFTWARE.
   ;
   ;      See: https://opensource.org/licenses/MIT.
   ;
   ;  *   Feedback
   ;
   ;      Please send comments and suggestions to the author at
   ;      MMVerstraete@gmail.com.
   ;Sec-Cod

   IF (SIZE(arg, /TYPE) EQ 7) THEN BEGIN
      arglen = STRLEN(arg)
      FOR i = 0, arglen - 1 DO BEGIN
         char = STRMID(arg, i, 1)
         idx = WHERE(char EQ ['0', '1', '2', '3', '4', '5', $
            '6', '7', '8', '9', '+', '-', '.'], count)
         IF (count NE 1) THEN RETURN, 0
      ENDFOR
      RETURN, 1
   ENDIF ELSE RETURN, 0

END
