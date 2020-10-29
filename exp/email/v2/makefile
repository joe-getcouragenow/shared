
# https://github.com/mailhog

LIB=github.com/matcornic/hermes
LIB_FSPATH=$(GOPATH)/src/$(LIB)

EX_FSPATH=$(LIB_FSPATH)/examples

print:
	@echo $(LIB_FSPATH)

dep:
	# for mobile
	brew cask install homebrew/cask-versions/adoptopenjdk8
	brew cask install android-sdk 
	brew cask install android-ndk

git-clone:
	git clone  https://$(LIB) $(LIB_FSPATH)

git-clone-delete:
	rm -rf $(LIB_FSPATH)


cmd-run:
	cd cmd && go run -a *.go