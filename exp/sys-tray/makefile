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

this-dep:
	git clone https://$(LIB) $(LIB_FSPATH)
this-dep-del:
	rm -rf $(LIB_FSPATH)

## this-flu-web-run
this-vscode-add:
	code --add --reuse-window $(LIB_FSPATH)

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

desk-pack:
	#cd $(FLU_SAMPLE_FSPATH) && hover init-packaging darwin-pkg
	cd $(FLU_SAMPLE_FSPATH) && hover build darwin-bundle
	cd $(FLU_SAMPLE_FSPATH) && hover build darwin-pkg
