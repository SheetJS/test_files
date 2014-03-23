#!/bin/bash
# xml.sh -- generate sheet names and xml output using Excel 2011 for Mac
# Copyright (C) 2014  SheetJS

basedir=${1:-2011}
mkdir -p $basedir
XML=./xml.scpt
SNAME=./sheetnames.scpt
if [ ! -e $XML ]; then 
	XML=./tests/xml.scpt
	SNAME=./tests/sheetnames.scpt
fi

for i in *.xls *.xlsx *.xlsm; do
	# generate sheetnames output
	if [ -e "./tests/skips/$i.skip" ]; then continue; fi
	of="$basedir/$i.sheetnames"
	if [[ ! -s $of ]]; then
		echo $i $of >&2
		osascript -s o $SNAME "$i" 2>"$of"
		sleep 1
	fi
	
	if [[ ! -s $of ]]; then continue; fi
	if [[ ! -s "$basedir/$i.xml" ]]; then
		echo XML "$i"
		osascript -s o $XML "$i"
		mv ~/Desktop/"$i".xml $basedir
		sleep 1
	fi
done
