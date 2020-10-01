# cd - continuous deployment

We need CD working
The deployed binary shoudl then self update.
- when this happens can be automatic or saved as needed in the DB when detcetd and shown in the Sys GUI.
	- Can do a notification of it later..


These guys have goten all of it done
https://github.com/AdguardTeam/AdGuardHome
- ironically We actually need to provide a DNS Server that is secure and users can use, and i found the way they do all the CD aspects to be really clean

go releaser
https://github.com/AdguardTeam/AdGuardHome/blob/master/.goreleaser.yml

packing and versioning and generation
https://github.com/AdguardTeam/AdGuardHome/blob/master/main.go
- they use packer
- We use go-bindata so its fine

channel based builds
https://github.com/AdguardTeam/AdGuardHome/blob/master/Makefile
- edge, release or beta !!

binary self updates off github
https://github.com/AdguardTeam/AdGuardHome/tree/master/update

