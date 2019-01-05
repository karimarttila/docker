#!/bin/bash

docker start ss-sonarqube
sleep 2
echo "Open browser in http://localhost:9012 (give SonarQube some 10 seconds to start...)"
echo "Credentials: admin/admin"
echo "See more instructions in: https://hub.docker.com/_/sonarqube/"


