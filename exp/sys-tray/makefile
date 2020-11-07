# https://github.com/JanezStupar/flutter_systray

# WORKS REALLY WELL !
# BUG:https://github.com/JanezStupar/flutter_systray/issues/2
# 	- In release buidl the icon is not found.


# git include
BOILERPLATE_FSPATH=./../../boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk

LIB=github.com/JanezStupar/flutter_systray
LIB_FSPATH=$(GOPATH)/src/$(LIB)

# flu build
override FLU_LIB_FSPATH = $(LIB_FSPATH)/$(FLU_SAMPLE_NAME)
override FLU_SAMPLE_NAME = example
override FLU_SAMPLE_FSPATH = $(LIB_FSPATH)/$(FLU_SAMPLE_NAME)

this-print:
	@echo
	@echo LIB: $(LIB)
	@echo LIB_FSPATH: $(LIB_FSPATH)
	@echo
	@echo

this-git-clone:
	git clone https://$(LIB) $(LIB_FSPATH)
this-git-clone-delete:
	rm -rf $(LIB_FSPATH)

## this-flu-web-run
this-code-add:
	code --add --reuse-window $(LIB_FSPATH)

fix:
	## Needs a "flutter create ."
	cd $(FLU_SAMPLE_FSPATH) && flutter create .

## Native

PORT=8200
serve:
	# fails... 
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


## HOVER 
this-test:
	$(MAKE) flu-test
## this-flu-web-run
this-flu-web-run:
	$(MAKE) flu-web-run 

## this-flu-desk-init
this-flu-desk-init:
	$(MAKE) flu-desk-init 
	cd $(LIB_FSPATH) && hover plugins get

## this-flu-desk-run
this-flu-desk-run:
	$(MAKE) flu-desk-run 
this-flu-desk-build:
	$(MAKE) flu-desk-build
this-flu-desk-open:
	$(MAKE) flu-desk-open

this-flu-desk-doctor:
	cd $(FLU_SAMPLE_FSPATH) && bs-hover doctor

this-flu-desk-pack-init:
	cd $(FLU_SAMPLE_FSPATH) && bs-hover init-packaging darwin-bundle
	cd $(FLU_SAMPLE_FSPATH) && hover init-packaging darwin-pkg
this-flu-desk-pack:
	#cd $(FLU_SAMPLE_FSPATH) && bs-hover init-packaging darwin-pkg
	# ONLY works
	cd $(FLU_SAMPLE_FSPATH) && bs-hover build darwin-bundle
	# Does not install properly, so use DMG instead
	#cd $(FLU_SAMPLE_FSPATH) && bs-hover build darwin-pkg
	cd $(FLU_SAMPLE_FSPATH) && bs-hover build darwin-dmg
this-flu-desk-pack-open:
	open $(FLU_SAMPLE_FSPATH)/go/build/outputs
