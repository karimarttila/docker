#!/usr/bin/env bash

if [ $# -ne 3 ]
then
    echo "Usage: ./run-container-aws-dynamodb.sh <my-name> <my-tag> <table-prefix>"
    echo "Examples:"
    echo "./run-container-aws-dynamodb.sh karimarttila/simple-server-clojure-dynamodb 0.1 kari-sseks"
    echo "If you have problems starting the container, check it using sh:"
    echo "  docker run -it --entrypoint /bin/bash karimarttila/simple-server-clojure-single-node:0.1"
    echo "You can get a terminal to running container, use commands:"
    echo "  docker ps -a => check the container name"
    echo "  docker exec -it <container-name> sh"
    echo "Stop and delete all containers:"
    echo "  docker stop $(docker ps -aq) ; docker rm $(docker ps -aq)"
    exit 1
fi

MY_NAME=$1
MY_TAG=$2
MY_PREFIX=$3


# Special setup for getting the AWS_PROFILE to docker container (mounting ~/.aws) to container.

docker run -v ~/.aws:/root/.aws -p 3045:3045 -e "SS_TABLE_PREFIX=${MY_PREFIX}" $MY_NAME:$MY_TAG

