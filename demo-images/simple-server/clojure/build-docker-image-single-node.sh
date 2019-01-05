#!/usr/bin/env bash

if [ $# -ne 3 ]
then
    echo "Usage: ./build-docker-image-single-node.sh <base-tag> <my-tag> <simple-server-dir>"
    exit 1
fi


MY_NAME="karimarttila/simple-server-clojure-single-node"
BASE_TAG=$1
MY_TAG=$2
SS_DIR=$3

echo "First build the app with the right profile..."
if [ ! -d "$SS_DIR" ]; then
  echo "Directory $SS_DIR does not exist"
  exit -1
fi
#pushd $SS_DIR
#./build-single-node-distributable.sh
#popd

echo "Then build the image..."
MY_ENTRY_POINT_FILE=my-entrypoint.sh
CMD_BUILD="docker build -f Dockerfile -t $MY_NAME:$MY_TAG --build-arg base_tag=${BASE_TAG} ."

cp $SS_DIR/target/uberjar/simple-server-1.0-standalone.jar image/app.jar
cp -r $SS_DIR/resources image/.
cp -r $SS_DIR/.lein-env image/.
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
rm .lein-env
cd ..
echo "All Done"
