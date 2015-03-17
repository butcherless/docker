<h1>Data only containers</h1>

<h2>Instructions:</h2>

<ul>
  <li> download busybox image
    <ul>
      <li><code>sudo docker run --rm busybox cat /etc/os-release</code>
    </ul>
  <li>create a data only container [<i>maven_repo</i>] mounting a volume [<i>/volume/maven-repo</i>] within an image [<i>busybox</i>]
    <ul>
      <li><code>sudo docker run --name maven_repo -v /volume/maven-repo busybox true</code>
      <li><code>sudo docker ps -a | grep maven_repo</code>
    </ul>
  <li>create a container mounting volume from a data only container [<i>maven_repo</i>]
    <ul>
      <li><code>sudo docker run --rm --volumes-from maven_repo debian /bin/bash -c "ls -la /volume/maven-repo</code>"
    </ul>
</ul>
