#!/usr/bin/env python
# tests/xlrd.py -- xlrd test files
# Copyright (C) 2013  SheetJS

import sys

# remove current directory from path (xlrd directory confuses python)
sys.path = sys.path[1:] 
import xlrd

filename=sys.argv[1]
bk = xlrd.open_workbook(filename)
