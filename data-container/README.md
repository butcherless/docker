<h1>Data only containers</h1>

<h2>Instructions:</h2>

<ul>
  <li> download ubuntu image
    <ul>
      <li><code>sudo docker run ubuntu cat /etc/os-release</code>
    </ul>
  <li> create base image from ubuntu
    <ul>
      <li>https://github.com/butcherless/docker/blob/master/data-container/base-image/Dockerfile</li>
      <li><code>sudo docker build -t ubuntu_java .</code>
      <li><code>sudo docker run ubuntu_java id</code>
    </ul>
  <li>create a data only container [<i>maven_data</i>] mounting a volume [<i>/volume/maven</i>] within an image [<i>ubuntu_java</i>]
    <ul>
      <li><code>sudo docker run --name maven_data -v /volume/maven ubuntu_java true</code>
      <li><code>sudo docker ps -a | grep maven</code>
    </ul>
  <li>create a container mounting volume from a data only container [<i>maven_data</i>]
    <ul>
      <li><code>sudo docker run --rm --volumes-from maven_data ubuntu_java /bin/bash -c "ls -l /volume/maven</code>"
    </ul>
</ul>
