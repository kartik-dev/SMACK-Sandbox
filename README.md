Vagrant for SMACK (Spark, Mesos, Akka, Cassandra and Kafka) Stack
==================================

#### Introduction

Vagrant project to spin up a single virtual machine running:

* Hadoop 2.7.2
* Hive 1.2.1
* Spark 2.0.0
* Confluent-io 3.0.0_2.11 platform 
* Zepplin 0.6.1
* nifi 1.0.0

The virtual machine will be running the following services:

* HDFS NameNode + NameNode
* YARN ResourceManager + JobHistoryServer + ProxyServer
* Hive metastore and server2
* Spark history server

#### Web user interfaces

Here are some useful links to navigate to various UI's:

* YARN resource manager:  (http://191.168.0.50:8088)
* Job history:  (http://191.168.0.50:19888/jobhistory/)
* HDFS: (http://191.168.0.50:50070/dfshealth.html)
* Spark history server: (http://191.168.0.50:18080)
* Spark context UI (if a Spark context is running): (http://191.168.0.50:4040)

##### Setup Pig manually (Need to automate)

cd /home/vagrant

wget http://mirror.netcologne.de/apache.org/pig/pig-0.16.0/pig-0.16.0.tar.gz

tar xvf pig-0.16.0.tar.gz

export PATH=$PATH:/home/vagrant/pig-0.16.0/bin

