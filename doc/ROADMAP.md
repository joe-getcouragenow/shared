# Roadmap

High level.

## V2

static GUI
- need to adjust the GUI before we connct it to the backend. This is because Biz want a static demo ASAP
- The Gcloud deploy is a mess, and so best to deploy to Hertzner
- SO we need to get the main loader working here: https://github.com/getcouragenow/main/tree/master/deploy/templates/maintemplatev2/server

Generate

- Using shared makefile
- Using go:generate

GRPC and CLI

- hooked up from sys up to Repo Man
- hooked up to sys-core fully
- v2 single and v3 dual binary

Sys-core: Cron

- Its needed for:
	- backups
	- sending reports from mod-disco
- Need ability for Cron to work off the DB
	- When changed, it makes sense to flush those in memory
	- Mhh seems we might need Subscribe off Badger DB earlier than i thought. Could use polling ( ironically a Cron) to just check the DB for changes.
- Need ability to access the schedules from the GRPC API.

Sys-core: Data

- Test data and real data
- generated
- embedded

sys-core: Migrate

- generated scaffold via sdk cli
	- Uses UTC Data Time
	- Using the sys-coe: DUMB for the tables the Modules uses.
- embedded
- available over CLI
- working in sys-core
	- It must parse ALL of the migrations for all modules and then apply them in global order. They are UTC DateTime
- expressed read only in Flutter.

Sys-core: Ops

- API working for install, backup, restore
	- go tests doing it.
- Config

Sys-acconts

- Flutter Dialoge based SignUp, SignIn, Change apssword, Recover word
	- needs email
	- needs email templates.
mod-accont
	- using sys accont


## V3

sys
- subscribe to badger updates
	- this will make alot of things easier.
	- there is an option to use NATS also but only if we embed it.
		- In which case the event from subscribe will be sent to NATS.

mod-ion
- working of badger, and not redis.

sys-lang
- we need translations to be machine translated and then override by humans
	- best way is to make it run off files, that are then loaded into the DB. So its using the embed approach like other modules
	- Humans translators can run the system in "dev mode" and so its all driven off the embedded golang, NOT the DB.
		- These files need to be additive.
		- And go back into the source and git.
	- Flutter no longer embeds the JSON in he assets, but instead asks the Server for the files when the user changes lang
	- Golang can also use the same JSON files
		- Use an ARB to describe.
		- https://github.com/empirefox/protoc-gen-dart-ext
			- https://github.com/empirefox/protoc-gen-dart-ext/search?q=arb

	
