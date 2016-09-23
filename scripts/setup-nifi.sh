#!/bin/bash

# http://www.cloudera.com/content/cloudera/en/documentation/core/v5-2-x/topics/cdh_ig_spark_configure.html

source "/vagrant/scripts/common.sh"

function installLocalnifi {
	echo "install nifi from local file"
	FILE=/vagrant/resources/$NIFI_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemotenifi {
	echo "install Nifi from remote file"
	curl -sS -o /vagrant/resources/$NIFI_ARCHIVE -O -L $NIFI_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$NIFI_ARCHIVE -C /usr/local
}

function installnifi {
	if resourceExists $NIFI_ARCHIVE; then
		installLocalnifi
	else
		installRemotenifi
	fi
	ln -s /usr/local/$NIFI_VERSION-bin /usr/local/nifi
	mkdir -p /usr/local/nifi/logs
}

function startServices {
	echo "starting nifi service"
	/usr/local/nifi/bin/nifi.sh start
}

echo "setup nifi"

installnifi
startServices

echo "nifi setup complete"