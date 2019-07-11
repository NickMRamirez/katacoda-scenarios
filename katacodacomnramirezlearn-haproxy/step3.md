In the *haproxy.cfg* file, the `global` section sets process-level instructions for HAProxy. For this example, that includes the following settings:

| Setting                  | Description                                                                                                                                  |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| `maxconn`                  | Limits the number of connections HAProxy will accept, protecting the load balancer from running out of memory.                               |
| `log`                      | Tells HAProxy where to send its log messages.                                                                                                |
| `stats socket`             | Enables the HAProxy Runtime API, which can be used to disable servers and health checks, changing server weights, and other dynamic changes. |
| `ssl-default-bind-ciphers` | Lists SSL and TLS ciphers to use by default.                                                                                                 |
| `ssl-default-bind-options` | Lists SSL and TLS options, such as `ssl-min-ver` to disable support for older protocols.                                                     |

## Try it out

The `log` directive in the `global` section tells HAProxy where to send its log messages. In this case, it sends them to *standard output*. Since HAProxy is running inside of a Docker container, you can view the logs by entering the following command into the terminal window:

```
cd /root/example
docker-compose logs haproxy
```{{execute}}

You should see the startup log message: *Proxy www started*.

The `stats socket` directive enables the HAProxy Runtime API on port 9000. The docker container exposes that port, so you can send the *show info* API command to see information about the running HAProxy process:

```
echo "show info" | nc localhost 9000
```{{execute}}

You will see a list of properties, such as the version of HAProxy and how many threads it is utilizing.