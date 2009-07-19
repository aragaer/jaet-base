SUBDIRS=src
bin_SCRIPTS=jaet

jaet:
	echo "#!/bin/bash" > jaet
	echo "exec xulrunner $(pkgdatadir)/application.ini -jsconsole" >> jaet
	chmod +x jaet
