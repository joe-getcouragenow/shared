# https://github.com/fluttercommunity/flutter_webview_plugin

LIB=ggithub.com/fluttercommunity/flutter_webview_plugin
LIB_FSPATH=$(GOPATH)/src/$(LIB)

# flu build
override FLU_SAMPLE_FSPATH = $(LIB_FSPATH)

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

this-build:
	cd $(LIB_FSPATH) && $(MAKE)
