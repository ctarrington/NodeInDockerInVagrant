# Goals
Vagrantfile and Dockerfile for node apps  
Run locally  
Run some services locally and some in containers  

# Initial setup
    Add to /etc/hosts:
    # node in docker in vagrant
    192.168.60.10 ndv.dev
    192.168.60.11 ndv1.dev
    192.168.60.12 ndv2.dev

# Build and Run in containers
    vagrant up
    
# Test locally
    http://ndv1.dev:4331/echoQ?q=hi%20thereeee
    http://ndv1.dev:4332/name
    http://ndv2.dev:4331/echoQ?q=hi%20thereeee
    http://ndv2.dev:4332/name
    
# Mainual startup
    vagrant ssh
    cd /vagrant
    ./run_cluster1.sh
    ./run_cluster2.sh
    
    
 
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

