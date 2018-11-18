# Simple Server Clojure Docker Image <!-- omit in toc -->


## Table of Contents  <!-- omit in toc -->
- [Introduction](#introduction)
- [Layers](#layers)
- [Environmental Variables and Entrypoint](#environmental-variables-and-entrypoint)
- [Build Instructions](#build-instructions)
- [Run Container](#run-container)


## Introduction

This is the Docker image for [Simple Server Clojure](TODO) version. I just wanted to demonstrate how to create a Docker image for the Simple Server. The Docker image uses [karimarttila/alpine3.8](TODO) base image.


## Layers

This image uses the following base images:

- [karimarttila/alpine 3.8](TODO) - The base image, which is based on [Alpine Linux](https://alpinelinux.org/).

This image adds the following layers:

- [OpenJDK Java 8 JRE](http://openjdk.java.net/) - Installed into this image.


## Environmental Variables and Entrypoint

The base image has set MY_LIB_DIR environmental variable which points to a directory that can be used by the derived images to copy the binaries, libraries, properties files and other files they need.

This image provides the my-entrypoint.sh shell script which starts the server.


## Build Instructions

Run: ```./build-docker-image.sh <base-tag> <my-tag> <jar-file> <resources-dir>```

E.g. in my machine I run:

```bash
./build-docker-image.sh 0.1 0.1 /mnt/edata/aw/kari/github/clojure/clj-ring-cljs-reagent-demo/simple-server/target/uberjar/simple-server-1.0-standalone.jar /mnt/edata/aw/kari/github/clojure/clj-ring-cljs-reagent-demo/simple-server/resources
```


## Run Container

Run: ```./run-container.sh <my-tag>```

E.g. 

```bash
./run-container.sh 0.1
```

NOTE: You can also use these commands:

```bash
# If you have problems starting the container, get a shell session to the container and check it inside:
docker run -it --entrypoint /bin/sh karimarttila/simple-server-clojure:0.1
# You can get a terminal to a running container, use commands:
docker ps -a => check the container name
docker exec -it <container-name> sh
# Stop and delete all containers when you are done:
docker stop  ; docker rm 
```
