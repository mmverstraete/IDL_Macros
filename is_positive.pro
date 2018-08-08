FUNCTION is_positive, arg

   ;Sec-Doc
   ;  PURPOSE: This function returns 1 if argument arg is of numeric type
   ;  and equal to or greater than 0.0, and 0 otherwise.
   ;
   ;  ALGORITHM: This function tests whether the argument arg is of a
   ;  numeric type, and if so, whether it is equal to or greater than 0.0.
   ;
   ;  SYNTAX: res = is_positive(arg)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   arg [I]: An arbitrary numeric expression.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: INTEGER.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns 1 if arg is both of numeric type and equal
   ;      or larger than 0, and returns 0 otherwise.
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
   ;  *   NOTE 2: This function considers complex numbers to be always
   ;      positive, independently from the sign of the real and imaginary
   ;      parts.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> PRINT, is_positive(1234)
   ;             1
   ;
   ;      IDL> PRINT, is_positive(0.0)
   ;             1
   ;
   ;      IDL> PRINT, is_positive(-0.1E-20)
   ;             0
   ;
   ;      IDL> PRINT, is_positive('12')
   ;             0
   ;
   ;      IDL> print, is_positive(COMPLEX(-1.0, 0.0))
   ;             1
   ;
   ;      IDL> print, is_positive(COMPLEX(1.0, -20.0))
   ;             1
   ;
   ;      IDL> print, is_positive(COMPLEX(-1.0, -20.0))
   ;             1
   ;
   ;      IDL> PRINT, is_positive()
   ;             0
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2017–11–20: Version 1.0 — Initial public release.
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
   ;  Assess whether the argument 'arg' is positive:
   IF (is_numeric(arg) EQ 1) THEN BEGIN
      IF (arg GE 0.0) THEN RETURN, 1 ELSE RETURN, 0
   ENDIF ELSE BEGIN
      RETURN, 0
   ENDELSE

END
