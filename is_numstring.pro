FUNCTION is_numstring, arg

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter arg is a STRING that contains only digits, arithmetic
   ;  signs, or the decimal point, or not.
   ;
   ;  ALGORITHM: This function relies on the IDL built-in function SIZE()
   ;  to determine whether the input positional parameter arg is a STRING,
   ;  and then checks whether each and every character in that string is a
   ;  digit, or an arithmetic sign, or the decimal point.
   ;
   ;  SYNTAX: res = is_numstring(arg)
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
   ;  *   This function returns 1 if arg is of type STRING and if each
   ;      character of that string is either a digit (0 to 9), or a sign
   ;      (+ or -), or a decimal point, and 0 otherwise.
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
   ;  *   NOTE 2: This function returns 0 if the input positional
   ;      parameter is an array of any type.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> a = '123'
   ;      IDL> PRINT, is_numstring(a)
   ;            1
   ;
   ;      IDL> b = '2*4/3'
   ;      IDL> PRINT, is_numstring(b)
   ;            0
   ;
   ;      IDL> c = '-567.89'
   ;      IDL> PRINT, is_numstring(c)
   ;            1
   ;
   ;      IDL> d = '4x'
   ;      IDL> PRINT, is_numstring(d)
   ;            0
   ;
   ;      IDL> e = ['123', '-567.89']
   ;      IDL> PRINT, is_numstring(e)
   ;            0
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2018–08–07: Version 0.9 — Initial release.
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

   ;  Assess whether the input positional parameter 'arg' contains only digits,
   ;  arithmetic signs or the decimal point:
   IF (is_array(arg)) THEN RETURN, 0
   IF (SIZE(arg, /TYPE) EQ 7) THEN BEGIN
      arglen = STRLEN(arg)
      FOR i = 0, arglen - 1 DO BEGIN
         char = STRMID(arg, i, 1)
         idx = WHERE(char EQ ['0', '1', '2', '3', '4', '5', $
            '6', '7', '8', '9', '+', '-', '.'], count)
         IF (count NE 1) THEN RETURN, 0
      ENDFOR
      RETURN, 1
   ENDIF ELSE RETURN, 0

END
