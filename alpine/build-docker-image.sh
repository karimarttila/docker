#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo "Usage: ./build-docker-image.sh <my-tag>"
    echo "Examples:"
    echo "./build-docker-image.sh 0.1"
    exit 1
fi

MY_NAME="karimarttila/alpine3.8"
MY_TAG=$1
CMD_BUILD="docker build -f Dockerfile -t $MY_NAME:$MY_TAG ."

echo "Building docker image $MY_NAME:$MY_TAG"
cd image
$CMD_BUILD
cd ..
echo "Done with image $MY_NAME:$MY_TAG"

