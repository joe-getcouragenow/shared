# Specification

Base architecure ..

## Base Architecture summary

- Orgs and Projects directory
    - Allows federated teams that are internal and external to your org to have access to the system.
    - Use projects to apply different security policies for internal and external actors/people.
- Secure login with various forms of 2FA (2 Factor Authentication).
    - FIDO2 and WebAuthn 
    - SMS - but its really not at all secure. 
- User Authentication can be conncted to LDAP, Active Directory or OIDC servers. 
    - Many existing large multi-nationals use these systems to control user accounts and also rights.
- Fully encrypted.
    - Database is fully encrpted. 
        - Master key can be stored on a personal TPM (e.g yubikey or Solokey). 
        - Anyone person with physical access or theft gets nothing.
        - Any intrusion via malware or personal getting Phished (typically via their email account) is not going to compromise the software.
    - Network encrypted.
        - TLS 1.3 
        - ESNI
        - ECHI (future standard, but not yet)
    - DNS Encrypted
        - Anyone using the system is 100% untracable. 
        - Normally with End to End encryption systems (Telegram, Whats app, Signal), you leak to the Government and the ISP that your are using the system and they collect meta data on your usage and geographical position, and the trace route of the path from you to the server. That easily allows them to pinpoint who you are.
    - Can Run fully internal on Premise or in the Cloud.
        - When run internally, you can shut of external netwok access if needed.
    - All Real time communication employs the same security standards as the gold standard, which is Signal as used by Governments, etc.
        - This is called MPL or double ratchet in the industry. 
        - But with No IP Leakage. Despite all the above security measure, Signal, Whats App, Google Meet all leaked your IP address. This is because they use WebRTC as the communication means. WebRTC works by both parties within a real time communication session sharing with each other their IP address, in order to do a Peer to Peer session. We do not allow this. We force all real time communciation (data, video, audio) to be relayed via our Server, and thus each users cannot discover any other users IP address. 
        - Also: Finding the IP address of another user when using Signal and other similar WebRTC software is just a matter on installing a proxy sniffer on your machine. Its not at all hard, is common software and someone can be shown this in 30 seconds.
        - Also: The WebRTC protocol forces connections to be opened on your router. Once these are opened, malicous actors can exploit it.
- Run on Web, Desktop and Mobiles.
    - Power users need to be able to use the system any time and from any device.
- Can run offline.
    - This is important for people working in countries where network access is not high quality.
- Providence and Audit trailing (compliance)
    - Providence means that the source of anything is recorded.
    - Audit Trailing is a log of what changes occurred in the system. 
    - These Compliance aspects are useful if you have any malpractice internally. They are needed to conform with ISO standards and EU and US Government standards.
- Issue Kan Ban
    - All changes in the system can be linked back against an Issue.
    - This is a type of aduit trailing, but is designed to allow all users to collaborate around Issues and work collectivly to resolve them, whilst keeping an Audit trail at the Issue level. 
- Secure Email and DNS
    - The system incorporates a DNS and email server.
    - This is needed by some Orgs that are using third party email and DNS, and so leaking their and their clients privacy.
    - The DNS Server acts as a type of Applications firewall in that it prevents malware, bots and other external tracking systems to reach the main servers or any of your users. 
    - If they all use the DNS Server they get this protection. 
