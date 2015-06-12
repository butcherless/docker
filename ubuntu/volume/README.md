Instructions:
<br/>
- create image from: this <a href="Dockerfile">Dockerfile</a>
<br/>
- build image: <code>sudo docker build -t mydata .</code>
<br/>
- run container: <code>sudo docker run --rm --name mydata -h jenkinserver -v \`pwd`:/jenkins-home mydata</code>
<br/>
- check results in the working dir: <code>ls -l</code>
