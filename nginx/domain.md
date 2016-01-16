# 多域名绑定

```
批量设置多域名绑定
http://www.server110.com/nginx/201309/1248.html

http://zhidao.baidu.com/link?url=mGDEfPPlJwQVK9EgrmDGdp9zbC8IC6MHPYVqF9tYWv0MUprxhVwRuOzaw2M7jb-zWbnlCC33WEj31a48OmRx4m9j0Ju1yvi6zlfiLMdWbTC
多个.conf方法（优点是灵活，缺点就是站点比较多配置起来麻烦）
这里以配置2个站点（2个域名）为例，n 个站点可以相应增加调整，假设：
IP地址: 192.168.1.100
域名1 example1.com 放在 /www/example1
域名2 example2.com 放在 /www/example2

配置 nginx virtual hosting 的基本思路和步骤如下：
把2个站点 example1.com, example2.com 放到 nginx 可以访问的目录 /www/
给每个站点分别创建一个 nginx 配置文件 example1.com.conf，example2.com.conf, 并把配置文件放到 /usr/local/nginx/vhosts/
然后在 /usr/local/nginx/nginx.conf 里面加一句 include 把步骤2创建的配置文件全部包含进来（用 * 号）
重启 nginx
1、打开 /usr/local/nginx/nginix.conf 文件，在相应位置加入 include 把以上2个文件包含进来
user  www www;
worker_processes  1;

# main server error log
error_log      /usr/local/nginx/log/nginx/error.log ;
pid     /usr/local/nginx/nginx.pid;

events {
worker_connections  51200;
}
# main server config
http {
include       mime.types;
default_type  application/octet-stream;
log_format  main  ‘$remote_addr – $remote_user [$time_local] $request ‘
‘”$status” $body_bytes_sent “$http_referer” ‘
‘”$http_user_agent” “$http_x_forwarded_for”‘;

sendfile        on;
#tcp_nopush     on;
#keepalive_timeout  0;
keepalive_timeout  65;
gzip  on;

server {
listen         80;
server_name     _;
access_log      /usr/local/nginx/log/nginx/access.log main;
server_name_in_redirect  off;
location / {
root  /usr/share/nginx/html;
index index.html;
}
}
# 包含所有的虚拟主机的配置文件
include /usr/local/nginx/vhosts/*;
}

2、在 /usr/local/nginx 下创建 vhosts 目录
mkdir /usr/local/nginx/vhosts

3、在 /usr/local/nginx/vhosts/ 里创建一个名字为 example1.com.conf 的文件，把以下内容拷进去
server {
        listen  80;
        server_name  example1.com www. example1.com;

        access_log  /www/access_ example1.log  main;

        location / {
            root   /www/example1.com;
            index  index.php index.html index.htm;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }

       # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        location ~ .php$ {
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  /www/example1.com/$fastcgi_script_name;
            include        fastcgi_params;
        }

        location ~ /.ht {
            deny  all;
        }
}

3、在 /usr/local/nginx/vhosts/ 里创建一个名字为 example2.com.conf 的文件，把以下内容拷进去
server {
        listen  80;
        server_name  example2.com www. example2.com;

        access_log  /www/access_ example1.log  main;

        location / {
            root   /www/example2.com;
            index  index.php index.html index.htm;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }

       # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        location ~ .php$ {
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  /www/example2.com/$fastcgi_script_name;
            include        fastcgi_params;
        }

        location ~ /.ht {
            deny  all;
        }
}

5、重启 Nginx

/etc/init.d/nginx restart
```
