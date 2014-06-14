# install java
yum install -y java-1.7.0-openjdk 

# install maven
export MVN_VER="3.2.1"
wget -q http://ftp.jaist.ac.jp/pub/apache/maven/maven-3/${MVN_VER}/binaries/apache-maven-${MVN_VER}-bin.tar.gz -O /tmp/maven-bin.tar.gz 
cd /tmp && tar -xf maven-bin.tar.gz && mv apache-maven-${MVN_VER} /usr/local/lib 
ln -s /usr/local/lib/apache-maven-3.2.1/bin/mvn /usr/local/bin/mvn 
rm /tmp/maven-*

