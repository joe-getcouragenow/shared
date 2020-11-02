
# https://github.com/RTradeLtd/go-temporalx-sdk/blob/master/Makefile

include ./version.mk
include ./release.mk

BIN_FLAGS := -ldflags "-X main.version=$(VERSION)"
BIN_FSPATH=$(PWD)/bin


LIB=github.com/RTradeLtd/s3x
LIB_FSPATH=$(GOPATH)/src/$(LIB)

# Server
CMD_S3X_FSPATH=$(LIB_FSPATH)/main.go
BIN_S3X_NAME=minio-s3x#-$(VERSION)
BIN_S3X_FSPATH=$(BIN_FSPATH)/$(BIN_S3X_NAME)

print:

	$(MAKE) version-print
	$(MAKE) release-print

	@echo 
	@echo BIN_FLAGS : $(BIN_FLAGS) 
	@echo BIN_FSPATH : $(BIN_FSPATH) 
	@echo 
	@echo 
	@echo CMD_S3X_FSPATH : $(CMD_S3X_FSPATH) 
	@echo BIN_S3X_FSAPTH : $(BIN_S3X_FSPATH) 
	@echo 

git-clone:
	git clone https://$(LIB) $(LIB_FSPATH)
git-clone-delete:
	rm -rf $(LIB_FSPATH)

code-open:
	code -a -r $(LIB_FSPATH)

build:
	cd $(LIB_FSPATH) && go mod download
	cd $(LIB_FSPATH) && GO111MODULE=on CGO_ENABLED=0 go build $(BIN_FLAGS) -tags kqueue -trimpath -o $(BIN_S3X_FSPATH) ./main.go
	

run:
	$(BIN_S3X_FSPATH) -h


