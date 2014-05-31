# name cent64-base
FROM centos:6.4

ENV JAVA_VERSION java-1.7.0
ENV USER docker

# Install 
RUN yum update -y && yum clean all && rm -rf /var/cache/yum/*
RUN yum install -y wget curl zsh sudo git openssh-server passwd screen vim && yum clean all && rm -rf /var/cache/yum/*
# RUN yum install -y $JAVA_VERSION-openjdk php php-devel


# install sshd
RUN yum install openssh-server openssh-clients && \
    service sshd start && service sshd stop && \
    echo "NETWORKING=yes" > /etc/sysconfig/network && \
    sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# setting user
RUN echo 'root:docker' | chpasswd && useradd $USER && echo "$USER:$USER" | chpasswd && echo "$USER ALL=(ALL) ALL" >> /etc/sudoers && echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir /home/$USER/.ssh
ADD id_rsa.tar /home/$USER/.ssh/ 
RUN chown $USER.$USER /home/$USER/.ssh/* && chmod 600 /home/$USER/.ssh/id_rsa && chown $USER.$USER /home/$USER/.ssh

EXPOSE 22
CMD /usr/sbin/sshd -D
# WORKDIR /home/$USER

