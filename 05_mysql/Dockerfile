# name cent64-mysql55
FROM iwag/cent65-base

ENV USER docker

RUN yum install -y tar

# install mysql
ENV MYSQL_VER 5.5.41-1
RUN cd /tmp && wget -q "http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.5/MySQL-${MYSQL_VER}.linux2.6.x86_64.rpm-bundle.tar" -O mysql.tar &&  tar -xf mysql.tar 
RUN cd /tmp && yum localinstall -y MySQL-shared-compat*.rpm && yum localinstall -y MySQL-server*.rpm && yum localinstall -y MySQL-client*.rpm && yum localinstall -y MySQL-devel*.rpm && yum localinstall -y MySQL-shared-5.5*.rpm && rm *.tar 
# RUN yum install -y mysql-server

ADD config_mysql.sh /home/$USER/config_mysql.sh
RUN chown -R $USER.$USER /home/$USER/* && chown $USER.$USER /home/$USER && service mysql start && sh /home/$USER/config_mysql.sh

EXPOSE 22
CMD service mysql start 
CMD /usr/sbin/sshd -D
