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

generator

- we need alex's go_geneate to call our own Gen golang binary
- then we can start to get the generator working off golang and not make files
- first will be the embed
- then the replacement of gen things in the makefile to use golang.
