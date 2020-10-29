BIN_NAME=badger-cli

LIB=github.com/joe-getcouragenow/badger-cli
LIB_FSPATH=$(GOPATH)/src/$(LIB)

git-clone:
	git clone https://$(LIB) $(LIB_FSPATH)
code-open:
	code -a -r $(LIB_FSPATH)

build:
	go build -o $(BIN_NAME) main.go

install:
	go build -o $(GOPATH)/bin/$(BIN_NAME) main.go