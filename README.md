# test_files

Test files associated with:

 - [js-xls](https://github.com/SheetJS/js-xls)
 - [js-xlsx](https://github.com/SheetJS/js-xlsx)

Instead of polluting those repos with large binary files, they are stored here.

All files contained in root directory are covered under the Apache 2.0 license.
The `Makefile` can pull files from other projects, which are covered under
separate licenses (see below).

The files in the 2011 and 2013 subdirectories are derivative outputs generated
using the specified version of Microsoft Excel.  Each derivative file of an
external file is clearly marked with a prefix associated with the source
(followed by an underscore), and original files do not have any of the source
prefixes.  Each derivative file is released under the same terms as the original
file (and all derivatives of original files are released under the Apache 2.0
License).

# Manifest

`formula_stress_test` uses every single function available in Excel 2011 in some
formula.  It includes a pivot table as well as array formulae, inline arrays,
errors, booleans, and other cell types and formula elements.

`comments_stress_test` tests various types of comments and functions.  The XLS
version uses VBA to extract comments.

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

`rich_text_stress` tests various types of rich text, applying formatting to the
entire cell as well as parts of the cell.

`named_ranges` tests named ranges (including valid and invalid expressions).

`custom_properties` tests custom properties

`xlsx-stream-d-date-cell` tests the ECMA-376 `d` date type

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

# Requests for Removal

This repo includes derivatives of files from external sources.  According to the
respective license terms, the authors of the external sources allege that the
artifacts are indeed covered under the same terms.  This project uses files
according to those terms.

External sources are expected to ensure that they are not violating license
terms.  However, from time to time, they may add test files from contributors
that did not create the files or obtain permission.  We are not actively
monitoring discussions pertaining to removal requests from other sources, but if
you find your content and would like to see it removed, we will investigate.

To submit a request, first reach out to the original source and give some time
for them to respond. If they remove the content, file an issue in this repo's
issue tracker and email <sheetjs@gmail.com> (subject "removal request"). In the
email, forward the original communications and link to the issue in the
original project issue tracker. Unless the original project recognizes that the
content is yours (admitting that the content cannot be released according to
their license terms), no action will be taken.

If you have reached out to the original source and have not received a reply in
30 days, raise an issue in this repo tracker and send an email with subject
"external license violation", forwarding proof of initial attempt to contact.
We will reach out to the external source.  If we do not receive a reply in 30
days, the content will be removed in future commits.

# License

All files contained in this repository are licensed under the Apache 2 License.
Files external to this repo (acquired via `make`) are licensed under separate
terms (as indicated in the External Test Files section)

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/1a1b91956aee094414d49d818560a2b5 "githalytics.com")](http://githalytics.com/SheetJS/test_files)
