# Roadmap

High level.

## V2

Sys-acconts

- Repo Sys builds into its own server with all its modules.
- Repo Main builds v2 and v3
	- mod-account
	- using sys account.
- Flutter Dialoge based SignUp, SignIn, Change apssword, Recover word
	- ALL Flutter code in sys-share !!
	- Copy stuff out from Product Web ex.
	- needs location
		- mod-account level
			- will be saves as meta data
			- Will get Widget and Data from sys-shared/timespace
				- Dta will need to be multi-lang..(later)
	- needs email
	- needs email templates.
		- see Repo shared/exp/email.

static GUI

- Use Repo main/templatev2 !!
	- https://github.com/getcouragenow/main/tree/master/deploy/templates/maintemplatev2/server
	- comment out the shit
	- get it just running a golang server serving the flutter
	- Page 1: https://maintemplate.ci.getcouragenow.org/#/userInfo
		- We dont need it anymore
		- We ask for their location in the Signin, so its part of mod-accont meta data.
			- In Sys-accounts will need to provide a Page for Usrs to update their location and other stuff of course.
	- Page 2: Choose Campaign
		- EX: https://maintemplate.ci.getcouragenow.org/#/orgs/0
		- Campaign Details needs a Video ( loads from YOuTUbe)
			- there is a flutter mod that works on all targets that can load Youtube videos with no Token needed. Find it.
	- Now use a Flutter Stepper for the next pages.
		- State is in one page.
		- Better for Users as faster and less cognitive overload.
		- LIb ex:
			- https://github.com/AseemWangoo/flutter_programs/blob/master/StepperWithForm.dart
			- Find cleaner lib !!
	- Page 3: Your Needs
		- Data and Layout
			- https://docs.google.com/document/d/1LGkCEzh2CwwW6VYTYxXsDW14gYrzly0gwZtfrkbTG9Y/edit#heading=h.4ngwhe68g115
		- EX: 
			https://maintemplate.ci.getcouragenow.org/#/myneeds/orgs/001
			- Data Driven from json still.
			- Must have ordering control..
			- Bottom command should NOT be a popup, but as described in the Data and Layout (above), and so step to the right part of the stepper.
			- For demo just embed, and later we will load from DB.
	- Page 4: Support roles
		- Data and layout:
			https://docs.google.com/document/d/1LGkCEzh2CwwW6VYTYxXsDW14gYrzly0gwZtfrkbTG9Y/edit#heading=h.fb8pr4hlpyzy
		- EX:
			- https://maintemplate.ci.getcouragenow.org/#/supportRoles/orgs/001
			- no slider, but instead Checkbox. EASY.
	- Page 5: SignUp
		- Dialogue opens
		- Stepper state in background :)
			- SO we dont have to do any insane state crap.
	- Page 6: Dashboard
		- Data and Layout:
			- https://docs.google.com/document/d/1LGkCEzh2CwwW6VYTYxXsDW14gYrzly0gwZtfrkbTG9Y/edit#heading=h.p7jninue1cfs
		- Ex:
			- https://maintemplate.ci.getcouragenow.org/#/dashboard/orgs/0

- deploy to Hertzner

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




## V3

sys

- subscribe to badger updates
	- this will make alot of things easier.
	- there is an option to use NATS also but only if we can embed it.
		- In which case the event from subscribe will be sent to NATS.
		- Prob works using Jetstream BTW
	- if we ever decide to use NATS with Clent then use golang and cross compile a wrapper that can use tcp and websockets/ quic

mod-ion

- working off genji badger, not redis. NATS can work with it.

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

sys-lang

- need to handle currencies (https://github.com/gtgalone/currency_text_input_formatter)

sys-privacy

- need global privacy policy that works for different jurisidcations.
- Use theirs. Fork and alter: https://github.com/github/site-policy
	- forked here: https://github.com/getcouragenow/site-policy
- used in Docs, CLI and Flutter.
- Must prompt when policy changes in CLI and Flutter.
	- See [privacy_screenshot](https://github.com/getcouragenow/shared/tree/master/doc/roadmap/privacy_screenshot.png)
