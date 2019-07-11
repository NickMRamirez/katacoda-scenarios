A `listen` section creates a public endpoint to which clients can connect. It then relays those connections to one of the servers. In the example *haproxy.cfg* file, the *www* `listen` section is using the `bind` keyword to accept traffic on port 80. It is then passing that traffic to one of two servers, either *web1* or *web2*, which are listening (privately) on port 8000.

A `listen` section accomplishes two objectives:

* Begins listening for client connections on a certain IP address and port, specified with a `bind` directive
* Defines the pool of servers that should handle each request

The simplicity of a `listen` section makes it ideal for cases where you want to relay connections to the same set of servers, without a need to redirect some requests to a different set of servers.

You may be curious about the label *www* on the `listen` line. Each `listen` must be given a name, but you can set this to whatever you like as long as it consists of only the following characters:

* Upper and/or lower-case letters
* Numeric digits
* Dashes (-), underscores (_), dots (.), and colons (:)

## Try it out

Click the **Display 80** tab to see it in action. 

This makes a request to HAProxy at port 80. HAProxy then relays the request to a backend server that is listening at port 8000, which returns a response to HAProxy. HAProxy then returns it to the client (the browser).
