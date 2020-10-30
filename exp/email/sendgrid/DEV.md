# sendgrid

https://github.com/dapr/components-contrib/blob/master/bindings/twilio/sendgrid/sendgrid.go

- looks strong
- meta binding

Example of how to laod up: https://github.com/dapr/dapr/blob/master/cmd/daprd/main.go#L371
- only 2 lines


THis lib looks like a great base to extedn for any thing where we need to use external providers.

-

https://github.com/pydio/cells/tree/master/broker/mailer
- Proto:
	- https://github.com/pydio/cells/blob/master/common/proto/mailer/mailer.proto
- templates
	- has a single one. We can extend
- queue
	- uses boltdb. Change to Badger.
	- Or use memory quque: https://github.com/pydio/cells/blob/master/broker/mailer/memqueue.go
- lang
	. 

--

Expose as a GRPC wrapper

- only needed for Sys-accounts for signup, etc etc
- But built it as part of Sys-core.
- Name: "Email"
- GRPC
	- just extend existing
- Security
	- We can get their JWT, and so know their Org, Project, etc
	- SO we can do he replacement of the Org Name and Project name for the email text
- Email Templating
	- They provide the template ( in this case Sys-Account)
	- They provide a binding to tell us the Field in the Template of where the Org and Proejct is.
- Config
	- exposed as part of sys-core.


---

Queue. We Shoudl have one since we are calling a third party system.

We can use this: https://github.com/alash3al/redix/tree/v2
- it is a simple Badger Redis wrapper with a proto.
