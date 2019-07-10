The *haproxy.cfg* file has been updated so that the single `listen` is split into a `frontend` and `backend`. These perform the equivalent function.

A `frontend` covers the client-facing duties of a `listen` section, while a `backend` covers the server pool duties. You could switch the order of these sections, so that the `backend` is defined first, if you wished. HAProxy is smart enough to parse them either way.
