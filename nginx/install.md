# 安装

```
参考 http://www.cnblogs.com/skynet/p/4146083.html
cd /home
wget http://nginx.org/download/nginx-1.9.8.tar.gz
tar -zxvf nginx-1.9.8.tar.gz
mv nginx-1.9.8/ nginx
cd nginx
#http://jingyan.baidu.com/article/2fb0ba404f814e00f2ec5f9e.html
./configure 安装目录
＃编译／安装
make & make install
＃软链接
ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx
ps -ef|grep nginx

启用nginx命令
#方法1
[root@admin nginx-1.2.6]# /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
#方法2
[root@admin nginx-1.2.6]# cd /usr/local/nginx/sbin
[root@admin sbin]# ./nginx

停止nginx命令
#查询nginx主进程号
ps -ef | grep nginx
#停止进程
kill -QUIT 主进程号
#快速停止
kill -TERM 主进程号
#强制停止
pkill -9 nginx

重启nginx命令
[root@admin local]# /usr/local/nginx/sbin/nginx -s reload
```
