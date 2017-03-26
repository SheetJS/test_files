#!/bin/bash
# sheetnames.sh -- generate sheet names using Excel 2016 for Mac
# Copyright (C) 2013-present  SheetJS

basedir=${1:-2016}
mkdir -p $basedir
SCPT=./sheetnames.scpt
if [ ! -e $SCPT ]; then SCPT=./tests/sheetnames.scpt; fi

for i in *.xls *.xlsx *.xlsm *.xlsb *.xml; do
	of="$basedir/$i.sheetnames"
	#echo $i $of >&2
	if [[ ! -s "$of" && ! -e "./tests/skips/$i.skip" ]]; then echo $i; osascript -s o $SCPT "$i" 2>"$of"; sleep 1; fi
done
