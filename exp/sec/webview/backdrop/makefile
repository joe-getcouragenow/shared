# https://github.com/fluttercommunity/backdrop

LIB=github.com/fluttercommunity/backdrop
LIB_FSPATH=$(GOPATH)/src/$(LIB)

# flu build
override FLU_SAMPLE_NAME = example
override FLU_SAMPLE_FSPATH = $(LIB_FSPATH)/$(FLU_SAMPLE_NAME)

this-print:
	@echo
	@echo LIB: $(LIB)
	@echo LIB_FSPATH: $(LIB_FSPATH)
	@echo
	@echo

this-clone:
	git clone https://$(LIB) $(LIB_FSPATH)
this-clone-del:
	rm -rf $(LIB_FSPATH)

## this-flu-web-run
this-vscode-add:
	code --add --reuse-window $(LIB_FSPATH)


### BUILD

LIB_HOV=github.com/go-flutter-desktop/hover
LIB_HOV_FSPATH=$(GOPATH)/src/$(LIB_HOV)
this-dep:

	git clone https://$(LIB_HOV) $(LIB_HOV_FSPATH)
	cd $(LIB_HOV_FSPATH) && go install .
this-dep-delete:
	rm -rf $(LIB_HOV_FSPATH)

### Web
this-flu-web-build:
	cd $(FLU_SAMPLE_FSPATH) && flutter build web
this-flu-web-run:
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d chrome

### DESK
this-flu-desk-init:
	cd $(FLU_SAMPLE_FSPATH) && hover init

this-flu-desk-run:
	cd $(FLU_SAMPLE_FSPATH) && hover run .

this-flu-desk-buildrun:
	cd $(FLU_SAMPLE_FSPATH) && hover build darwin
	open $(FLU_SAMPLE_FSPATH)/go/build/outputs/darwin/$(FLU_SAMPLE_NAME)

### Mob

this-flu-mob-init:
	cd $(FLU_SAMPLE_FSPATH) && open ios/Runner.xcworkspace
	# Click runner and and then in the top pane click "Signing" and choose your accont.

this-flu-mob-clean:
	cd $(FLU_SAMPLE_FSPATH) && rm -rf ios/Pods
	cd $(FLU_SAMPLE_FSPATH) && flutter clean

this-flu-mob-run:
	
	cd $(FLU_SAMPLE_FSPATH) && flutter run -d "iPhone joe"
