#!/usr/bin/env bash

if [ $# -ne 4 ]
then
    echo "Usage: ./build-docker-image-single-node.sh <base-tag> <my-tag> <jar-file> <resources-dir>"
    exit 1
fi

MY_NAME="karimarttila/simple-server-clojure-single-node"
BASE_TAG=$1
MY_TAG=$2
JAR_FILE=$3
RESOURCES_DIR=$4
MY_ENTRY_POINT_FILE=my-entrypoint.sh
CMD_BUILD="docker build -f Dockerfile -t $MY_NAME:$MY_TAG --build-arg base_tag=${BASE_TAG} ."

cp $JAR_FILE image/app.jar
cp -r $RESOURCES_DIR image/.
cp lib/$MY_ENTRY_POINT_FILE image/.
cd image
echo "Parameters:"
echo " - base tag:           $BASE_TAG"
echo " - my tag:             $BASE_TAG"
echo " - jar file:           $JAR_FILE"
echo " - properties file:    $PROPERTIES_FILE"
echo " - my-entrypoint file: $MY_ENTRY_POINT_FILE"
echo "Building docker image $MY_NAME:$MY_TAG ..."

$CMD_BUILD
echo "Done with image $MY_NAME:$MY_TAG"
echo "Cleaning ..."
rm -rf resources
rm *.jar
rm *.sh
cd ..
echo "All Done"
