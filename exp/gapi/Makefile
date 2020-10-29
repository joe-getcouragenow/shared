# https://github.com/googleapis/gapic-generator-go
# https://github.com/googleapis/gapic-generator-go/blob/master/util/cmd/release/main.go
# https://github.com/googleapis/gapic-generator-go/tree/master/cmd/protoc-gen-go_cli

# https://github.com/apigee/registry
# 

LIB=github.com/googleapis/gapic-generator-go
LIB_FSPATH=$(GOPATH)/src/$(LIB)

print:
	@echo
	@echo LIB:			$(LIB)
	@echo LIB_FSPATH: 	$(LIB_FSPATH)
	@echo

git-clone:
	git clone https://$(LIB) $(LIB_FSPATH)
git-clone-delete:
	rm -rf $(LIB_FSPATH)

code-open:
	code -a -r $(LIB_FSPATH)

release-run:
	cd $(LIB_FSPATH) && go run util/cmd/release/main.go -commitish 1

license-run:
	cd $(LIB_FSPATH) && go run util/cmd/license/main.go
