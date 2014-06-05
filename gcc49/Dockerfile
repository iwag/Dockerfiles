FROM iwag/ruby-misc
MAINTAINER iwag

RUN yum install -y glibc-devel gcc-c++ autoconf

RUN git clone https://github.com/Homebrew/linuxbrew.git /home/docker/linuxbrew 
RUN echo 'export PATH="$HOME/linuxbrew/bin:$PATH" ' >> /home/docker/.bashrc  && \
	  echo 'LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib64:${HOME}/linuxbrew/lib:${HOME}/linuxbrew/opt/gmp4/lib:${HOME}/linuxbrew/opt/libmpc08/lib:${HOME}/linuxbrew/opt/mpfr2/lib:${HOME}/linuxbrew/opt/isl011/lib"' >> /home/docker/.bashrc && \
		wget http://install.ohmyz.sh -O /home/docker/install.ohmyz.sh && \
    chown -R docker.docker /home/docker/linuxbrew 

ADD build.sh /home/docker/build.sh
RUN chown -R docker.docker /home/docker/*.sh

EXPOSE 22
CMD service sshd start
