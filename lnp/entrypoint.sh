#!/bin/bash
# Don't continue if we catch an error.
set -e
 /etc/init.d/nginx start
 /etc/init.d/php7.1-fpm start
# just keep this script running
while [[ true ]]; do
    sleep 1
done
