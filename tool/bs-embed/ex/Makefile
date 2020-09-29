.PHONY: generate

NAME=maintemplate

print:
	@echo hey



tidy:
	
	cd mod01 && go mod tidy
	cd maintemplate && go mod tidy

	cd mod01 && go mod download
	cd maintemplate && go mod download

generate:
	go generate ./...
	@echo "[OK] Files added to embed "

embed:
	go-bindata -o ./mod01/bindata.go -fs -prefix "assets" ./mod01/static/... 
	go-bindata -o ./maintemplate/bindata.go -fs -prefix "assets" ./maintemplate/static/... 

build:
	@go build -o ./build/$(NAME) ./maintemplate/cmd/app/*.go
	@echo "[OK] App binary was created!"

security:
	#@gosec ./...
	@echo "[OK] Go security check was completed!"


all: generate security embed build
	

run:
	@./build/$(NAME)
