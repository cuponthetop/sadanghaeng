#!/bin/sh
sudo service nginx stop  # or whatever your webserver is
if ! sudo ./letsencrypt/letsencrypt-auto renew -nvv --standalone > sudo /var/log/letsencrypt/renew.log 2>&1 ; then
    echo Automated renewal failed:
    cat /var/log/letsencrypt/renew.log
    exit 1
fi
sudo service nginx start # or whatever your webserver is