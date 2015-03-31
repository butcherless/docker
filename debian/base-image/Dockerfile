FROM debian:jessie

# sudo docker build -t debian/base .

#RUN echo "root:admin" | chpasswd

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl git htop less lynx openssh-server openssh-client vim wget zip
RUN service ssh start
