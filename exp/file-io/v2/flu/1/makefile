# https://github.com/Baseflow/flutter_cache_manager

# bad: uses sqflite. 

# includes
BOILERPLATE_FSPATH=./../../../../../../boot/boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk


LIB=github.com/Baseflow/flutter_cache_manager
#LIB=github.com/bi-zone/gon
LIB_FSPATH=$(GOPATH)/src/$(LIB)
LIB_VERSION=? # not used currently.

FLU_SAMPLE_FSPATH = $(LIB_FSPATH)/flutter_cache_manager/example

# This is the Image it wil download 
https://blurha.sh/assets/images/img1.jpg


this-all: this-print

this-print:
	@echo

	@echo
	@echo LIB: 				$(LIB)
	@echo LIB_FSPATH: 		$(LIB_FSPATH)
	@echo LIB_VERSION: 		$(LIB_VERSION)
	@echo

this-git-clone:
	git clone https://$(LIB) $(LIB_FSPATH)
this-git-clone-delete:
	rm -rf $(LIB_FSPATH)

open:
	open $(LIB_FSPATH)

### Using pure flutter

this-update-check:
	$(MAKE) flu-pub-update-check

this-update:
	$(MAKE) flu-pub-update


serve:
	# works and is easy way to test without golang.
	cd $(FLU_SAMPLE_FSPATH) && flutter run web-server
setup:
	flutter channel dev
	flutter upgrade
	flutter devices
	flutter config --enable-windows-desktop
	flutter config --enable-macos-desktop
	flutter config --enable-linux-desktop
setup-check:
	flutter channel
	flutter devices
	flutter doctor

run:
	cd $(FLU_SAMPLE_FSPATH) && flutter run
run-web:
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d chrome
run-macos:
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d macos

build:
	#cd $(FLU_SAMPLE_FSPATH) && flutter build web
	#cd $(FLU_SAMPLE_FSPATH) && flutter build windows
	# works ?
	cd $(FLU_SAMPLE_FSPATH) && flutter build macos
	#cd $(FLU_SAMPLE_FSPATH) && flutter build linux




### Using our flu-mk

this-flu-web-run:
	# works
	$(MAKE) flu-web-run


this-flu-desk-init:
	$(MAKE) flu-desk-init
this-flu-desk-init-pack:
	$(MAKE) flu-desk-init-pack

this-flu-desk-build:
	$(MAKE) flu-desk-build
this-flu-desk-open:
	$(MAKE) flu-desk-open
