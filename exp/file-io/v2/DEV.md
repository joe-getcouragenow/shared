# v2


## UPDATES

So the current sys-shared protobuf has the Org, Project Id with it.

Below are the notes of how the whole system can be designed to make it reusable and easy to work with and also to code.

- Modules level
	- treats the data and files as the same thing, in that the files are base64 encoded into the db
	- this is so that a backup is complete with data and file all together.
	- so any module developer gets the file system for free as part of their work
	- the developer adds the field to ehri protobuf for all base64 files they use, just like they do for data
	- because the data repository pattern is where we do the authz, the files are not protected by the dame authz also :)
- sys-shared level
	- go
		- helper code for DAO. Makes it easy to use file and data. Just extend what you currently have for genji.
	- flu
		- helper code for gettin the base64 out of the protobuf
		- cache or none cache. For now as we dont have time dont bother with caching
		- display the base64 file as a standard image that can be used by the standard flutter widgets.
- sys-core level
	- go and go cli
		- bootstrapping the system with data and files.
		- bootstrapping can be appled to any module. Just like we have sys-account and mod-disco currently. Each woudl have their own bootstrap json and files.
		- its fine that the user has to bootstrap each module one at a time for now btw. 
			- We can build higher level CLI to treat the seperate modules as one for the bootstrapping in the main repo.. Just like we do it for grpc..
			- The main thing is that you will then we able to bootstra ANY module, and so example code for a mini module can be bootstrapped too.
		- cli conversion
			- a dev or biz person wants to describe their bootstrap as JSON and files.
				- so need a way for the json data to have a "pointer" back to the file, because at the end of the day they will be linked in the DB also.
				- so as you said on telegram, its the "id" of the file. I really think, that its best to use the path ( including the dir ) as its laid out on disk as the "FileID.
				- This makes it easy for the user to understand how one the "File ID of a file maps to the ID in the json data.
				- It will also make it easier later at the flutter level because you will need to give a file a "path" to dispaly it. So you can use the same "File ID" as the path.
			- when you put the data in the DB you can save the File ID, but also add a PK because we know we need a KSUID.
				- and we can extedn it for hashing, caching, chunking later easily from this base.
- later.....
	- we will use hive cache, and so can then store the file as base64 and also encrypt it on the client. The above designed supports that.
	- so the data and files are all properly encrypted at rest.
	- then will cross compile genji to wasm and native and use the protobufs to do FFI between flutter and golang. I have this working now, and this is why we are using prototbufs :)
		- the encryption at rest will work with it too with slight changes. 

## Layers

### Badger stores all files as binary.

- sys DB helpers wrap it all for you.
	- Get and set the base64 into the db
	- Compute the hash when you change the base64.
- In a Table, 
	- you just have save the base64 into a field, just like any data.
	- save the hash ntothe same field.
	- Helper wraps access to the field to get / set the hash and / or base64.
- main.go shows it works.

### dao

- same as for data. make it bulletproof for a dev via the helper.


### Server

- the grpc layer is unchanged.
- the binary field is just added as base64. no chunking.


### go and flutter clients use base64

- cli
	- uplaod and download
- flutter
	- download
	- upload is not high priority right now.

### cache

- use hive cache to store the base64
- use the hash as a chahe miss checker

## LIBS

- We are using this for the CLI, so lets use this approach for all the archi !!
- This solves the V2 Filer needs. Its not efficient but fine for v2.
- There is No CHNKING in this design. SO its only for small stuff
- We are usign the HIVE File Cacher, and so if we want we can use it for Async File Uplaods from FLutter later..
	- USe a hash on backend always, so that clients and DB can do smart caching
- GRPC File API
	- We need a fully resolved Endpoint to the files for when we just want to pull an image from the system.
	- Any GRPC data API, can then just link to the File DB and ask for its Sub URL ( no domain )
		- they can then store References in the DB Tables as a UUID.
		- We can use the Sys-Bus to notify when a File change event happens ( delete, etc)
		- We can expose the GRPC FILE API events to the FLutter GUI and Golanf CLI.
- SO then:
	- Go Badger DB. Store the files as base64 there. Test code already works for this.
		- Can make it Sys Shared level, so that Sys Accounts and Mod Disco all have this as part of their DB API. Nice.
			- Via Make cli you can upload and download files and they are stored in Genji/BadderDB
	- GO CLI
		- Again is make available as sys Shared level, and so the Sys Accounts and Mod Disco get it automatically.
	- Flutter. When download / upload a file, just use grpc base64
		- Can code it at the Sys Shared level, so all go and flutter code get this for free.
		- Example code to base64 encode a file
			- https://bezkoder.com/dart-base64-image/
		- File Caching
			- https://pub.dev/packages/flutter_cache_manager_hive
			- Hive, so works everywhere and fast 
			- Example code: https://github.com/vishna/flutter_cache_manager_hive#usage
	
		- GRPC error codes are also base64ed
			- Shows how to base64 encode is here: https://github.com/grpc/grpc-dart/issues/72
			- shows how to pack the bytes: https://github.com/grpc/grpc-dart/commit/b6e40c34e3e63833309c05e66003ab0374e2f11a#diff-67957c0796b9f6e213022775e835d9c19ae6069e67d82b49a0a36e4c0c1a7c3bR431
				- "Prior to creating the Status object we pad the data to ensure its length is an even multiple of 4"
				- Is also used for GRPC error status (grpc-status-details-bin): https://github.com/grpc/grpc-dart/pull/349
			- https://api.dart.dev/stable/2.1.0/dart-convert/base64Encode.html
- NameSpacing
	- Call it "File" in the go and flutter namespace
	- Then subname it "base64", so we leave room for adding a Minio HTTP later in the sub namespace.


https://github.com/PauloniaAQP/paulonia_cache_image/blob/master/lib/paulonia_cache_image_web.dart


https://github.com/marcojakob/dart-event-bus
- generic event bus, so that modules can communicate to each other.
- no persistence but easy to add hive.
- we probably want to add this to the grpc event bus lib.