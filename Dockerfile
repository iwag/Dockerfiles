# name iwag/all

FROM centos:6.4
#FROM iwag/ruby-misc
MAINTAINER iwag

RUN yum update -y

RUN mkdir /docker
ADD . /docker
RUN ls -1 /docker/*/install.sh | xargs cat | /bin/bash 

RUN wget http://install.ohmyz.sh -O /home/docker/install.ohmyz.sh 

EXPOSE 22
CMD /usr/sbin/sshd -D
