# Alpine 3.8 <!-- omit in toc -->


## Table of Contents  <!-- omit in toc -->
- [Introduction](#introduction)
- [Layers](#layers)
- [Environmental Variables and Entrypoint](#environmental-variables-and-entrypoint)
- [Build Instructions](#build-instructions)


## Introduction

I have created this Alpine 3.8 base image just if I wanted to create more Simple Server images (so that they all could use the same base image).

This is the bare Alpine and I have just installed Emacs and curl for debugging purposes inside the container.


## Layers

This image uses the following layers:
- [alpine 3.8](https://hub.docker.com/_/alpine/) - The base image, which is based on [Alpine Linux](https://alpinelinux.org/).
- [emacs](https://www.gnu.org/software/emacs/) - Installed into the image.
- [curl](https://en.wikipedia.org/wiki/CURL)


## Environmental Variables and Entrypoint

The image sets MY_LIB_DIR environmental variable which points to a directory in which derived images can copy the binaries, libraries and other stuff. Derived images should also provide my-entrypoint.sh shell script which starts the server.


## Build Instructions

Run: ```./build-docker-image.sh <my-tag>```

Example:

```bash
./build-docker-image.sh 0.1
```


