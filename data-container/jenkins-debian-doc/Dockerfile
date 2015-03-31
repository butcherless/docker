FROM debian:latest 

# sudo docker build -t debian/data-only .

RUN useradd --user-group jenkins
RUN mkdir -p /var/jenkins
RUN chown -R jenkins:jenkins /var/jenkins
