## DDOS

Project Shield is going to screw us with users

Broad adoption
- We need to have lots of people running Servers.
- The CRDT replication with then mean that attacks are worthless. Servers dying will have no effect.
- Having many clients will means the real tiem lang will be unstoppable.
- All the tricks before rely on broad adaption in order to work. The Network effect as its known.
- All this suggest that we need to rebrand as a Product like "Team work X - helping teams work togther" type of software.

Rate Limit
https://github.com/envoyproxy/ratelimit
- This will pevnet DDOS attacks

Adgard
- The bot and filter detection integrated will allow us to reject calls from bad IP's
- However, with ESNI becoming prevalent it will make it hader to detect over time

DNS
- Running the integrated DNS with ESNI will protect users, but also protect use from DNS spoofing and blocking
- This relies on the DNS data being part of the CRDT replication

Tunnel
- anyone running a Server ( which can be a mobile or a laptop or a raspberry pi) will have a private, NATed IP.
- So we have two choices
    - Use the CRDT based DHT ( distributed hash table) to allow anyoe to find anyone
        - Means we are resilient but expose IP's of users
    - We use a Dynamic DNS feature for non mobile clients
        - Because we the DNS is our own, we can do this easily because its input back into our own system. Its self reflecting essntially, and only needs a Laptop in a few continents to go live. Essentially these initial laptop act as the Tunnel in a way
- Lastly there is a new feature of TCP called "Encrypted Client Hello (ECH)" that surpassed ESNI to protect users that we could use
    - https://github.com/tlswg/draft-ietf-tls-esni
    - https://datatracker.ietf.org/doc/draft-ietf-tls-esni/?include_text=1
    - Background:
        - https://umbriel.fr/blog/ESNI,_what_it_can_and_cant_do.html
        - https://duo.com/decipher/internet-standards-emphasize-user-privacy-at-expense-of-enterprise-security
    - ESNI issues
        - China is banning all Servers using it, and because of so many serevrs running with virtual IPS mapped to Public static IPs in data center, a singel banning by China takes out thousands of serevrs in reality.
    - HPKE
        - ECH relies on HPKE (Hybrid Public Key Encryption) which is the Encryption Discovery mechanism
        - standard: https://tools.ietf.org/html/draft-irtf-cfrg-hpke-05
        - golang implemenation: https://github.com/cisco/go-hpke
    - MLS
        - Message Layer Security as used by Singla and Wire
        - golang implemenation: https://github.com/cisco/go-mls
    - Firefox is implementing ECH :)
        - https://www.mail-archive.com/dev-platform@lists.mozilla.org/msg29389.html
        - in nightly ?
        - "network.security.ech.enabled" is the setting
        - ESNI will be removed
    - Chrome is alos working on it.
        - https://bugs.chromium.org/p/chromium/issues/detail?id=1091403
