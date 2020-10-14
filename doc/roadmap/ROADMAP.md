# Roadmap

High level.

## V2

What is needed to get V2 out the door ?
Rosie and gary. 
Research Package / Survey = Enrolment module
CLI = Command Line Interface
LOE = Level of effort


- Main v2 building.
	- sign in working.

- Research Package (DONE)
	- "Check consideration" branch works for web and branched survey. back works. cancel works.

- mod-account hardcoded to load the same survey (LOE: ??? )
	- bring in Research Package
		- check works from top main down.
		- hack it to have the Condition and Support Roles
	- so all orgs / projects use the same survey
	- flutter needs to save this data to DB via the shared sys-account Protobuf.
		- save the "Survey" JSON into the respective Meta Field
		- save the "Condition" and "Support Roles" data into the respective Meta Fields and into the DB as real data and not JSON.
			- so then when we do the SQL query for the dashboard we are only doing standard SQL and not dealing with JSON.
			- so the Dashboard Filters can use this.
	- Modify the shared sys-account Protobuf to allow the above.
	- User can redo the survey
		- override the above data.
	- dashboard 
		- Load the Filter types via the Meta Field Proto, and hence the DB
		- Do the SQL query via the DB at shared sys-account

- modular: sys config ( LOE: 2 - 3 days, maybe 2 )
	- see: minin-jsonnet.md

- modular: sys routes for grpc (LOE: 2 days )
	- each module has a config loader.
	- one aspect is to load the GRPC routes.
		- so that any MAIN at any level can use them.
	- need a Service.go per module
	- us it from top level main.

- modular: Service (LOE: 1 day ).
	- Needs Service.go
		- sucks routes, etc out of the config.
		- used by examples and main.
	- Each module needs to do this.

- Wire sys-account / mod-account up from Main downward ( LOE : 1 hr )
	- using config, routes and service.

- Wire up sys-core and shared sys-core.
	- using config, routes and service.
	- dao ( json to genji mapping)

- Bootstrap system ( LOE: 1 day )
	- sys CLI ( 1 day )
	- create org and project and default accounts.
		- golang driven. just add a CMD to the existing CLI for shared sys-core 

- Sys DB (LOE: 4 days )
	- fix account creation so it checked for upserts. ( .5 day)
	- fix cron job so it is non blocking.
	- finish backup (nightly)
		- must be streaming. ( 2 days )
		- copies them to s3 google storage. ( 1 day )
		- restore from s3 ( .5 day )
		- not differential backups.

- sys-account
	- when user signs out, invalidate JWT.
	- when user times out, invalidate JWT.
		- currently 30 minutes.
		- so after 30 minutes they MUST login again.
	- email (sys-core, exposed via sys-shaesys-share)
		- template, and email lib
		- config.
		- for signup to check its a real email
		- for change password 
		- for password recovery, if they forgot
		- NO 2FA at this stage.

- guards (LOE: )
	- so that GUI and Server enforces access
	- The way we do it is by hand coding, which is time consuming and leads to mistakes. 
		- OPA will save our arses.
		- Theory: https://www.verygoodsecurity.com/blog/posts/building-a-fine-grained-permissions-system-in-a-distributed-environment
		- https://github.com/sawadashota/kratos-frontend-go
		- based on ory, kratos and OPA rego.
		- OPA Rego policies might save our butts as we need to do authz and guards at GUI, Server and Data Layer.
			- https://github.com/open-policy-agent/opa
		- Server:
			- https://github.com/open-policy-agent/opa/blob/master/cmd/run.go
				- Cobra :)
			- Store: https://github.com/open-policy-agent/opa/blob/master/storage/interface.go
				- Easy to make it work wiht genji / Badger
				- Its has DataEvent and Trigger Event. 
		- We will almost definitly need to make this Modular. JSONNET will work well with it i think.
			- Bundler: https://www.openpolicyagent.org/docs/v0.14.2/external-data/#option-3-bundle-api
		- JWT, Singin SignOn, etc
			- https://github.com/ory/keto/blob/master/engine/ladon/handler.go
			- https://github.com/ory/keto/blob/master/engine/engine.go
			- Store:
				- https://github.com/ory/keto/blob/master/storage/manager_sql.go
					- they ue the OPA store interface, and wrote their SQL store
					- This looks like a good basis to write a Genji Driver and get migrations. See the next 2 points below:
					- Drivers:
						- https://github.com/ory/x/blob/master/sqlcon/connector.go#L101
						- Tracing: https://github.com/ory/x/blob/master/sqlcon/connector.go#L235
						- https://github.com/ory/x/blob/master/dbal/migrate_files.go
						- https://github.com/ory/x/blob/master/sqlcon/migrate.go

		- GO: https://www.openpolicyagent.org/docs/v0.14.2/integration/#integrating-with-the-go-api
			- looks nice.
			- Example: https://github.com/open-policy-agent/example-api-authz-go
		- GRPC: https://github.com/open-policy-agent/opa-envoy-plugin
			- looks like we can use it with Improbable, but need to check
			- simple examples: 
				- https://yashagarwal.in/posts/2019/02/go-grpc-opa-a-perfect-union-part-3/
					- matching code: https://github.com/yashhere/go-library-service
			- Sys-core GRPC and CLI will eventually be used to provide direct access to Genji
				- Just like how DGraph uses GRPC as the direct access to Badger DB !
				- SO OPA and GRPC allow use to apply the policies there.
				- So we SHOULD be able to also use the GRPC and OPA to guard access from Modules also !! :)
		- Dart: https://github.com/open-policy-agent/contrib/tree/master/dart_authz
			- Sure its for a Dart Server, but from my investigation of the dart lib we can adapt it to work with FLutter and Flutter Modular guards.
		- SQL:
			- only found a shitty python examle so far
	- Auth
		- https://github.com/salrashid123/oauth2#impersonated-credentials-with-domain-wide-delegation
			- For federatd auth
		- https://github.com/salrashid123/yubikey
			- for future reference when we need to start using Yubikeys and solokey.

		
	- use the JWT .
	- GUI
		- encorce gui NAV display
		- enforce routes
		- context, so that all calls to sys have the riht Org and Project context
			- suck out of JWT
	- Server
		- load the Nav display Data, and expose via JWT claims.
		- enforce routes at GRPC using JWT
		- Context loaded per request using JWT. Not using Sessions because JWT is our session cookie.

