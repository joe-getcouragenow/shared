v2

Badger stores all files as binary.
- sys DB helpers wrap it all for oyu
- In a Table, you just have save the base64 into a row, just like any data.
- main.go shows it works.

dao
- same as for data
- compute the hash for the developer and save into a row for them
- the hash is used for cache control

Server
- the grpc layer is unchanged.
- the binary is just added as base64. no chunking.


go and flutter clients use base64

cache
- use hive cache to store the base64
- use the hash as a chahe miss checker

--



