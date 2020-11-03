# https://github.com/jerson/pgrok

# Use mkcert with this to create the Certs for testing and also for real server.

# Use https://github.com/inconshreveable/go-update/tree/v0
	# - https://equinox.io/ https://equinox.io/docs#how-it-works
	# https://dl.equinox.io/equinox/release-tool/stable
		# Make the exact same !
	# - We dont need any of this except the binary diffs.
	# - we already do packaging via Hover.




LIB=github.com/jerson/pgrok
LIB_FSPATH=$(GOPATH)/src/$(LIB)

BIN_FSPATH=$(PWD)/bin
BIN_CLI=$(BIN_FSPATH)/tunnel-cli
BIN_SERVER=$(BIN_FSPATH)/tunnel

git-clone:
	git clone https://$(LIB) $(LIB_FSPATH)
git-clone-delete:
	rm -rf $(LIB_FSPATH)

build:
	cd $(LIB_FSPATH) && $(MAKE) deps
	cd $(LIB_FSPATH) && $(MAKE) assets
	
	cd $(LIB_FSPATH)/cmd/pgrokd && go build -o $(BIN_SERVER) .
	cd $(LIB_FSPATH)/cmd/pgrok && go build -o $(BIN_CLI) .
build-delete:
	rm -rf $(BIN_FSPATH)

# NETWORKING
# hosted domain for tunnel (-domain)
TUNNEL_DOMAIN=
# Ports for HTTP . (-httpAddr)
TUNNEL_HTTP_PORT=:80
# Ports for HTTPS . (-httpsAddr)
TUNNEL_HTTPS_PORT=:443
# Port for cli. (-tunnelAddr)
TUNNEL_CLI_PORT=4443

# CERTS
# Cert for Mutual Authentication (-tlsClientCA)
TUNNEL_CLIENT_CA_FSPATH=
# Cert for Server TLS (-tlsCrt)
TUNNEL_TLS_CERT_FSPATH= 
# Key for Server TLS (-tlsKey)
TUNNEL_TLS_Key_FSPATH=

# METRICS (exports to env)
KEEN_API_KEY=?
KEEN_PROJECT_TOKEN=?
KEEN_API_KEY=?

server-run:
	$(BIN_SERVER)
	# ./pgrokd -tlsKey="/path/to/tls.key" -tlsCrt="/path/to/tls.crt" -domain="example.com"
server-open:
	open 
cli-run:
	$(BIN_CLI) -config 