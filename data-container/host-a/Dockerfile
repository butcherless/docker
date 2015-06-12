FROM ubuntu_java 

RUN mkdir -p /home/user-a
RUN useradd user-a --home-dir /home/user-a -d /home/user-a -b /home/user-a
COPY create-maven-project.sh /home/user-a/create-maven-project.sh 
COPY settings.xml /usr/share/maven3/apache-maven-3.2.5/conf/settings.xml
RUN chown -R user-a:user-a /home/user-a

ENV HOME /home/user-a
USER user-a

CMD date >> /volume/maven/java.txt \
    && id >> /volume/maven/java.txt \
    && ls -lh /volume/maven \
    && cat /volume/maven/java.txt
