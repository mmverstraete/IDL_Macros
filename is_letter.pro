FUNCTION is_letter, arg

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter arg is one of the 26 letters (lowercase or uppercase) of
   ;  the ASCII character set or not.
   ;
   ;  ALGORITHM: This function screens out all arguments that are not of
   ;  type BYTE or STRING, as well as all STRINGs longer than a single
   ;  character, and checks whether the BYTE representation of arg is
   ;  within the ranges [65, 90] or [97, 122] to determine whether it
   ;  corresponds to a letter.
   ;
   ;  SYNTAX: res = is_letter(arg)
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
   ;  *   This function returns 1 if the input positional parameter arg is
   ;      a single uppercase or a lowercase letter, and 0 otherwise.
   ;
   ;  EXCEPTION CONDITIONS: None.
   ;
   ;  DEPENDENCIES: None.
   ;
   ;  REMARKS:
   ;
   ;  *   NOTE 1: This function returns 0 if the input positional
   ;      parameter arg is of type STRING but contains more than 1
   ;      character, or is an array of any type: See the examples below.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> PRINT, is_letter('c')
   ;            1
   ;
   ;      IDL> PRINT, is_letter('M')
   ;            1
   ;
   ;      IDL> PRINT, is_letter('$')
   ;            0
   ;
   ;      IDL> PRINT, is_letter(123)
   ;            0
   ;
   ;      IDL> PRINT, is_letter('123')
   ;            0
   ;
   ;      IDL> PRINT, is_letter(['a', 'b'])
   ;            0
   ;
   ;      IDL> PRINT, is_letter(!NULL)
   ;            0
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2018–12–02: Version 1.0 — Initial public release.
   ;
   ;  *   2019–01–28: Version 2.00 — Systematic update of all routines to
   ;      implement stricter coding standards and improve documentation.
   ;
   ;  *   2019–06–10: Version 2.01 — Update the code to handle any type of
   ;      input positional argument.
   ;
   ;  *   2019–06–19: Version 2.02 — Update the documentation to note that
   ;      this function returns 0 if the input positional parameter
   ;      contains more than 1 character.
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

   IF (is_array(arg)) THEN RETURN, 0
   rc = type_of(arg, type_code, type_name)
   CASE type_code OF
      1: BEGIN
         IF (((arg GE 65) AND (arg LE 90)) OR $
            ((arg GE 97) AND (arg LE 122))) $
            THEN RETURN, 1 ELSE RETURN, 0
      END
      7: BEGIN
         IF (STRLEN(arg) EQ 1) THEN BEGIN
            IF (((BYTE(arg) GE 65) AND (BYTE(arg) LE 90)) OR $
               ((BYTE(arg) GE 97) AND (BYTE(arg) LE 122))) $
               THEN RETURN, 1 ELSE RETURN, 0
         ENDIF ELSE RETURN, 0
      END
      ELSE: RETURN, 0
   ENDCASE

END
