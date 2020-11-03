# tunnel

# WARP from cloudflared: https://github.com/cloudflare/cloudflared
# Run our own: https://github.com/jpillora/chisel

# SO we can proxy everything and hide the original sever. 
# Users need to run the chisel. We can bake that into the SDK tools later
# Chisel support TCP and UDP and so video conf and QUIC will work :) Just like WARP !

CHI_LIB=github.com/jpillora/chisel
CHI_LIB_FSPATH=$(GOPATH)/src/$(CHI_LIB)
CHI_VERSION=v1.7.1

CHI_BIN_FSPATH=$(CHI_LIB_FSPATH)/bin
CHI_BIN=$(CHI_BIN_FSPATH)/chi

print:
	@echo
	@echo CHI_LIB: $(CHI_LIB)
	@echo CHI_LIB_FSPATH: $(CHI_LIB_FSPATH)
	@echo CHI_VERSION: $(CHI_VERSION)
	@echo
	@echo CHI_BIN_FSPATH: $(CHI_BIN_FSPATH)
	@echo CHI_BIN: $(CHI_BIN)
	@echo

dep:
	# git clone --depth 1 --branch <tag_name> <repo_url>
	git clone --depth 1 --branch $(CHI_VERSION) https://$(CHI_LIB) $(CHI_LIB_FSPATH)
dep-delete:
	rm -rf $(CHI_LIB_FSPATH)
vscode-add:
	code -a -r $(CHI_LIB_FSPATH)

build: build-delete
	cd $(CHI_LIB_FSPATH) && go build -o $(CHI_BIN) .
build-delete:
	rm -rf $(CHI_BIN_FSPATH)


CHI_ENV_PORT=9000
CHI_ENV_PROXY=https://chisel-demo.herokuapp.com/
CHI_ENV_CLIENT_PORT=3000
server-run:
	# chisel server --port $PORT --proxy http://example.com
	$(CHI_BIN) server --port $(CHI_ENV_PORT) --proxy $(CHI_ENV_PROXY) 
client-run:
	# chisel client https://chisel-demo.herokuapp.com 3000
	$(CHI_BIN) client $(CHI_ENV_PROXY) $(CHI_ENV_CLIENT_PORT)
client-open:
	open http://127.0.0.1:$(CHI_ENV_CLIENT_PORT)
	
