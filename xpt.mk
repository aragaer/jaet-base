compdir=$(pkgdatadir)/components
%.xpt: %.idl
	$(XPIDL) -m typelib -w -v -I $(IDLDIR) -e $@ $<
