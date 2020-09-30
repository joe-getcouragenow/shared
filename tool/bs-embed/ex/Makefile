.PHONY: generate

NAME=maintemplate
MOD_LIST= maintemplate mod01
EMBED_FLAGS = -pkg assets -nomemcopy -fs -prefix "assets"

GOSEC_BIN_NAME=gosec
GOSEC_VERSION=2.4.0

.PHONY: build

print:
	@echo hey

dep:
	@echo installing gosec
	curl -sfL https://raw.githubusercontent.com/securego/gosec/master/install.sh | \
 		sh -s -- -b $(GOPATH)/bin v$(GOSEC_VERSION)
	which $(GOSEC_BIN_NAME)

tidy:
	cd mod01 && go mod tidy
	cd maintemplate && go mod tidy

	cd mod01 && go mod download
	cd maintemplate && go mod download

generate:
	go generate ./...
	@echo "[OK] Files added to embed "


embed:
	for mod in $(MOD_LIST); do \
  		go-bindata -o ./$$mod/assets/bindata.go ${EMBED_FLAGS} ./$$mod/static/...; \
  	done

#embed:
#	go-bindata -o ./mod01/assets/bindata.go -pkg assets -nomemcopy -fs -prefix "assets" ./mod01/static/...
#	go-bindata -o ./maintemplate/assets/bindata.go -pkg assets -fs -nomemcopy -prefix "assets" ./maintemplate/static/...

build:
	@go build -o ./build/$(NAME) ./maintemplate/cmd/app/*.go
	@echo "[OK] App binary was created!"

security:
	@gosec -no-fail ./...
	@echo "[OK] Go security check was completed!"


all: generate security embed build
	

run:
	@./build/$(NAME)
