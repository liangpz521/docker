#/bin/bash

docker rm $(docker ps -aq)
docker rmi -f lnmp
