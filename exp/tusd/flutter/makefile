# https://github.com/jjmutumi/tus_client


#LIB=github.com/jjmutumi/tus_client
LIB=github.com/joe-getcouragenow/tus_client
LIB_FSPATH=$(GOPATH)/src/$(LIB)

EX_FSPATH=$(LIB_FSPATH)/example

print:

dep:
	# for mobile
	brew cask install homebrew/cask-versions/adoptopenjdk8
	brew cask install android-sdk 
	brew cask install android-ndk

git-clone:
	git clone  https://$(LIB) $(LIB_FSPATH)

git-clone-delete:
	rm -rf $(LIB_FSPATH)

open:
	open $(LIB_FSPATH)
vscode:
	code -a -r $(LIB_FSPATH)

STORE_FSPATH=$(HOME)/Library/Caches/com.example/example
store-create:
	mkdir -p $(STORE_FSPATH)
store-open:
	ls -al $(STORE_FSPATH)



flu-web-init:
	cd $(EX_FSPATH) && flutter create .

flu-web-run:
	cd $(EX_FSPATH) && flutter run -d chrome
flu-web-build:
	cd $(EX_FSPATH) && flutter build web --release --csp --no-source-maps --pwa-strategy none
flu-web-serve:
	go run serve.go -d $(EX_FSPATH)/build/web -p 8080




flu-desk-init:
	cd $(EX_FSPATH) && hover init
flu-desk-plugins:
	# Have to go int and fix the import of the File picker in example/go
	cd $(EX_FSPATH) && hover plugins get

flu-desk-run:
	# WORKS 
	cd $(EX_FSPATH) && hover run
flu-desk-build:
	cd $(EX_FSPATH) && hover build darwin --release
	#cd $(EX_FSPATH) && hover build windows --release
flu-desk-pack-init:
	cd $(EX_FSPATH) && hover init-packaging darwin-pkg
flu-desk-pack:
	cd $(EX_FSPATH) && hover build darwin-bundle --release
	cd $(EX_FSPATH) && hover build darwin-pkg --release

flu-mob-build:
	cd $(EX_FSPATH) && flutter build apk --release --shrink --target-platform android-arm,android-arm64,android-x64 --split-per-abi