#!/bin/bash
sed -i s#PasswordAuthentication\ no#PasswordAuthentication\ yes#g /etc/ssh/sshd_config
sed -i s#PermitRootLogin\ no#PermitRootLogin\ yes#g /etc/ssh/sshd_config
service sshd restart
echo root:mapr | chpasswd
yum -y install docker
