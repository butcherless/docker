FROM opensuse/base

# sudo docker build -t opensuse/nexus .

# Java SE 7
RUN wget --no-check-certificate --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    --progress=bar:force:noscroll \
    http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-linux-x64.tar.gz
RUN mkdir -p /opt/oracle
RUN tar zxvf jdk-7u75-linux-x64.tar.gz -C /opt/oracle
RUN rm -f jdk-7u75-linux-x64.tar.gz
RUN ln -sf /opt/oracle/jdk1.7.0_75/jre/bin/java /usr/bin/java
ENV JAVA_HOME /opt/oracle/jdk1.7.0_75


# Nexus
RUN wget --progress=bar:force:noscroll --no-check-certificate \
    http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
RUN mkdir /opt/nexus /home/nexus
RUN tar zxvf nexus-latest-bundle.tar.gz -C /opt/nexus
RUN rm -rf nexus-latest-bundle.tar.gz 
COPY nexus /etc/init.d/nexus
RUN useradd --base-dir /home/nexus --user-group --home-dir /home/nexus nexus
RUN chown -R nexus:nexus /opt/nexus /home/nexus

CMD service nexus start && tail -f /dev/null
#USER nexus
