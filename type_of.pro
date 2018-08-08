FUNCTION type_of, arg, type_code, type_name

   ;Sec-Doc
   ;  PURPOSE: This function returns 0 and reports on the type of input
   ;  argument arg in the 2 output arguments type_code and type_name.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE().
   ;
   ;  SYNTAX: rc = type_of(arg, type_code, type_name)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   arg [I]: An arbitrary expression.
   ;
   ;  *   type_code {INTEGER} [O]: The type code of the input argument
   ;      arg.
   ;
   ;  *   type_name {STRING} [O]: The type name of the input argument arg.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: INTEGER.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns 0 and reports on the type of input
   ;      argument arg in the 2 output arguments type_code and type_name.
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
   ;      IDL> a = 36B
   ;      IDL> rc = type_of(a, type_code, type_name)
   ;      IDL> PRINT, type_code, '   ', type_name
   ;                 1   BYTE
   ;
   ;      IDL> b = 987.32
   ;      IDL> rc = type_of(b, type_code, type_name)
   ;      IDL> PRINT, type_code, '   ', type_name
   ;                 4   FLOAT
   ;
   ;      IDL> c = 'Hello World!'
   ;      IDL> rc = type_of(c, type_code, type_name)
   ;      IDL> PRINT, type_code, '   ', type_name
   ;                 7   STRING
   ;
   ;      IDL> PRINT, type_of()
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
   type_code = SIZE(arg, /TYPE)
   type_name = SIZE(arg, /TNAME)

   RETURN, 0

END
