
RELEASE_FSPATH=$(PWD)/dist

RELEASE_TARGETS="linux/amd64 linux/386 linux/arm linux/arm64 darwin/amd64 freebsd/amd64 freebsd/386 freebsd/arm freebsd/arm64 openbsd/amd64 openbsd/386 openbsd/arm openbsd/arm64"


release-print:
	@echo
	@echo RELEASE_FSPATH : $(RELEASE_FSPATH) 
	@echo RELEASE_TARGETS : $(RELEASE_TARGETS) 
	 
	@echo 
release-run:
	# Cross-compile using gox, injecting appropriate tags.
	go get -u github.com/mitchellh/gox

	rm -rf $(RELEASE_FSPATH)
	mkdir -p $(RELEASE_FSPATH)

	gox -output="release/tex-cli-$(git describe --tags)-{{.OS}}-{{.Arch}}" \
		-ldflags "-X main.Version=$VERSION -X main.CompileDate=$DATE -s -w" \
		-osarch="$RELEASE_TARGETS" \
		./cmd/tex

	ls ./release/tex-cli* > files
	for i in $(cat files); do
		sha256sum "$i" > "$i.sha256"
	done
