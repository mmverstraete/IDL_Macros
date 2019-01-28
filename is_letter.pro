FUNCTION is_letter, char

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the (presumably single
   ;  character) input positional parameter char is one of the 27 letters
   ;  (lowercase or uppercase) of the ASCII character set or not.
   ;
   ;  ALGORITHM: This function checks whether the BYTE representation of
   ;  char is within the ranges [65, 90] or [97, 122] to determine whether
   ;  it corresponds to a letter.
   ;
   ;  SYNTAX: rc = is_letter, char)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   char {STRING} [I]: An arbitrary 1-character long variable.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: INT.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns 1 if the input positional parameter char
   ;      is an uppercase or a lowercase letter, and 0 otherwise.
   ;
   ;  EXCEPTION CONDITIONS: None.
   ;
   ;  DEPENDENCIES: None.
   ;
   ;  REMARKS:
   ;
   ;  *   NOTE 1: This function does not check whether the input
   ;      positional parameter is of type STRING and composed of a single
   ;      character: If that is not the case, results may be unreliable at
   ;      best, or may cause IDL to crash. See the examples below.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> PRINT, is_letter('c')
   ;             1
   ;
   ;      IDL> PRINT, is_letter('M')
   ;             1
   ;
   ;      IDL> PRINT, is_letter('$')
   ;             0
   ;
   ;      IDL> PRINT, is_letter(123)
   ;             0
   ;
   ;      IDL> PRINT, is_letter('123')
   ;      % Expression must be a scalar or 1 element array
   ;         in this context: <BYTE Array[3]>.
   ;      % Execution halted at: IS_LETTER...
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2018–12–02: Version 1.0 — Initial public release.
   ;
   ;  *   2019–01–28: Version 2.00 — Systematic update of all routines to
   ;      implement stricter coding standards and improve documentation.
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

   ;  Assess whether the input positional parameter 'char' is a letter or not:
   IF (((BYTE(char) GE 65) AND (BYTE(char) LE 90)) OR $
      ((BYTE(char) GE 97) AND (BYTE(char) LE 122))) $
      THEN RETURN, 1 ELSE RETURN, 0

END
