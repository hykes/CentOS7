# Tomcat

```
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.67/bin/apache-tomcat-7.0.67.tar.gz
tar -xzvf apache-tomcat-7.0.67.tar.gz
mv apache-tomcat-7.0.67 tomcat
cd tomcat
启动tomcat
./startup.sh
停止tomcat
./shutdown.sh

tomcat 三种部署方式
1）多个项目都放到webapps目录下(工程文件夹A，B)
127.0.0.1:8080/A
127.0.0.1:8080/B
2) 配置多个Service ,Service与Engine名称保持一致Catalina2
127.0.0.1:8080
127.0.0.1:9090
3）一个service，Host里配置多个Context
<Context path="/aa" reloadable="true" docBase="E:/A" /> 
<Context path="/bb" reloadable="true" docBase="E:/B" />
127.0.0.1:8080/aa
127.0.0.1:8080/bb
```