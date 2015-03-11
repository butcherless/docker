<h1>Data only containers</h1>

<h2>Instructions:</h2>

<ul>
  <li>create a data only container [<i>m2_repo</i>] mounting a volume [<i>/volumes/m2_repo</i>] within an image [<i>debian:jessie</i>]
    <ul>
      <li><code>sudo docker run -v /volumes/m2_repo --name m2_repo debian:jessie</code>
    </ul>
  <li>create a container mounting volume from a data only container [<i>m2_repo</i>]
    <ul>
      <li><code>sudo docker run --volumes-from m2_repo debian:jessie /bin/bash -c "ls -l /volumes/"</code>
    </ul>
</ul>