- seeder ( 5 days )
	- dont use mage.
	- is called by go:generate
	- is a main.go in each module, so it can be compiled in CI.
		- replaces make this-dep.
		- installs to global go bin path.
	- proto
	- flu
	- embedder "seeder pack / unpack"
	- config merging
		- suck out each module config that is embedded and turn into base.yaml


- Deployment ( 2 days )
	- Just use goreleaser ( 1 day )
	- Setup iceland server via Hertzner, manually grab the binary and put onto Server in Iceland. ( 1day )
		- make it repeatable.


BUT...

- Try to get Migrations done because without it that Server deployed will be orgphaned.
- SQL Migrations (LOE: 5 days)
- Needs UAT testing still.
	- Need to be done as soon as a deployed binary is deployed.
	- Get auto updating working from github releases.


---


Alex

Monday
- mod-account
	- copy to make a mod-dummy. Fix mod-dummy:
		- exactly as it is now.
		- just find / replace on the namespace to be "mod-dummy"
	- use the sys-account doman model.
	- use the meta field to hold the research data.
	- copy the existing example up to mod-account.
		- we will hard code the questions into the code.
		- we will hard the Org and Project via the DB using the CLI.
		- So if i as admin made a 2nd Project it would have the same questions.
	- make sure you can load up a users already done research again, so they can see their old answers and redo the survey.
	- singin

1. join up v2 and v3 so that from main downwards we can build and deploy.
- must be able to run dual binaries.
	- check go.sum that we DONT leak sys too much.
- because then all tests in CI can use the REAL running Server.
- This is where we see the whole thing working or not
	- In v3 dual mode, the Mod-* use GRPC calls
	- in v2 single mode, the Mod-* use Go calls.

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
- leave stack in and lets see how it works with Flutter Modular
- riverpod will later be out saign grace because Tests can run in CI.

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
				- https://github.com/cph-cachet/research.package
					- much better 
					- 
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

CI

- Need android and IOS to build
	- https://github.com/google/mediapipe/blob/master/setup_android_sdk_and_ndk.sh

Provider Patterns

- Subscriptions. 
- Able to Test in CI
	- SO MUST NOT be dependent on FLutter
- Reactive so that UI updates naturally.
- https://github.com/flutterdata/flutter_data
- https://github.com/flutterdata/data_state/tree/master/packages/data_state
	- NOT dependent on Flutter
- https://github.com/flutterdata/flutter_data_json_api_adapter
	- Will be easy to modify this generator to work with Protobufs
	- This basically generates Dart Models to work with your GRPC Protobufs

sys-db

- https://github.com/go-gorm
	- I think that adding a dialect for Genji here is very possble.
	- BUT might be overkill.
	- sqlc looks cleaner: https://github.com/kyleconroy/sqlc

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

kanban

- https://github.com/traggo/server
	- looks perfect
	- uses gorm, so not too hard to replace with genji.


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
