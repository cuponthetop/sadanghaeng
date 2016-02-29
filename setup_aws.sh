#!/bin/bash
# for Ubuntu 14.04 LTS

sudo apt-get update
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

# install dep
sudo apt-get install -y nodejs
sudo apt-get install -y mongodb
sudo apt-get install -y nginx
