#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalZeppelin {
	echo "install Zeppelin from local file"
	FILE=/vagrant/resources/$ZEPPELIN_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteZeppelin {
	echo "install Zeppelin from remote file"
	curl -sS -o /vagrant/resources/$ZEPPELIN_ARCHIVE -O -L $ZEPPELIN_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$ZEPPELIN_ARCHIVE -C /usr/local
}

function installZeppelin {
	if resourceExists $ZEPPELIN_ARCHIVE; then
		installLocalZeppelin
		else
			installRemoteZeppelin
			fi
	ln -s /usr/local/$ZEPPELIN_VERSION-bin-all /usr/local/zeppelin
	mkdir -p /usr/local/zeppelin/logs
}

function startServices {
	echo "starting Zepplin service"
	/usr/local/zeppelin/sbin/zeppelin-deamon.sh start
}

echo "setup Zeppelin"
installZeppelin
startServices
echo "Zeppelin setup complete"