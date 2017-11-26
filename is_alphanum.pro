FUNCTION is_alphanum, arg

   ;Sec-Doc
   ;  PURPOSE: This function returns 1 if the type of arg is either
   ;  STRING (7) or one of the numeric types: BYTE (1), INT (2), LONG (3),
   ;  FLOAT (4), DOUBLE (5), COMPLEX (6), DCOMPLEX (9), UINT (12), ULONG
   ;  (13), LONG64 (14) or ULONG64 (15), and 0 otherwise.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE().
   ;
   ;  SYNTAX: res = is_alphanum(arg)
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
   ;  *   This function returns 1 if the type of arg is alphanumeric, and
   ;      0 otherwise.
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
   ;      IDL> PRINT, is_alphanum('Hi')
   ;             1
   ;
   ;      IDL> PRINT, is_alphanum(1.2)
   ;             1
   ;
   ;      IDL> PRINT, is_alphanum(PTR_NEW(0b))
   ;             0
   ;
   ;      IDL> PRINT, is_alphanum()
   ;             0
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2017–11–20: Version 1.0 — Initial public release.
   ;
   ;
   ;Sec-Lic
   ;  INTELLECTUAL PROPERTY RIGHTS
   ;
   ;  *   Copyright (C) 2017 Michel M. Verstraete.
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
   ;
   ;
   ;Sec-Cod
   ;  Assess the type of the argument 'arg':
   res = SIZE(arg, /TYPE)
   IF (((res GT 0) AND (res LT 8)) OR $
      (res EQ 9) OR $
      ((res GT 11) AND (res LT 16))) $
      THEN RETURN, 1 ELSE RETURN, 0

END
