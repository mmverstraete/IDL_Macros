FUNCTION is_lowercase, char

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter char is a single lowercase character or not.
   ;
   ;  ALGORITHM: This function returns 1 if the input positional parameter
   ;  char meets the following 4 conditions: (1) it is of type STRING, (2)
   ;  it is a scalar, (3) it is of length 1, and (4) its BYTE value lies
   ;  in the range [97, 122].
   ;
   ;  SYNTAX: res = is_lowercase(char)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   char {STRING} [I]: The single character to be tested.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: INT.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns 1 if the input positional parameter is a
   ;      single character set in lowercase, and 0 otherwise.
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
   ;  *   NOTE 2: The input positional parameter char must be a scalar.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> char = 'a'
   ;      IDL> res = is_lowercase(char)
   ;      IDL> PRINT, 'res = ', res
   ;      res =            1
   ;
   ;      IDL> char = 'Z'
   ;      IDL> res = is_lowercase(char)
   ;      IDL> PRINT, 'res = ', res
   ;      res =            0
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2017–11–18: Version 1.0 — Initial release.
   ;
   ;  *   2018–01–15: Version 1.1 — Implement optional debugging.
   ;
   ;  *   2018–06–01: Version 1.5 — Implement new coding standards.
   ;
   ;  *   2019–01–28: Version 2.00 — Systematic update of all routines to
   ;      implement stricter coding standards and improve documentation.
   ;
   ;  *   2019–06–15: Version 2.01 — Simplify the code and move this
   ;      function from the repository Utilities to the repository Macros.
   ;
   ;  *   2019–08–20: Version 2.1.0 — Adopt revised coding and
   ;      documentation standards (in particular regarding the assignment
   ;      of numeric return codes), and switch to 3-parts version
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

   ;  Verify that the argument char is of type STRING:
   IF (is_string(char)) THEN BEGIN

   ;  Verify that the argument char is a scalar:
      IF (is_scalar(char)) THEN BEGIN

   ;  Verify that the argument char is of length 1:
         IF (STRLEN(char) EQ 1) THEN BEGIN

   ;  Verify that the argument char is a lowercase character:
            IF ((BYTE(char) GE 97) AND (BYTE(char) LE 122)) $
               THEN RETURN, 1 ELSE RETURN, 0
         ENDIF ELSE RETURN, 0
      ENDIF ELSE RETURN, 0
   ENDIF ELSE RETURN, 0

END
