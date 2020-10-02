# Telemetry


## Design basis
Because this system is designed to run in an isolated non public environment we need to contain the Telemetry.

That means not using a ton of external systems.

We can run the Tele as part of Sys-Core, IF we know it wont panic and crash then !

wrap panics: https://github.com/bugsnag/bugsnag-go/blob/master/panicwrap.go
- we can then catch them and send them to Tele system

We can have a DB just for Tele, and because the DB is a Document DB its easy to store anything in there.

We can connect over the GRPC CLI and inspects and use the Web GUI r CLi to inspect the system as a Super Admin doing ops.

Because use GRPC so much the standard GRPC tools are a given. We just need to proxy the output of all that stuff into our Tele.db.




