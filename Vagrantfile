# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos65-generic"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

  config.vm.define "admin" do |admin_config|
    admin_config.vm.provision "shell", path: "bootstrap.sh"
    admin_config.vm.provision "shell", path: "bootstrap-admin.sh"
    admin_config.vm.hostname = "admin"
    admin_config.vm.network "private_network", ip: "192.168.1.10",
      virtualbox__intnet: "ansible"
  end

  (1..3).each do |i|
    config.vm.define "node#{i}" do |node_config|
      node_config.vm.provision "shell", path: "bootstrap.sh"
      node_config.vm.hostname = "node#{i}"
      node_config.vm.network "private_network", ip: "192.168.1.2#{i}",
        virtualbox__intnet: "ansible"
    end
  end
end
