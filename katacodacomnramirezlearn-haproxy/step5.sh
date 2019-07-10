#!/bin/bash

cd /root/example
cat /root/changes/haproxy.cfg > /root/example/haproxy.cfg
docker-compose restart haproxy