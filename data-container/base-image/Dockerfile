FROM ubuntu:14.04.2 

# OpenJdk installation

RUN apt-get update \
    && apt-get install openjdk-7-jdk wget -y
RUN mkdir -p /volume/maven \
    && touch /volume/maven/java.txt 
RUN JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64


# Maven installation

RUN wget --progress=dot:mega \
    http://www.eu.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
RUN mkdir -p /usr/share/maven3
RUN tar zxvf apache-maven-3.2.5-bin.tar.gz -C /usr/share/maven3
RUN rm -f apache-maven-3.2.5-bin.tar.gz
RUN ln -sf /usr/share/maven3/apache-maven-3.2.5/bin/mvn /usr/bin/mvn

CMD ls -lh /volume/maven
