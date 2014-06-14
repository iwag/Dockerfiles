
# install supervisord
yum install -y python-setuptools
easy_install pip 
pip install "pip>=1.4,<1.5" --upgrade 
pip install supervisor

# build and install ruby
yum -y install gcc glibc-devel openssl-devel libyaml-devel libxslt-devel && yum clean all
export RUBY_VER="1.9"
export RUBY_VER2="1.9.3"
export RUBY_PATCH="p545"
wget -q "http://cache.ruby-lang.org/pub/ruby/${RUBY_VER}/ruby-${RUBY_VER2}-${RUBY_PATCH}.tar.gz" -O /tmp/ruby.tar.gz  
cd /tmp/ && \
tar -xf ruby.tar.gz && \
cd "ruby-${RUBY_VER2}-${RUBY_PATCH}" && \
./configure --prefix=/usr/local && make &&  make install && \
cd /tmp && rm -rf /tmp/ruby*  

gem install bundler --no-ri # && yum -y remove gcc cpp kernel-headers

