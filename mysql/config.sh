# setting mysql
DB=mydb
# sudo service mysqld start
mysql -uroot -e "create database $DB;"
mysql -uroot -e "create user $USER;"
mysql -uroot -e "grant all on *.* to $USER@localhost identified by 'dummy';"
mysql -uroot -e "create user ro;"
mysql -uroot -e "grant all on *.* to ro@localhost identified by 'dummy';"

