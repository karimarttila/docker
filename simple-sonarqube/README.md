# Simple SonarQube  <!-- omit in toc -->


## Table of Contents  <!-- omit in toc -->
- [Introduction](#introduction)
- [SonarQube Tweaking Instructions](#sonarqube-tweaking-instructions)
- [Run SonarQube Analyses](#run-sonarqube-analyses)


## Introduction

Simple SonarQube is based on free SonarQube 7.1 version Docker image provided in the [Docker repository](https://hub.docker.com/_/sonarqube/). I tweaked it just a little bit to provide Java 10 support. Maybe in later SonarQube Docker image versions there is support for Java 10. The tweaking is very simple upgrade of SonarJava plugin and creating new image from the upgraded container.


## SonarQube Tweaking Instructions

You can install [SonarQube](https://www.sonarqube.org/) code quality server to analyze and visualize the code quality e.g. of a Java project. Using [Docker](https://www.docker.com/) this is pretty simple and keeps your precious workstation clean (no need to install database etc. workstation). See documentation in the [Docker repository](https://hub.docker.com/_/sonarqube/).

```bash
cd orig-sonarqube-scripts
docker pull sonarqube
docker network create -d bridge sonar
./start-sonarqube-container.sh
```

**Note.** At least in Ubuntu 18 Docker sometimes gets screwed when you have to switch VPN on/off. If this happens, try resetting docker network interfaces and delete the docker network you just created, and create it again.

Then open browser in http://localhost:9011 , login using admin/admin. Then Adminstration/Marketplace => Update SonarJava to 5.6 version (version 5.2 which comes with SonarQube 7.1 of that Docker version does not support Java 10).
Then SonarQube says: "SonarQube needs to be restarted in order to
update 1 plugins" => click "Restart".

Once you have updated and SonarQube is ready run:

```bash
./commit-docker.sh
```

Now you have committed the updated SonarQube version to a new image ss/sonarqube:1.0 (ss as Simple Server, i.e. not as Schutzstaffel). You can now stop and remove that container:

```bash
./stop-rm-sonarqube-container.sh
```

## Run SonarQube Analyses

Next move one directory up to the simple-sonarqube directory.

```bash
./boot-sonarqube-container.sh
```

Then open browser in http://localhost:9012 (**note port 9012** this time, and wait some 10 seconds to let SonarQube boot...). 

Now you can run analyses in your e.g. Java project using Gradle. First configure Gradle as explained in [build.gradle](https://github.com/karimarttila/java/blob/master/webstore-demo/simple-server/build.gradle):

```gradle
plugins {
  id "org.sonarqube" version "2.6.2"
}
```

And [gradle.properties](https://github.com/karimarttila/java/blob/master/webstore-demo/simple-server/gradle.properties):

```gradle
# SonarQube
systemProp.sonar.host.url=http://localhost:9012
systemProp.sonar.login=admin
systemProp.sonar.password=admin
systemProp.sonar.languages=java
systemProp.sonar.java.source=10
systemProp.sonar.java.target=10
```

Then you are ready to run the analyses.

Example script is here: [run-ss-container-sonarqube-analysis.sh](https://github.com/karimarttila/java/blob/master/webstore-demo/simple-server/run-ss-container-sonarqube-analysis.sh).

```bash
./run-ss-container-sonarqube-analysis.sh
```

Open browser in http://localhost:9012 and check your results.

NOTE. As the SonarQube UI says: "Embedded database should be used for evaluation purpose only. The embedded database will not scale, it will not support upgrading to newer versions of SonarQube, and there is no support for migrating your data out of it into a different database engine."

So, once you delete the container, your history is gone. Basically I configured this Docker based SonarQube just to make one time quality analysis for my project. Maybe I will install another Sonarqube Docker version which supports database in a Docker volume, so that the history is not gone with the container.

You can stop/start the container using scripts:

```bash
./stop-sonarqube-container.sh
./start-stopped-sonarqube-container.sh
```

You can get a bash to the container by:

```bash
exec-bash-in-sonarqube-container.sh
```

