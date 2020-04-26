#!/bin/sh
echo "starting"

sudo /etc/init.d/nginx start

ps axl | grep webhook | grep -v grep > /dev/null

if [ $? != 0 ]
then
	/root/deployment/webhook-server.py
	echo "starting webserver webhook"
fi
