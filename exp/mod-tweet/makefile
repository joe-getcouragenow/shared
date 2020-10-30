# includes
BOILERPLATE_FSPATH=./../../../boot/boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk

# https://github.com/jointwt/goryon

# GO GRPC is now here:https://github.com/grpc/grpc-go
# But the go module is here: 
LIB=github.com/jointwt/goryon
#LIB=github.com/bi-zone/gon
LIB_FSPATH=$(GOPATH)/src/$(LIB)
LIB_VERSION=? # not used currently.


FLU_SAMPLE_FSPATH = $(LIB_FSPATH)

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

this-flu-web-run:
	$(MAKE) flu-web-run


this-flu-desk-init:
	$(MAKE) flu-desk-init
this-flu-desk-init-pack:
	$(MAKE) flu-desk-init-pack

this-flu-desk-build:
	$(MAKE) flu-desk-build
this-flu-desk-open:
	$(MAKE) flu-desk-open
