# Goals
 - Vagrantfile and Dockerfile for node apps 

# Build and Run in container(s)
 - commit and push repo
 - vagrant up
 - vagrant ssh
 - cd /vagrant
 - . ./vagrant_configs.env
 - docker run -d --name name-container -p $HWCONFIG_NAME_SVC_PORT:$HWCONFIG_NAME_SVC_PORT -e HWCONFIG_NAME_SVC_PORT name-image
 - docker run -d --name echo-container -p $HWCONFIG_ECHO_SVC_PORT:$HWCONFIG_ECHO_SVC_PORT -e HWCONFIG_ECHO_SVC_PORT -e HWCONFIG_NAME_SVC_HOST -e HWCONFIG_NAME_SVC_PORT echo-image
 
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
. ./vagrant_configs.env

node echo.js

node name.js

OR

HWCONFIG_ECHO_SVC_HOST=localhost HWCONFIG_ECHO_SVC_PORT=3001 HWCONFIG_NAME_SVC_HOST=localhost HWCONFIG_NAME_SVC_PORT=3002 node echo.js

HWCONFIG_ECHO_SVC_HOST=localhost HWCONFIG_ECHO_SVC_PORT=3001 HWCONFIG_NAME_SVC_HOST=localhost HWCONFIG_NAME_SVC_PORT=3002 node name.js

