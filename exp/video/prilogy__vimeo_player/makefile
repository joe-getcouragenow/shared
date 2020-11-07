# includes
BOILERPLATE_FSPATH=./../../../../boot/boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk

# Orig
#LIB=github.com/prilogy/vimeo_player
# fork in english
#https://github.com/itsupport-sfu/vimeo_player
LIB=github.com/itsupport-sfu/vimeo_player

#LIB=github.com/bi-zone/gon
LIB_FSPATH=$(GOPATH)/src/$(LIB)
LIB_VERSION=? # not used currently.


FLU_SAMPLE_FSPATH = $(LIB_FSPATH)/example

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

setup:
	flutter channel dev
	flutter upgrade
	flutter devices
	flutter config --enable-web
	flutter config --enable-windows-desktop
	flutter config --enable-macos-desktop
	flutter config --enable-linux-desktop
setup-check:
	flutter channel
	flutter devices
	flutter doctor


PORT=8200
serve:
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d chrome --web-hostname=127.0.0.1 --web-port=$(PORT)
serve-release:
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d chrome --web-hostname=127.0.0.1 --web-port=$(PORT) --release
serve-public:
	ngrok http $(PORT)
	# open shttps://b89725841d38.ngrok.io



run-macos:
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d macos

build:
	#cd $(FLU_SAMPLE_FSPATH) && flutter build web --dart-define=flokk.forceWebLogin=true
	#cd $(FLU_SAMPLE_FSPATH) && flutter build windows
	cd $(FLU_SAMPLE_FSPATH) && flutter build macos
	#cd $(FLU_SAMPLE_FSPATH) && flutter build linux

### Using our flu-mk

### WEB
this-flu-web-run:
	$(MAKE) flu-web-run

### DESK

this-flu-desk-init:
	$(MAKE) flu-desk-init
this-flu-desk-init-plugins:
	$(MAKE) flu-desk-init-plugins


this-flu-desk-run:
	$(MAKE) flu-desk-run
this-flu-desk-build:
	$(MAKE) flu-desk-build
this-flu-desk-open:
	$(MAKE) flu-desk-open

### DESK releasing

this-flu-desk-init-pack:
	$(MAKE) flu-desk-init-pack