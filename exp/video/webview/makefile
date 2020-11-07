# includes
BOILERPLATE_FSPATH=./../../../../boot/boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk

# Video cross platform is freaking impossible.
# Use a webview instead.
# For desktop with go-flutter need to find a solution.
# this will also mean that grpc-web is used and the app is automatically updated from server.

# Orig
#https://github.com/balvinderz/video_player_web_hls
LIB=github.com/balvinderz/video_player_web_hls
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


fix:
	## Needs a "flutter create ."
	#cd $(FLU_SAMPLE_FSPATH) && flutter create .

	# ios pod file scew up
	cd $(LIB_FSPATH) && rm ios/Podfile.lock
	cd $(LIB_FSPATH) && rm -rf ios/Pods
	cd $(LIB_FSPATH) && flutter clean


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
run-ios:
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d 9175a508b5f6e39b84ed21323d2a7510c6af942b
run-ios-sim:
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d 336A4A58-CD9A-4FDE-A5E9-7604A1B26E49 

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