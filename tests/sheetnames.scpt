#!/usr/bin/env osascript
-- sheetnames.scpt -- generate sheet names using Excel 2011 for Mac
-- Copyright (C) 2013  SheetJS

on run argv
	set pwd to (system attribute "PWD")
	set workingDir to POSIX path of pwd
	set input_file_name to pwd & "/" & (item 1 of argv)
	set input_file to POSIX file input_file_name 
	set sheetnames to {}
	tell application "Microsoft Excel"
		open workbook workbook file name input_file update links do not update links read only true ignore read only recommended true notify false add to mru false
		tell active workbook
			set idx to 1
			repeat 40 times
				try
					tell sheet idx
						if (get worksheet type) is not equal to (sheet type worksheet) then error ("'" & (get worksheet type) & "'")
						copy name to the end of sheetnames
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
	repeat with name in sheetnames
		log name
	end
end run
