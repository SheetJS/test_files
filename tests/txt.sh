#!/bin/bash
# txt.sh -- generate sheet names and txt output using Excel 2011 for Mac
# Copyright (C) 2014  SheetJS

MODE=TXT
FMT=txt

basedir=${1:-2011}
mkdir -p $basedir
CMD=./$FMT.scpt
SNAME=./sheetnames.scpt
if [ ! -e $CMD ]; then
	CMD=./tests/$FMT.scpt
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
	if [[ ! -s "$basedir/$i.0.$FMT" && ! -s "$basedir/$i.1.$FMT" ]]; then
		echo $MODE "$i"
		osascript -s o $CMD "$i"
		mv ~/Desktop/"$i".*.$FMT $basedir
		sleep 1
	fi
done
