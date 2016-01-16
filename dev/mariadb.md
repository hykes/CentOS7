# MariaDB

> MariaDB数据库管理系统是MySQL的一个分支，主要由开源社区在维护，采用GPL授权许可 MariaDB的目的是完全兼容MySQL，包括API和命令行，使之能轻松成为MySQL的代替品。在存储引擎方面，使用XtraDB（英语：XtraDB）来代替MySQL的InnoDB。

```
centos下yum暂时没有mysql-server直接安装包；
MariaDB是MySQL社区开发的分支，也是一个增强型的替代品;
安装MariaDB
yum -y  install mariadb-server mariadb mariadb-devel
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation
firewall-cmd --permanent --add-service mysql
systemctl restart firewalld.service
iptables -L -n|grep 3306
登录数据库查看下是否有变好
msyql -uroot -p
show databases;
```
