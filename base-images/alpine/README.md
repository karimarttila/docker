# Alpine 3.8 <!-- omit in toc -->


# Table of Contents  <!-- omit in toc -->
- [Introduction](#introduction)
- [Layers](#layers)
- [Build Instructions](#build-instructions)


# Introduction

I have created this Alpine 3.8 base image if I later want to create more Simple Server images so that they all could use the same base image.

This is a bare Alpine image and I have just installed Emacs and curl for debugging purposes.


# Layers

This image is based on:
- [alpine 3.8](https://hub.docker.com/_/alpine/) - The base image, which is based on [Alpine Linux](https://alpinelinux.org/).

This image installs the following packages:
- [emacs](https://www.gnu.org/software/emacs/)
- [curl](https://en.wikipedia.org/wiki/CURL)


# Build Instructions

Run: ```./build-docker-image.sh <my-tag>```

Example:

```bash
./build-docker-image.sh 0.1
```
