#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo "Usage: ./run-container.sh <my-tag>"
    echo "Examples:"
    echo "./run-container.sh 0.1"
    echo "If you have problems starting the container, check it using sh:"
    echo "  docker run -it --entrypoint /bin/sh karimarttila/simple-server-clojure:0.1"
    echo "You can get a terminal to running container, use commands:"
    echo "  docker ps -a => check the container name"
    echo "  docker exec -it <container-name> sh"
    echo "Stop and delete all containers:"
    echo "  docker stop $(docker ps -aq) ; docker rm $(docker ps -aq)"
    exit 1
fi

MY_NAME="karimarttila/simple-server-clojure"
MY_TAG=$1
docker run -p 3045:3045 $MY_NAME:$MY_TAG
