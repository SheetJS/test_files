.PHONY: index.html
index.html:
	echo "<ul>" > $@
	git ls-files | while read x; do echo "<li><a href='$$x'>$$x</a></li>"; done >> $@ 
	echo "</ul>" >> $@
