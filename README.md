# Goals
Vagrantfile and Dockerfile for node apps  
Run locally  
Run some services locally and some in containers  

# Build and Run in containers
    vagrant up
    
# Test locally
    http://localhost:4331/echoQ?q=hi%20thereeee
    http://localhost:4332/name
    
# Mainual startup
    vagrant ssh
    cd /vagrant
    ./run_services.sh
    
    
 
# Graceful Shutdown
    docker stop echoContainer
    docker rm echoContainer
    exit to mac
    vagrant halt
 
# completely clean
    vagrant destroy
 
 
# Handy commands
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

