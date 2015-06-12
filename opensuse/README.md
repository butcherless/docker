<p>- Create a base image from <b>opensuse</b> latest version. This image contains OS updates and commands required for the project needs.</p>
<ul>

<li>Change to image base dir:
<code>cd $GIT_PROJECT_HOME/opensuse/base-image</code>

<li>Image Dockerfile:
<code>https://github.com/butcherless/docker/blob/master/opensuse/base-image/Dockerfile</code>

<li>Build image:
<code>sudo docker build -t opensuse/base .</code>

<li>Verify image:
<code>sudo docker images</code>

<li>Run test container:
<code>sudo docker run --rm opensuse/base cat /etc/os-release</code>

</ul>
<br/>


<p>- Create a <b>Jenkins/Tomcat/Java SE 7</b> image from previous opensuse base image.</p>
<ul>

<li>Change to image base dir:
<code>cd $GIT_PROJECT_HOME/opensuse/jenkins</code>

<li>Image Dockerfile:
<code>https://github.com/butcherless/docker/blob/master/opensuse/jenkins/Dockerfile</code>

<li>Build image:
<code>sudo docker build -t opensuse/jenkins .</code>

<li>Verify image:
<code>sudo docker images</code>

<li>Run test container:
<code>sudo docker run --rm opensuse/jenkins cat /etc/os-release</code>

</ul>
<br/>


<p>- Create a base image for data only containers.</p>
<ul>

<li>Change to image base dir:
<code>cd $GIT_PROJECT_HOME/data-container/jenkins-opensuse-doc</code>

<li>Image Dockerfile:
<code>https://github.com/butcherless/docker/blob/master/data-container/jenkins-opensuse-doc/Dockerfile</code>

<li>Build image:
<code>sudo docker build -t opensuse/data-only .</code>

<li>Verify image:
<code>sudo docker images</code>

</ul>
<br/>


<p>- Create a <b>data only container</b> image from previous opensuse base image.</p>
<ul>

<li>Run the container and create the <b>Volume</b>:
<code>sudo docker run -v /var/jenkins --name jenkins-data-only opensuse/data-only echo "jenkins data only container"</code>

<li>Verify the container:
<code>sudo docker ps -a</code>

</ul>
<br/>


<p>- Run the Jenkins container using the previous <b>data only container</b> volume.</p>
<ul>

<li>Run the container in interactive mode within the previous volume
<code>sudo docker run --volumes-from jenkins-data-only --rm -p 8080:8080 -it opensuse/jenkins /bin/bash</code>

<li>Run the container in background mode within the previous volume
<code>sudo docker run -d --volumes-from jenkins-data-only --name jenkins-server -p 8080:8080 opensuse/jenkins</code>

</ul>
