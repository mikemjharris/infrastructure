#!/bin/bash
/bin/bash version-dashboard.sh
cd /root/dashboard
git checkout master
git pull
docker build -t mikemjharris/dashboard .
docker kill dashboard
docker rm dashboard
docker run -d -p 7001:8001  --name dashboard mikemjharris/dashboard
