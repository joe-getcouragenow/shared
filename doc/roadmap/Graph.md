# Graph

We need the ability to graph users togther.

https://github.com/getcouragenow/graphview
- https://github.com/nabil6391/graphview

All we need to do is the the sys-acconts meta data to add extra fields for whatever the relationship is.
We do this in mod-accounts.

The relationship type can be varible.
But usee case is that from an Org or Project level you want to see who knows who basically.
Thats a simple agregation.

Then from the graph you you see all the users, and then from a User you want to see what other Prgs or projects they are a member of.
The obvious way to do this is to use Facet Search.
You can then list users by Org, Project or Who they know.
We are planning to use Facet Search as a first class system level thing.
We can do this with bleve.
https://blevesearch.com/docs/Result-Faceting/
- go: https://github.com/alash3al/bbadger
- probably others
- also IPFS makes sense as the store sicne it has the CRDT Badger stuff which will give us the scaling we need.
    - https://github.com/ipfs/go-ds-crdt
    - wrappers: https://github.com/amirylm/libp2p-facade
        - https://github.com/amir-yahalom/go-csn. See the CMD:
            - boot node is the Discovery server. It prob tracks the http gateways and nodes.
            - http-gateway is the way in to the nodes and so protects the privacy of the nodes.
            - node is a users node. Like a desktop, mobile or rasp pi.
https://github.com/lanzafame
    - dude workng on IPFS search