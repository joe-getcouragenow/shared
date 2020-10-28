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

## Remote Tele

We need to also do tele on the actual running servers themselves.

Its tempting to do this using cloud SAAS, but there are such good looks out there in golang it seems silly.

And with just binaries, its easy to run them on Servers.

Logs
- loki
	- https://grafana.com/docs/loki/latest/installation/local/
	- Onto K8: https://grafana.com/docs/loki/latest/installation/tanka/
		- https://github.com/grafana/tanka
		- https://github.com/jsonnet-bundler/jsonnet-bundler
		- so we dont have to manage scaling on our own servers
	- agent: https://github.com/afiskon/promtail-client
		- suppot JSON and protobuf
		- can can use from flutter when we embed maybe.


Sentry is an option.
https://docs.sentry.io/platforms/flutter/


https://pub.dev/packages/flutter_snow_base
- wraps catcher, whch uses sentry
- uses flutter modular

