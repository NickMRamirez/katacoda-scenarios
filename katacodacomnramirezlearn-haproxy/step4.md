A `listen` section creates a public endpoint to which clients can connect. It then relays those connections to one of the servers. In the example *haproxy.cfg* file, the *fe_main* `listen` section is using the `bind` keyword to accept traffic on port 80. It is then passing that traffic to a server named *web1*, which is listening (privately) on port 8080.

A listen section accomplishes two objectives:

* Begins listening for client connections on a certain port, specified with a `bind` directive
* Defines the pool of servers that should handle each request

The simplicity of a `listen` section makes it ideal for cases where you want to relay connections to the same set of servers, without a need to redirect some requests to a different set of servers.

Click the *Display 80* tab to see it in action. This makes a request to HAProxy at port 80. HAProxy then relays the request to a backend server, which returns a response to HAProxy.