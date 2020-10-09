# Roadmap

High level.

## V2

Alex

main
- imports sys:Service to make a server here.



1. join up v2 and v3 so that from main downwards we can build and deploy.
- must be able to run vual binaries.
- because then all tests in CI can use the REAL running Server.

2. Test data (really basic)
- Just a basic script to inject the basic into our DB.
	- via the CLI API.
- 2 orgs, and 2 projects in each org
- 2 users which have access to one or 2 of those orgs
- etc etc

3. signin, signup screen. can look like shit
- Get it working with a "mod-dummy" Module. Mod-disco is a nightmare still.
- Give mod-dummy its own Nav ICON in the GUI.
- 2 or 3 routes
- Apply the guards and signup to them.
- leave staced in and lets see how it works with Flutter Modular
- riverpod will latr be out saign grace because Tests can run in CI.

4. Flutter modular guards. We have the API and DB for Accounts, so lets use it with the guards
- What a user sees in their UI is pre-determined by their Accounts Data.

5. How we use the guards and signup together.


Sys-acconts

- Repo Sys builds into its own server with all its modules.
- Repo Main builds v2 and v3
	- using mod-account with uses using sys account.

- Embedding
	- github.com/go-bindata/go-bindata
	- Dont need github.com/elazarl/go-bindata-assetfs, because go-bindata has it now.
	- We need to decide what we will use for the assets of each module and i think this is the best one.

- Flutter Dialoge based SignUp, SignIn, Change apssword, Recover word
	- ALL Flutter code in sys-share !!
	- Copy stuff out from Product Web ex.
	- needs location
		- mod-account level
			- will be saves as meta data
			- Will get Widget and Data from sys-shared/timespace
				- Dta will need to be multi-lang..(later)
	- needs email
		- https://github.com/jordan-wright/email
			- looks pretty good to me !!
	- needs email templates.
		- see Repo shared/exp/email.
	- needs sms for 2FA
		- https://github.com/sfreiberg/gotwilio
		- V3 i think...
	- example of them all used together:
		- https://github.com/zhiminwen/amwebhook/blob/master/main.go

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
	- there is another option to use Emitter, whcih uses Badger and clusters it. 
		- https://github.com/emitter-io/emitter
		- Badger: https://github.com/emitter-io/emitter/blob/master/internal/provider/storage/ssd.go
		- Cluster: https://github.com/emitter-io/emitter/tree/master/internal/service/cluster
		- Deploy: https://github.com/emitter-io/emitter/tree/master/deploy/k8s
			- Can easily convrt to use k3d, and so be on preimse and cloud adgnostic

mod-ion

- Less coupled to ion solution for our needs.
	- https://github.com/screego/server

- store
	- working off genji badger so we get a easy to deplyo and run stack.
	- Redis: https://github.com/pion/ion/blob/master/pkg/db/redis.go
		- easy to convert to useing Emitter
	- NATS: github.com/cloudwebrtc/nats-protoo
		- easy to convert to using Emitter Proto
- turn
	- integrate Turn as a Service. 
		- code: https://github.com/pion/turv
		- Its already designed to be Embeddable.
			- See: https://github.com/pion/ion/blob/master/go.sum#L286
		- When our Server boots tell the binary to run as that, so we can scale the system.
	
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
