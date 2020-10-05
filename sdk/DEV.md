# dev

Alex has the go-Generate working off the make files.
- SO lets keep everything that way for now.


dep
- need the dep stuff to use golang for all OS's
- this will get CI working

ci
- The way we setup the repo to then call make is broken.
- I saw a smarter way that works and so just need to fix it

generator

- we need alex's go_geneate to call our own Gen golang binary
- then we can start to get the generator working off golang and not make files
- first will be the embed
- then the replacement of gen things in the makefile to use golang.
