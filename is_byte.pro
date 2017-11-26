FUNCTION is_byte, arg

   ;Sec-Doc
   ;  PURPOSE: This function returns 1 if the type of arg is BYTE, and 0
   ;  otherwise.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE().
   ;
   ;  SYNTAX: res = is_byte(arg)
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
   ;  *   This function returns 1 if arg is of type BYTE, and 0 otherwise.
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
   ;  *   NOTE 2: Within the IDL context, a BYTE variable represents an
   ;      unsigned 8-bit integer number, which can take values between 0
   ;      and 255, but small integers in that range are not characterized
   ;      as bytes, unless explicitly stated: the default type for
   ;      integers is a 16-bit INT.
   ;
   ;  *   NOTE 3: Within the ASCII context, there is a direct relation
   ;      between integers in the range 0 to 255 and corresponding
   ;      character representations, but these are not interchangeable in
   ;      IDL. See the following examples.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> a = 72B
   ;      IDL> res = is_byte(a)
   ;      IDL> PRINT, res
   ;             1
   ;
   ;      IDL> b = STRING(a)
   ;      IDL> PRINT, b
   ;      H
   ;      IDL> res = is_byte(b)
   ;      IDL> PRINT, res
   ;             0
   ;
   ;      IDL> PRINT, BYTE('H')
   ;        72
   ;      IDL> c = 72
   ;      IDL> res = is_byte(c)
   ;      IDL> PRINT, res
   ;             0
   ;
   ;      IDL> PRINT, is_byte()
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
   ;  Assess whether the argument 'arg' is of type BYTE:
   IF (SIZE(arg, /TYPE) EQ 1) THEN RETURN, 1 ELSE RETURN, 0

END