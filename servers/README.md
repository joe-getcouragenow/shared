# Test Harness

Tools to make it easy to boot up your environment from your laptop for local dev, but also your servers.

This makes Dev, CI, CD and OOPS easier and repeatable.

All these toole will be refactored to be used by Booty.

## Main 

Our main binary is designed to run as a single binary with nothing else.

This allows a user to run everything on a desktop or linux server, but does not give them any HA or Scalability.
So to do that we incorporate the tools below, and change main to use it. THis will allow them to run many main binaries with the tools.


## Booty

Booty wraps all these toosl, plus our own tools, and allows deployment of our main binary and cli.

All the things below need to be wrapped by Booty.



TODO:
- All the tools below need to be wrapped by booty.
	- Move all to Shared.
- Make a Booty and Boot-dev repo to seperate out the tools.
- Booty is for users
	- just has the stuff to deploy and admin the binaries.
	- Will pull the main cli and main Server, so all anyone needs is booty anywhere to run.
	- then it will pull all the binaries it needs like these tools etc.
- Booty-dev is for developers
	- imports the code git, code gen tools from shared.



TODO:

- TIUP has nicer signal control in the terminal, and i think we can use that in booty to control all the.
- Use an agnsotic Lib to talk to the other things in booty and our main binary
	- https://github.com/google/go-cloud (https://gocloud.dev/)
		- Makes S3 agnostic ( gocloud.dev/blob )
		- Makes NATS agnostic.
		- Makes TIDB agnostic ( gocloud.dev/mysql )
		- Makes Hashicorp Vault agnostic ( gocloud.dev/secrets )
			- Not sure we need it.
			- On baremetal, where to store secrets. We need to use Zoolando golang code i think so it woks on all Desktops and Servers to store secrets in the native TPM chip.


## grafana

Gives us a Ops aspects we need.


TempoDB looks perfect for us because it uses a golang WAL, and then sends it all into S3.
Grafana GUI is good enough for Ops users, and we will make one in FLutter charts for Biz users.

TODO:
- There is not booty for the grafana toolset, and so we have to make it.
- Get booting of grafana to be booty like. TIUP has code to do it that we can use.
- 

## tidb

Gives us a SQL DB that can scale out.

TODO:
- TIUP does everything we need.
- It boots and uses grafana, but we need to not use it but instead our own grafaan booty.

## minio

Gives a Files store.

TODO: 
- Make file works, and has basic E2E make based tests.
- Get it integrated into NATS, so we get a CDC of Minio.
- 
## nats

Gives us a Message Queue and Event Bus.

TODO:
- THere s no booty for it, and so we need to make that.

## Hashicorp

Gives us a Deployment Orchestration basis for exe and docker.

Based on: https://github.com/ncabatoff/yurt

Yurt boots up the following binaries: nomad, consul, vault, prometheus, consul_exporter, node_exporter.


OpenYurt follows a classic edge application architecture design - a centralized Kubernetes master resides in the cloud site, which manages multiple edge nodes reside in the edge site. Each edge node has moderate compute resources allowing running a number of edge applications plus the Kubernetes node daemons. The edge nodes in a cluster can span multiple physical regions. The terms region and Pool are interchangeable in OpenYurt.

Based on: https://github.com/alibaba/openyurt
