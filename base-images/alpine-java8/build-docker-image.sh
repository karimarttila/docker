#!/usr/bin/env bash

if [ $# -ne 2 ]
then
    echo "Usage: ./build-docker-image.sh <base-tag> <my-tag>"
    echo "Examples:"
    echo "./build-docker-image.sh 0.1 0.1"
    exit 1
fi

MY_NAME="karimarttila/alpine3.8-java8"
BASE_TAG=$1
MY_TAG=$2
CMD_BUILD="docker build -f Dockerfile -t $MY_NAME:$MY_TAG --build-arg base_tag=${BASE_TAG} ."

cd image
echo "Parameters:"
echo " - base tag:           $BASE_TAG"
echo " - my tag:             $BASE_TAG"
echo "Building docker image $MY_NAME:$MY_TAG ..."

$CMD_BUILD
echo "Done with image $MY_NAME:$MY_TAG"
cd ..
echo "All Done"
