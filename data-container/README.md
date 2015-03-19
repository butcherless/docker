<h1>Data only containers</h1>

<h2>Instructions:</h2>

<ul>
  <li>download debian:jessie image
    <ul>
      <li><code>sudo docker run --rm debian:jessie cat /etc/os-release</code>
    </ul>
  <li>sudo docker build -t jenkins/data .
  <li>sudo docker ps -a | grep jenkins_data
  <li>create a data only container [<i>jenkins_data</i>] mounting a volume [<i>/volume/maven-repo</i>] within an image [<i>debian:jessie</i>]
    <ul>
      <li><code>sudo docker run --name jenkins_data -v /home/jenkins jenkins/data true</code>
      <li><code>sudo docker ps -a | grep jenkins_data</code>
    </ul>
  <li>create a container mounting volume from a data only container [<i>maven_repo</i>]
    <ul>
      <li><code>sudo docker run --rm --volumes-from jenkins_data debian/java8 /bin/bash -c "ls -la /home"</code>"
    </ul>
</ul>
