# Maven

```
cd /home
wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
tar -xzvf apache-maven-3.1.1-bin.tar.gz
mv apache-maven-3.1.1 maven
cd maven
vi /etc/profile
#maven
export M2_HOME=/home/maven
export PATH=$PATH:$M2_HOME/bin
保存退出后运行下面的命令使配置生效
source /etc/profile
验证版本
mvn -v
```