
# File DB

We have badger that is awesome, and we need a File system also now.

IPFS or Minio are the obvious ones.

Minio for go
- https://github.com/RTradeLtd/s3x
	- gives a GRPC API to Minio !

Minio for Flutter
- https://github.com/xtyxtyx/minio-dart

Why ?
- Will allow Feature module to have a way to 

## Temporal S3 Recipe

- Protobuf here:
	- https://github.com/RTradeLtd/TxPB
- SDK here:
	- https://github.com/RTradeLtd/go-temporalx-sdk

## Minio 3s Recipe

https://geek-cookbook.funkypenguin.co.nz/recipes/minio/

https://github.com/kahing/goofys
- allows to mounts a remote minio


## Feature module

It currently uses tusd, which is not working.
We can easily use the minio-dart

## backup of DB and Filer itself

https://github.com/restic/restic
- can backup to minio: https://github.com/restic/restic/blob/master/internal/backend/s3/s3.go

So we can then backup to a local or remote. Kill two birds with one stone.

## Email

We also need a filer for emails, and so can use eithr badger or s3 for this.

https://github.com/mailhog
- Just set an App Password on the chosen Gmail account and it will send emails to it.
	- see: https://github.com/mailhog/MailHog/issues/246


## Logging

This will allow logs to be local, as well as sent to a cloud minio.

Or we use OpenTelemetry. 