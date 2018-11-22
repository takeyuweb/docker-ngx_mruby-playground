#!/bin/bash

while true
do
        inotifywait --exclude .swp -e create -e modify -e delete -e move  /usr/local/nginx/conf.d
        # Check NGINX Configuration Test
        # Only Reload NGINX If NGINX Configuration Test Pass
        nginx -t
        if [ $? -eq 0 ]
        then
                echo "Reloading Nginx Configuration"
                 nginx -s reload
        fi
done
