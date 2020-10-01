

this-all: this-print this-tool-build this-ex-build

this-print:
	@echo sdk
	
this-tool-build:
	cd bs-embed && $(MAKE) this-all

this-ex-build:
	cd bs-embed-ex && $(MAKE) this-all

this-ex-run:
	cd bs-embed-ex && $(MAKE) this-run
