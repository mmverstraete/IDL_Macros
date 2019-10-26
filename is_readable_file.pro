FUNCTION is_readable_file, fspec

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter fspec points to a readable file or not.
   ;
   ;  ALGORITHM: This function verifies that the input positional
   ;  parameter fspec is of type STRING and if so relies on the IDL
   ;  built-in function FILE_TEST to determine whether it points to a
   ;  readable file or not.
   ;
   ;  SYNTAX: rc = is_readable_file(fspec)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   fspec {STRING} [I]: The variable to be tested.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]: None.
   ;
   ;  RETURNED VALUE TYPE: INT.
   ;
   ;  OUTCOME:
   ;
   ;  *   If the input positional parameter fspec is of type STRING, this
   ;      function returns 1 if fspec points to a readable file, and 0
   ;      otherwise. If fspec is of any other data type, this function
   ;      returns -1.
   ;
   ;  EXCEPTION CONDITIONS: None.
   ;
   ;  DEPENDENCIES: None.
   ;
   ;  REMARKS:
   ;
   ;  *   NOTE 1: This function accepts any type of input positional
   ;      parameter, including none at all, in which case it returns -1.
   ;
   ;  *   NOTE 2: The input positional parameter fspec can be a scalar or
   ;      an array.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> fspec = '~/Codes/IDL/Macros/is_readable_file/is_readable_file.pro'
   ;      IDL> rc = is_readable_file(fspec)
   ;      IDL> PRINT, 'res = ' + strstr(res)
   ;      res = 1
   ;
   ;      IDL> fspec = '~/Desktop/'
   ;      IDL> rc = is_readable_file(fspec)
   ;      IDL> PRINT, 'res = ' + strstr(res)
   ;      res = 0
   ;
   ;      IDL> fspec = 123
   ;      IDL> res = is_readable_file(fspec)
   ;      IDL> PRINT, 'res = ' + strstr(res)
   ;      res = -1
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2017–07–05: Version 0.9 — Initial release under the name
   ;      is_readable.pro.
   ;
   ;  *   2017–11–20: Version 1.0 — Initial public release.
   ;
   ;  *   2018–01–15: Version 1.1 — Implement optional debugging.
   ;
   ;  *   2018–04–24: Version 1.2 — Update the function to return 0 but no
   ;      exception condition if the input positional parameter exists but
   ;      is unreadable.
   ;
   ;  *   2018–05–14: Version 1.3 — Add return code to indicate the input
   ;      positional parameter does not exist, and update the
   ;      documentation.
   ;
   ;  *   2018–06–01: Version 1.5 — Implement new coding standards.
   ;
   ;  *   2018–06–22: Version 1.6 — Improve diagnostic messages.
   ;
   ;  *   2018–08–15: Version 1.7 — Return non-empty excpt_cond values
   ;      only when errors are encountered (i.e., only when res = -1, and
   ;      not as warning or information messages).
   ;
   ;  *   2018–08–28: Version 1.8 — Return empty excpt_cond value only
   ;      when file_spec exists and is readable.
   ;
   ;  *   2019–01–28: Version 2.00 — Systematic update of all routines to
   ;      implement stricter coding standards and improve documentation.
   ;
   ;  *   2019–08–20: Version 2.1.0 — Simplify the code, move this
   ;      function from repository Utilities to repository Macros, rename
   ;      it is_readable_file.pro, and adopt revised coding and
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

   ;  Verify that the input positional parameter fspec is of type STRING and
   ;  points to a readable file:
   IF (is_string(fspec) EQ 1) THEN BEGIN
      res = FILE_TEST(fspec, /REGULAR, /READ)
      IF (res EQ 1) THEN RETURN, 1 ELSE RETURN, 0
   ENDIF ELSE RETURN, -1

END
