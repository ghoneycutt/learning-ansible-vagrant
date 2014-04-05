#!/bin/bash

# install some software
yum -y install facter ansible cowsay

# setup ansible
echo 127.0.0.1 > /etc/ansible/hosts

# setup keys
ssh-keygen -b 1024 -N '' -f /root/.ssh/id_rsa -t rsa -q
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
echo "127.0.0.1 $(cat /etc/ssh/ssh_host_rsa_key.pub)" > /root/.ssh/known_hosts

# run a command with ansible
ansible all -m command -a 'cowsay learning ansible is fun!'
