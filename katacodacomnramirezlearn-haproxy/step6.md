Splitting your configuration up into `frontend` and `backend` sections is advantageous when you want to introduce more complex routing behavior. In our current example, the `frontend` relays all traffic to the `backend` with the name *webservers* by looking at the `default_backend` directive. If such a `backend` isn't found, HAProxy will fail to load the new configuration and give an error such as:

Proxy 'www': unable to find required default_backend: 'webservers'.

Let's introduce some more advanced routing logic.

If you wanted to send all traffic by default to the *webservers* `backend`, but all requests for PNG files to a `backend` named *static_resources*, then you would do these steps:

* Add a new `backend` section named *static_resources*
* Add a `use_backend` directive to the `frontend` with an `if` statement that says when that `backend` should be used

## Try it out

Change the *haproxy.cfg* file so that the `frontend` and `backend` sections look like this:

```
frontend www 
    bind :80
    use_backend static_resources if { path_end .png }
    default_backend webservers

backend webservers
    server web1 web1:8000 check
    server web2 web2:8000 check

backend static_resources
    server static1 static1:8080 check
```

Then you can access a PNG image via the load balancer at https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/cat.png.

View the HAProxy logs to see that the request for the image was relayed to the *static_resources* backend. You should see: