# FTP

```
yum list vsftpd
yum install vsftpd
修改配置
vi /etc/vsftpd/vsftpd.conf 将anonymous_enable=YES的值设置为NO
增加FTP用户、并设置密码
　　命令：useradd hehaiyang -s /sbin/nologin -d /home/FTP 
其中hehaiyang为FTP账号，/home/FTP为设置的目录路径
运行命令 passwd hehaiyang 之后输入两次密码即可
设置创建的FTP指定目录的权限
chmod 777 /home/FTP 
启动FTP服务
命令：service vsftpd start

参考：http://os.51cto.com/art/201008/222036.htm
```