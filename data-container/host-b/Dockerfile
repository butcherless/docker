FROM ubuntu_java 

RUN mkdir -p /home/user-b
RUN useradd user-b --home-dir /home/user-b -d /home/user-b -b /home/user-b
COPY create-maven-project.sh /home/user-b/create-maven-project.sh 
COPY settings.xml /usr/share/maven3/apache-maven-3.2.5/conf/settings.xml
RUN chown -R user-b:user-b /home/user-b

ENV HOME /home/user-b
USER user-b

CMD date >> /volume/maven/java.txt \
    && id >> /volume/maven/java.txt \
    && ls -lh /volume/maven \
    && cat /volume/maven/java.txt
