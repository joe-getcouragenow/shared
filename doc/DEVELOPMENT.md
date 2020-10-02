# Development

## Project docs

This contains the Functional modules and runner.

Project Web site: https://getcouragenow.org/

## Developer setup and help

The project uses [Flutter](https://flutter.dev/), [Golang](https://golang.org/) and [k3d](https://github.com/rancher/k3d)

However, you need to make sure you have all extra dependencies setup first, if you want to extend the system. 
See the boilerplate OS folder where scripts are there to do this for you.

## Tools

With Flutter and golang installed, you can install our tools.

## Building

See Main Repo and Deploy folder for Client and Server makefiles:

Run  ```make this-all```, and it will put all build tools into the go bin.


## Running

Run  ```make run-all```, and it will run the code.

## Container based

This is not yet ready !

Use Bazel and Telepresense to have all the code in docker and docker compose and k3d.

## Working on an issue

The [Kan Ban](https://github.com/orgs/getcouragenow/projects/1) should be looked at to work out what to work on.

Is you want to work on an issue, please first ensure that you understand the issue and the suggested approach. Ask the Team on Telegram if your not sure about something or the best way to approach the implementation.

When you take an issue, please assign yourself to it and let everyone know on the Telegram group, so we everyone knows your taking it.



## SSH Setup

```
cd $HOME/.ssh

# Delete the shit in your global git config. Your leaking ..
# git config --list
# same but shows where the values come from.
# git config -l

# Make a new key
# ssh-keygen -t rsa -b 4096 -C "me-getcouragenow@github.com"

# Add ssh key
# ssh-add ~/.ssh/me-getcouragenow@github.com

# Delete ssh key  (if you screw it up)
# ssh-add -d ~/.ssh/me-getcouragenow@github.com

# List added ssh
# ssh-add -l

# Add the public key to github on the web site
# https://github.com/settings/keys

```

ssh config:

add this to $HOME/.ssh/config

```
## me-getcouragenow
# https://github.com/me-getcouragenow/dev
# e.g: git clone git@github.com-me-getcouragenow:me-getcouragenow/main
Host github.com-me-getcouragenow
 HostName github.com
 User git
 UseKeychain yes
 AddKeysToAgent yes
 IdentityFile ~/.ssh/me-getcouragenow@github.com
```

## Git

Now you setup your filesystem and make any changes and PR it back.

The scripts do all this for you.

```
# setup Org folder
mkdir cd $(GOPATH)/github.com/me-getcouragenow

# Clone a repo
git clone git@github.com-me-getcouragenow:me-getcouragenow/dev

# Jump into the repo
cd $(GOPATH)/github.com/me-getcouragenow/dev

# CHECK you in the repo
pwd
/Users/apple/workspace/go/src/github.com/me-getcouragenow/dev

# Config it to point to upstream properly
make gitr-fork-setup

# Catchup to the upstream
make gitr-fork-catchup

# Make a PR
make M='<#ISSUENUMBERO> comment ...' gitr-fork-all

```

---

## CI and CD

When your PR is merged, check it builds correctly and then check the automated release works.

CI: https://github.com/getcouragenow/<repo>/actions


### Tracking the Channels

- Git TAGS are used to version the backend and frontend together.

Domains need to be tracked against environments
- Domain Y: env-y.json

Map the git TAGS version to the Channel
- stable: (git-tag X)
- beta: (git-tag Y)
- dev: (git-tag Y)
- ci: ( Master always )

Client/assets/env.json
Server/

## DNS

SRV record matching;

ci=maintemplate.ci.getcouragenow.org

beta=maintemplate.beta.getcouragenow.org

dev=maintemplate.dev.getcouragenow.org

stable=maintemplate.stable.getcouragenow.org