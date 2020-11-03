# contacts


Has the right GUi scaffold. works ok on all sizes

## Google

At the moment its using google contacts. Obviously we dont want to do this.
We have our own Accounts sysem and so can easile us that.

## links

Contacts with links to other things like github or twitter etc works

## Url schemes

Clicking on an email or Telephone number opens the default one in web !!
this is just what we need

## Integration

We can easily add this to sys-accounts for each user.

Each User can edit their own contacts.
- We need a Rail Icon for it.
- Account
- SO then in account they just update thwir contacts

In each Project, the Project Admin can see the users and conatct them.

## BUGS

Its desifned to use the offical flutetr desktop.
- make file has the code to help do this.

Using go-flutter ?
- We might not need it.
- It is very possible that using FFI and protobuf and compiling the golang as a shared lib will work fine, and allow use to build proper flutetr desktop wth out own golang code.
	- should work on web, mobile and desktop this way.

Proxy
- The thing is designed to run a proxy. The proxy handles all the Cors stuff for you so that it can display twitter inside a webview for example