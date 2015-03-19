FROM debian/java8:latest

RUN useradd --user-group --shell /bin/bash --base-dir /home/sprint --home-dir /home/sprint sprint

USER sprint
ENV HOME /home/sprint
COPY start-integration.sh /usr/local/bin/start-integration.sh

ENTRYPOINT ["/usr/local/bin/start-integration.sh"]
