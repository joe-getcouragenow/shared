# file.io


Using badger
- one backup
- free caching
	- because badger uses as much memory as possible, its is effectively a free cache layer also. Doing this with a traditional cache in front of a system is lots of work.

From go and flutter needs

for go its used to bootstrap files over the grpc CLI

for flutter its used by the feadback plugin.
- this plugin currently does not work in web.

Resumarable
- woudl be good but can understand we dont have time

tusd
- web does not work

pure grpc
- slower but prefered becaue then security is using the same as all our other code


## lib
https://ops.tips/blog/sending-files-via-grpc/
- with code and charts.
- grpc is slower than http.
- he zips the data: google.golang.org/grpc/encoding/gzip

https://github.com/google/dart-neats/blob/master/chunked_stream/pubspec.yaml
- flutter chunking stream. Will need it.

https://github.com/tigerwill90/fastcdc
- golang  chunking. fast

https://github.com/johanbrandhorst/chunker
- simplistic grpc chunker.

https://github.com/RTradeLtd/go-temporalx-sdk/blob/master/client/file.go
- GRPC client for file upload. Also Proto here: https://github.com/RTradeLtd/TxPB/blob/master/pb/file.proto
- users ranges
- no server, but thats pretty easy, as we just want to pump the file into the DB with a hash.

https://github.com/mattn/ft
- pretty good
- also does file listing

https://github.com/kraman/grpc-chunkio
- golang cli for file chunking
- proto
- example
- mage for protoc :)
- no server

https://github.com/mjneil/go-chunked-streaming-server
- golang server
- is http only. 
	- Looks like a good base.
	- We can ad GRPC to this with https://github.com/kraman/grpc-chunkio
- has useful File reader / writer stuff thoough
- has client in golang

https://github.com/niaow/filestream
- Does bundles of files.
- We could use this for bootstrap in terms of sending them all to the server and then the server processes them into the system.
	- Also this would mean that we can drag on drop whole directories via flutter to bootstrap the system.
	- So we can store bootstraps inthe DB, and then ask the system to do the bootstrap.
	- this sets us up for a nice google drive thing.
v4

We make a formal Google drive like grpc API
