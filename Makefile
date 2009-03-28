SHELL = /bin/sh

DIRS = base extensions
TARGET ?= Linux
BASE_DIR = $(shell pwd)
export BASE_DIR
export TARGET

.PHONY: all clean $(DIRS)

all:
	$(MAKE) jaet

clean:
	@$(MAKE) $(DIRS) COMMAND=$@

$(DIRS):
	@echo "=== $@ ==="
	@$(MAKE) -C $@ $(COMMAND)

.DEFAULT:
	@mkdir -p $(BASE_DIR)/build/$@_$(TARGET)
	$(MAKE) -C base all RELEASE_DIR=$(BASE_DIR)/build/$@_$(TARGET)
