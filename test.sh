#!/bin/bash
# test.sh -- testing script
# Copyright (C) 2013  SheetJS
# usage:
#   test.sh prep # installs requisite modules
#   test.sh clean # removes test logs
#   test.sh all # runs all tests
# logs are dumped in *.tests
 
do_test() {
	echo "# $1" >>"$2".tests
	$3 "$1" >/dev/null 2>>"$2".tests
	echo "- $? $1" >>"$2".tests
}

case "$1" in
"prep")
	npm install -g xlsjs xlsx
	pip install -r requirements.txt --use-mirrors
	;;
"clean")
	rm -f *.tests
	;;
"all") 
	for i in *.xls; do
		echo $i >&2
		do_test "$i" core "xls2csv --dev"
		do_test "$i" xlrd "python tests/xlrd.py"
	done
	for i in *.xlsx; do
		echo $i >&2
		do_test "$i" core "xlsx2csv --dev"
		do_test "$i" xlrd "python tests/xlrd.py"
	done
	grep -- "^- [^0]" *.tests
	;;
esac
