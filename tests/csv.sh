#!/bin/bash
# csv.sh -- generate sheet names and csv output using Excel 2011 for Mac
# Copyright (C) 2013-present  SheetJS

basedir=${1:-2016}
mkdir -p $basedir
CSV=./csv.scpt
SNAME=./sheetnames.scpt
if [ ! -e $CSV ]; then
	CSV=./tests/csv.scpt
	SNAME=./tests/sheetnames.scpt
fi

for i in *.xls *.xlsx *.xlsm *.xlsb *.xml; do
	# generate sheetnames output
	if [ -e "./tests/skips/$i.skip" ]; then continue; fi
	of="$basedir/$i.sheetnames"
	if [[ ! -s $of ]]; then
		echo $i $of >&2
		osascript -s o $SNAME "$i" 2>"$of"
		sleep 1
	fi

	if [[ ! -s $of ]]; then continue; fi
	if [[ ! -e "$basedir/$i.0.csv" && ! -e "$basedir/$i.1.csv" ]]; then
		echo CSV "$i"
		osascript -s o $CSV "$i" 2>&1 | while read x; do
			if [ -e "$x" ]; then echo "$x"; cp "$x" "$basedir"; fi
		done
		sleep 1
	fi
done
