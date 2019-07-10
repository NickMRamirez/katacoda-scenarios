#!/bin/bash

cd /root/example/
cat /root/changes/haproxy-1.cfg > /root/example/haproxy.cfg
docker-compose restart haproxy