
# works fine
BIN=./example
build:
	go build -o $(BIN) .
run:
	$(BIN)

## packing

pack-darwin:
	# MacOS uses app bundles for GUI apps
	mkdir -p example.app/Contents/MacOS
	cp .gitignore example.app/Contents/MacOS
	go build -o example.app/Contents/MacOS/example
	open example.app # Or click on the app in Finder
pack-windows:
	go build -ldflags="-H windowsgui" -o example.exe
	open example.exe