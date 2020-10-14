# mixin using jsonet

## Concept

Need config and other things to be proviced by a Module up to the top level main.

Sys-core is an Agent that acts for the Modules...
Main should always have as little boilerplate as possible. We need to have a main in every Module as well as the top level deploy module. Hence, we use sys-core as the place where all the complexity is.
So main always passes a "pointer" to sys-core.

Main then needs to get those config, etc, and pass to sys-core/Db or anything else.

When a Module inits at main, it will get its config from sys-core.
- sql migrations
- config
- any assets, etc

Also lets be aware of ENV based config. This is useful for doing overrides and security.

## Libs

https://github.com/yoshz/monitoring-mixins

- install jsonnet
go get github.com/google/go-jsonnet/cmd/jsonnet
go get github.com/google/go-jsonnet/cmd/jsonnetfmt

- install jsonnet-bundler
go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb

- install promtool
go get github.com/prometheus/prometheus/cmd/promtool

---

m3db:

https://github.com/m3db/m3/blob/master/examples/dbnode/proto_client/main.go
- shows how to use protobufs with m3db.

- Example: https://github.com/m3db/m3/tree/master/config/m3db

- Is using github.com/google/go-jsonnet/cmd/jsonnet :)
    - https://github.com/m3db/m3/blob/master/Makefile#L182

- For make make the config gen is easy :)
    - https://github.com/m3db/m3/blob/master/Makefile#L271

---


## Roadmap

start with this: https://github.com/yoshz/monitoring-mixins

- mod-dummy
    - fix mod dummy code
    - correct naming
    - import sys-shared, so we can work out the V2 / v3 thing.
    - go back up to main and get v2 and v3 using it
    - do it all with the cli, so we can exercie it. Not a black box anymore..
    - at this point we can run the dual binary and so,
        - Run main v3
        - RUN the mod-* using the cli, and you can test your code.
        - write integration tests which use the pkg and the test data.
        - and then we will really be able to extend sys-core to be the Agent that acts for all the Modules.
            - do the SQL migrations for you, etc etc.
            - laod the test data for you.
            - load the real data for you.

- sys-core
    - add a jssonet here...
    - get the sys/main/cli to use it
    - get the sys/main/pkg/service to use it, ...

- mod-dummy
    - add a jssonet here...
    - get the example/main/cli to use it, calling into sys-core
    - get the example/main/service to use it, ...

- main/deploy/v2 and v3
    - add a jssonet here...
    - get the templates/maintemplatev2/main/cli to use it, calling into mod-dummy.
        - ? do we get sys-core automatically via mod-dummy ?
    - get the templates/maintemplatev2/main/service to use it, calling into mod-dummy.
    - get the templates/maintemplatev3/main/cli to use it, calling into mod-dummy.
        - might require some refactor on the boilerplate of how we instatiate the service.go for each module.
        - how to tell it to over the wire GRPC and not GO in process calls.



