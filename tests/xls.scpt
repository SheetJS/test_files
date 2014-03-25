#!/usr/bin/env osascript
-- xls.scpt -- generate xls output using Excel 2011 for Mac
-- Copyright (C) 2014  SheetJS
-- vim: set ts=2:

on run argv
	set pwd to (system attribute "PWD")
	set workingDir to POSIX path of pwd
	set input_file_name to pwd & "/" & (item 1 of argv)
	set input_file to POSIX file input_file_name
	tell application "Microsoft Excel"
		open workbook workbook file name input_file update links do not update links read only true ignore read only recommended true notify false add to mru false
		tell active workbook
			set ofile to (item 1 of argv) & ".xls"
			save workbook as filename ofile file format Excel98to2004 file format
			close saving no
		end tell
		try
			tell active workbook to close
		end try
		quit saving no
	end tell
end run
