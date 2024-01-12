#!/bin/bash

# jenkins 컨테이너 root 패스워드 뭐지??

sudo docker exec --user='root' -it jenkins apt-get update
sudo docker exec --user='root' -it jenkins apt-get install openjdk-17-jdk -y

sudo docker exec --user='root' -it jenkins apt-get -y install apt-transport-https \
         ca-certificates \
         curl \
         gnupg-agent \
         software-properties-common && \
sudo docker exec --user='root' -it jenkins curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo docker exec --user='root' -it jenkins apt-get update && \
apt-get install docker-ce-cli -y

sudo docker exec -it jenkins bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
echo $JAVA_HOME
