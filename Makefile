.PHONY: init clean
init: apachepoi

clean:
	git clean -fd

apachepoi:
	svn co http://svn.apache.org/repos/asf/poi/trunk/test-data/spreadsheet/ .
