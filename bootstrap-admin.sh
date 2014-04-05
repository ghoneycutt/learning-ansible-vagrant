#!/bin/bash

# install sshpass
yum -y install sshpass

# setup ansible
rm -f /etc/ansible/hosts
for box in admin node1 node2 node3
do
  echo $box >> /etc/ansible/hosts
done

cat << EOM > /root/.ansible.cfg
[defaults]
host_key_checking = False
EOM

# setup ssh
cat << EOM > /root/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
EOM

ssh-keygen -b 1024 -N '' -f /root/.ssh/id_rsa -t rsa -q
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
for node in node1 node2 node3
do
  sshpass -p 'vagrant' scp /root/.ssh/id_rsa.pub $node:/root/.ssh/authorized_keys
done

# run ansible
ansible all -m command -a 'cowsay ansible is fun!'
