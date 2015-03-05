FROM debian/java8:latest


# Jetty installation

RUN wget --progress=dot:mega wget http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.2.9.v20150224.tar.gz
# COPY jetty-distribution-9.2.9.v20150224.tar.gz /jetty-distribution-9.2.9.v20150224.tar.gz

RUN mkdir -p /opt/jetty
RUN mkdir -p /opt/web/basedir
RUN mkdir -p /opt/jetty/temp
RUN tar zxvf jetty-distribution-9.2.9.v20150224.tar.gz -C /opt/jetty
RUN mv /opt/jetty/jetty-distribution-9.2.9.v20150224 /opt/jetty/jetty9
RUN rm -f jetty-distribution-9.2.9.v20150224.tar.gz

RUN useradd --user-group --shell /bin/false --home-dir /opt/jetty/temp jetty

# Test context: http://localhost:8080/test
RUN mkdir -p /opt/web/basedir/webapps/test
COPY index.html /opt/web/basedir/webapps/test/index.html

WORKDIR /opt/web/basedir
RUN java -jar /opt/jetty/jetty9/start.jar\
    --add-to-start=deploy,http,https,logging


RUN cp /opt/jetty/jetty9/bin/jetty.sh /etc/init.d/jetty
RUN echo "JETTY_HOME=/opt/jetty/jetty9" > /etc/default/jetty
RUN echo "JETTY_BASE=/opt/web/basedir" >> /etc/default/jetty
RUN echo "TMPDIR=/opt/jetty/temp" >> /etc/default/jetty

RUN chown --recursive jetty:jetty /opt/jetty
RUN chown --recursive jetty:jetty /opt/web/basedir

EXPOSE 22
EXPOSE 8080

#CMD ["service", "jetty", "start"]