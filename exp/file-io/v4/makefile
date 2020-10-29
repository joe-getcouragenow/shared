
# https://github.com/RTradeLtd/go-temporalx-sdk/blob/master/Makefile

include ./version.mk
include ./release.mk

BIN_FLAGS := -ldflags "-X main.version=$(VERSION)"
BIN_FSPATH=./bin

CMD_CLI_FSPATH=$(PWD)/cmd/cli/main.go
BIN_CLI_NAME=fileio-cli#-$(VERSION)
BIN_CLI_FSAPTH=$(BIN_FSPATH)/$(BIN_CLI_NAME)


CMD_S3X_FSPATH=$(PWD)/cmd/s3x/main.go
BIN_S3X_NAME=fileio-server#-$(VERSION)
BIN_S3X_FSAPTH=$(BIN_FSPATH)/$(BIN_S3X_NAME)

print:

	$(MAKE) version-print
	$(MAKE) release-print

	@echo 
	@echo BIN_FLAGS : $(BIN_FLAGS) 
	@echo BIN_FSPATH : $(BIN_FSPATH) 
	@echo 
	@echo CMD_CLI_FSPATH : $(CMD_CLI_FSPATH) 
	@echo BIN_CLI_FSAPTH : $(BIN_CLI_FSAPTH) 
	@echo 
	@echo CMD_S3X_FSPATH : $(CMD_S3X_FSPATH) 
	@echo BIN_S3X_FSAPTH : $(BIN_S3X_FSAPTH) 
	@echo 

	

build:
	# cli
	go build $(BIN_FLAGS) -o $(BIN_CLI_FSAPTH) $(CMD_CLI_FSPATH) 
	# s3x server
	go build $(BIN_FLAGS) -o $(BIN_S3X_FSAPTH) $(CMD_S3X_FSPATH) 

cli-run:
	$(BIN_CLI_FSAPTH) -h

	# util for key management
	$(BIN_CLI_FSAPTH) util

	# grpc cli with many commans
	$(BIN_CLI_FSAPTH) client

	# grpc admin
	$(BIN_CLI_FSAPTH) client admin


