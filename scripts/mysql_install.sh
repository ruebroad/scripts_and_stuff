#!/bin/bash
sudo apt update
sudo apt install mysql-server
# sudo mysql_secure_installation # removes insecure settings

# MySQL APT Repository
curl -L https://dev.mysql.com/get/mysql-apt-config_0.8.3-1_all.deb -o /tmp/mysql-apt-config.deb
sudo dpkg -i /tmp/mysql-apt-config.deb

# Answer the questions from setup screen
sudo apt-get update
sudo apt-get install mysql-server

# Mysql Config
echo "[mysqld]\n" >> /etc/mysql/my.cnf
echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf
echo "sql-mode=" >> /etc/mysql/my.cnf # not clear if this is really required

# root password is blank
