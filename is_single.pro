FUNCTION is_single, arg

   ;Sec-Doc
   ;  PURPOSE: This function returns 1 if the type of argument arg refers
   ;  to a single precision number (i.e., BYTE (1), INT (2), LONG (3),
   ;  FLOAT (4), COMPLEX (6), UINT (12), ULONG (13), LONG64 (14) or
   ;  ULONG64 (15)), and 0 otherwise.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE().
   ;
   ;  SYNTAX: res = is_single(arg)
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
   ;  *   This function returns 1 if arg is of type BYTE (1), INT (2),
   ;      LONG (3), FLOAT (4), COMPLEX (6), UINT (12), ULONG (13),
   ;      LONG64 (14) or ULONG64 (15), and 0 otherwise.
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
   ;      IDL> PRINT, is_single(2)
   ;             1
   ;
   ;      IDL> PRINT, is_single(5B)
   ;             1
   ;
   ;      IDL> PRINT, is_single(COMPLEX(3.5, 1.0))
   ;             1
   ;
   ;      IDL> PRINT, is_single(DOUBLE(78.0))
   ;             0
   ;
   ;      IDL> PRINT, is_single()
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
   ;  Assess whether the argument 'arg' is of one of the single precision types:
   res = SIZE(arg, /TYPE)
   IF (((res GT 0) AND (res LT 5)) OR $
      (res EQ 6) OR $
      ((res GT 11) AND (res LT 16))) $
      THEN RETURN, 1 ELSE RETURN, 0

END
