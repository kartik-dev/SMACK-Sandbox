Vagrant for SMACK (Spark, Mesos, Akka, Cassandra and Kafka) Stack
==================================

#### Introduction

Vagrant project to spin up a single virtual machine running:

* Mesos 1.0
* Hadoop 2.7.2
* Hive 1.2.1
* Spark 2.0.0
* Confluent-io 3.0.0_2.11 platform 
* Apache Zeppelin 0.6.1
* Apache NiFi 1.0.0
* Cassandra 3.7

The virtual machine will be running the following services:

* HDFS NameNode + NameNode
* YARN ResourceManager + JobHistoryServer + ProxyServer
* Hive metastore and server2
* Spark history server
* Zeppelin
* NiFi
* Cassandra

#### Web user interfaces

Here are some useful links to navigate to various UI's:

* Mesos Master:  (http://192.168.0.50:5050)
* YARN resource manager:  (http://192.168.0.50:8088)
* Job history:  (http://192.168.0.50:19888/jobhistory/)
* HDFS: (http://192.168.0.50:50070/dfshealth.html)
* Spark history server: (http://192.168.0.50:18080)
* Spark context UI (if a Spark context is running): (http://192.168.0.50:4040)
* Zeppelin UI: (http://192.168.0.50:8889)
* NiFi UI: (http://192.168.0.50:8080/nifi)
