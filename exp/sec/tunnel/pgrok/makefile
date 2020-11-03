# https://github.com/jerson/pgrok

LIB=github.com/jerson/pgrok
LIB_FSPATH=$(GOPATH)/src/$(LIB)


BIN_CLI=$(PWD)/bin/pgrok
BIN_SERVER=$(PWD)/bin/pgrokd

git-clone:
	git clone https://$(LIB) $(LIB_FSPATH)
git-clone-delete:
	rm -rf $(LIB_FSPATH)

build:
	cd $(LIB_FSPATH) && $(MAKE) deps
	cd $(LIB_FSPATH) && $(MAKE) assets
	
	cd $(LIB_FSPATH)/cmd/pgrokd && go build -o $(BIN_SERVER) .
	cd $(LIB_FSPATH)/cmd/pgrok && go build -o $(BIN_CLI) .
srv-run:
	$(BIN_SERVER)
scli-run:
	$(BIN_CLI)