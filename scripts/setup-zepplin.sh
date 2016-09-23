#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalZepplin {
	echo "install Zepplin from local file"
	FILE=/vagrant/resources/$ZEPPLIN_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteZepplin {
	echo "install Zepplin from remote file"
	curl -sS -o /vagrant/resources/$ZEPPLIN_ARCHIVE -O -L $ZEPPLIN_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$ZEPPLIN_ARCHIVE -C /usr/local
}

function installZepplin {
	if resourceExists $ZEPPLIN_ARCHIVE; then
		installLocalZepplin
		else
			installRemoteZepplin
			fi
	ln -s /usr/local/$ZEPPLIN_VERSION-bin-all /usr/local/zepplin
	mkdir -p /usr/local/zepplin/logs
}

function startServices {
	echo "starting Zepplin service"
	/usr/local/zepplin/sbin/zepplin-deamon.sh start
}

echo "setup Zepplin"
installZepplin
startServices
echo "Zepplin setup complete"