# file.io

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

https://github.com/mattn/ft
- pretty good
- also does file listing


v4

We make a formal Google drive like grpc API

We coudl contrinue using the v2 also, but untend it for chunking.

