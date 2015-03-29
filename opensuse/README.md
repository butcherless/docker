Create a base image from <b>opensuse</b> latest version. This image contains OS updates and commands required for the project needs.

Change to base dir:
<code>cd $GIT_PROJECT_HOME/opensuse/base-image</code>

Image Dockerfile:
<code>https://github.com/butcherless/docker/blob/master/opensuse/base-image/Dockerfile</code>

Build image:
<code>sudo docker build -t opensuse/base .</code>

Verify image:
<code>sudo docker images</code>

Run test container:
<code>sudo docker run --rm opensuse/base cat /etc/os-release</code>
