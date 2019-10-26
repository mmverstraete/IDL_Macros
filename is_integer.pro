FUNCTION is_integer, arg

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter arg is of one of the integer types or not.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE()
   ;  to determine the type of the input positional parameter.
   ;
   ;  SYNTAX: res = is_integer(arg)
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
   ;  *   This function returns 1 if arg is of type INT, UINT, LONG,
   ;      ULONG, LONG64, or ULONG64, and 0 otherwise.
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
   ;  *   NOTE 3: Within the IDL context, an INT variable represents a
   ;      signed 16-bit integer number, which can take values between
   ;      -32,768 and +32,767; a UINT variable represents an unsigned
   ;      16-bit integer number, which can take values between 0 and
   ;      65,535; a LONG variable represents an unsigned 32-bit integer
   ;      number, which can take values between –2,147,483,648 and
   ;      +2,147,483,647; a ULONG variable represents an unsigned 32-bit
   ;      integer number, which can take values between 0 and
   ;      4,294,967,295; a LONG64 variable represents an unsigned 64-bit
   ;      integer number, which can take values between
   ;      –9,223,372,036,854,775,808 and +9,223,372,036,854,775,807; a
   ;      ULONG64 variable represents an unsigned 64-bit integer number,
   ;      which can take values between 0 and 18,446,744,073,709,551,615.
   ;
   ;  *   NOTE 4: Note the more permissive interpretation of type INTEGER,
   ;      which returns a positive answer for any one of the 6 types of
   ;      integer numbers allowed in IDL.
   ;
   ;  *   NOTE 5: Contrary to the case of floating point numbers, if an
   ;      integer constant larger than  + 32, 767 is assigned to a
   ;      variable, the latter becomes a LONG integer.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> a = 10
   ;      IDL> res = is_integer(a)
   ;      IDL> PRINT, res
   ;            1
   ;
   ;      IDL> b = 1.23
   ;      IDL> res = is_integer(b)
   ;      IDL> PRINT, res
   ;            0
   ;
   ;      IDL> c = 40000
   ;      IDL> PRINT, is_integer(c)
   ;            1
   ;      IDL> PRINT, is_int(c)
   ;            0
   ;      IDL> PRINT, is_long(c)
   ;            1
   ;
   ;      IDL> d = -9223372036854LL
   ;      IDL> res = is_integer(d)
   ;      IDL> PRINT, res
   ;            1
   ;
   ;      IDL> e = [12, 24, 40000]
   ;      IDL> PRINT, is_integer(e)
   ;            1
   ;
   ;      IDL> PRINT, is_integer()
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
   ;  *   2019–06–19: Version 2.01 — Update the function to return 1 when
   ;      the input positional parameter arg is of type BYTE, which is
   ;      often used as an 8-bit integer while generating color graphics
   ;      output.
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

   ;  Assess whether the input positional parameter 'arg' is of one of the INTEGER types:
   IF ((SIZE(arg, /TYPE) EQ 1) OR $
      (SIZE(arg, /TYPE) EQ 2) OR $
      (SIZE(arg, /TYPE) EQ 12) OR $
      (SIZE(arg, /TYPE) EQ 3) OR $
      (SIZE(arg, /TYPE) EQ 13) OR $
      (SIZE(arg, /TYPE) EQ 14) OR $
      (SIZE(arg, /TYPE) EQ 15)) $
      THEN RETURN, 1 ELSE RETURN, 0

END
