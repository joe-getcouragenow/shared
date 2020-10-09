# 

FF_APP_FSPATH=/Applications/Firefox.App
FF_BIN_FSPATH=/Applications/Firefox.app/Contents/MacOS/firefox

FF_PROFILE_FSPATH=/Users/apple/Library/Application Support/Firefox/Profiles

PROFILE_X_FSPATH=

FF_DATA=$(PWD)/_data
FF_BIN=$(PWD)/_bin

FF_BIN_NAME=firefox-helper
FF_BIN_FSPATH=$(FF_BIN)/$(FF_BIN_NAME)

# TODO: DNS Set..
# TODO:https://github.com/pyllyukko/user.js/

PKGNAME=github.com/getcouragenow/shared/exp/sec/firefox


print:
	@echo
	@echo
	@echo FF_APP_FSPATH : $(FF_APP_FSPATH)
	@echo FF_BIN_FSPATH : $(FF_BIN_FSPATH)
	@echo FF_PROFILE_FSPATH : $(FF_PROFILE_FSPATH)
	@echo

dep:
	brew install firefox
	go install github.com/spf13/cobra/cobra

	# https://www.linode.com/docs/development/go/using-cobra/
	# cobra init --pkg-name github.com/getcouragenow/shared/exp/sec/firefox
	# cobra init --pkg-name github.com/getcouragenow/shared/exp/sec/firefox cmdname


help:
	$(FF_BIN_FSPATH) -h

version:
	$(FF_BIN_FSPATH) --full-version

profiles-open:
	open $(FF_PROFILE_FSPATH)

build:
	go build -o $(FF_BIN_FSPATH) .
	$(FF_BIN_FSPATH)


1:
	# create, delete profiles
	$(FF_BIN_FSPATH) --ProfileManager

2: 
	# start FF using this profile
	$(FF_BIN_FSPATH) --profile 





