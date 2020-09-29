
# includes
BOILERPLATE_FSPATH=./../../boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/go.mk


# Print
this-print:
	@echo
	@echo -- TOOL LANG --
	@echo

this-dep:
	go get github.com/securego/gosec/v2/cmd/gosec
LIB_BINDATA=github.com/go-bindata/go-bindata
LIB_BINDATA_FSPATH=$(GOPATH)/src/github.com/go-bindata/go-bindata
LIB_BINDATA_BIN=$(GOPATH)/bin/go-bindata

this-bindata-clone:
	git clone https://$(LIB_BINDATA) $(LIB_BINDATA_FSPATH)

this-bindata-clone-delete:
	rm -rf $(LIB_BINDATA_FSPATH)

this-bindata-build:
	cd $(LIB_BINDATA_FSPATH)/go-bindata && go build -o $(LIB_BINDATA_BIN) .
	which $(LIB_BINDATA_BIN)

## Fixed so mod
this-mod:
	$(MAKE) go-mod-update

EMBED_BIN_NAME=bs-embed
EMBED_BIN_FSPATH=$(GOPATH)/bin/$(EMBED_BIN_NAME)

GEN_BIN_NAME=bs-gen
GEN_BIN_FSPATH=$(GOPATH)/bin/$(GEN_BIN_NAME)

## Build
this-build: 
	cd cmd/embed && go build -o $(EMBED_BIN_FSPATH) .
	which $(EMBED_BIN_NAME)

	cd cmd/gen && go build -o $(GEN_BIN_FSPATH) .
	which $(GEN_BIN_NAME)

this-run:
	$(BIN_FSPATH)



