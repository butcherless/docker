FROM debian/jenkins

# sudo docker build -t debian/jenkins .


# Jenkins
RUN wget --progress=bar:force:noscroll \
 http://mirrors.jenkins-ci.org/war/latest/jenkins.war


# Tomcat 7
RUN wget --progress=bar:force:noscroll \
 http://www.eu.apache.org/dist/tomcat/tomcat-7/v7.0.59/bin/apache-tomcat-7.0.59.tar.gz
RUN mkdir /usr/share/tomcat7 /home/jenkins /var/jenkins
RUN tar zxvf apache-tomcat-7.0.59.tar.gz -C /usr/share/tomcat7
COPY jenkins /etc/init.d/jenkins
COPY tomcat-users.xml /usr/share/tomcat7/apache-tomcat-7.0.59/conf/tomcat-users.xml
COPY server.xml /usr/share/tomcat7/apache-tomcat-7.0.59/conf/server.xml
RUN rm -rf apache-tomcat-7.0.59.tar.gz
RUN mv jenkins.war /usr/share/tomcat7/apache-tomcat-7.0.59/webapps
RUN useradd --base-dir /home/jenkins --user-group --home-dir /home/jenkins jenkins
RUN chown -R jenkins:jenkins /usr/share/tomcat7 /home/jenkins /var/jenkins
ENV JENKINS_HOME /var/jenkins

CMD service jenkins start && tail -f /dev/null
