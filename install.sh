#!/bin/bash
sed -i s#PasswordAuthentication\ no#PasswordAuthentication\ yes#g /etc/ssh/sshd_config
sed -i s#PermitRootLogin\ no#PermitRootLogin\ yes#g /etc/ssh/sshd_config
service sshd restart
echo root:mapr | chpasswd
mkdir /root/.ssh
echo StrictHostKeyChecking no > /root/.ssh/config
yum -y install wget lsof
