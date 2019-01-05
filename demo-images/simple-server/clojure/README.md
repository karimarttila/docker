# Simple Server Clojure Docker Image <!-- omit in toc -->


# Table of Contents  <!-- omit in toc -->
- [Introduction](#introduction)
- [Environmental Variables and Entrypoint](#environmental-variables-and-entrypoint)
- [Build Instructions](#build-instructions)
  - [Single-Node Version](#single-node-version)
- [Run Container](#run-container)


# Introduction

This is the Docker image for [Simple Server Clojure](https://github.com/karimarttila/clojure/tree/master/clj-ring-cljs-reagent-demo/simple-server) version. I just wanted to demonstrate how to create a Docker image for the Simple Server. The Docker image uses [karimarttila/alpine3.8-java8](https://github.com/karimarttila/docker/tree/master/base-images/alpine-java8) base image.



# Environmental Variables and Entrypoint

The base image has set MY_LIB_DIR environmental variable which points to a directory that this image uses to copy the binaries, libraries, properties files and other files it needs.

This image provides the my-entrypoint.sh shell script which starts the server.


# Build Instructions

NOTE: 

- Remember to build the version you want to use in the Docker image (e.g. single-node, aws dynamodb or azure table storage version.
- Leiningen creates two jars: use the standalone version which comprises Clojure runtime.

## Single-Node Version

Run: ```./build-docker-image-single-node.sh <base-tag> <my-tag> <jar-file> <resources-dir>```

E.g. in my machine I run:

```bash
./build-docker-image-single-node.sh 0.1 0.1 /mnt/edata/aw/kari/github/clojure/clj-ring-cljs-reagent-demo/simple-server/target/uberjar/simple-server-1.0-standalone.jar /mnt/edata/aw/kari/github/clojure/clj-ring-cljs-reagent-demo/simple-server/resources
```


# Run Container

Run: ```./run-container.sh <my-tag>```

E.g. 

```bash
./run-container.sh 0.1
```

The container starts the server and forwards its internal port 3045 to host port 3045 so that you can use the same curl test files in Clojure Simple Server [scripts](https://github.com/karimarttila/clojure/tree/master/clj-ring-cljs-reagent-demo/simple-server/scripts) directory that you could use to test the standalone server running directly on the host machine.

NOTE: You might find also these commands useful:

```bash
# If you have problems starting the container, get a shell session to the container and check it inside:
docker run -it --entrypoint /bin/sh karimarttila/simple-server-clojure-single-node:0.1
# You can get a terminal to a running container, use commands:
docker ps -a => check the container name
docker exec -it <container-name> sh
# Stop and delete all containers when you are done:
docker stop  ; docker rm 
```
