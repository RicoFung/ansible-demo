#!/usr/bin/env bash

# 参数 1 主机组
HOSTS=$1
# 参数 2 执行的操作 deploy | restart | stop | start
OPERATION=$2
# 参数 3 运行环境
ENV=$3
# 参数 4 分支名
BRANCH=$4
# 参数 5 工作目录
BASE_DIR=$5

export IPOS_ANSIBLE=/data/epo-ansible/ipos-ansible
cd ${IPOS_ANSIBLE}/ansible_scripts/${ENV} && git pull --force
# 执行ansible操作
ansible-playbook -i ${BASE_DIR}/hosts ${BASE_DIR}/playbooks/exe.yml -f 1 --extra-vars "EV_HOSTS=$HOSTS EV_OPERATION=$OPERATION EV_ENV=$ENV EV_BRANCH=$BRANCH EV_IPOS_ANSIBLE=$IPOS_ANSIBLE"