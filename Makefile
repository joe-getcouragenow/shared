
# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.

BOILERPLATE_FSPATH=./boilerplate

include $(BOILERPLATE_FSPATH)/help.mk
include $(BOILERPLATE_FSPATH)/os.mk
include $(BOILERPLATE_FSPATH)/gitr.mk
include $(BOILERPLATE_FSPATH)/tool.mk
include $(BOILERPLATE_FSPATH)/flu.mk
include $(BOILERPLATE_FSPATH)/go.mk


# remove the "v" prefix
VERSION ?= $(shell echo $(TAGGED_VERSION) | cut -c 2-)

override FLU_SAMPLE_NAME =client
override FLU_LIB_NAME =client


## Print all settings
this-print: ## print
	
	$(MAKE) os-print
	
	$(MAKE) gitr-print

	$(MAKE) go-print

	$(MAKE) tool-print
	
	$(MAKE) flu-print

	$(MAKE) flu-gen-lang-print

	

this-dep:
	# LOCAL DEVS: go to root make file and call this yourself to get all the tools !!!!
	# install tools
	cd ./tool && $(MAKE) this-build

	# Install our grpc tools
	#$(MAKE) grpc-all

### CI

## Build for CI. Does Big Gen !
this-build: this-print this-dep