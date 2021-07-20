#!/usr/bin/env bash

# 参数 1 执行的操作 deploy
operation=$1
# 参数 2 工作目录
BASE_DIR=$2
# 参数 3 运行环境
deploy_env=$3

export ipos_ansible=/data/epo-ansible/ipos-ansible
cd ${ipos_ansible}/ansible_scripts/${deploy_env} && git pull
# 执行ansible操作
ansible-playbook -i ${BASE_DIR}/hosts ${BASE_DIR}/playbooks/core.yml -f 1 --extra-vars "operation=$operation deploy_env=$deploy_env ipos_ansible=$ipos_ansible"