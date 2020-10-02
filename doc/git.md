
clone

git clone git@github.com-joe-getcouragenow:joe-getcouragenow/dev



config


[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
	ignorecase = true
	precomposeunicode = true
[remote "origin"]
	url = git@github.com-joe-getcouragenow:joe-getcouragenow/dev
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
[remote "upstream"]
	url = git@github.com-joe-getcouragenow:getcouragenow/dev
	fetch = +refs/heads/*:refs/remotes/upstream/*

# old: url = git://github.com/getcouragenow/dev.git
# new: url= git@github.com-joe-getcouragenow:getcouragenow/dev

# git@github.com-joe-getcouragenow:joe-getcouragenow/dev
