#!/bin/bash

PRESS_ENTER_MSG="press enter key to continue"

pause() {
	echo
	read -p "`echo $@`"
}

clear

# rm -rf /tmp/docker-tutorial
# mkdir /tmp/docker-tutorial
cd /tmp/docker-tutorial

echo -e "cloning git repo"
# git clone https://github.com/butcherless/docker

exit 1

cd docker/ubuntu/base-image
echo -e "\ncurrent dir: `pwd`"
pause ${PRESS_ENTER_MSG}

echo -e "\nlisting ubuntu images..."
sleep 2

sudo docker images | grep ubuntu
pause ${PRESS_ENTER_MSG}


# sudo docker rmi ubuntu/base

echo -e "\nbuilding ubuntu base image..."
sleep 2

sudo docker build -t ubuntu/base .
ssh-keygen -f "/home/cmartin/.ssh/known_hosts" -R [localhost]:2222
sudo docker run -d -p 2222:22 --name mysshd -h ssh-server ubuntu/base
sudo docker ps -a
sudo docker port mysshd 22
chmod 400 mykey
sudo docker exec mysshd hostname

pause "after press enter you can type some commands and finally, press CTRL+D o type exit"
ssh -i mykey root@localhost -p 2222 -oStrictHostKeyChecking=no

echo -e "\nstopping and removing container 'mysshd'"
sudo docker stop mysshd
sudo docker rm mysshd

pause "end base image step!"

# Java 8 image
clear
cd ../java8
echo -e "\ncurrent dir: `pwd`"
pause ${PRESS_ENTER_MSG}

echo -e "\nbuilding ubuntu java8 image..."
sleep 2

sudo docker build -t ubuntu/java8 .

echo -e "\nchecking java se installation..."
sleep 2
sudo docker run --rm ubuntu/java8 java -version

echo -e "\nchecking maven installation..."
sleep 2
sudo docker run --rm ubuntu/java8 mvn -v

echo -e "\nchecking gradle installation..."
sleep 2
sudo docker run --rm ubuntu/java8 gradle -v

exit 1

cd ../jenkins
sudo docker build -t ubuntu/jenkins .



# docker aliases

alias dkrmdi='sudo docker rmi $(sudo docker images -qf dangling=true)'
alias dklsi='sudo docker images'
alias dklsc='sudo docker ps -a'
alias dkrmc='sudo docker rm'
alias dkrmcs='sudo docker rm $(dklsc -q)'
alias dkrc='sudo docker run --rm'
