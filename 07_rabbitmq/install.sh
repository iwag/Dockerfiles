# downlaod and install rabbitmq
wget -q http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm -O /tmp/erlang.rpm 
yum localinstall -y /tmp/erlang.rpm  
wget -q http://www.rabbitmq.com/releases/rabbitmq-server/v3.2.1/rabbitmq-server-3.2.1-1.noarch.rpm -O /tmp/rabbitmq-server.rpm 
yum localinstall -y /tmp/rabbitmq-server.rpm
rm /tmp/*.rpm 

# setup rabbitmq
/etc/init.d/rabbitmq-server start 
/usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management 
/etc/init.d/rabbitmq-server restart 
sleep 5 
wget -q http://localhost:55672/cli/rabbitmqadmin -O /usr/sbin/rabbitmqadmin 
chmod +x /usr/sbin/rabbitmqadmin
/etc/init.d/rabbitmq-server stop
# RUN rabbitmqctl add_user $USER $USER && rabbitmqctl add_user dummy dummy


