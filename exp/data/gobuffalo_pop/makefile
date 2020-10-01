


# git include
BOILERPLATE_FSPATH=./../../../../boilerplate
include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk

# https://github.com/gobuffalo/pop


LIB=github.com/gobuffalo/pop
LIB_FSPATH=$(GOPATH)/src/$(LIB)

# flu build
override FLU_SAMPLE_FSPATH = $(LIB_FSPATH)

this-print:
	@echo
	@echo LIB: $(LIB)
	@echo LIB_FSPATH: $(LIB_FSPATH)
	@echo
	@echo

BUF_BIN=buffalo-pop

this-dep:
	# buffalo-pop/v2
	# combines github.com/gobuffalo/buffalo and github.com/gobuffalo/pop/v5
	go get -tags sqlite -u -v github.com/gobuffalo/buffalo-pop/v2

this-clone:
	git clone https://$(LIB) $(LIB_FSPATH)

	
this-clone-del:
	rm -rf $(LIB_FSPATH)

## this-flu-web-run
this-vscode-add:
	code --add --reuse-window $(LIB_FSPATH)


### BUILD

BIN_FSPATH=$(PWD)/bin
BIN_NAME=$(BIN_FSPATH)/soda

DATA_FSPATH=$(PWD)/data
DATA_NAME=$(DATA_FSPATH)/01

#DB_TYPE=cockroach
DB_TYPE=sqlite3

this-db-dep:
	# Using cockroach
	brew install cockroachdb/tap/cockroach
this-dp-run:
	cockroach start --unencrypted-localhost-http --insecure

this-build-print:
	@echo
	@echo BIN_FSPATH: $(BIN_FSPATH)
	@echo BIN_NAME: $(BIN_NAME)
	@echo
	
	@echo
	@echo DATA_FSPATH: $(DATA_FSPATH)
	@echo DATA_NAME: $(DATA_NAME)
	@echo

	@echo
	@echo DB_TYPE: $(DB_TYPE)
	@echo

this-build:
	cd $(LIB_FSPATH)/soda && go build -o $(BIN_NAME) .
this-build-clean:
	rm -rf $(BIN_FSPATH)


this-run:
	mkdir -p $(DATA_NAME)
	# gen database-yml
	cd $(DATA_NAME) && $(BIN_NAME) generate config -t $(DB_TYPE)

	# gen migration
	cd $(DATA_NAME) && $(BIN_NAME) generate fizz fizz01

this-run-clean:
	rm -rf $(DATA_FSPATH)

### FLU



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