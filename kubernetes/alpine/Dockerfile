# build: docker build -t alpine-jre8 .
# verify: docker run --rm alpine-jre8 java -version

FROM alpine

#sudo apt-get install oracle-java8-installer
RUN apk update
RUN apk add openjdk8-jre
