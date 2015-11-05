# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "dockerhost"
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end

  config.vm.network "forwarded_port", guest: 4331, host: 4331
  config.vm.network "forwarded_port", guest: 4332, host: 4332

  config.vm.provision "docker" do |d|
    d.version = "1.9"
    d.build_image " --file /vagrant/Dockerfile.echo -t echo-image /vagrant"
    d.build_image " --file /vagrant/Dockerfile.name -t name-image /vagrant"
  end

  config.vm.provision "shell",
    inline: "cd /vagrant && ./run_services.sh"

end