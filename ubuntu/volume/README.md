<p>Instructions:</p>
<br/>
- create image from: <code>https://github.com/butcherless/docker/blob/master/ubuntu/volume/Dockerfile</code>
<br/>
- build image: <code>sudo docker build -t mydata .</code>
<br/>
- run container: <code>sudo docker run --rm --name mydata -h jenkinserver -v `pwd`:/jenkins-home mydata</code>
