Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    i = 1
    config.vm.define "smack#{i}" do |smack|
        smack.vm.box = "bento/centos-7.1"
        smack.vm.provider "virtualbox" do |v|
          v.name = "smack#{i}"
          v.customize ["modifyvm", :id, "--memory", "6144"]
        end
        smack.vm.network :private_network, ip: "192.168.0.50"
        smack.vm.hostname = "192.168.0.50"
        smack.vm.provision "shell", path: "scripts/setup-centos.sh"
        smack.vm.provision "shell", path: "scripts/setup-java.sh"
		smack.vm.provision "shell", path: "scripts/setup-mesos.sh"
		smack.vm.provision "shell", path: "scripts/setup-hadoop.sh"
        smack.vm.provision "shell", path: "scripts/setup-hive.sh"
        smack.vm.provision "shell", path: "scripts/setup-spark.sh"
        smack.vm.provision "shell", path: "scripts/setup-zepplin.sh"
        smack.vm.provision "shell", path: "scripts/setup-nifi.sh"
        smack.vm.provision "shell", path: "scripts/setup-confluent.sh"
		smack.vm.provision "shell", path: "scripts/setup-cassandra.sh"
        smack.vm.provision "shell", path: "scripts/finalize-centos.sh"
    end
end
