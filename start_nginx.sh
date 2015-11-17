#!/bin/bash

docker build --file /vagrant/Dockerfile.nginx -t nginx-image /vagrant
docker run -d --name nginx-container -p 8080:8080 nginx-image