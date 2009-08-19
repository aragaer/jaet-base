SUBDIRS=src binary
bin_SCRIPTS=jaet

jaet:
	echo "#!/bin/bash" > jaet
	echo "exec xulrunner $(pkgdatadir)/application.ini \$$@" >> jaet
	chmod +x jaet
