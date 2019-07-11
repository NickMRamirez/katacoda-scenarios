#!/bin/bash

cd /root/example
docker-compose up -d

apt install -y netcat

wget -O cat.png https://cdn.pixabay.com/photo/2016/11/09/23/16/music-1813100_960_720.png