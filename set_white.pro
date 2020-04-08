FUNCTION set_white

   ;Sec-Doc
   ;  PURPOSE: This function returns a 2-character STRING.
   ;
   ;  ALGORITHM: This function does not accept any input positional
   ;  parameters and returns a string containing two characters: a TAB and
   ;  a SPACE.
   ;
   ;  SYNTAX: white = set_white()
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: STRING.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns a 2-character STRING containing a TAB and
   ;      a SPACE.
   ;
   ;  EXCEPTION CONDITIONS: None.
   ;
   ;  DEPENDENCIES: None.
   ;
   ;  REMARKS:
   ;
   ;  *   NOTE 1: This function may be useful to split a string on white
   ;      space when the nature of the apparent white space is unknown, or
   ;      when both characters may appear in the same string.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> line = 'This line contains a TAB' + STRING(9B) + $
   ;         'character.'
   ;      IDL> PRINT, line
   ;      This line contains a TAB    character.
   ;      IDL> white = set_white()
   ;      IDL> parts = STRSPLIT(line, white, COUNT = n_parts, /EXTRACT)
   ;      IDL> PRINT, 'n_parts = ', n_parts
   ;      n_parts =            6
   ;      IDL> FOR i = 0, n_parts-1 DO PRINT, i, '   >' + parts[i] + '<'
   ;             0   >This<
   ;             1   >line<
   ;             2   >contains<
   ;             3   >a<
   ;             4   >TAB<
   ;             5   >character.<
   ;
   ;      IDL> parts = STRSPLIT(line, ' ', COUNT = n_parts, /EXTRACT)
   ;      IDL> PRINT, 'n_parts = ', n_parts
   ;      n_parts =            5
   ;      IDL> FOR i = 0, n_parts-1 DO PRINT, i, '   >' + parts[i] + '<'
   ;             0   >This<
   ;             1   >line<
   ;             2   >contains<
   ;             3   >a<
   ;             4   >TAB character.<
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
   ;  *   2019–08–20: Version 2.1.0 — Adopt revised coding and
   ;      documentation standards, and switch to 3-parts version
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

   ;  Return a string containing a TAB and a SPACE:
   RETURN, STRING(9B) + STRING(32B)

END
