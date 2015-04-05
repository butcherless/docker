FROM ubuntu/java8

# sudo docker build -t ubuntu/jenkins .


# Jenkins
RUN wget --progress=dot:giga \
    http://mirrors.jenkins-ci.org/war/latest/jenkins.war


# Tomcat 7
RUN wget --progress=dot:giga \
    http://www.eu.apache.org/dist/tomcat/tomcat-7/v7.0.59/bin/apache-tomcat-7.0.59.tar.gz
RUN mkdir /usr/share/tomcat7 /home/jenkins
RUN tar zxvf apache-tomcat-7.0.59.tar.gz -C /usr/share/tomcat7
RUN rm -rf apache-tomcat-7.0.59.tar.gz
RUN mv jenkins.war /usr/share/tomcat7/apache-tomcat-7.0.59/webapps
COPY tomcat-users.xml /usr/share/tomcat7/apache-tomcat-7.0.59/conf/tomcat-users.xml
COPY server.xml /usr/share/tomcat7/apache-tomcat-7.0.59/conf/server.xml
RUN useradd --base-dir /home/jenkins --user-group --home-dir /home/jenkins jenkins
RUN chown -R jenkins:jenkins /usr/share/tomcat7 /home/jenkins
ENV JENKINS_HOME /var/jenkins

COPY jenkins /etc/init.d/jenkins
RUN chmod 755 /etc/init.d/jenkins
RUN update-rc.d jenkins defaults

CMD service jenkins start && tail -f /dev/null
