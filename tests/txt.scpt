#!/usr/bin/env osascript
-- txt.scpt -- generate text output using Excel 2011 for Mac
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
			set idx to 1
			repeat 100 times
				try
					tell sheet idx
						--if (get worksheet type) is not equal to (sheet type worksheet) then error ("'" & (get worksheet type) & "'")
						set ofile to (item 1 of argv) & "." & (idx - 1) & ".txt"
						-- save as filename ofile file format CSV Windows file format
						save as filename ofile file format current platform text file format
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
