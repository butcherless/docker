# build:  docker build -t alpine-jre8-boot .
# verify: docker run -ti --rm -p 8080:8080 alpine-jre8-boot

FROM alpine-jre8

# git clone https://github.com/spring-guides/gs-spring-boot.git

COPY gs-spring-boot-0.1.0.jar /boot-app.jar
EXPOSE 8080/tcp
ENTRYPOINT ["java", "-jar", "/boot-app.jar"]
