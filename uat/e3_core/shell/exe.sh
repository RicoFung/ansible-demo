#!/usr/bin/env bash

# 参数 1 执行的操作 deploy
OPERATION=$1
# 参数 2 运行环境
ENV=$2
# 参数 3 工作目录
BASE_DIR=$3

export IPOS_ANSIBLE=/data/epo-ansible/ipos-ansible
cd ${IPOS_ANSIBLE}/ansible_scripts/${ENV} && git pull
# 执行ansible操作
ansible-playbook -i ${BASE_DIR}/hosts ${BASE_DIR}/playbooks/core.yml -f 1 --extra-vars "EV_OPERATION=$OPERATION EV_ENV=$ENV EV_IPOS_ANSIBLE=$IPOS_ANSIBLE"