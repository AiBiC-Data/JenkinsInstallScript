#!/bin/bash

# tested on ubuntu 22.04 (LTS) by kwonho

# 도커 설치

# 1. 우분투 시스템 패키지 업데이트
sudo apt-get update
# 2. 필요한 패키지 설치
sudo apt-get install -y\
    apt-transport-https \
    ca-certificates\
    curl\
    gnupg-agent\
    software-properties-common
# 3. Docker의 공식 GPG키를 추가
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# 4. Docker의 공식 apt 저장소를 추가
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# 5. 시스템 패키지 업데이트
sudo apt-get update
sudo apt-get install net-tools
# 6. Docker 설치
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
# 7. Docker가 설치 확인
systemctl enable docker
systemctl start docker
#sudo systemctl status docker

# 도커에 젠킨스 올리기

# 젠킨스 저장소 설치
mkdir -p /var/jenkins_home
#  권한 설정
chown -R 1000:1000 /var/jenkins_home/
# 호스트9000:컨테이너8080 매핑/ 포트50000을 통신위해 매핑
docker run --restart=on-failure -p 9000:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins jenkins/jenkins:lts

# show endpoint
echo 'Jenkins installed'
echo 'access jenkins at: http://'$(curl -4 -s ifconfig.co)':9000'
