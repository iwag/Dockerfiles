FROM centos:6.4
MAINTAINER iwag

# install misc.
RUN yum -y update && yum clean all
RUN yum -y install zsh vim vim-enhanced unzip passwd sudo openssh-server git && yum clean all 

# install supervisord
RUN yum install -y python-setuptools && \
    easy_install pip && \
    pip install "pip>=1.4,<1.5" --upgrade && \
    pip install supervisor

# install sshd
RUN yum install openssh-server openssh-clients && \
    service sshd start && service sshd stop && \
    echo "NETWORKING=yes" > /etc/sysconfig/network && \
    sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && \
    echo 'root:uaaa' | chpasswd

# install chef
# RUN yum install -y rsync && curl -L https://www.opscode.com/chef/install.sh | bash

# install ruby
RUN yum -y install gcc glibc-devel openssl-devel libyaml-devel libxslt-devel && yum clean all
RUN wget -q http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz -O /tmp/ruby.tar.gz && \
    cd /tmp/ && \
    tar -xf ruby.tar.gz && \
    cd ruby-2.1.1 && \
    ./configure && make &&  make install && \
    cd /tmp && rm -rf /tmp/ruby* && yum -y remove gcc cpp kernel-headers && \
    gem install bundler --no-ri

# useradd
RUN useradd okok && echo okok:okok | chpasswd && echo 'okok ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p /home/okok/.ssh && chown okok.okok /home/okok/.ssh && chmod 700 /home/okok/.ssh
# ADD ./authorized_keys /home/okok/.ssh/authorized_keys
# RUN chown okok.okok /home/okok/.ssh/authorized_keys && chmod 600 /home/okok/.ssh/authorized_keys

ADD config.sh /home/okok/config.sh 
ADD deploy.sh /home/okok/deploy.sh 
RUN chown okok.okok /home/okok/*.sh

EXPOSE 22
CMD service sshd start
