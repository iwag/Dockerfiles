# name cent64-base
FROM centos:centos6

ENV USER docker

# Install 
RUN yum update -y && yum clean all && rm -rf /var/cache/yum/*
RUN yum install -y wget curl zsh sudo git openssh-server passwd screen vim && yum clean all && rm -rf /var/cache/yum/*

# install sshd
RUN yum install -y openssh-server openssh-clients && \
    service sshd start && service sshd stop && \
    echo "NETWORKING=yes" > /etc/sysconfig/network && \
    sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# setting time
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock && \
    rm -f /etc/localtime && \
    ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime 

# setting user
ENV USER docker
RUN echo 'root:docker' | chpasswd && useradd $USER && echo "$USER:$USER" | chpasswd && echo "$USER ALL=(ALL) ALL" >> /etc/sudoers && echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers

#RUN mkdir /home/$USER/.ssh
#ADD id_rsa.pub /home/$USER/.ssh/
#ADD id_rsa /home/$USER/.ssh/
#RUN chown $USER.$USER /home/$USER/.ssh/* && chmod 600 /home/$USER/.ssh/id_rsa && chown $USER.$USER /home/$USER/.ssh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
# WORKDIR /home/$USER

