# Security


The Architecture is designed to be an End to End secure system.

See the [sys-core](https://github.com/getcouragenow/packages/tree/master/sys-core) for the code and domain model and the roles and permissions.

## Benefits

All the ESNI and other related security technologies remedies all the BS security and anonymising aspects.

100% encrypted and anonymized

Orgs run 100% of their systems fully secure by using the security tools.
Orgs should run in Iceland.

So chrome or any tool on their desktop or mobile will be automatically secure and anonymous. For their whole org !!

Anyone in the public will see a warning when they connect telling them how to get secure.
The tool we am developing means they  just download and run it and it’s all done for them. Idiot proof.
Then they reconnect and it shows them they are fully secure and anonymous.

No VPN needed.

Any users leaking to any other internet entity can be detected, and we can show them and their OrgAdmin as a summary.

## Checks for User

https://www.cloudflare.com/ssl/encrypted-sni/

- you need ALL 4 to pass in your browser !

https://1.1.1.1/help

- another check which sucks

## DNS

Set DNS to cloudflare. Least worst option.

- For IPv4:

	- 1.1.1.1
	- 1.0.0.1
- For IPv6:

	- 2606:4700:4700::1111
	- 2606:4700:4700::1001

## Browsers

**Firefox**

Only Firefox has all 4 that you need:
use these settings: https://www.inmotionhosting.com/support/website/security/dns-over-https-encrypted-sni-in-firefox/

**Chrome**

Chrome does not support ESNI, because it will affect their Adword tracking i guess. So don't use Chrome.

If you must use Chrome:
Chrome:
chrome://flags/#dns-over-https
chrome://flags/#enable-webrtc-hide-local-ips-with-mdns
chrome://flags/#dns-httpssvc

## OS

**IOS and MAC** 

Profiles to force DOH to work

https://github.com/AdguardTeam/AdGuardHome/issues/2110

here are the profiles already done.
https://github.com/paulmillr/encrypted-dns

Windows

- No idea... Anyone know ?

Linux

- No idea... Anyone know ?

Android

- No idea.... Anyone now ?

## Tunnel

Install clouldflared: https://github.com/cloudflare/cloudflared


## Check the Server

We need to use this code and integrate it.

https://github.com/nextdns/nextdns/blob/master/service.go
https://github.com/nextdns/nextdns/tree/master/host

We will implement the DNS and ESNI check also into your own server.
SO we can tell the user they are leaking and advice them

## Modules

Each Module needs security to be applied.

### Client

For client security, all data is gotten from the server/sys-core and enforced by the client/sys-core code.

Routing guards enforce what the user can route to and is enforced by sys-core.

Navigation GUI guards enforce what the user sees is enforced by sys-core.

With regards RTC ( like chat), access and functions that a client can perform is enforced by sys-core.

### Server

Each Module uses GRPC and so Auth and Authz is enforced automatically by the GRPC middleware that sys-core loads.

Each Module owns the DB tablespace it uses, and the sys-core enforces that they can only acces their tables. This means that a third party module can not access another Modules data.

At the DB query layer, the domain model describes the Authz permissions and is enforced by sys-core.

---

## Security Architecture

All security aspects are enforced in sys-core to remediate developers accidentally making mistakes.

The layer cake of the End to End looks like this.

Client

- Generates it own private key and gives the public key to the Server.
- Public key stored in Server ( gateway )

DNS

- DNS inspection can be reduced if the users use an Encrypted DNS, and they are becoming more and more common.
- We do not want to introduce Wireguard VPN as it tends to expose the user to the WebRTC leak hack.
	- Tailscale was a Wireguard Server and client that circumvents the WebRTC leak, but we really prefer standard Encrypted DNS mainstream and aim to develop in that vein.

Transport

- Uses TLS 1.3 with Certs auto issued by Lets Encrypt.
- Client and Server checks the TLS Certificate.

Server 

- State is encrypted in the DB
- Master key stored in TPM chips via OS keychain.
- Keys rotation.


### High Level Security Roadmap

**V2**

Only single server and RPC.

TLS
- Auto Certs

Server
- DB is encrypted, ensuring that Admins runnng the system cannot see he data.

**V3**

Many Servers sharded and Client doing small amount of RTC.

Client

- Private key and Public key introduced because we start to use RTC ( eg Chat )

Server

- Global Registry Server introduced will be needed to hold DB master keys, Transport certs, Client Pub keys
- MTL Certs used between Global Registry Server and Servers.

**v4**

we will be running many instances of each golang MOD as their own Servers

No real changes needed.
