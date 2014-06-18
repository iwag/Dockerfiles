
# update and install iroiro
yum update -y && yum clean all && rm -rf /var/cache/yum/*
yum install -y wget curl zsh sudo git openssh-server passwd screen vim && yum clean all && rm -rf /var/cache/yum/*

# install sshd
yum install -y openssh-server openssh-clients
service sshd start && service sshd stop 
echo "NETWORKING=yes" > /etc/sysconfig/network 
sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# setting time
echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock 
rm -f /etc/localtime 
ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime 

# setting user
export USER=docker
echo 'root:docker' | chpasswd && useradd $USER && echo "$USER:$USER" | chpasswd && echo "$USER ALL=(ALL) ALL" >> /etc/sudoers && echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers

# setup ssh
mkdir /home/$USER/.ssh
mv /docker/id_rsa.tar /home/$USER/.ssh/ 
chown $USER.$USER /home/$USER/.ssh/* && chmod 600 /home/$USER/.ssh/id_rsa && chown $USER.$USER /home/$USER/.ssh

