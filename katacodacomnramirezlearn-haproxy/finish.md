You now have an understanding of the major parts of an HAProxy configuration file:

| Section  | Description                                                                   |   |   |   |
|----------|-------------------------------------------------------------------------------|---|---|---|
| `global`   | Sets process-level instructions for HAProxy                                 |   |   |   |
| `defaults` | Sets default parameters for all other sections following its declaration    |   |   |   |
| `listen`   |  Defines both the cluster of servers and the listener that receives traffic |   |   |   |
| `frontend` | Defines the listener that receives traffic                                  |   |   |   |
| `backend`  | Defines the cluster of servers                                              |   |   |   |