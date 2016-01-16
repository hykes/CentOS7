# 常见问题

```
nginx: [error] open() "/usr/local/nginx/logs/nginx.pid" failed (2: No such file or directory)

解决方法：
[root@localhost nginx]# /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf

使用nginx -c的参数指定nginx.conf文件的位置

[root@localhost nginx]# cd logs/
[root@localhost logs]# ll
总用量 12
-rw-r--r-- 1 root root 1246 12月  9 18:10 access.log
-rw-r--r-- 1 root root  516 12月 10 15:39 error.log
-rw-r--r-- 1 root root    5 12月 10 15:38 nginx.pid
此时nginx.pid文件已经存在
```
