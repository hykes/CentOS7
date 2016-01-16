# ESC配置

```
1.选购ecs 要带宽，没带宽不能访问外网，无外网IP （以下配置为学生特惠默认配置）
CPU： 1核
内存： 1024 MB
操作系统： CentOS 7.0 64位
公网IP： XXX
内网IP： XXX
带宽计费方式： 按使用流量
当前使用带宽： 带宽：1Mbps（峰值）
2.ssh登录，命令：
	ssh root@外网IP
3.在控制台里给磁盘建立个快照 
4.升级系统，命令：
	yum -y update
5.升级非centos官方源里的内核kernel（可选，建议自己编译kernel最新的稳定版,kernel是所有linux系统的大脑和心脏，可到https://www.kernel.org查询最新版） 
6.打开firewall防火墙
  6-1.设置防火墙自启动，命令： 
	systemctl enable firewalld.service
  6-2.启动防火墙，命令： 
	systemctl start firewalld.service
  6-3.打开端口，如80 22等等（可选）命令： 
	firewall-cmd --permanent --add-port=80/tcp
	firewall-cmd --permanent --add-port=22/tcp
	firewall-cmd --reload
7.挂载数据盘（可选）
```