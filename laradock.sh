#!/bin/bash
sudo yum update -y
sudo yum install -y git
sudo yum install -y docker
sudo usermod -a -G docker ec2-user
sudo service docker start
curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose
sudo mv ./docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

git clone https://github.com/LaraDock/laradock.git
cp docker-compose.yml laradock/docker-compose.yml
cd laradock 
docker-compose build workspace
docker-compose build nginx
docker-compose up -d nginx
      