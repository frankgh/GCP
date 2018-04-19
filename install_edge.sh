#!/bin/bash
sed -i s#PasswordAuthentication\ no#PasswordAuthentication\ yes#g /etc/ssh/sshd_config
sed -i s#PermitRootLogin\ no#PermitRootLogin\ yes#g /etc/ssh/sshd_config
service sshd restart
echo root:mapr | chpasswd
yum -y install docker
systemctl enable docker
systemctl start docker

echo [MapR_Core] > /etc/yum.repos.d/mapr_core.repo
echo name = MapR Core Components >> /etc/yum.repos.d/mapr_core.repo
echo baseurl = http://package.mapr.com/releases/v6.0.1/redhat >> /etc/yum.repos.d/mapr_core.repo
echo gpgcheck = 1 >> /etc/yum.repos.d/mapr_core.repo
echo enabled = 1 >> /etc/yum.repos.d/mapr_core.repo
echo protected = 1 >> /etc/yum.repos.d/mapr_core.repo

yum -y install mapr-client
