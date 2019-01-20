#!/usr/bin/env bash

if [ $# -ne 4 ]
then
    echo "Usage: ./build-docker-image.sh <base-tag> <my-tag> <simple-server-dir> <ss-version>"
    echo "Example: ./build-docker-image.sh 0.1 0.1 /mnt/edata/aw/kari/github/clojure/clj-ring-cljs-reagent-demo/simple-server single-node"
    exit 1
fi

BASE_TAG=$1
MY_TAG=$2
SS_DIR=$3
SS_VERSION=$4

if [ "$SS_VERSION" == "single-node" ]; then
  MY_NAME="karimarttila/simple-server-clojure-single-node"
  MY_BUILD_SCRIPT="./build-single-node-distributable.sh"
elif [ "$SS_VERSION" == "table-storage" ]; then
  if [[ -z "${AZURE_CONNECTION_STRING}" ]]; then
    echo "Environmental variable AZURE_CONNECTION_STRING is not set"
    echo "Source it first using command:"
    echo "source ~/.azure/kari2ssaksdevtables-connectionstring.sh"
    exit -1
  fi
  MY_NAME="karimarttila/simple-server-clojure-table-storage"
  MY_BUILD_SCRIPT="./build-azure-table-storage-distributable.sh"
elif [ "$SS_VERSION" == "dynamodb" ]; then
  if [[ -z "${SS_TABLE_PREFIX}" ]]; then
    echo "SS_TABLE_PREFIX not set"
    exit -1
  fi
  MY_NAME="karimarttila/simple-server-clojure-dynamodb"
  MY_BUILD_SCRIPT="./build-aws-eks-dynamodb-distributable.sh"
else
  echo "Unknown choice: $SS_VERSION"
  exit 2
fi

echo "Using tag: $MY_IMAGE_TAG"

echo "First build the app with the right profile..."
if [ ! -d "$SS_DIR" ]; then
  echo "Directory $SS_DIR does not exist"
  exit -1
fi
pushd $SS_DIR
./${MY_BUILD_SCRIPT}
popd

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
