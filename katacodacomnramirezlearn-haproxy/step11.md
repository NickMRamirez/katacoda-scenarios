For the most part, you should try to choose a load-balancing algorithm that will distribute the traffic as evenly as possible across your servers. However, sometimes you want to utilize some servers more heavily. This can be used to favor more powerful servers, for example, or to perform advanced deployment techniques such as canary deployments, in which servers hosting new features get only a small portion of the traffic. 

You can add a `weight` parameter to a `server` directive to set how much traffic it should receive, proportionate to other servers. It can be a number between 0 and 256.

## Try it out

Update the *haproxy.cfg* to use this configuration:

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
    balance roundrobin
    server web1 web1:8000 check weight 75
    server web2 web2:8000 check weight 25
</pre>

In this example, the *web1* `server` has a `weigth` of 75, while *web2* has a `weight` of 25.

Restart the Docker container after you've updated the configuration:

```
cd /root/example
docker-compose restart haproxy
```{{execute}}

Make a four or five requests to the [website](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/).

Check the logs:

```
docker-compose logs haproxy
```{{execute}}

You should see that *web1* is used 3/4 of the time.