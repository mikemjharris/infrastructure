#!/bin/bash
/bin/bash $(pwd)/version.sh
cd /root/personal-website
git checkout master
git pull
