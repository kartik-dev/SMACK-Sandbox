sudo -s

/vagrant/scripts/start-hadoop.sh

nohup hive --service metastore < /dev/null > /usr/local/hive/logs/hive_metastore_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &

nohup hive --service hiveserver2 < /dev/null > /usr/local/hive/logs/hive_server2_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &

/usr/local/spark/sbin/start-history-server.sh

/usr/local/spark/sbin/stop-history-server.sh

/home/vagrant/zookeeper-3.4.9/bin/zkServer.sh start 

nohup /home/vagrant/confluent-3.0.1/bin/kafka-server-start /home/vagrant/confluent-3.0.1/etc/kafka/server.properties < /dev/null > /home/vagrant/confluent-3.0.1/logs/kafka.log 2>&1 </dev/null &

nohup /home/vagrant/confluent-3.0.1/bin/schema-registry-start /home/vagrant/confluent-3.0.1/etc/schema-registry/schema-registry.properties < /dev/null > /home/vagrant/confluent-3.0.1/logs/schemregistry.log 2>&1 </dev/null &

nohup /home/vagrant/confluent-3.0.1/bin/kafka-rest-start < /dev/null > /home/vagrant/confluent-3.0.1/logs/restproxy.log 2>&1 </dev/null &

/home/vagrant/zeppelin-0.6.0-bin-all/bin/zeppelin-daemon.sh restart

-- Kafka
-- create topic
/home/vagrant/confluent-3.0.1/bin/kafka-topics --zookeeper 192.168.0.50:2181 --create --topic clicklog --partitions 1 --replication-factor 1


curl -X GET -i http://192.168.0.50:8081/subjects

curl -X GET -i http://192.168.0.50:8081/subjects/clicklog-value/versions/1

curl -X GET http://192.168.0.50:8081/config

curl -X PUT -i -H "Content-Type: application/vnd.schemaregistry.v1+json" --data '{"compatibility": "NONE"}' http://192.168.0.50:8081/config