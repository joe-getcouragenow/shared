# DNS 

Secure...

Adguard can do ESNI soon
https://forum.adguard.com/index.php?threads/can-adguard-encrypt-sni.39351/

## Checks for User

https://www.cloudflare.com/ssl/encrypted-sni/

- you need ALL 4 to pass in your browser !

https://1.1.1.1/help

- another check which sucks

## DNS

Set DNS to cloudflare. Least worst option.

STATUS: done.

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


## Check the Server

We need to use this code and integrate it.

https://github.com/nextdns/nextdns/blob/master/service.go
https://github.com/nextdns/nextdns/tree/master/host

We will implement the DNS and ESNI check also into your own server.
SO we can tell the user they are leaking and advice them.

DNS

Will use Adguard one
https://github.com/AdguardTeam/AdGuardHome
- they are adding ESNI etc currently.


## ESNI Relay

The Tunnel can incororate the ESNI relay

https://github.com/iyouport-org/relaybaton
- This can be runnng on Server and embedded in mobile and desktop
- Its really nice.
- Will means that uses are using ESNI and with our DNS are protected
- China GReat Firewall of China is now blocking all ESNI connections
	- Spoofing it cant work on Cloudflare DNS because they disallow it now
	- But it will on our Own DNS :)
- Will will present the Chcker to the User so they can make sure they are safe.
	- It will run off our system. Is easy.