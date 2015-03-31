FROM debian:jessie

# sudo docker build -t debian/java8 .

RUN echo "root:admin" | chpasswd

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl git htop less lynx openssh-server openssh-client vim wget zip
RUN service ssh start


# Java 8 installation
 
RUN wget --no-check-certificate --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    --progress=bar:force:noscroll \
    http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.tar.gz
RUN mkdir -p /usr/lib/jvm
RUN tar zxvf jdk-8u40-linux-x64.tar.gz -C /usr/lib/jvm
RUN rm -f jdk-8u40-linux-x64.tar.gz
RUN ln -sf /usr/lib/jvm/jdk1.8.0_40/jre/bin/java /usr/bin/java
ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_40


# Apache Maven 3.3.1
RUN wget --progress=bar:force:noscroll \ 
 http://www.eu.apache.org/dist/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz
RUN mkdir -p /usr/share/maven3
RUN tar zxvf apache-maven-3.3.1-bin.tar.gz -C /usr/share/maven3
RUN rm -f apache-maven-3.3.1-bin.tar.gz
RUN ln -sf /usr/share/maven3/apache-maven-3.3.1/bin/mvn /usr/bin/mvn
ENV M2_HOME /usr/share/maven3/apache-maven-3.3.1


# Gradle installation

RUN wget --progress=bar:force \
    https://services.gradle.org/distributions/gradle-2.3-all.zip
RUN mkdir -p /usr/share/gradle
RUN unzip gradle-2.3-all.zip -d /usr/share/gradle
RUN rm -f gradle-2.3-all.zip
RUN ln -sf /usr/share/gradle/gradle-2.3/bin/gradle /usr/bin/gradle
ENV GRADLE_HOME /usr/share/gradle/gradle-2.3
