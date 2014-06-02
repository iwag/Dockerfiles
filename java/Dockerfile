# name java
FROM iwag/ruby-misc

ENV USER docker

# install java

RUN yum install -y java-1.7.0-openjdk

EXPOSE 22
CMD /usr/sbin/sshd -D
