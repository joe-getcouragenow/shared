# Test Harness

Tools to make it easy to boot up your environment from your laptop for local dev, but also your servers.

This makes Dev, CI, CD and OPS easier and repeatable.

All these tools will be refactored to be used by Booty.

TODO:

- everything here needs to be converted to golang so that booty can run it. Makefile for now just to work out how to do it.


## Main 

How does this relate to main binary ?

Our main binary is designed to run as a single binary with nothing else, and so allows a user to run everything on a desktop or linux server easily. 

It really can be thought of as the Edge binary because it has a DB and GUI, and can be easily packaged and run by anyone. Its currently is designed to operate on it own.
But later, it can start to act as a CDN in that read data can be cached in the DB, and mutations can be saves locally and forwarded to a Server in a Event Architecture.

Main needs the following stuff from the Server.
- HA or Scalability of that main binary (v2 roadmap) or many binaries (v3 roadmap)
- Ops tools.
- Telemetry.

The tools below give us te things we need to will allow user to run many main binaries with the Ops and Telemetry tools needed.


## Booty

How does tis relate to booty ?

Booty is what a Developer or User needs to deploy and run the system, and so booty will control the tools using shell commands.

It gives us the Ops ( Operations ) tooling that devs and users need to manage the full life cycle of Development, Deployment and Updates for all the things needed to run the system.

Booty-Dev is for developers

- imports booty cmd, so it gets that too.
- imports the code git, code gen tools from shared.

Booty is for users

- just has the stuff to deploy and admin the runtime binaries.


TODO:

- TIUP has nicer signal control in the terminal, and i think we can use that in booty to control all the binaries...
- Use an agnsotic Lib to talk to the other things in booty and our main binary.
	- https://github.com/google/go-cloud (https://gocloud.dev/)
		- Makes S3 agnostic ( gocloud.dev/blob )
		- Makes NATS agnostic.
		- Makes TIDB agnostic ( gocloud.dev/mysql )
		- Makes Hashicorp Vault agnostic ( gocloud.dev/secrets )
			- Not sure we need it.
			- On baremetal, where to store secrets ?. We need to use Zoolando golang code i think so it woks on all Desktops and Servers to store secrets in the native TPM chip.

- Yurt has a really nice way of pulling binaries. Use that in Booty and otehr tools.


## Hashicorp

Gives us a Deployment Orchestration basis for exe and docker.

Based on: https://github.com/ncabatoff/yurt. Yurt boots up the following binaries: nomad, consul, vault, prometheus, consul_exporter, node_exporter.

Users or we can use this to deploy to Server(s) and manage their lifecycle.

Bootstrapping itself:

- Booty embeds the yurt code to install the hashicorp bits.
- Booty can use a global s3 / pubsub to know all servers running via the meta data.
- Booty can manage upgrades via this meta data.

Deploying other binaries / dockers:

- There are a few options for how we can use this.
- Use the "Raw Exe" functionality of Nomad to deploy any binary to a Desktop or Server.
- Use the "docker" functionality of nomad to deploy dockers with docker swarm.
	- this might be a perfect use case for Module, because they are untrusted, and our main binary can use the modules over GRPC.

Caddy can be on the Server and be our main host.
Caddy will then just reverse proxy all docker deployed using https://github.com/lucaslorentz/caddy-docker-proxy/


## Kubernetes

We wont need k8 for a long time, and maybe never.

openyurt ( https://github.com/alibaba/openyurt ) hwoever is a good example of tooling to make it easy for devs and users to work with k8.

## victora metrics

Stack:

Caddy
- For basic security needs.


Main binary (org server)
- protocols
	- Standard prometheus
		- we use github.com/VictoriaMetrics/metrics
	- standard loggin lib: zap or logrus in json format ?
		- we use zap.
	- Exposes an endpoint for the agent to pull from.
		- /metrics
		- 

VicMetAgent ( vmagent runs on our server)
- pulls from Main binary
- polling ( 10 secs )
- can pull from many servers....

VicMet Store ( run with Grafana )
- File system dir using custom format.

VicMetBackup ( run with Grafana )
- pulling from VicMet Store ( streaming ..)
- pushing to S3.
- Sec
	- One per Org. So we give it out to them and they put in their config.

S3 ( Google GSC)
- Bucket per Org.

Grafana ( Our server  )
- polling the agent store ( 10 secs )
- Grafana
	- Sec
		- One for org. So we give it out to them and they store wherever.
		- One for Biz Team who have get "all labels view". So we give it out to them and they store wherever.
	- Proxy Sec ( if it works and 5 days, so not doing. )
		- https://grafana.com/docs/grafana/latest/auth/auth-proxy/
		- SO we provide a Link that has the headers in it from our Sys-accounts...
- Caddy
	- https://getcouragenow.org/metrics
		- Sec - None.


Maybe later...
- https://github.com/lindenlab/caddy-s3-proxy
- https://github.com/trusch/caddy-extauth


## grafana

Gives us a Telemetry aspects we need.

TempoDB looks perfect for us because it uses a simple golang WAL store, and then sends it all into S3. It has not other moving parts except for a few binaries.
It is based on JSONET to make configuration easy, which we use for main architecture.


TODO:
- There is no booty for the grafana toolset, and so we have to make it.
- Get booting of grafana to be booty like. TIUP has code to do it that we can use.
- Grafana GUI is good enough for Ops users, and we will make one in Flutter charts for Biz users dashboards.


## tidb

Gives us a SQL DB that can scale out with the CDC aspects that our CRS architecture needs.

TODO:
- It boots and uses grafana, but we need to not use it but instead our own Grafana booty.

## minio

Gives is a Files store that cna scale out.

TODO: 
- Make file works, and has basic E2E make based tests.
- Get it integrated into NATS, so we get a CDC of Minio.
- 
## nats

Gives us a Message Queue and Event Bus.

TODO:
- THere s no booty for it, and so we need to make that.
- Integrate with TIDB and Minio so that those 2 stores have CDC.
