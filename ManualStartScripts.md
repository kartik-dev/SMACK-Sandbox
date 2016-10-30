sudo -s

-- Start Hadoop
/vagrant/scripts/start-hadoop.sh

-- Start Hive
nohup hive --service metastore < /dev/null > /usr/local/hive/logs/hive_metastore_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &
nohup hive --service hiveserver2 < /dev/null > /usr/local/hive/logs/hive_server2_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &

-- Start Spark historyserver
/usr/local/spark/sbin/start-history-server.sh

-- Start Confluent-io platform
/usr/local/confluent/bin/zookeeper-server-start /usr/local/confluent/etc/kafka/zookeeper.properties &
/usr/local/confluent/bin/kafka-server-start /usr/local/confluent/etc/kafka/server.properties &
/usr/local/confluent/bin/schema-registry-start /usr/local/confluent/etc/schema-registry/schema-registry.properties &

-- Start Zeppelin
/usr/local/zeppelin/bin/zeppelin-daemon.sh start &

-- Start Mesos
service mesos-master start
service mesos-slave start

-- Start Cassandra
export PATH=$PATH:/usr/local/cassandra/bin
cp /vagrant/resources/cassandra/cassandra.yaml /usr/local/cassandra/conf/
cassandra -R &

-- Kafka
-- create topic
/usr/local/confluent/bin/kafka-topics --zookeeper 192.168.0.50:2181 --create --topic jsonLog --partitions 1 --replication-factor 1

curl -X GET -i http://192.168.0.50:8081/subjects

curl -X GET -i http://192.168.0.50:8081/subjects/clicklog-value/versions/1

curl -X GET http://192.168.0.50:8081/config

curl -X PUT -i -H "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"compatibility": "NONE"}' http://192.168.0.50:8081/config