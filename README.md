# Goals
Vagrantfile and Dockerfile for node apps  
Run locally  
Run some services locally and some in containers  

# Build and Run in containers
    commit and push repo
    vagrant up
    vagrant ssh
    cd /vagrant
    . ./vagrant_configs.env
    docker run -d --name name-container -p $NID_CONFIG_NAME_SVC_PORT:$NID_CONFIG_NAME_SVC_PORT -e NID_CONFIG_NAME_SVC_PORT name-image
    docker run -d --name echo-container -p $NID_CONFIG_ECHO_SVC_PORT:$NID_CONFIG_ECHO_SVC_PORT -e NID_CONFIG_ECHO_SVC_PORT -e NID_CONFIG_NAME_SVC_HOST -e NID_CONFIG_NAME_SVC_PORT echo-image
 
    http://localhost:3331/echoQ?q=hi%20thereeee
    http://localhost:3332/name
 
# Graceful Shutdown
    docker stop echoContainer
    docker rm echoContainer
    exit to mac
    vagrant halt
 
# completely clean
    vagrant destroy
 
 
# Handy commands
    javascript
    docker logs <containerName>
    docker run -i -t --entrypoint /bin/bash <imageName>
    docker images
    docker ps -a

    docker rm -f $(docker ps -a -q)
    docker rmi $(docker images -q)

#Run locally 
    . ./local_configs.env
    node echo.js
    node name.js

