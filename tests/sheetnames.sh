#!/bin/bash
# sheetnames.sh -- generate sheet names using Excel 2011 for Mac
# Copyright (C) 2013  SheetJS

basedir=${1:-2011}
mkdir -p $basedir
SCPT=./sheetnames.scpt
if [ ! -e $SCPT ]; then SCPT=./tests/sheetnames.scpt; fi

for i in *.xls *.xlsx *.xlsm *.xlsb; do
	of="$basedir/$i.sheetnames"
	echo $i $of >&2
	if [[ ! -s "$of" && ! -e "./tests/skips/$i.skip" ]]; then osascript -s o $SCPT "$i" 2>"$of"; sleep 1; fi
done
