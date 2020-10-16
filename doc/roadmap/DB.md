# db

Strategy

1. Use Dgraph NOPE

- If we need clustering ?
- Sys Shared
    - Our grpc
        - Dgraph DGO here ????
- SYS Level
    - Embed DGraph
        - copy the cmds in.
        - easy because its Corba.
        - compile its protos as go and check...
    - Our GRPC
        - Talk to DGraph directly.
        - DGO
            - compile as just go and check...
            - and use its proto to talk to Dgraph inprocess
    - SQLish things
        - 

2. Stick with genji and badger

- All the code we need is there in badger and dgraph

- v2 and v3
    - Pooling
    - Streaming backup and restore
        - the code is there in dgraph
        - just copy the bits into sys. The sys-share API might need slight changes.
- v4
    - Facets and bleve.
    - cmd architypes ( which dagraph do now ).
        e.g ''' dgraph zero '''
- v5 
    - Rafting. Multi instacne architypes.
    - use flame.


3. Dont use Genji

- Once it has context and pooling then it can be used again
- Use a different badger DB wrapper that is designed to run as a server.
- We can put the protobufs directly into Badger DB if we want i think
- Queries
    - We can do complex SQL like searches by iterating
    - for mod-accont dashoard the GPRC describes the query params
    - then the mod can have access to badger over the GRPC
        - It only needs to be able to iterate.
        - the DGO one is not quite right: https://github.com/dgraph-io/dgo/blob/master/protos/api.proto
        - Its really just a matter of returning MANY of the same proto types and so that can be modelled in the Response proto type.
        - 
---

pooling.

- gomax
    - https://github.com/dgraph-io/dgraph/blob/master/dgraph/main.go
- locks
    - The golang Context is being added, which i think will also allow poolng?
        - https://github.com/genjidb/genji/pull/231
    - Change this to have locks:
        https://github.com/genjidb/genji/blob/master/engine/badgerengine/engine.go
    - This shows the locks:
        - https://github.com/genjidb/genji/blob/master/engine/memoryengine/engine.go
    - reference:


Streaming backups and pooling.

We can use the actual Dbgraph code.
- rather than copy it, we could just link into it.
- https://github.com/dgraph-io/dgraph/blob/master/worker/worker.go
- has the Rafter aspects for us.


Relevant bits inside:

- https://github.com/dgraph-io/dgraph/blob/master/worker/backup_handler.go
    - not oos built tag :)
    - file or s3: https://github.com/dgraph-io/dgraph/blob/master/worker/backup_handler.go#L101
        - exactly what we want to do.


- https://github.com/dgraph-io/dgraph/blob/master/worker/s3_handler.go
    - s3 side of it for backup and restore

- https://github.com/dgraph-io/dgraph/blob/master/worker/restore.go
    - restore

- https://github.com/dgraph-io/dgraph/blob/master/worker/backup_ee.go
    - via proto
    - ensures only one at a time
    - keeps audit of them using manifest
    - exactly what we are doing

