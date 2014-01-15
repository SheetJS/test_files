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

`merge_cells` tests vertical, horizontal, and rectangular merged cells. 

`LONumbers` tests LO number format deviations from Excel.  The `LONumbers.xls*`
files are directly from LibreOffice 4.1.4.2.  These files were opened in Excel,
"repaired", and saved as `LONumbers-EXCELVERSION.xls*`.

# Getting External Test Files

All external test files are pulled using the Makefile and fall under separate 
licensing terms (as described below).  None of the files directly contained in 
this repo are encumbered by external licenses.  They are acquired by cloning:

- Github repos are cloned using SVN access (just pulls the relevant directory)
- Bitbucket repos are cloned using HG access 

`apachepoi` pulls only the spreadsheet test battery from the Apache POI project:
<https://poi.apache.org/spreadsheet/index.html>.  
At the time of this writing, it is covered under Apache License, version 2.0: 
<http://www.apache.org/licenses/LICENSE-2.0>

`xlrd` pulls the test battery from xlrd project: <http://www.python-excel.org/>
At the time of this writing, it is covered under BSD License.

`excel-reader-xlsx` pulls the test battery from the excel-reader-xlsx project:
<https://github.com/jmcnamara/excel-reader-xlsx/>
At the time of this writing, it is covered under Perl Artistic License.

`openpyxl` pulls the test battery from the openpyxl project: 
<http://openpyxl.readthedocs.org/>
At the time of this writing, it is covered under the MIT License

`pyExcelerator` pulls the test battery from the pyExcelerator project:
<https://pypi.python.org/pypi/pyExcelerator>
At the time of this writing, it is covered under the BSD 4-clause License

`jxls-*` pulls the test battery from the jxls project: 
<http://jxls.sourceforge.net/>
At the time of this writing, it is covered under the GNU Lesser GPL License 

`roo` pulls the test battery from the roo project: <http://roo.rubyforge.org/>
At the time of this writing, the test files are covered under the MIT License 

`spreadsheet-parsexlsx` pulls the test battery from the ParseXLSX project:
<https://metacpan.org/release/Spreadsheet-ParseXLSX>
At the time of this writing, it is covered under the MIT (X11) License

# License

All files contained in this repository are licensed under the Apache 2 License. 
Files external to this repo (acquired via `make`) are licensed under separate
terms (as indicated in the External Test Files section)

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/1a1b91956aee094414d49d818560a2b5 "githalytics.com")](http://githalytics.com/SheetJS/test_files)
