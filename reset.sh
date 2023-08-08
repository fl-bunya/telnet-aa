#!/bin/bash

name="telnet-ascii-animation"
tag="0.0.1"

docker stop $name
docker rm $name
docker rmi $name:$tag

docker build -t $name:$tag .
# docker build --no-cache -t $name:$tag .
docker run -dit -v ${PWD}/bin:/root/bin --name $name -p 23:23 -p 808:808 $name:$tag
# docker run -dit --name $name -p 9998:80 $name:$tag
docker exec -it $name bash
