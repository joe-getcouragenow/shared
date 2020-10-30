# queue

https://github.com/alash3al/redix/tree/v2
- this is proto and grpc based, and so fits with our v2 and v3 archi goals. 
- Can replace our basic event bus If we want.
- Is stateful, and so ensures that a message is picked up.
- It saves the events to BadgerDB.
- has a nice DSN also that abstracts badger and sql : https://github.com/alash3al/goukv

Or we just ad peristence to our event bus and not use this.