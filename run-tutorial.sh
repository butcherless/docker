#!/bin/bash

PRESS_ENTER_MSG="press enter key to continue"

pause() {
	echo
	read -p "`echo $@`"
}

clear
echo -e "checking docker version...\n"
sudo docker version
pause ${PRESS_ENTER_MSG}


clear
cd ubuntu/base-image
echo -e "current dir: `pwd`"
echo -e "\nlisting ubuntu images...\n"
sudo docker images | grep ubuntu
pause ${PRESS_ENTER_MSG}


# sudo docker rmi ubuntu/base
clear
echo -e "building ubuntu base image...\n"
sudo docker build -t ubuntu/base .
pause "ubuntu base image built, ${PRESS_ENTER_MSG}"

clear
echo -e "login into ubuntu base container via ssh client...\n"
ssh-keygen -qf "/home/cmartin/.ssh/known_hosts" -R [localhost]:2222
sudo docker run -d -p 2222:22 --name mysshd -h ssh-server ubuntu/base
sudo docker ps -a
sudo docker port mysshd 22
chmod 400 mykey
sudo docker exec mysshd hostname
pause "after press the enter key, you can type some commands (hostname, id, df -h). Finally, press CTRL+D o type exit"

clear
ssh -i mykey root@localhost -p 2222 -oStrictHostKeyChecking=no

echo -e "\nstopping container 'mysshd'..."
sudo docker stop mysshd
echo -e "\nremoving container 'mysshd'..."
sudo docker rm mysshd

pause "end base image step! ${PRESS_ENTER_MSG}"


# Java 8 image
clear

cd ../java8
echo -e "current dir: `pwd`"
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

pause "end java 8 image step! ${PRESS_ENTER_MSG}"


# Jenkins image
clear

cd ../jenkins
echo -e "current dir: `pwd`"
pause ${PRESS_ENTER_MSG}

echo -e "\nbuilding ubuntu jenkins image..."
sleep 1
sudo docker build -t ubuntu/jenkins .

echo -e "\nchecking jenkins image..."
sleep 1
sudo docker images | grep jenkins
pause ${PRESS_ENTER_MSG}

echo -e "\nstarting jenkins container..."
sleep 1
sudo docker run -d --name jenkins -p 8090:8080 ubuntu/jenkins
pause ${PRESS_ENTER_MSG}

echo -e "\nchecking jenkins container..."
sleep 1
sudo docker ps -a
pause ${PRESS_ENTER_MSG}

echo -e "go to tomcat homepage: http://localhost:8090"
pause ${PRESS_ENTER_MSG}

echo -e "go to jenkins hombepage: http://localhost:8090/jenkins"
pause ${PRESS_ENTER_MSG}

echo -e "\nstopping container 'jenkins'..."
sudo docker stop jenkins
echo -e "\nremoving container 'jenkins'..."
sudo docker rm jenkins
pause ${PRESS_ENTER_MSG}

echo -e "\nchecking containers..."
sleep 1
sudo docker ps -a
pause ${PRESS_ENTER_MSG}



# Nexus image
clear

cd ../nexus
echo -e "current dir: `pwd`"
pause ${PRESS_ENTER_MSG}

echo -e "\nbuilding ubuntu nexus image..."
sleep 1
sudo docker build -t ubuntu/nexus .

echo -e "\nchecking nexus image..."
sleep 1
sudo docker images | grep nexus
pause ${PRESS_ENTER_MSG}

echo -e "\nstarting nexus container..."
sleep 1
sudo docker run -d --name nexus -p 8091:8081 ubuntu/nexus
pause ${PRESS_ENTER_MSG}

echo -e "\nchecking nexus container..."
sleep 1
sudo docker ps -a
pause ${PRESS_ENTER_MSG}

echo -e "go to nexus homepage: http://localhost:8091/nexus (this may take a few seconds)"
pause ${PRESS_ENTER_MSG}

echo -e "\nstopping container 'nexus'..."
sudo docker stop nexus
echo -e "\nremoving container 'nexus'..."
sudo docker rm nexus
pause ${PRESS_ENTER_MSG}

echo -e "\nchecking containers..."
sleep 1
sudo docker ps -a
pause ${PRESS_ENTER_MSG}
