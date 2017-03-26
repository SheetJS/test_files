#!/usr/bin/env osascript
-- csv2016.scpt -- generate csv output using Excel 2016 for Mac
-- Copyright (C) 2013-present  SheetJS
-- vim: set ts=2:

-- note: Excel 2016 can only write to a specific folder: ~/Library/Containers/com.microsoft.Excel
-- Make the directory ~/Library/Containers/com.microsoft.Excel/Data/2016
-- Change the _sheetjs_ term in the script to your username

on run argv
	set pwd to (system attribute "PWD")
	set workingDir to POSIX path of pwd
	set input_file_name to pwd & "/" & (item 1 of argv)
	set input_file to POSIX file input_file_name
	tell application "Microsoft Excel"
		open workbook workbook file name input_file update links do not update links read only true ignore read only recommended true notify false add to mru false
		tell active workbook
			set idx to 1
			repeat 1040 times
				try
					tell sheet idx
						set ofile to (item 1 of argv) & "." & (idx - 1) & ".csv"
						set ofile to "/Users/_sheetjs_/Library/Containers/com.microsoft.Excel/Data/2016/" & ofile
						log ofile
						save as filename ofile file format CSV Windows file format overwrite true
					end tell
				end try
				set idx to (idx + 1)
			end repeat
			close saving no
		end tell
		try
			tell active workbook to close
		end try
		quit saving no
	end tell
end run
