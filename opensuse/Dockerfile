FROM opensuse:latest

RUN zypper  --no-gpg-checks --non-interactive in tar wget

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


# Apache Maven 3.3.1
RUN wget --progress=bar:force:noscroll \ 
 http://www.eu.apache.org/dist/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz
RUN mkdir -p /opt/maven3
RUN tar zxvf apache-maven-3.3.1-bin.tar.gz -C /opt/maven3
RUN rm -f apache-maven-3.3.1-bin.tar.gz
RUN ln -sf /opt/maven3/apache-maven-3.3.1/bin/mvn /usr/bin/mvn

# Jenkins
RUN wget --progress=bar:force:noscroll \
 http://mirrors.jenkins-ci.org/war/latest/jenkins.war


# Tomcat 7
RUN wget --progress=bar:force:noscroll \
 http://www.eu.apache.org/dist/tomcat/tomcat-7/v7.0.59/bin/apache-tomcat-7.0.59.tar.gz
RUN mkdir /opt/tomcat7 /home/jenkins
RUN tar zxvf apache-tomcat-7.0.59.tar.gz -C /opt/tomcat7
RUN rm -rf apache-tomcat-7.0.59.tar.gz
RUN cp jenkins.war /opt/tomcat7/apache-tomcat-7.0.59/webapps
RUN groupadd efxci
RUN useradd jenkins -g efxci
RUN chown -R jenkins:efxci /opt/tomcat7 /home/jenkins
