# 目录浏览功能

```
1、开启全站所有目录浏览功能

vi  /usr/local/nginx/conf/nginx.conf   #编辑配置文件，在http {下面添加以下内容：
autoindex on;   #开启nginx目录浏览功能
autoindex_exact_size off;   #文件大小从KB开始显示
autoindex_localtime on;   #显示文件修改时间为服务器本地时间
:wq!  #保存，退出
service nginx reload   #重新加载nginx配置

2、只打开网站部分目录浏览功能

只打开 http://www.yourdomain.com/soft 目录浏览

vi  /usr/local/nginx/conf/nginx.conf   #编辑配置文件，在server {下面添加以下内容：
location   /soft {
autoindex on;
autoindex_exact_size off;
autoindex_localtime on;
:wq!  #保存，退出

[root@localhost sbin]# ./nginx -s reload
```
