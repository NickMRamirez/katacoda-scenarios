#!/bin/bash

cd /root/example
docker-compose up -d

apt install -y netcat

wget -O cat.png https://cdn.pixabay.com/photo/2018/03/31/03/46/kitten-3277268_960_720.png