#!/usr/bin/env bash

# 参数 1 执行的操作 deploy | stop | restart
operation=$1
# 参数 2 工作目录
BASE_DIR=$2
# 参数 3 运行环境
deploy_env=$3

export ipos_ansible=/data/epo-ansible/ipos-ansible
cd ${ipos_ansible}/ansible_scripts && git pull && git checkout develop
# 执行ansible操作
ansible-playbook -i ${deploy_env}/${BASE_DIR}/playbooks/core.yml -f 1 --extra-vars "group=$group operation=$operation deploy_env=$deploy_env ipos_ansible=$ipos_ansible"
