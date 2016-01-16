# SSH

```
使用ssh证书授权登录的必要性

普通用户登录时，以往的做法往往是使用账号密码登录，但是这样的登录方式风险相当高，使用密钥登录能大大降低这个风险，这个密钥是针对每台计算机生成的独一无二的凭证，保存在登录用户的电脑中，只能通过登录用户电脑的证书授权才能登录服务器。

登录用户电脑操作

建立~/.ssh目录（如果没有）

ls -al ~/.ssh
根据邮箱创建私钥

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
按照流程走完后会在 ~/.ssh目录下看到id_rsa, id_rsa.pub文件 第一个是私有密钥 第二个是拥有密钥

复制id_rsa.pub中的内容（mac）

cat id_rsa.pub | pbcopy
服务器配置(centos7)

vim /etc/ssh/sshd_config
将如下配置前的#号去掉

#禁用root账户登录，如果是用root用户登录请开启
PermitRootLogin yes

# 是否让 sshd 去检查用户家目录或相关档案的权限数据，
# 这是为了担心使用者将某些重要档案的权限设错，可能会导致一些问题所致。
# 例如使用者的 ~.ssh/ 权限设错时，某些特殊情况下会不许用户登入
StrictModes no

# 是否允许用户自行使用成对的密钥系统进行登入行为，仅针对 version 2。
# 至于自制的公钥数据就放置于用户家目录下的 .ssh/authorized_keys 内
RSAAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile      .ssh/authorized_keys

# 有了证书登录了，就禁用密码登录吧，安全要紧
PasswordAuthentication no
将密钥写到一张文件去 如test 然后将这个文件导入 ～/.ssh/authorized_keys

cat test >> ～/.ssh/authorized_keys
启动ssh服务

service sshd start
有可能会提示

Redirecting to /bin/systemctl start  sshd.service
只要按照提示操作就能开启ssh服务

/bin/systemctl start  sshd.service
这样一来在计算机持有密钥的情况下就可以不使用账号密码登录服务器了
```
