# https://github.com/ueman/feedback

LIB=github.com/ueman/feedback
LIB_FSPATH=$(GOPATH)/src/$(LIB)

print:

git-clone:
	git clone  https://$(LIB) $(LIB_FSPATH)

git-clone-delete:
	rm -rf $(LIB_FSPATH)

open:
	open $(LIB_FSPATH)

flu-web-init:
	cd $(LIB_FSPATH)/example && flutter create .

flu-web-run:
	cd $(LIB_FSPATH)/example && flutter run -d chrome
flu-web-build:
	cd $(LIB_FSPATH)/example && flutter build web --release --csp --no-source-maps --pwa-strategy none
flu-web-serve:
	go run serve.go -d $(LIB_FSPATH)/example/build/web -p 8080

flu-desk-init:
	cd $(LIB_FSPATH)/example && hover init
flu-desk-run:
	cd $(LIB_FSPATH)/example && hover run
flu-desk-build:
	cd $(LIB_FSPATH)/example && hover build darwin --release
	#cd $(LIB_FSPATH)/example && hover build windows --release
flu-desk-pack-init:
	cd $(LIB_FSPATH)/example && hover init-packaging darwin-pkg
flu-desk-pack:
	cd $(LIB_FSPATH)/example && hover build darwin-pkg --release

