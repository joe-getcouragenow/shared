# Shared

Tools for devs.

Not for anything else

---

**NOTE !**
NEVER EVER put a go-mod into the root !!
Each folder in this thing can never have a go-mod in its parent.

---

## Boilerplate folder

Used by all repos via a back link in their make files.

## ci-templates folder

"/workflows" are auto copied to all other repos.

All the others are experiments and we will need bit of them later.

## Dep folder

Sets up Local and CI with any binaries needed. Mostly GRPC.
boilerplate/*.mk holds the path to them on your disk, so we can use them in our build scripts easily.

## Exp folder

Our experiments. Once one works we copy or replicate in the real code.

## Doc folder

Final docs.

These are kept up to date, and so if you get lost code there.

## SDK folder

Our golang tool for Design, Dev, Build, Deploy and Ops

Currently under development. Stick with boilerplate make files and go:generate for now.
But will be easy to get it going because we are really just doing what the make files do.

## Tool folder

compiled tools we use for dev

