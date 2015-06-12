FROM ubuntu/java8

# sudo docker build -t ubuntu/nexus .

# Nexus
RUN wget --progress=dot:giga --no-check-certificate \
    http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
RUN mkdir /opt/nexus /home/nexus
RUN tar zxvf nexus-latest-bundle.tar.gz -C /opt/nexus
RUN rm -rf nexus-latest-bundle.tar.gz 
COPY nexus /etc/init.d/nexus
RUN useradd --base-dir /home/nexus --user-group --home-dir /home/nexus nexus
RUN chown -R nexus:nexus /opt/nexus /home/nexus

CMD service nexus start && tail -f /dev/null
#USER nexus
