FUNCTION is_float, arg

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter arg is of type FLOAT or not.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE()
   ;  to determine the type of the input positional parameter.
   ;
   ;  SYNTAX: res = is_float(arg)
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
   ;  *   This function returns 1 if arg is of type FLOAT, and 0
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
   ;  *   NOTE 2: The input positional parameter arg can be a scalar or an
   ;      array.
   ;
   ;  *   NOTE 3: Within the IDL context, a FLOAT variable represents a
   ;      single precision floating point number, which can take values
   ;      within a range that is hardware-dependent. The IDL function
   ;      MACHAR() reports the extent of this range, for instance
   ;      [1.2E-38, 3.4E+38] for a 64-bit machine, where the mantissa will
   ;      feature at least 6 and no more than 7 significant digits.
   ;
   ;  *   NOTE 4: If a real number with more than 7 significant digits is
   ;      assigned to a variable without specifying that it should be
   ;      saved in double precision, the variable will contain a truncated
   ;      representation of that number, and thus be considered of type
   ;      FLOAT.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> a = 1.23
   ;      IDL> res = is_float(a)
   ;      IDL> PRINT, res
   ;             1
   ;
   ;      IDL> b = 5
   ;      IDL> res = is_float(b)
   ;      IDL> PRINT, res
   ;             0
   ;
   ;      IDL> c = 1.2345678987
   ;      IDL> res = is_float(c)
   ;      IDL> PRINT, res
   ;             1
   ;      IDL> PRINT, c
   ;         1.23457
   ;      IDL> PRINT, c, FORMAT = '(F12.10)'
   ;         1.2345678806
   ;
   ;      IDL> PRINT, is_float()
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
   ;
   ;  *   2019–08–20: Version 2.1.0 — Adopt revised coding and
   ;      documentation standards, and switch to 3-parts version
   ;      identifiers.
   ;Sec-Lic
   ;  INTELLECTUAL PROPERTY RIGHTS
   ;
   ;  *   Copyright (C) 2017-2020 Michel M. Verstraete.
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
   ;      be included in their entirety in all copies or substantial
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

   ;  Assess whether the input positional parameter 'arg' is of type FLOAT:
   IF (SIZE(arg, /TYPE) EQ 4) THEN RETURN, 1 ELSE RETURN, 0

END
