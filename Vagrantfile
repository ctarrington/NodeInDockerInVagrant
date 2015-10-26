# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.define "dockerhost"
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3331, host: 3331
  config.vm.network "forwarded_port", guest: 3332, host: 3332

  config.vm.provision "docker" do |d|
    d.pull_images "node"

    d.build_image " --file /vagrant/Dockerfile.echo -t echo-image /vagrant"
    d.build_image " --file /vagrant/Dockerfile.name -t name-image /vagrant"
  end

end