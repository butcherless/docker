<h1>Self training with Docker virtualization</h1>

<h2>Instructions:</h2>

<ul>
  <li> download debian:jessie image
    <ul>
      <li>cmd: <code>sudo docker run sudo docker run debian:jessie cat /etc/os-release</code>
    </ul>
    <li> download or create <b>Dockerfile</b> debian:jessie + java:8 + maven:3.2.5 + gradle:2.3
    <ul>
      <li>url: https://github.com/butcherless/docker/blob/master/debian-java8/Dockerfile
    </ul>
    <li> build image debian:jessie + java:8 + maven:3.2.5 + gradle:2.3
    <ul>
      <li>cmd: <code>sudo docker build -t debian/java8 .</code>
      <li>cmd: <code>sudo docker run debian/java8 /bin/bash -c "java -version; mvn -v; gradle -v"</code>
    </ul>
  
</ul>
