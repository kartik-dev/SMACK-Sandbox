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
	ln -s /usr/local/$confluent_VERSION /usr/local/confluent
	mkdir -p /usr/local/confluent/logs
}

echo "setup confluent"

installConfluent

echo "confluent install complete"