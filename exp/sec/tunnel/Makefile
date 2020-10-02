# tunnel

# WARP from cloudflared: https://github.com/cloudflare/cloudflared
# Run our own: https://github.com/jpillora/chisel

CHI_LIB=github.com/jpillora/chisel
CHI_LIB_FSPATH=$(GOPATH)/src/$(CHI_LIB)
CHI_VERSION=v1.7.1
CHI_BIN=$(CHI_LIB_FSPATH)/bin
CHI_CLIENT_BIN=$(CHI_BIN)/chi-cli
CHI_SERVER_BIN=$(CHI_BIN)/chi-server

print:
	@echo
	@echo CHI_LIB: $(CHI_LIB)
	@echo CHI_LIB_FSPATH: $(CHI_LIB_FSPATH)
	@echo CHI_VERSION: $(CHI_VERSION)
	@echo CHI_BIN: $(CHI_BIN)
	@echo CHI_CLIENT_BIN: $(CHI_CLIENT_BIN)
	@echo CHI_SERVER_BIN: $(CHI_SERVER_BIN)
	@echo

dep:
	# git clone --depth 1 --branch <tag_name> <repo_url>
	git clone --depth 1 --branch $(CHI_VERSION) https://$(CHI_LIB) $(CHI_LIB_FSPATH)
dep-delete:
	rm -rf $(CHI_LIB_FSPATH)
vscode-add:
	code -a -r $(CHI_LIB_FSPATH)

build: build-delete
	mkdir -p $(CHI_BIN)
	cd $(CHI_LIB_FSPATH) && go build -o $(CHI_SERVER_BIN) .
	cd $(CHI_LIB_FSPATH)/client && go build -o $(CHI_CLIENT_BIN) .
build-delete:
	rm -rf $(CHI_BIN)
