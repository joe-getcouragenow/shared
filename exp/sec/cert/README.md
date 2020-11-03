# cert

We need to have a central way to mananage certs.

The Server Boot process has to walk the user through setting up a CERT

---

We currently have:

https://github.com/getcouragenow/main/blob/master/deploy/templates/maintemplatev2/main/server/main.go#L69
- Entry point. Shoudl be dumb like it is an rely on the sys-core/service/config..

https://github.com/getcouragenow/sys-share/blob/master/sys-core/service/config/config.go#L63
https://github.com/getcouragenow/sys-share/blob/master/sys-core/service/config/config.go#L92
- This is the correct place to do it, so that everything above gets this functionality.
- staging versus prod.

We need to refuse to boot unless we have TLS properly done.

1. Local DEV and UAT use mkcert.

This looks like some nice wrapper code.

- https://github.com/pydio/cells/blob/master/cmd/config-proxy.go#L118
- https://github.com/pydio/cells/blob/master/common/config/tls-self.go


2. Real Server use Certmagic.

https://github.com/getcouragenow/sys-share/blob/master/sys-core/service/config/config.go#L63

- we currently do it automagically here.

https://github.com/getcouragenow/sys-share/blob/master/sys-core/service/config/config.go#L92

---


So best way is:

1. GRPC CLI - Let the CLI do it with a formal GRPC API

- The user can get and set the CERT configuration.
	- If they change the config, they will need to restart the server. The server will then boot off the new config.

- It can then talk to the Server, and control what cert it uses.

- Just add it to the SysCore API we use for DB Admin etc.

- When doing UAT, the user can via the CLI check the Certs
- They can also boostrap new certs, which they will need to do and the config will use them.
	- SO we make sure that the CLI puts them into the right place for where the config expects them.

2. JSONET Config

- The Config is up at the main level.

- We should formalise what cert type into the config, and also the paths to the Cert.
	- Local Or Remote
	- In this way, the Sys Core then knows where to load the Cert from.

- If local, then use Mkcert generated certs, and know the paths / files

- If remote, then use Cert Magic, and know the paths / files.

In the end this will allow the JSONET Architecture to take advantage of everything above such that its easy to boot an example for any layer of the architecture.
It will also remove any uncertainty about whats happening under the hood.
We can also then show in CLI and FLutter Admin exactly what Cert we are using and from where.

This of course relies on the fact that sys core cli is able to be compiled :)