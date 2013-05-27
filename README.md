# test_files

Test files associated with:

 - [js-xls](https://github.com/Niggler/js-xls)
 - [js-xlsx](https://github.com/Niggler/js-xlsx)

Instead of polluting those repos with large binary files, they are stored here

# Manifest

`formula_stress_test` uses every single function available in Excel 2011 in some
formula.  It includes a pivot table as well as array formulae, inline arrays,
errors, booleans, and other cell types and formula elements.

`number_format` tests every implied format from ECMA-376 as well as every format
available within the Excel 2011 UI.  Ultimately there will be international
versions to test certain features (some require an east-Asian version -- if you
are reading this and can generate test files, please contribute!)

`large_strings` tests large strings and a large shared string table.  Larger
strings are programmatically generated using `CONCATENATE` while the shared
string table was pulled from <http://longwords.org/longwordslist.html>

# License

All files are licensed under the MIT License (included in this repo).  
