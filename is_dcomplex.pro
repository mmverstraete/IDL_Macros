FUNCTION is_dcomplex, arg

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter arg is of type DCOMPLEX or not.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE()
   ;  to determine the type of the input positional parameter.
   ;
   ;  SYNTAX: res = is_dcomplex(arg)
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
   ;  *   This function returns 1 if arg is of type DCOMPLEX, and 0
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
   ;  *   NOTE 3: Within the IDL context, a variable of type DCOMPLEX is
   ;      represented as a couple of double precision real numbers, but an
   ;      array of two double precision real numbers is not considered a
   ;      complex number.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> c = DCOMPLEX(3.0D, 4.0D)
   ;      IDL> res = is_dcomplex(c)
   ;      IDL> PRINT, res
   ;            1
   ;
   ;      IDL> d = 2 * c
   ;      IDL> PRINT, is_dcomplex([c, d])
   ;            1
   ;
   ;      IDL> res = is_dcomplex([12.3D, 45.6D])
   ;      IDL> PRINT, res
   ;            0
   ;
   ;      IDL> PRINT, is_dcomplex()
   ;            0
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

   ;  Assess whether the input positional parameter 'arg' is of type DCOMPLEX:
   IF (SIZE(arg, /TYPE) EQ 9) THEN RETURN, 1 ELSE RETURN, 0

END
