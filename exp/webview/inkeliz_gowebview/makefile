
LIB1=github.com/webview/webview
LIB1_FSPATH=$(GOPATH)/src/$(LIB1)

LIB2=github.com/inkeliz/gowebview
LIB2_FSPATH=$(GOPATH)/src/$(LIB)



print:
	echo
	echo $(LIB1_FSPATH)
	echo
	echo $(LIB2_FSPATH)
	echo

git-clone:
	git clone https://$(LIB1) $(LIB1_FSPATH)
	git clone https://$(LIB2) $(LIB2_FSPATH)
	
git-clone-delete:
	rm -rf $(LIB1_FSPATH)
	rm -rf $(LIB2_FSPATH)
	

build1:
	cd $(LIB1_FSPATH) && go build .
run1:
	cd lib1-ex && go run .
build2:
	cd $(LIB_FSPATH) && go generate .


BIN=./example
ex-build:
	
	go build -o $(BIN) .
ex-run:
	$(BIN)