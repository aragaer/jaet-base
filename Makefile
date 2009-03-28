SHELL = /bin/sh

SUBMODULES = base

DIRS = base extensions
TARGET ?= Linux
BASE_DIR = $(shell pwd)
export BASE_DIR
export TARGET

.PHONY: all clean $(DIRS)

all:
	$(MAKE) jaet

push:
	for i in $(SUBMODULES) ; do (cd $$i && git push origin master ) ; done
	git push origin master

pull:
	git pull origin master
	git submodule update

clean:
	@$(MAKE) $(DIRS) COMMAND=$@

clobber:
	git clean -qdf
	-rm -rf ~/.aragaer/jaet

run:
	xulrunner build/jaet_$(TARGET)/application.ini

run-dbg:
	xulrunner build/jaet_$(TARGET)/application.ini -jsconsole

$(DIRS):
	@echo "=== $@ ==="
	@$(MAKE) -C $@ $(COMMAND)

.DEFAULT:
	@mkdir -p $(BASE_DIR)/build/$@_$(TARGET)
	$(MAKE) -C base all RELEASE_DIR=$(BASE_DIR)/build/$@_$(TARGET)
