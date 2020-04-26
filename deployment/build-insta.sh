#!/bin/bash
cd /root/insta-preview
git checkout master
git pull
/bin/bash ~/deployment/version-insta.sh
docker build -t mikemjharris/insta-preview .
docker kill insta-preview 
docker rm insta-preview 
docker run -d -v ~/logs/:/var/www/logs -p 7001:8001  --name insta-preview mikemjharris/insta-preview
