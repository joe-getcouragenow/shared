# dev

Alex has the go-Generate working off the make files.
- SO lets keep everything that way for now.

ci
- The way we setup the repo to then call make is broken.
- I saw a smarter way that works and so just need to fix it

gitr
- make it able to do it on all repos in one hit
- make it send a Telegram message. would be good NOT to have to rely on github.
	- so then when a dev does a gitr operation we all see it.

dep
- need the dep stuff to use golang for all OS's
- this will get CI working

flutter
- package refs should use git or file references ?
- file references are fine because then local and CI just work because we assume that the other git repos are checked out by the CI script
- And the SDK, will do that checking out for you.
	- We will have a special sdk.yaml in which you declate what other repos you need in order to build that are part of GCN Or other Module developers.
	- Or we could use https://github.com/jsonnet-bundler/jsonnet-bundler
		- this woudl solve the golang generate problem
		- it would also solve the K8 / k3d problem.

generator

- we need alex's go_geneate to call our own Gen golang binary
- then we can start to get the generator working off golang and not make files
- first will be the embed
- then the replacement of gen things in the makefile to use golang.

serving flutter
- this works well: https://github.com/shurcooL/vfsgen
	- note: https://github.com/shurcooL/vfsgen/issues/75

