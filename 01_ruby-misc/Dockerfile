# name : iwag/ruby-misc
FROM iwag/cent64-base
MAINTAINER iwag

# install supervisord
RUN yum install -y python-setuptools && \
    easy_install pip && \
    pip install "pip>=1.4,<1.5" --upgrade && \
    pip install supervisor

# install chef
# RUN yum install -y rsync && curl -L https://www.opscode.com/chef/install.sh | bash

# install ruby
ENV RUBY_VER 1.9
ENV RUBY_VER2 1.9.3
ENV RUBY_PATCH p545
RUN yum -y install gcc glibc-devel openssl-devel libyaml-devel libxslt-devel && yum clean all
RUN wget -q "http://cache.ruby-lang.org/pub/ruby/${RUBY_VER}/ruby-${RUBY_VER2}-${RUBY_PATCH}.tar.gz" -O /tmp/ruby.tar.gz  && \
    cd /tmp/ && \
    tar -xf ruby.tar.gz && \
    cd "ruby-${RUBY_VER2}-${RUBY_PATCH}" && \
    ./configure --prefix=/usr/local && make &&  make install && \
    cd /tmp && rm -rf /tmp/ruby* && \ 
    gem install bundler --no-ri # && yum -y remove gcc cpp kernel-headers && \


EXPOSE 22
CMD /usr/sbin/sshd -D
