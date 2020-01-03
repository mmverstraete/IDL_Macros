FUNCTION first_char, arg

   ;Sec-Doc
   ;  PURPOSE: This function returns the first character of the scalar
   ;  input positional parameter arg.
   ;
   ;  ALGORITHM: This function relies on IDL functions is_scalar and
   ;  is_string to extract the desired character.
   ;
   ;  SYNTAX: res = first_char(arg)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   arg [I]: An arbitrary expression.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: STRING.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns the first character of the input
   ;      positional parameter arg if it is of type STRING and contains at
   ;      least one character, and ” otherwise.
   ;
   ;  EXCEPTION CONDITIONS: None.
   ;
   ;  DEPENDENCIES:
   ;
   ;  *   is_scalar.pro
   ;
   ;  *   is_string.pro
   ;
   ;  REMARKS:
   ;
   ;  *   NOTE 1: This function accepts any type of input positional
   ;      parameter, including none at all, in which case it returns the
   ;      null string ”.
   ;
   ;  *   NOTE 2: The input positional parameter arg must be a scalar.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> PRINT, '>' + first_char('Hello World') + '<'
   ;      >H<
   ;
   ;      IDL> PRINT, '>' + first_char(3.14) + '<'
   ;      ><
   ;
   ;      IDL> PRINT, '>' + first_char()  + '<'
   ;      ><
   ;
   ;      IDL> PRINT, '>' + first_char(['Hello', 'World'])  + '<'
   ;      ><
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2017–11–20: Version 1.0 — Initial public release.
   ;
   ;  *   2018–01–15: Version 1.1 — Implement optional debugging.
   ;
   ;  *   2018–06–01: Version 1.5 — Implement new coding standards.
   ;
   ;  *   2019–01–28: Version 2.00 — Systematic update of all routines to
   ;      implement stricter coding standards and improve documentation.
   ;
   ;  *   2019–08–20: Version 2.1.0 — Simplify the code, move it from
   ;      repository Utilities to repository Macros, adopt revised coding
   ;      and documentation standards, and switch to 3-parts version
   ;      identifiers.
   ;
   ;  *   2020–01–03: Version 2.1.1 — Update the documentation.
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

   ;  Verify that the input positional parameter 'arg' is of type STRING and
   ;  contains at least one character:
   IF (is_scalar(arg)) THEN BEGIN
      IF ((is_string(arg)) AND (STRLEN(arg) GT 0)) THEN BEGIN
         RETURN, STRMID(arg, 0, 1)
      ENDIF ELSE RETURN, ''
   ENDIF ELSE RETURN, ''

END
