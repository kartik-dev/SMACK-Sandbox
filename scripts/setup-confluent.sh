#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalConfluent {
	echo "install Confluent from local file"
	FILE=/vagrant/resources/$CONFLUENT_ARCHIVE
	tar -xzf $FILE -C /usr/local
}
function installRemoteConfluent {
	echo "install Confluent from remote file"
	curl -sS -o /vagrant/resources/$CONFLUENT_ARCHIVE -O -L $CONFLUENT_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$CONFLUENT_ARCHIVE -C /usr/local
}
function installConfluent {
	if resourceExists $CONFLUENT_ARCHIVE; then
		installLocalConfluent
		else
			installRemoteConfluent
			fi
	ln -s /usr/local/confluent-3.0.1 /usr/local/confluent
	mkdir -p /usr/local/confluent/logs
}

function startServices {
	echo "starting nifi service"
	/usr/local/confluent/bin/zookeeper-server-start /usr/local/confluent/etc/kafka/zookeeper.properties &
	/usr/local/confluent/bin/kafka-server-start /usr/local/confluent/etc/kafka/server.properties &
	/usr/local/confluent/bin/schema-registry-start /usr/local/confluent/etc/schema-registry/schema-registry.properties &
}

echo "setup confluent"
installConfluent
startServices
echo "confluent install complete"