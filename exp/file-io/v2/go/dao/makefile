

LIB_BIN_FSPATH=$(PWD)/bin/$(LIB_NAME)-cli
LIB_DATA_FSPATH=$(PWD)/data

print:
	@echo
	@echo
	@echo LIB_BIN_FSPATH: $(LIB_BIN_FSPATH)
	@echo LIB_DATA_FSPATH: $(LIB_DATA_FSPATH)
	@echo

run:
	# delete DB files
	rm -rf mydb
	mkdir mydb

	go run main.go
run-delete:
	rm -rf mydb

cli:
	# DONT both with with this. Was just playing aorund..
	badger-cli --dir mydb list