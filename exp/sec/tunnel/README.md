# tunnel

We need a tunnel to hide all our Servers

But you have to have a way to initially get to your own hiden servers without leaking the IP when your setting it up.
So use Cloudflare WARP to connect to the internet, and then setup our own tunnel Server.
Then startup our own Chisel Tunnel ( aka CHI)
Then connect to the hidden Servers to get whatever golang software you need on it.

Now with our own CHI running, you can close down WARP.
Then update the Client software to use or CHI public proxy server URL.
Now we and public can hit the CHI public proxy, and it will forward requests to the correct hidden Server no matter where it is.
