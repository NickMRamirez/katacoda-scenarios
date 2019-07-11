HAProxy is built from the ground up to be a **load balancer**. That singular focus guides how concepts are represented within its *haproxy.cfg* configuration file. 

A load balancer: 

* listens at an address and receives incoming traffic from clients
* manages a cluster of servers to which it passes the request
* allows you to scale your server capacity, without requiring the client to have knowledge of the backend servers

By hiding the details of the backend servers from clients, HAProxy allows you to scale out servers without disruption. A load balancer is a proxy, or middleman, between the client and servers.
