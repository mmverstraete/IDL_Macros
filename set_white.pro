FUNCTION set_white

   ;Sec-Doc
   ;  PURPOSE: This function does not accept any input arguments and
   ;  returns a string containing two characters: a TAB and a SPACE.
   ;
   ;  ALGORITHM: This function returns a 2-character STRING containing a
   ;  TAB and a SPACE.
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
   ;  *   NOTE 1: This may be useful to split a string on white space when
   ;      the nature of the apparent white space is unknown, or when both
   ;      characters may appear in the same string.
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
   ;  Return a string containing a TAB and a SPACE:

   RETURN, STRING(9B) + STRING(32B)

END
