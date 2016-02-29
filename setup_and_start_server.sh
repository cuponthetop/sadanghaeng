#!/bin/bash
# for Ubuntu 14.04 LTS
MONGODB_PORT_NUM=5002

# install npm modules
sudo npm install -g pm2

echo "initializing server at: $(pwd)";

# replace __REPLACE__THIS__ to pwd inside nginx
sed "s/__REPLACE__THIS__/$(pwd)/g" ./nginx > ./nginx_aws

# remove default config
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default

# copy our nginx_aws config file to defulat location
sudo cp ./nginx_aws /etc/nginx/sites-enabled/garim

# create log directory
mkdir -p log/nginx
mkdir -p log/mongodb

# create log files
touch log/nginx/nginx.access.log
touch log/mongodb/mongodb.log

# create data directory
mkdir -p data/mongodb

# create certs directory
mkdir certs

# get certs??

# restart nginx

sudo service nginx restart

# start mongod
mongod --datapath ./data/mongodb/ --fork --logpath ./log/mongodb/mongodb.log --port "$MONGODB_PORT_NUM"

# update mongodb config
sed -i "s|mongodb://localhost/|mongodb://localhost/$MONGODB_PORT_NUM" sadanghaeng_api/config/production/db.js
sed -i "s|mongodb://localhost/|mongodb://localhost/$MONGODB_PORT_NUM" sadanghaeng_auth/config/production/db.js

# start server via pm2
pm2 start echosystem.json