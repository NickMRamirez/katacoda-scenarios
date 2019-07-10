If you require more complex routing behavior, such as the ability to send traffic to different clusters of servers depending on a condition, then it's better to split a `listen` section into two parts: a client-facing `frontend` and one or more `backend` sections that contain servers.

A `frontend` covers the client-facing duties of a `listen` section, while a `backend` covers the server pool duties. You could switch the order of these sections, so that the `backend` is defined first, if you wished. HAProxy is smart enough to parse them either way.

## Try it out

Update the *haproxy.cfg* file so that the `listen` section is replaced with the following:

```
frontend www 
    bind :80
    default_backend webservers

backend webservers
    server web1 web1:8000 check
    server web2 web2:8000 check
```

Then restart the Docker container:

```
cd /root/example
docker-compose restart haproxy
```

Click the *Display 80* tab to see that the site still works. You can also check the logs again to see that the *www* `frontend` and *webservers* `backend` were started:

```
docker-compose logs haproxy
```

You should see:

```
Proxy www started.
Proxy webservers started.
```