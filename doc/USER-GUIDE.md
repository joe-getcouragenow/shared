# Vision

This is written from a Users perspective. 

## Setup your Server

First we give you or you buy a Rasp PI. 

It's a 25 dollar computer that you just plug into your home / office router using an ethernet cable.

That is your server and holds all your data. It's yours. That sits there on its own private IP. The data is encrypted and so even if you were hacked or burgled your privacy is ensured. You hold the Master encryption key. 

## Connect to your Server

Then you use the Web, Desktop or Mobile App. 

That and only that can connect to the Rasp PI on your local network. 

So it's secure, the keys are generated in the App, and the public key is put into the Server. Now you and only you can access the data on that Server.

## Connect via the Gateway

Then you can choose to connect it up to the globally redundant Secure Gateway. This is end to end encrypted. 

You use the gateway to connect if your are away from your home or office server.


## Synchronise

Then you can set it up to automatically synchronise with your collegues.

This is for 2 reasons:

1. If your home ADSL / fibre goes down, you can access your data when on the go.
2. If your house burns down you lose nothing.

The way you trust each other is via exchanging public keys via an out of bounds medium. 
You can do it via QR code, NFC ( bluetooth is not secure ) or Email. The security Policy you pick determines how paranoid you want to be. QR is the most paranoid.

To access the data, when your not at home / office, the software uses the global gateway server. It's got your public key, and so knows its you when you dial in. Remember the Private key is on your device. You can copy the Private key to as many devices as you want via the QR sync function.

When the software attempts to dials in to your Server, the Gateway will check your fully secure, and if not will give you the commands to secure your device to use the Gateway's own DNS ( which has ESNI, DDOS attack pretection and malware protection ).

The system will then direct you back to the "Am i secure" page where you can see if your fully untraceable an secure.

## 2FA

Now is the time to move your private key to your own secure area.

Private keys are all great, but what if you want to be even more secure, and not rely on the private key being stored in the TPM chip of your device. 

There many well known vulnerabilites with the [TPM](https://en.wikipedia.org/wiki/Trusted_Platform_Module) chips in your mobile and desktop.


The Apple hardware has known flaws already, as do most laptops. This is why government ministers have the TPM chip replaced in all thier hardware. 

- https://arstechnica.com/information-technology/2020/10/apples-t2-security-chip-has-an-unfixable-flaw/

- https://appleinsider.com/articles/20/10/13/a-custom-usb-c-cable-can-jailbreak-the-t2-chip-in-a-macbook-pro

Its also why governments buy Intel CPU chips without the IME [IME](https://en.wikipedia.org/wiki/Intel_Management_Engine) chip functionality. Its actualy a chip inside a chip and so cant be turned off or removed.

Then there are backdoor chips and malware installed by the Chinese and US for example:

- https://www.bloomberg.com/news/features/2018-10-04/the-big-hack-how-china-used-a-tiny-chip-to-infiltrate-america-s-top-companies

- https://www.networkworld.com/article/2985036/malware-implants-on-cisco-routers-revealed-to-be-more-widespread.html

And lastly all the [zero day exploits](https://en.wikipedia.org/wiki/Intel_Management_Engine) that have not yet been disclosed to the public, because these exploits are being actively used by various bad actors.

- https://us-cert.cisa.gov/ncas

Malware is also an issue with many examples always coming into the news almost every day.

- https://www.cyclonis.com/phishing-campaigns-use-covid-19-fedex-dhl-ups-fake-issues-spread-malware/


Solution:

Because of this and many other backdoors and bugs with security chips, the solution is to hold your own hardware that acts as the TPM. 

When you login to the Web, Dekstop or Mobile app, the system will prompt you to press a button on the Hardware.
It will then do the Authentication with the app. 

These use open standards such as FIDO2 and WebAuthN.

The best hardware for this Hardware Authentication is the Solo as it is itself fully open sourced, unlike the Yubikey, etc

- https://solokeys.com/
- DiceKeys are a new novel way of creating and then physically storing the Masetr key of your SoloKey: https://www.crowdsupply.com/dicekeys/dicekeys
    - You shake it to get entropy, and a Master key
    - You then put that into the SoloKey via the App GUI.
    - Then you physically store that where you store things you can never loose.
    - This is what is called in Security the "Chain of Trust": https://en.wikipedia.org/wiki/Chain_of_trust


## Message Layer Security

All real time communication are end to end encrypted but also use the [Double Ratchet security logic](https://en.wikipedia.org/wiki/Double_Ratchet_Algorithm) logic to ensure that your messages only reach the correct person and cant be replayed back. This is the same logic used in Signal and What App.

Also all communication ( including video conferences go through the global gateway system ). This is so that your IP does not leak to anyone else your in real time communciation with.

## Basic Functionaity

From there you can use all the functionality which is Real Time Collaboration based.
- Video conference
- Share Documents and Photos
- Chat
- Contacts
- Admin your Org and its sub Projects.
    - See the social graph of who knows who via Faceted search.

## Languages

The system User Interface is in every language of course.

The system will real time translate any functionality. For example in a video conference it will transcribe the audio with subtitles so that everyone can understand everyone else no matter what language they speak. When in chat it wll do the same.

## Write your own Modules

The Architecture is designed so that other developers can build Modules on top of the system, without undermining the End to End encryption.  It does this by forcing all Modules to themselves have Private and public keys and for the System to then enforce those. This is essentially the same thing the App Store does, and requires [Notorization](https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution).

With Notorization, publishers can sign their software offline using their own private keys. Once the developers is ready to make the software available, they can push their signed trusted software to a Notary Server.

Users, having acquired the developers's public key through our secure channel, can then communicate with our Notary server, relying only on the developers's key to determine the validity and integrity of the received software.

This software can run on all Web browsers, Laptops and mobiles but has its own Notorization layer, that runs above the Google and Apple ones.

So unlike Signal or Telegram, its an open ecosystem where anyone can extend the system.

