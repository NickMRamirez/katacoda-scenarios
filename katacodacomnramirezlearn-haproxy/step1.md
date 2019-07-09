An HAProxy configuration file consists primarily of only a handful of sections. These sections are:

| Section  | Description                                                                 |   |   |   |
|----------|-----------------------------------------------------------------------------|---|---|---|
| `global`   | Sets process-level instructions for HAProxy                                 |   |   |   |
| `defaults` | Sets default parameters for all other sections following its declaration    |   |   |   |
| `listen`   |  Defines both the cluster of servers and the listener that receives traffic |   |   |   |
| `frontend` | Defines the listener that receives traffic                                  |   |   |   |
| `backend`  | Defines the cluster of servers                                              |   |   |   |

These simple building blocks allow for clear, intuitive configurations that can scale to handle a great deal of traffic. Advanced techniques, such as redirecting requests, filtering out malicious users, and altering messages as they pass through, fit within this framework.

Open the *haproxy.cfg* file to the right.
