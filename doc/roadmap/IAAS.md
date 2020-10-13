# IAAS

The storage and compute needs a management plane and discovery in order to scale.

It also needs to be agnostic to Cloud, OnPremsie and hidden Onpremie

Redfish is the open standard that bypasses all the stupid proprietry hardware and API's that are hidden behind all the clouds.
So we need an API that talks to that hardware ( for our on premise) and a abstraction layer that does it to the Clouds also.

Then we need to store the data that relates of course to where all that hardware is.


https://github.com/yunionio/onecloud/tree/master/pkg/util/redfish

Boxes
- need SSD over Netwwork. 


