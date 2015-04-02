FROM ubuntu:14.04.2

# sudo docker build -t ubuntu/base .

RUN echo "root:admin" | chpasswd

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl git htop less lynx openssh-server openssh-client vim wget zip
