#!/bin/bash

source "/vagrant/scripts/common.sh"

function installMesos {
  rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
  yum -y install mesos mesosphere-zookeeper
  echo "zk://192.168.0.50:2181/mesos" > /etc/mesos/zk
  echo "192.168.0.50" > /etc/mesos-slave/ip
  echo "192.168.0.50" > /etc/mesos-slave/hostname
}

function startMesos {
   service zookeeper restart
   systemctl start mesos-master
   systemctl start mesos-slave
}

echo "Install & start mesos master and slave"
installMesos
startMesos