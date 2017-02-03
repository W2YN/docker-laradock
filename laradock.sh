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
docker-compose build workspace & docker-compose build nginx & docker-compose up -d nginx
#php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
#php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#php composer-setup.php
#php -r "unlink('composer-setup.php');" 