#!/usr/bin/env bash

# 参数 1 操作的主机
group=$1
# 参数 2 执行的操作 deploy | stop | restart
operation=$2
# 参数 3 工作目录
BASE_DIR=$3
# 参数 4 运行环境
deploy_env=$4

export ipos_ansible=/data/epo-ansible/ipos-ansible
cd ${ipos_ansible}/ansible_scripts && git pull && git checkout develop
# 执行ansible操作
ansible-playbook -i ${deploy_env}/${BASE_DIR}/hosts ${deploy_env}/${BASE_DIR}/playbooks/core.yml -f 1 --extra-vars "group=$group operation=$operation deploy_env=$deploy_env ipos_ansible=$ipos_ansible"
