# name cent64-memcached
FROM iwag/cent64-base

RUN yum install -y memcached

EXPOSE 22
CMD service memcached start 
CMD /usr/sbin/sshd -D
