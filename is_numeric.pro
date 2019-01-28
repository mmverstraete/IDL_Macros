FUNCTION is_numeric, arg

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter arg is a number or not.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE()
   ;  to determine the type of the input positional parameter.
   ;
   ;  SYNTAX: res = is_numeric(arg)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   arg [I]: An arbitrary expression.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: INT.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns 1 if arg is of one of the numeric types
   ;      (type codes 1, 2, 3, 4, 5, 6, 9, 12, 13, 14, or 15), and 0
   ;      otherwise.
   ;
   ;  EXCEPTION CONDITIONS: None.
   ;
   ;  DEPENDENCIES: None.
   ;
   ;  REMARKS:
   ;
   ;  *   NOTE 1: This function accepts any type of input positional
   ;      parameter, including none at all, in which case it returns 0.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> .reset
   ;      IDL> PRINT, is_numeric(zzz)
   ;             0
   ;
   ;      IDL> a = 12B
   ;      IDL> res = is_numeric(a)
   ;      IDL> PRINT, res
   ;             1
   ;
   ;      IDL> b = 'Hello'
   ;      IDL> res = is_numeric(b)
   ;      IDL> PRINT, res
   ;             0
   ;
   ;      IDL> c = 12.3
   ;      IDL> res = is_numeric(c)
   ;      IDL> PRINT, res
   ;             1
   ;
   ;      IDL> PRINT, is_numeric()
   ;             0
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2017–11–20: Version 1.0 — Initial public release.
   ;
   ;  *   2019–01–28: Version 2.00 — Systematic update of all routines to
   ;      implement stricter coding standards and improve documentation.
   ;Sec-Lic
   ;  INTELLECTUAL PROPERTY RIGHTS
   ;
   ;  *   Copyright (C) 2017-2019 Michel M. Verstraete.
   ;
   ;      Permission is hereby granted, free of charge, to any person
   ;      obtaining a copy of this software and associated documentation
   ;      files (the “Software”), to deal in the Software without
   ;      restriction, including without limitation the rights to use,
   ;      copy, modify, merge, publish, distribute, sublicense, and/or
   ;      sell copies of the Software, and to permit persons to whom the
   ;      Software is furnished to do so, subject to the following three
   ;      conditions:
   ;
   ;      1. The above copyright notice and this permission notice shall
   ;      be included in its entirety in all copies or substantial
   ;      portions of the Software.
   ;
   ;      2. THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
   ;      KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
   ;      WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
   ;      AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
   ;      HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
   ;      WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
   ;      FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
   ;      OTHER DEALINGS IN THE SOFTWARE.
   ;
   ;      See: https://opensource.org/licenses/MIT.
   ;
   ;      3. The current version of this Software is freely available from
   ;
   ;      https://github.com/mmverstraete.
   ;
   ;  *   Feedback
   ;
   ;      Please send comments and suggestions to the author at
   ;      MMVerstraete@gmail.com
   ;Sec-Cod

   COMPILE_OPT idl2, HIDDEN

   ;  Assess whether the input positional parameter 'arg' is of one of the
   ;  numeric types:
   res = SIZE(arg, /TYPE)
   IF (((res GT 0) AND (res LT 7)) OR $
      (res EQ 9) OR $
      ((res GT 11) AND (res LT 16))) $
      THEN RETURN, 1 ELSE RETURN, 0

END
