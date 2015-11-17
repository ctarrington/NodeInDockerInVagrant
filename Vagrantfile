# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "bento/centos-7.1"

  config.vm.synced_folder ".", "/vagrant/", type: "rsync", rsync__exclude: [".git/", ".idea/", "node_modules/"], rsync__auto: "false"


  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end

  config.vm.provision "docker" do |d|
    d.version = "1.9"
  end

  config.vm.define "nid-cluster1" do |cluster|
    cluster.vm.network "private_network", ip: "192.168.60.11"

    cluster.vm.provision "shell",
      inline: "cd /vagrant && ./restart_all.sh"
  end

end