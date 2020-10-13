# Vision

This is written from a Users perspective. This is how it should be explained.


Here is the plan - see what your think...

First we give you or you buy a Rasp PI. It's a 25 dollar computer that you just plug into our home router using an ethernet cable.
That is your server and holds all your data. It's yours. The data is encrypted and so even if you were hacked or burgled they get nothing. You hold the Master encryption key. How this is stored is further down...
That sits there on its own private IP. 

Then you use the Web, Desktop or Mobile App. That and only that can connect to the Rasp PI on your local network. 
So it's secure. The keys are generated in the App, and the public key is put into the Server. Now you and only you can access the data on that Server.

Then you can choose to hook it up to the globally redundant Secure Gateway. This is end to end encrypted. 

You and your collegues will automatically synchronise data with each other. This is for 2 reasons:

1. If your home ADSL / fibre goes down, you can access your data when on the go.
2. If your house burns down you lose nothing.

The way you trust each other is via exchanging public keys via an out of bounds medium. Each of you is what is called an Org.
You can do it via QR code, NFC ( bluetooth is not secure ) or Email. The security Policy you pick determines how paranoid you want to be. QR is the most paranoid.

To access the data when your not at home you have 2 options:

1. You use the global gateway server. It's got your public key, and so knows its you when you call in. Remember the Private key is on your device. You can copy the Private key to as many devices as you want BTW via the QR sync function.
2. If you dont want your ISP or anyone else to Track that your even using the Gateway, just use the Gateway and select Crypto DNS and ESNI. 
- What this will do is give you the commands to secure your device to use the Gateway's own DNS ( which has DDOS attack pretection, malware protection ). 
- The system will then direct you back to the "Am i secure" page where you can see if your untracable".

## Other forms of authentciation and 2FA

Private keys are all great, but what if you want to be even more secure, and not rely on the private key being stored in the TPM chip of your device.  

This is why government ministers have the TPM chip ( https://en.wikipedia.org/wiki/Trusted_Platform_Module ) replaced in all thier hardware. 

The Apple hardware has known flaws already, as do most laptops.

- https://arstechnica.com/information-technology/2020/10/apples-t2-security-chip-has-an-unfixable-flaw/

Its also why governments buy Intel CPU chips without the IME chip functionality. Its actualy a chip inside a chip.

- https://en.wikipedia.org/wiki/Intel_Management_Engine

Then there is backdoor chips by the Chinese in the data centers.

- https://www.bloomberg.com/news/features/2018-10-04/the-big-hack-how-china-used-a-tiny-chip-to-infiltrate-america-s-top-companies

And lastly all the stuff that is still zero day explotis and has not yet been disclosed to the public, because these explots are being activdly used.

Because of this and many other backdoors and bugs with security chips, the solution is to hold your own hardware that acts as the TPM. 

When you login to the Web, Dekstop or Mobile app, the system will prompt you to press a button on the Hardware.
It will then do the Authentication with the app. 

These use open standards such as FIDO2 and WebAuthN

The best hardware for this Hardware Authentication is the Solo as it is itself fully open sourced, unlike the Apple and Intel stuff.
Its made by a friend of mine in Berlin.

- https://solokeys.com/
- DiceKeys are a new novel way of creating and then physically storing the Masetr key of your SoloKey: https://www.crowdsupply.com/dicekeys/dicekeys
    - You shake it to get entropy, and a Master key
    - You then put that into the SoloKey via the App GUI.
    - Then you physically store that where you store things you can never loose.
    - This is what is called in Security the "Chain of Trust": https://en.wikipedia.org/wiki/Chain_of_trust


## Message Layer Security

All real time communication are end to end encrypted but also use the MPL Rouble Ratchet security logic to ensure that your messages only reach the correct person. https://en.wikipedia.org/wiki/Double_Ratchet_Algorithm

Also all communication ( including video conferences go through the global gateway system ). This is so that your IP does not leak to anyone else your in real time communciation with.

## Basic Functionaity
From there you can use all the functionality which is Real Time Collaboration based.
- Video conference
- Share Documents and Photos
- Chat
- Admin your Org and its sub Projects
    - See the social graph of who knows how via Faceted search.

## Languages

The system User Interface is in every language of course.

The system will real time translate any functionality. For example in a video conference it will transcribe the audio with subtitles so that everyone can understand everyone else no matter what language they speak. Or when in chat it wll do the same.

## Open Development system

The Architecture is designed so that other developers can build modules on top of the Archietcure, without undermining the End to End encryption.  It does this by forcing all Modules to themsleves have Private and public keys and for the System to then enforce those. This is essnetally the same thing the App Store does, and requires Notorization.

- https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution

This software can run on all Web browsers, Laptops and mobiles but has underneight its own Notorization layer, that runs inside the Google and Apple ones.

So unlike Signal or Telegram, its an open ecosystem where anyone can extend the system.

