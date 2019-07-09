The `global` section sets process-level instructions for HAProxy. In this example, that includes where to send logs. For this tutorial, HAProxy is running inside of a Docker container. So, you can view the HAProxy logs by entering the following command into the terminal window:

```
docker-compose logs haproxy
```

Try it out! You should see the initial log message: *Proxy fe_main started*.