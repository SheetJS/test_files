#!/bin/bash
# xls.sh -- generate sheet names and xls output using Excel 2011 for Mac
# Copyright (C) 2014  SheetJS

basedir=${1:-2011}
mkdir -p $basedir
XLS=./xls.scpt
SNAME=./sheetnames.scpt
if [ ! -e $XLS ]; then 
	XLS=./tests/xls.scpt
	SNAME=./tests/sheetnames.scpt
fi

for i in *.xlsx *.xlsm; do
	# generate sheetnames output
	if [ -e "./tests/skips/$i.skip" ]; then continue; fi
	of="$basedir/$i.sheetnames"
	if [[ ! -s $of ]]; then
		echo $i $of >&2
		osascript -s o $SNAME "$i" 2>"$of"
		sleep 1
	fi
	
	if [[ ! -s $of ]]; then continue; fi
	if [[ ! -s "$basedir/$i.xls" ]]; then
		echo XLS "$i"
		osascript -s o $XLS "$i"
		mv ~/Desktop/"$i".xls $basedir
		sleep 1
	fi
done
