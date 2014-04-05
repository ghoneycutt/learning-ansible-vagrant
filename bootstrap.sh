#!/bin/bash

# install some software
yum -y install facter ansible cowsay

# setup hosts
echo '192.168.1.10 admin' >> /etc/hosts
echo '192.168.1.21 node1' >> /etc/hosts
echo '192.168.1.22 node2' >> /etc/hosts
echo '192.168.1.23 node3' >> /etc/hosts

# setup ssh
install -d -m 0700 /root/.ssh
