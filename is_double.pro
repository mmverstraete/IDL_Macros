FUNCTION is_double, arg

   ;Sec-Doc
   ;  PURPOSE: This function returns 1 if the type of arg is DOUBLE, and 0
   ;  otherwise.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE().
   ;
   ;  SYNTAX: res = is_double(arg)
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
   ;  *   This function returns 1 if arg is of type DOUBLE, and 0
   ;      otherwise.
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
   ;  *   NOTE 2: Within the IDL context, a DOUBLE variable represents a
   ;      double precision floating point number, which can take values
   ;      within a range that is hardware-dependent. The IDL function
   ;      MACHAR(/DOUBLE) reports the extent of this range, for instance
   ;      [2.2E-308, 2.0E+308] for a 64-bit machine, where the mantissa
   ;      will feature at least 15 and no more than 16 significant digits.
   ;
   ;  *   NOTE 3: A DCOMPLEX variable is not considered of type DOUBLE.
   ;      However, both the real and the imaginary components, taken
   ;      individually, are of type DOUBLE.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> a = 3.14159D
   ;      IDL> res = is_double(a)
   ;      IDL> PRINT, res
   ;             1
   ;
   ;      IDL> b = DCOMPLEX(12.3, 4.56)
   ;      IDL> res = is_double(b)
   ;      IDL> PRINT, res
   ;             0
   ;      IDL> res = is_double(IMAGINARY(b))
   ;      IDL> PRINT, res
   ;             1
   ;
   ;      IDL> PRINT, is_double()
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
   ;  Assess whether the argument 'arg' is of type DOUBLE:
   IF (SIZE(arg, /TYPE) EQ 5) THEN RETURN, 1 ELSE RETURN, 0

END