#!/bin/bash

PRESS_ENTER_MSG="press enter key to continue"

pause() {
	echo
	read -p "`echo $@`"
}

clear

# rm -rf /tmp/docker-tutorial
# mkdir /tmp/docker-tutorial
# cd /tmp/docker-tutorial

echo -e "cloning git repo..."
# git clone https://github.com/butcherless/docker
# cd docker

cd ubuntu/base-image
echo -e "\ncurrent dir: `pwd`"
pause ${PRESS_ENTER_MSG}

echo -e "\nlisting ubuntu images..."
sleep 1

sudo docker images | grep ubuntu
pause ${PRESS_ENTER_MSG}


# sudo docker rmi ubuntu/base

echo -e "\nbuilding ubuntu base image..."

sudo docker build -t ubuntu/base .
ssh-keygen -qf "/home/cmartin/.ssh/known_hosts" -R [localhost]:2222
sudo docker run -d -p 2222:22 --name mysshd -h ssh-server ubuntu/base
sudo docker ps -a
sudo docker port mysshd 22
chmod 400 mykey
sudo docker exec mysshd hostname

pause "after press enter you can type some commands and finally, press CTRL+D o type exit"
ssh -i mykey root@localhost -p 2222 -oStrictHostKeyChecking=no

echo -e "\nstopping container 'mysshd'..."
sudo docker stop mysshd
echo -e "\nremoving container 'mysshd'..."
sudo docker rm mysshd

pause "end base image step!"

# Java 8 image
clear

echo -e "\nbuilding ubuntu java 8 image..."

cd ../java8
echo -e "\ncurrent dir: `pwd`"
pause ${PRESS_ENTER_MSG}

echo -e "\nbuilding ubuntu java 8 image..."
sleep 1

sudo docker build -t ubuntu/java8 .

echo -e "\nchecking java se installation..."
sleep 1
sudo docker run --rm ubuntu/java8 java -version

echo -e "\nchecking maven installation..."
sleep 1
sudo docker run --rm ubuntu/java8 mvn -v

echo -e "\nchecking gradle installation..."
sleep 1
sudo docker run --rm ubuntu/java8 gradle -v

pause "end java 8 image step!"

# Java 8 image
clear

echo -e "\nbuilding ubuntu jenkins image..."


cd ../jenkins
sudo docker build -t ubuntu/jenkins .
