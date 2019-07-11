A `backend` or `listen` section defines a pool of servers that share the responsibility of handling incoming requests. In the following example, HAProxy relays the requests to one of the two servers:

```
backend webservers
    server web1 web1:8000 check
    server web2 web2:8000 check
```

The method that HAProxy uses when choosing the server is its *load-balancing algorithm*. It's customizable.

The algorithm is set with the `balance` directive. When `balance` is not set, as in this example, it defaults to *roundrobin*. The *roundrobin* algorithm is often used when load balancing services that have fairly quick, uniform response times such as with web applications. With *roundrobin*, each server is used in turn, starting with the first one listed in the configuration. 

## Try it out

You can set the algorithm explicitly by adding a `balance` directive. Change the *haproxy.cfg* file so that it uses `balance first`:

<pre class="file" data-filename="haproxy.cfg" data-target="replace">
global
    maxconn 50000
    log stdout local0
    stats socket :9000 mode 660 level admin
    ssl-default-bind-ciphers ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256
    ssl-default-bind-options ssl-min-ver TLSv1.2 no-tls-tickets

defaults
    mode http
    log global
    option httplog
    option forwardfor
    timeout connect 5s
    timeout client 5s
    timeout server 5s

frontend www 
    bind :80
    default_backend webservers

backend webservers
    balance first
    server web1 web1:8000 check
    server web2 web2:8000 check
</pre>

Restart the Docker container:

```
cd /root/example
docker-compose restart haproxy
```{{execute}}

Make a few requests to the [website](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/) and then check the HAProxy logs to see that only *web1* (the *first* server) is being used:

```
docker-compose logs haproxy
```{{execute}}