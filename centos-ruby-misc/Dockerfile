FROM iwag/cent64_base
MAINTAINER iwag

# install misc.
# RUN yum -y update && yum clean all
# RUN yum -y install zsh vim vim-enhanced unzip passwd sudo openssh-server git && yum clean all 

# install supervisord
RUN yum install -y python-setuptools && \
    easy_install pip && \
    pip install "pip>=1.4,<1.5" --upgrade && \
    pip install supervisor

# install sshd
RUN yum install openssh-server openssh-clients && \
    service sshd start && service sshd stop && \
    echo "NETWORKING=yes" > /etc/sysconfig/network && \
    sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# install chef
# RUN yum install -y rsync && curl -L https://www.opscode.com/chef/install.sh | bash

# install ruby
RUN yum -y install gcc glibc-devel openssl-devel libyaml-devel libxslt-devel && yum clean all
RUN wget -q http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p545.tar.gz -O /tmp/ruby.tar.gz && \
    cd /tmp/ && \
    tar -xf ruby.tar.gz && \
    cd ruby-1.9.3-p545 && \
    ./configure && make &&  make install && \
    cd /tmp && rm -rf /tmp/ruby* && \ 
    gem install bundler --no-ri # && yum -y remove gcc cpp kernel-headers && \


# useradd
# RUN useradd docker && echo docker:docker | chpasswd && echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p /home/docker/.ssh && chown docker.docker /home/docker/.ssh && chmod 700 /home/docker/.ssh
ADD id_rsa.tar /home/docker/.ssh/id_rsa.tar
# RUN chown docker.docker /home/docker/.ssh/authorized_keys && chmod 600 /home/docker/.ssh/authorized_keys

#ADD config.sh /home/docker/config.sh 
#ADD deploy.sh /home/docker/deploy.sh 
#RUN chown docker.docker /home/docker/*.sh

#USER docker
#WORKDIR /home/docker
#CMD ["/home/docker/config.sh"]

# EXPOSE 22
# CMD service sshd start
