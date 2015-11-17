#!/bin/bash

docker build --file /vagrant/Dockerfile.echo -t echo-image /vagrant
docker build --file /vagrant/Dockerfile.name -t name-image /vagrant
docker build --file /vagrant/Dockerfile.nginx -t nginx-image /vagrant