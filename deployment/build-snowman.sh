#!/bin/bash
cd /root/threejs-snowman
git checkout master
git pull
docker build -t mikemjharris/snowman .
docker kill snowman 
docker run --rm -d -v $(pwd)/data:/var/www/data -p 3000:8000  --name snowman mikemjharris/snowman
