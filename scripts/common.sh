#!/bin/bash

# java
JAVA_ARCHIVE=jdk-8u51-linux-x64.gz

# hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-2.7.2
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hadoop/core/$HADOOP_VERSION/$HADOOP_ARCHIVE
HADOOP_RES_DIR=/vagrant/resources/hadoop

# hive
HIVE_VERSION=hive-1.2.1
HIVE_ARCHIVE=apache-$HIVE_VERSION-bin.tar.gz
HIVE_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hive/$HIVE_VERSION/$HIVE_ARCHIVE
HIVE_RES_DIR=/vagrant/resources/hive
HIVE_CONF=/usr/local/hive/conf

# spark 
SPARK_VERSION=spark-2.0.0
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.7.tgz
SPARK_MIRROR_DOWNLOAD=http://d3kbcqa49mib13.cloudfront.net/$SPARK_VERSION-bin-hadoop2.7.tgz
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=/usr/local/spark/conf

# Zepplin
ZEPPELIN_VERSION=zeppelin-0.6.1
ZEPPELIN_ARCHIVE=$ZEPPELIN_VERSION-bin-all.tgz
ZEPPELIN_MIRROR_DOWNLOAD=http://mirror.synyx.de/apache/zeppelin/zeppelin-0.6.1/$ZEPPELIN_VERSION-bin-all.tgz
ZEPPELIN_RES_DIR=/vagrant/resources/zeppelin
ZEPPELIN_CONF_DIR=/usr/local/zeppelin/conf

# nifi
NIFI_VERSION=nifi-1.0.0
NIFI_ARCHIVE=nifi-1.0.0-bin.tar.gz
NIFI_MIRROR_DOWNLOAD=http://mirror.yannic-bonenberger.com/apache/nifi/1.0.0/nifi-1.0.0-bin.tar.gz
NIFI_RES_DIR=/vagrant/resources/nifi
NIFI_CONF_DIR=/usr/local/nifi/conf

# Confluent
CONFLUENT_VERSION=confluent-3.0.1-2.11
CONFLUENT_ARCHIVE=$CONFLUENT_VERSION.tar.gz
CONFLUENT_MIRROR_DOWNLOAD=http://packages.confluent.io/archive/3.0/$CONFLUENT_VERSION.tar.gz
CONFLUENT_RES_DIR=/vagrant/resources/confluent
CONFLUENT_CONF_DIR=/usr/local/confluent/conf

# Cassandra
CASSANDRA_VERSION=apache-cassandra-3.7
CASSANDRA_ARCHIVE=$CASSANDRA_VERSION-bin.tar.gz
CASSANDRA_MIRROR_DOWNLOAD=http://mirror2.shellbot.com/apache/cassandra/3.7/apache-cassandra-3.7-bin.tar.gz
CASSANDRA_RES_DIR=/vagrant/resources/cassandra
CASSANDRA_CONF_DIR=/usr/local/cassandra/conf

# ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}