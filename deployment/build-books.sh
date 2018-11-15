#!/bin/bash
/bin/bash ~/deployment/version-books.sh
cd /root/books
git checkout master
git pull
docker build -t mikemjharris/books .
docker kill books
docker rm books
docker run -d -p 8008:8001  --name books mikemjharris/books
