# IPOS-ANSIBLE 脚本工程

## 1.目标机器ssh免登陆配置：
 
### 1.1.生成authorized_keys

a) 在Ansible服务器中执行如下命令，生成`id_rsa.pub`：

```
# ssh-keygen -t rsa
# cat ~/.ssh/id_rsa.pub
```

b) 将`id_rsa.pub`内容复制到`/ipos-ansible/playbook/[环境]/authorized_keys`文件中

c) 上传到目标管理节点机器的`~/.ssh/authorized_keys`里面 (文件如无则新增)

### 1.2.修改该文件的权限
```
# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/authorized_keys
```
     
### 1.3.在playbook编译机检测连通性
```
# ssh uatoms@10.12.203.xxx
# yes
```