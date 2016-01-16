# Jenkins

```
方式一
	sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
	sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
	yum install jenkins
方式二（本文采用）
	下载war包 http://mirrors.jenkins-ci.org/war/1.643/
	配置tomcat/conf/server.xml 复制一份service 配置，修改端口号/appBase/log前缀，其它不变。
	重启服务
插件安装
	git/maven/email
	设置tomcat编码utf-8
```