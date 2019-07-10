# Intro to HAProxy Concepts

HAProxy is built from the ground up to be a **load balancer**. That focus guides how network concepts are represented within its *haproxy.cfg* configuration file. 

A load balancer: 

* listens at an address and receives incoming traffic
* manages a cluster of servers to which it passes the request
* allows you to scale your server capacity, without requiring the client to have knowledge of the backend servers

By hiding the details of the backend servers from the client, HAProxy allows you to scale out without disruption. A load balancer is a proxy, or middleman, between the client and servers.

In this scenario, you will learn about the major sections of an HAProxy configuration: the `global`, `defaults`, `listen`, `frontend`, and `backend` sections.

