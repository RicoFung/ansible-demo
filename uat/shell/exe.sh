#!/usr/bin/env bash

# 参数 1 主机组
PROFILE=$1
# 参数 2 执行的操作 pack | publish | rollback | restart | stop | start
OPERATION=$2
# 参数 3 回滚点
ROLLBACK_POINT=$3
# 参数 4 源码分支
BRANCH=$4
# 参数 5 ANSIBLE环境
ANSIBLE_ENV=$5
# 参数 6 工作目录
ANSIBLE_WORK_DIR=$6
# 参数 7 ansible分支
ANSIBLE_BRANCH=$7

export IPOS_ANSIBLE=/data/epo-ansible/ipos-ansible
cd ${IPOS_ANSIBLE}/ansible_scripts/${ANSIBLE_ENV} && git pull --force && git fetch --all && git reset --hard origin/${ANSIBLE_BRANCH} && git checkout ${ANSIBLE_BRANCH}

# 执行ansible操作
ansible-playbook -i ${ANSIBLE_WORK_DIR}/profile ${ANSIBLE_WORK_DIR}/playbooks/exe.yml -f 1 --extra-vars "EV_PROFILE=$PROFILE EV_OPERATION=$OPERATION EV_ROLLBACK_POINT=$ROLLBACK_POINT EV_BRANCH=$BRANCH EV_ANSIBLE_ENV=$ANSIBLE_ENV EV_IPOS_ANSIBLE=$IPOS_ANSIBLE"