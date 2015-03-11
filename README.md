<h1>Self training with Docker virtualization</h1>

<h2>Instructions:</h2>

<ul>
  <li> download and check debian:jessie image
    <ul>
      <li><code>sudo docker run debian:jessie cat /etc/os-release</code>
    </ul>
    <li> download or create <b>Dockerfile</b> debian:jessie + java:8 + maven:3.2.5 + gradle:2.3
    <ul>
      <li>https://github.com/butcherless/docker/blob/master/debian-java8/Dockerfile
    </ul>
    <li> build an image with debian:jessie + java:8 + maven:3.2.5 + gradle:2.3
    <ul>
      <li><code>sudo docker build -t debian/java8 .</code>
      <li><code>sudo docker run debian/java8 /bin/bash -c "java -version; mvn -v; gradle -v"</code>
    </ul>
  
</ul>
