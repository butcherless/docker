<h1>Data only containers</h1>

https://hackernoon.com/docker-data-containers-cb250048d162

<h2>Instructions:</h2>

<ul>
  <li>download <i>debian:jessie</i> image as base image
    <ul>
      <li><code>sudo docker run --rm debian:jessie cat /etc/os-release</code>
    </ul>
  <li>create a new image containing a service user [<i>jenkins</i>, <i>nexus</i>, <i>jetty</i>, etc.] from base image
    <ul>https://github.com/butcherless/docker/blob/master/data-container/jenkins-data/Dockerfile</ul>
  <li>change to Dockerfile directory
    <ul><code>sudo docker build -t jenkins/data .</code></ul>
  <li>verify image creation
  <ul><code>sudo docker images | grep jenkins/data</code></ul>
  <li>create a data only container [<i>jenkins_data</i>] mounting a volume [<i>/home/jenkins</i>] within an image [<i>jenkins/data</i>]
    <ul><code>sudo docker run --name jenkins_data -v /home/jenkins jenkins/data true</code></ul>
  <li>verify container creation
      <ul><code>sudo docker ps -a | grep jenkins_data</code></ul>

  <li>run a container mounting volume from a data only container [<i>maven_repo</i>]
    <ul>
      <li><code>sudo docker run --rm --volumes-from jenkins_data debian:jessie /bin/bash -c "ls -la /home</code>"
    </ul>
</ul>
