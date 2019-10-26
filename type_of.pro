FUNCTION type_of, arg, type_code, type_name

   ;Sec-Doc
   ;  PURPOSE: This function reports the type code and the type name of
   ;  the input positional parameter arg.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE()
   ;  to determine the type of the input positional parameter.
   ;
   ;  SYNTAX: res = type_of(arg, type_code, type_name)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   arg [I]: An arbitrary expression.
   ;
   ;  *   type_code {INT} [O]: The type code of the input positional
   ;      parameter arg.
   ;
   ;  *   type_name {STRING} [O]: The type name of the input positional
   ;      parameter arg.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: INT.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns 0 and reports the type code and the type
   ;      name of the input positional parameter arg in the 2 output
   ;      positional parameters type_code and type_name.
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
   ;  EXAMPLES:
   ;
   ;      IDL> a = 36B
   ;      IDL> res = type_of(a, type_code, type_name)
   ;      IDL> PRINT, type_code, '   ', type_name
   ;               1   BYTE
   ;
   ;      IDL> b = 987.32
   ;      IDL> res = type_of(b, type_code, type_name)
   ;      IDL> PRINT, type_code, '   ', type_name
   ;               4   FLOAT
   ;
   ;      IDL> c = 'Hello World!'
   ;      IDL> res = type_of(c, type_code, type_name)
   ;      IDL> PRINT, type_code, '   ', type_name
   ;               7   STRING
   ;
   ;      IDL> d = [2.3D, 4.5D]
   ;      IDL> res = type_of(d, type_code, type_name)
   ;      IDL> PRINT, type_code, '   ', type_name
   ;               5   DOUBLE
   ;
   ;      IDL> PRINT, type_of()
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

   ;  Assess the type code and the type name of the input positional parameter
   ;  'arg':
   type_code = SIZE(arg, /TYPE)
   type_name = SIZE(arg, /TNAME)

   RETURN, 0

END
