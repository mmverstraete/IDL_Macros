FUNCTION is_writable_dir, $
   fspec, $
   CREATE = create

   ;Sec-Doc
   ;  PURPOSE: This function reports whether the input positional
   ;  parameter fspec points to a writable directory or not.
   ;
   ;  ALGORITHM: This function verifies that the input positional
   ;  parameter fspec is of type STRING and if so relies on the IDL
   ;  built-in function FILE_TEST to determine whether it points to a
   ;  writable directory or not.
   ;
   ;  SYNTAX: rc = is_writable_dir(fspec, CREATE = create)
   ;
   ;  POSITIONAL PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   fspec {STRING} [I]: The variable to be tested.
   ;
   ;  KEYWORD PARAMETERS [INPUT/OUTPUT]:
   ;
   ;  *   CREATE = create {INT} [I] (Default value: 0): Flag to activate
   ;      (1) or skip (0) creating the folder if it does not exist.
   ;
   ;  RETURNED VALUE TYPE: INT.
   ;
   ;  OUTCOME:
   ;
   ;  *   This function returns 1 if the input positional parameter fspec
   ;      is of type STRING and either points to an existing writable
   ;      directory or does not pre-exist and has been created
   ;      (CREATE = 1).
   ;
   ;  *   This function returns 0 if the input positional parameter fspec
   ;      is of type STRING and either points to an unwritable directory
   ;      or does not pre-exist and its creation has not been requested
   ;      (CREATE = 0).
   ;
   ;  *   This function returns -1 if the input positional parameter fspec
   ;      is of type STRING and points to an existing regular file.
   ;
   ;  *   This function returns -2 if the input positional parameter fspec
   ;      is not of type STRING or is missing.
   ;
   ;  EXCEPTION CONDITIONS: None.
   ;
   ;  DEPENDENCIES: None.
   ;
   ;  REMARKS:
   ;
   ;  *   NOTE 1: This function accepts any type of input positional
   ;      parameter, including none at all, in which case it returns -2.
   ;
   ;  *   NOTE 2: The input positional parameter fspec must be a scalar.
   ;
   ;  EXAMPLES:
   ;
   ;      IDL> fspec = '~/Desktop/'
   ;      IDL> rc = is_writable_dir(fspec)
   ;      IDL> PRINT, 'res = ' + strstr(res)
   ;      res = 1
   ;
   ;      IDL> fspec = '~/Desktop/qwerty123456/'
   ;      IDL> rc = is_writable_dir(fspec)
   ;      IDL> PRINT, 'res = ' + strstr(res)
   ;      res = 0
   ;
   ;      IDL> fspec = '~/Codes/IDL/Macros/is_writable_dir/is_writable_dir.pro'
   ;      IDL> rc = is_writable_dir(fspec)
   ;      IDL> PRINT, 'res = ' + strstr(res)
   ;      res = -1
   ;
   ;      IDL> fspec = 123
   ;      IDL> rc = is_writable_dir(fspec)
   ;      IDL> PRINT, 'res = ' + strstr(res)
   ;      res = -2
   ;
   ;  REFERENCES: None.
   ;
   ;  VERSIONING:
   ;
   ;  *   2017–07–05: Version 0.9 — Initial release under the name
   ;      is_writable.pro.
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
   ;  *   2019–07–28: Version 2.01 — Rewrite the code, move this function
   ;      from repository Utilities to repository Macros, rename it
   ;      is_writable_dir.pro, and add the optional input keyword
   ;      parameter CREATE.
   ;
   ;  *   2019–08–20: Version 2.1.0 — Adopt revised coding and
   ;      documentation standards (in particular regarding the use of
   ;      verbose and the assignment of numeric return codes), and switch
   ;      to 3-parts version identifiers.
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

   ;  Set the default values of flags and essential keyword parameters:
   IF (KEYWORD_SET(create)) THEN create = 1 ELSE create = 0

   ;  Verify that the input positional parameter fspec is of type STRING:
   IF (is_string(fspec) EQ 1) THEN BEGIN

   ;  Retrieve information about the input positional parameter fspec:
      finfo = FILE_INFO(fspec)

   ;  Verify that fspec exists in the file system:
      IF (finfo.EXISTS) THEN BEGIN

   ;  Verify that fspec is a directory:
         IF (finfo.DIRECTORY) THEN BEGIN

   ;  Return 1 if fspec is a writable directory:
            IF (finfo.WRITE) THEN BEGIN
               RETURN, 1
            ENDIF ELSE BEGIN

   ;  Return 0 if fspec is an unwritable directory:
               RETURN, 0
            ENDELSE
         ENDIF ELSE BEGIN

   ;  Return -1 if fspec exists in the file system but is not a directory:
            RETURN, -1
         ENDELSE
      ENDIF ELSE BEGIN

   ;  Create the directory fspec if requested, and return 0 otherwise:
         IF (create) THEN BEGIN
            FILE_MKDIR, fspec
            RETURN, 1
         ENDIF ELSE BEGIN
            RETURN, 0
         ENDELSE
      ENDELSE
   ENDIF ELSE BEGIN

   ;  Return -2 if fspec is not of type STRING:
      RETURN, -2
   ENDELSE

END
