#!/bin/bash

# tested on ubuntu 22.04 (LTS)

# Install Docker

# 1.Update Ubuntu Systems
sudo apt-get update

# 2. Install packages
sudo apt-get install -y\
    apt-transport-https \
    ca-certificates\
    curl\
    gnupg-agent\
    software-properties-common
    
# 3. Add Docker License GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 4. Docker의 공식 apt 저장소를 추가 Add docker License apt repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 5. Update system package
sudo apt-get update
sudo apt-get install net-tools

# 6. Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose docker-compose-plugin

# 7. Start Docker
systemctl enable docker
systemctl start docker
#systemctl status docker

# Start Jenkins with Docker

# Make jenkins folder
mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home/

# Mapping Container and Host 
docker run --restart=on-failure --user='root' -p 9000:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -d --name jenkins jenkins/jenkins:lts

# Show endpoint
echo 'Jenkins installed'
echo 'access jenkins at: http://'$(curl -4 -s ifconfig.co)':9000'
