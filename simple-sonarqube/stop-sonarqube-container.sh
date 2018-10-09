#!/bin/bash

docker stop $(docker ps -a -q  --filter ancestor=ss/sonarqube:1.0)
