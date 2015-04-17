FROM ubuntu:14.04.2

RUN useradd jenkins

RUN mkdir /jenkins-home
RUN chown -R jenkins:jenkins /jenkins-home
VOLUME /jenkins-home

USER jenkins

CMD ls -l /jenkins-home && \
    date >> /jenkins-home/date.log && \
    cat /jenkins-home/date.log