#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo "Usage: ./build-docker-image.sh <my-tag>"
    echo "Examples:"
    echo "./build-docker-image.sh 0.1"
    exit 1
fi

MY_NAME="karimarttila/debian-openjdk11"
MY_TAG=$1
CMD_BUILD="docker build -f Dockerfile -t $MY_NAME:$MY_TAG ."

cd image
echo "Parameters:"
echo " - my tag:             $BASE_TAG"
echo "Building docker image $MY_NAME:$MY_TAG ..."

$CMD_BUILD
echo "Done with image $MY_NAME:$MY_TAG"
cd ..
echo "All Done"
