FUNCTION is_int, arg

   ;Sec-Doc
   ;  PURPOSE: This function returns 1 if the type of arg is INT, and 0
   ;  otherwise.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE().
   ;
   ;  SYNTAX: res = is_int(arg)
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
   ;  *   This function returns 1 if arg is of type INT, and 0 otherwise.
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
   ;  *   NOTE 2: Within the IDL context, an INT variable represents a
   ;      signed 16-bit integer number, which can take values between
   ;       − 32, 768 and  + 32, 767. Natural numbers beyond this range can
   ;      be used, but need to be declared as LONG, ULONG, LONG64 or
   ;      ULONG64.
   ;
   ;  *   NOTE 3: Note the strict interpretation of the type INT. See the
   ;      function is_integer for a generic test allowing any one of the
   ;      INTEGER types.
   ;
   ;  *   NOTE 4: Contrary to the case of floating point numbers (see
   ;      subsection [subsec:isfloat] above), if an integer constant
   ;      larger than  + 32, 767 is assigned to a variable, the latter
   ;      becomes a long integer.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> a = 10
   ;      IDL> res = is_int(a)
   ;      IDL> PRINT, res
   ;             1
   ;
   ;      IDL> b = 1.23
   ;      IDL> res = is_int(b)
   ;      IDL> PRINT, res
   ;             0
   ;
   ;      IDL> c = 40000
   ;      IDL> res = is_int(c)
   ;      IDL> PRINT, res
   ;             0
   ;      IDL> PRINT, is_long(c)
   ;             1
   ;
   ;      IDL> PRINT, is_INT()
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
   ;  Assess whether the argument 'arg' is of type INT:
   IF (SIZE(arg, /TYPE) EQ 2) THEN RETURN, 1 ELSE RETURN, 0

END
