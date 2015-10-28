# Goals
 - Vagrantfile and Dockerfile for node app
 - Pull from github
 - 

# Installation to Run Locally
npm install

node echo.js
http://localhost:3666/echoQ?q=hi%20thereeee

# Build and Run in container(s)
 - commit and push repo
 - vagrant up
 - vagrant ssh
 - cd /vagrant
 - docker build --file Dockerfile.echo -t echo-image .
 - docker build --file Dockerfile.name -t name-image .
 - docker run -d --name echoContainer -p 3331:3331 -e "DOCKER_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')" echo-image
 - docker run -d --name nameContainer -p 3332:3332 -e "DOCKER_HOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+')" name-image
 - http://localhost:3331/echoQ?q=hi%20thereeee
 - http://localhost:3332/name
 
# Graceful Shutdown
 - docker stop echoContainer
 - docker rm echoContainer
 - exit to mac
 - vagrant halt
 
# completely clean
 - vagrant destroy
 
 
# Handy commands
docker logs <containerName>
docker run -i -t --entrypoint /bin/bash <imageName>
docker images
docker ps -a

docker rm -f $(docker ps -a -q)
docker rmi $(docker images -q)


#Run locally 
HWCONFIG_ECHO_SVC_HOST=localhost HWCONFIG_ECHO_SVC_PORT=3001 HWCONFIG_NAME_SVC_HOST=localhost HWCONFIG_NAME_SVC_PORT=3002 node echo.js

HWCONFIG_ECHO_SVC_HOST=localhost HWCONFIG_ECHO_SVC_PORT=3001 HWCONFIG_NAME_SVC_HOST=localhost HWCONFIG_NAME_SVC_PORT=3002 node name.js

