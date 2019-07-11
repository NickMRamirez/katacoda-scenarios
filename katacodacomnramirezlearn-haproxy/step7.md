A `frontend` or `listen` section creates the client-facing side of a proxy. Adding a `bind` directive begins the proxy listening on a particular IP address and port. Consider the following example:

```
frontend www
   bind :80
   default_backend webservers
```

This proxy listens for incoming connections on all IPv4 addresses assigned to the host at port 80. It uses INADDR_ANY behind the scenes, meaning it binds to all available interfaces.

In order to bind to a specific address, you would add it before the port, as shown:

```
frontend www
   bind 172.17.0.13:80
   default_backend webservers
```

To listen for connections on all IPv6 addresses assigned to the host, prefix the port with two colons (e.g. :::80):

```
frontend www
   bind :80   
   bind :::80
   default_backend webservers
```

In this case, there are two bind lines: 

* one that listens on all IPv4 addresses
* one that listens on all IPv6 addresses

You can also use the `v4v6` argument with a single IPv6 `bind` line to bind to all IPv4 and IPv6 addresses:

```
frontend www
   bind :::80 v4v6
   default_backend webservers
```

Or, you can bind to a specific IPv6 address, as shown in this example:

```
frontend www 
   bind fd12:3456:7890:abcd::14:80
   default_backend webservers
```

It's perfectly valid to add multiple `bind` lines within the same `frontend` or `listen` in order to listen on multiple IP addresses. Although, you can also list the addresses one after another and separate them with commas, as shown:

```
frontend www
   bind 172.17.0.13:80,172.17.0.14:80
   default_backend webservers
```

Or, add a range of ports on which to listen. In the following example, HAProxy binds to all ports in the range of 8000 to 8020 for the given IP address.

```
frontend www
   bind 172.17.0.13:8000-8020
   default_backend webservers
```

Be careful not to bind to more ports than you need, since each configured port consumes a socket on the host and sockets are needed to accept incoming connections and also initiate connections to backend servers.
