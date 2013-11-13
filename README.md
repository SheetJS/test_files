# test_files

Test files associated with:

 - [js-xls](https://github.com/SheetJS/js-xls)
 - [js-xlsx](https://github.com/SheetJS/js-xlsx)

Instead of polluting those repos with large binary files, they are stored here.

All files contained in this repo are covered under the Apache 2.0 license.
The `Makefile` can pull files from other projects, which are covered under 
separate licenses (see below).

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

`RkNumber` tests all styles of RkNumber records.  Records were verified by hand.

# Getting External Test Files

All external test files are pulled using the Makefile and fall under separate 
licensing terms (as described below).  None of the files directly contained in 
this repo are encumbered by external licenses.

`apachepoi` pulls only the spreadsheet test battery from the Apache POI project:
<https://poi.apache.org/spreadsheet/index.html>.  
At the time of this writing, it is covered under Apache License, version 2.0: 
<http://www.apache.org/licenses/LICENSE-2.0>

`xlrd` pulls the test battery from xlrd project: <http://www.python-excel.org/>
At the time of this writing, it is covered under BSD License.

pyExcelerator https://github.com/WoLpH/pyExcelerator/tree/master/museum

python-xlsx https://github.com/staale/python-xlsx/tree/master/xlsx/tests/fixtures

excel-reader-xlsx https://github.com/jmcnamara/excel-reader-xlsx/tree/master/t/regression/xlsx_files

openpyxl https://bitbucket.org/ericgazoni/openpyxl/src/33f920b3f1da73d899a6140b64956e0a6798a53f/openpyxl/tests/test_data?at=default



# License

All files contained in this repository are licensed under the Apache 2 License. 
Files external to this repo (acquired via `make`) are licensed under separate
terms (as indicated in the External Test Files section) 
