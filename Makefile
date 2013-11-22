.PHONY: init clean apachepoi xlrd
init: apachepoi xlrd

clean:
	git clean -fd

apachepoi:
	svn co http://svn.apache.org/repos/asf/poi/trunk/test-data/spreadsheet/ .

xlrd:
	svn co --trust-server-cert --non-interactive https://github.com/python-excel/xlrd/trunk/tests xlrd 
	cd xlrd; for i in *.xls *.xlsx; do cp $$i ../xlrd_$$i; done
