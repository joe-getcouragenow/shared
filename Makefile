
BOILERPLATE_FSPATH=./boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/grpc.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk

# remove the "v" prefix
VERSION ?= $(shell echo $(TAGGED_VERSION) | cut -c 2-)

## Print all settings
this-print: ## print
	
	$(MAKE) os-print
	
	$(MAKE) gitr-print

	$(MAKE) go-print

	$(MAKE) tool-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	
### BUILD

# Called from CI.
# Devs should run this before a git commit, so then they know that it will pass CI too.

this-dep:
	# none

## Build in CI
this-all: this-print 
	# build
	cd ./tool && $(MAKE) this-build
	
	# test
	cd ./tool && $(MAKE) this-test

	# SDK
	cd ./tool/sdk && $(MAKE) this-all



### DEV


## Sync

# Repos
LIB_MAIN_FSPATH=$(PWD)/../main
LIB_MOD_FSPATH=$(PWD)/../mod
LIB_SYS_FSPATH=$(PWD)/../sys
LIB_SYS_SHARE_FSPATH=$(PWD)/../sys-share
#LIB_DEV_FSPATH=$(PWD)/../dev


REPO_LIST=main mod sys sys-share

# Folders in each repo
BOILER_NAME=boilerplate
DOC_NAME=doc

#override GITR_COMMIT_MESSAGE = joe
override GITR_COMMIT_MESSAGE = $(MESSAGE)

this-git-all: this-copy-all this-git-commit-all this-git-catchup-all this-git-push-all

## Forces commit in all repos
this-git-commit-all: 

	# Useful when working across many repos.
	# Add the same Issue number

	@echo GITR_COMMIT_MESSAGE: $(GITR_COMMIT_MESSAGE)

	for repo in $(REPO_LIST); do \
		cd ./../$$repo && $(MAKE) gitr-fork-commit ; \
  	done

## Force catchup from Upsteam for all repos.
this-git-catchup-all:

	for repo in $(REPO_LIST); do \
		cd ./../$$repo && $(MAKE) gitr-fork-catchup ; \
  	done

this-git-push-all:

	for repo in $(REPO_LIST); do \
		cd ./../$$repo && $(MAKE) gitr-fork-push ; \
  	done

## Copy boilerplate to other repos.
this-copy-all:

	# Shared is the MASTER of boilerplate
	# We Copy them to the othe repos.
	for repo in $(REPO_LIST); do \
		cd ./../$$repo && rm -rf $(BOILER_NAME) ; \
  	done

	for repo in $(REPO_LIST); do \
		cp -Rvi ./boilerplate ./../$$repo/$(BOILER_NAME) ; \
  	done