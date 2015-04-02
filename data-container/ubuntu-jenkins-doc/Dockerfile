FROM ubuntu:14.04.2 

# sudo docker build -t ubuntu/data-only .

RUN apt-get update -y
RUN apt-get upgrade -y

RUN useradd --user-group jenkins
RUN mkdir -p /var/jenkins
RUN chown -R jenkins:jenkins /var/jenkins
