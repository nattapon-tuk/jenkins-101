#Remark: This Dockerfile is to run Jenkins Master server
#

#FROM jenkins/jenkins:2.414.2-jdk11
FROM jenkins/jenkins:2.440.3-jdk17

USER root

#to install docker cli
RUN apt-get update && apt-get install -y lsb-release python3-pip
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

#to install other libs
RUN apt-get install -y vim curl zip less


USER jenkins

#RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
#RUN jenkins-plugin-cli --plugins "blueocean:1.27.12 docker-workflow:572.v950f58993843"
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"