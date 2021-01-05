# Shared

Tools for devs to build.




## SSH local setup


- REF: Setup many accounts in ssh config:  https://medium.com/@xiaolishen/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693

- Delete the shit in your global git config. Your leaking ..
	- ``` git config --list ```

- same but shows where the values come from.
	- ``` git config -l ```

- Make a new key
	- ``` ssh-keygen -t rsa -b 4096 -C "userXXX_github" ```


- Add ssh key 
	- ``` ssh-add ~/.ssh/userXXX_github  ```

- List added ssh 
	- ``` ssh-add -l  ```


- Add the public key to github on your github web site
	- https://github.com/settings/keys

## SSH Config file

Needs this in it:

```

# userXXX
# https://github.com/userXXX/dev
# e.g: git clone git@github.com-userXXX:userXXX/dev.git
Host github.com-userXXX
 HostName github.com
 User git
 UseKeychain yes
 AddKeysToAgent yes
 IdentityFile ~/.ssh/userXXX_github
 
```


## when you fork

add this to .git/config:
````
[user]
	email = userXXX@gmail.com
````

then:

````
make gitr-fork-setup
````



## Install golang and then tools


````
make this-dep
````