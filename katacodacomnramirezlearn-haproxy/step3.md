The `defaults` section sets various default values that will apply to the sections that follow. Choose settings that are common across the rest of the configuration so that you don't need to repeat them in each `listen`, `frontend`, and `backend` section. Each of these settings can be overridden, if needed, by specifying it again within a following section.

In the *haproxy.cfg* file here, we've included the following settings:

| Setting             | Description                                                                                                                                     |   |   |   |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|---|---|---|
| `mode http`         | Defines whether HAProxy operates as a TCP proxy or if it's able to inspect higher-level HTTP messages. It can be set to either `tcp` or `http`. |   |   |   |
| `log global`        | Instructs HAProxy to use the `log` directive from the `global` section.                                                                         |   |   |   |
| `option httplog`    |  Tells HAProxy to log more verbose messages that are helpful for HTTP traffic.                                                                  |   |   |   |
| `option forwardfor` | Records the client's source IP address and places it into an X-Forwarded-For header.                                                            |   |   |   |
| `timeout connect`   | Defines how long to wait for HAProxy to establish a connection to a backend server.                                                             |   |   |   |
| `timeout client`    | Defines how long to wait for the client to send data.                                                                                           |   |   |   |
| `timeout server`    | Defines how long to wait for the server to send data.        
