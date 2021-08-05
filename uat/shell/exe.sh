#!/usr/bin/env bash

# 参数 1 主机组
PROFILE=$1
# 参数 2 执行的操作 deploy | restart | stop | start
OPERATION=$2
# 参数 3 源码分支
BRANCH=$3
# 参数 4 ANSIBLE环境
ANSIBLE_ENV=$4
# 参数 5 工作目录
BASE_DIR=$5
# 参数6 ansible分支
ANSIBLE_BRANCH=$6

export IPOS_ANSIBLE=/data/epo-ansible/ipos-ansible
cd ${IPOS_ANSIBLE}/ansible_scripts/${ANSIBLE_ENV} && git pull --force && git fetch --all && git reset --hard origin/${ANSIBLE_BRANCH} && git checkout ${ANSIBLE_BRANCH}

# 执行ansible操作
ansible-playbook -i ${BASE_DIR}/profiles ${BASE_DIR}/playbooks/exe.yml -f 1 --extra-vars "EV_PROFILE=$PROFILE EV_OPERATION=$OPERATION EV_ANSIBLE_ENV=$ANSIBLE_ENV EV_BRANCH=$BRANCH EV_IPOS_ANSIBLE=$IPOS_ANSIBLE"