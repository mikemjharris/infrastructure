#!/bin/bash
cd /root/ga-star-wars-timeline
git checkout master
git pull
docker build -t star-wars-new .
docker kill star-wars-twitter 
docker run --rm -d -p 3001:3000 --name star-wars-twitter star-wars-new

