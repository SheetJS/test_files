#!/bin/bash
# csv.sh -- generate sheet names and csv output using Excel 2011 for Mac
# Copyright (C) 2013  SheetJS

basedir=${1:-2011}
mkdir -p $basedir
CSV=./csv.scpt
SNAME=./sheetnames.scpt
if [ ! -e $CSV ]; then
	CSV=./tests/csv.scpt
	SNAME=./tests/sheetnames.scpt
fi

for i in *.xls *.xlsx; do
	# generate sheetnames output
	if [ -e "./tests/skips/$i.skip" ]; then continue; fi
	of="$basedir/$i.sheetnames"
	if [[ ! -s $of ]]; then
		echo $i $of >&2
		osascript -s o $SNAME "$i" 2>"$of"
		sleep 1
	fi

	if [[ ! -s $of ]]; then continue; fi
	if [[ ! -s "$basedir/$i.0.csv" && ! -s "$basedir/$i.1.csv" ]]; then
		echo CSV "$i"
		osascript -s o $CSV "$i"
		mv ~/Desktop/"$i".*.csv $basedir
		sleep 1
	fi
done
