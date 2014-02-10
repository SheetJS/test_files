#!/usr/bin/env ruby
# tests/roo.rb -- roo test files
# Copyright (C) 2014  SheetJS
require 'roo'
require 'spreadsheet'

p ARGV[0]
f = Roo::Spreadsheet.open(ARGV[0])
f.each_with_pagename do |name, sheet|
	p sheet;
end
