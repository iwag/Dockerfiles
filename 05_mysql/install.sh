
export MYSQL_VER="5.5.38-1"
cd /tmp && wget -q "http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.5/MySQL-${MYSQL_VER}.linux2.6.x86_64.rpm-bundle.tar" -O mysql.tar &&  tar -xf mysql.tar 
yum localinstall -y MySQL-shared-compat*.rpm 
yum localinstall -y MySQL-server*.rpm 
yum localinstall -y MySQL-client*.rpm 
yum localinstall -y MySQL-devel*.rpm 
yum localinstall -y MySQL-shared-5.5*.rpm 
rm /tmp/*.tar /tmp/*.rpm
# RUN yum install -y mysql-server

# setup mysql
service mysqld start && sleep 5 && /bin/bash /docker/mysql/config_mysql.sh

