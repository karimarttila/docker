# Alpine 3.8 - Java11 <!-- omit in toc -->


# Table of Contents  <!-- omit in toc -->
- [Introduction](#introduction)
- [Why I'm Not Using Alpine?](#why-im-not-using-alpine)
- [Layers](#layers)
- [Environmental Variables and Entrypoint](#environmental-variables-and-entrypoint)
- [Build Instructions](#build-instructions)


# Introduction

I have created this debian-openjdk11 - base image if I later want to create more Java based Simple Server images so that they all could use the same base image.

This is a bare Debian+OpenJDK11 image with Emacs installed.

As of writing this [Simple Server Clojure Docker image](https://github.com/karimarttila/docker/tree/master/simple-server/clojure) uses this base image.

# Why I'm Not Using Alpine?

I tried to use Alpine first and install OpenJDK11 in Alpine - it turned out to be a bit difficult since Alpine uses different library (see: https://wiki.musl-libc.org/functional-differences-from-glibc.html) - you cannot install OpenJDK based on glibc in Alpine without handling this first. I thought that it is easier to use official OpenJDK11 Docker image instead.

# Layers

This image is based on:
- [openjdk:11](https://hub.docker.com/_/openjdk/).

This image installs the following packages:
- [emacs-nox](https://www.gnu.org/software/emacs/).


# Environmental Variables and Entrypoint

The image sets MY_LIB_DIR environmental variable which points to a directory in which derived images can copy the binaries, libraries and other files they need. Derived images should also provide my-entrypoint.sh shell script which starts the server.


# Build Instructions

Run: ```./build-docker-image.sh <base-tag> <my-tag>```

Example:

```bash
./build-docker-image.sh 0.1 0.1
```
