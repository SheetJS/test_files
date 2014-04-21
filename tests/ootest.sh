#!/bin/bash
# ootest.sh -- Download from http://www.openoffice.org/sc/testdocs/filetype/
# Copyright (C) 2014  SheetJS

mkdir -p ootest
curl http://www.openoffice.org/sc/testdocs/ | grep -o '"[^"]*xls"' | awk -F'"' '{print $2}' | while read x; do
	y=${x##*/};
	if [ ! -e ootest_"$y" ]; then
		curl -o "ootest_$y" "http://www.openoffice.org/sc/testdocs/$x"
	fi
done

