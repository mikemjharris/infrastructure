#!/bin/bash
cd /root/view-from-the-ra
git checkout master
git pull
docker-compose build
docker-compose kill
docker-compose up -d
