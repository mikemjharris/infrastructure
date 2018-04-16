#!/bin/bash
cd /root/blog
git checkout master
git pull
docker build -t mikemjharris/blog .
docker kill blog
docker rm blog
docker run -d -p 7000:8000  --name blog mikemjharris/blog
